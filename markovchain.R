library(markovchain)

stateNames <- c("R", "N", "S")
transMatrix <- matrix( c(1/2, 1/4, 1/4, 1/2, 0, 1/2, 1/4, 1/4, 1/2),
                      nrow=3, byrow=TRUE)
startState <- "N"

weatherOz <- new("markovchain", transitionMatrix=transMatrix,
                 states=stateNames, name="Weather_in_Oz")
print( weatherOz )

print( summary(weatherOz) )

pathLength <- 10 
weatherPath <- rmarkovchain(n=pathLength,
                            object = weatherOz, t0 = startState)
cat("A sample starting from N: ", weatherPath, "\n")
weatherPath <- rmarkovchain(n=pathLength,
                            object = weatherOz, t0 = startState)
cat("Another sample starting from N: ", weatherPath, "\n")

largeN <- 1000; startStable <- 100
weatherPath <- rmarkovchain(n=largeN,
                            object = weatherOz, t0 = startState)
stablePattern <-  weatherPath[startStable:largeN]
empiricalStable <- c( mean( stablePattern == "R" ),
                     mean( stablePattern == "N" ),
                     mean( stablePattern == "S" ))
theorStable <- steadyStates(weatherOz)
cat("Empirical stable distribution: ",  empiricalStable, "\n")
cat("Theoretical stable distribution: ", theorStable, "\n")

## NAME: markovchain.R
## USAGE: within R, at interactive prompt
##        source("markovchain.R")
## REQUIRED ARGUMENTS: none
## OPTIONS: none
## DESCRIPTION: An R script using the markovchain library to 
##              
## DIAGNOSTICS:
## CONFIGURATION AND ENVIRONMENT:  library(markovchain)
## DEPENDENCIES:  library(markovchain)
## INCOMPATIBILITIES: none known
## PROVENANCE: created Steve Dunbar, based on documentation in
## "The markovchain Package: A Package for Easily Handling Discrete
##  Markov Chains in R" by G. Spedicato, et al.
## BUGS AND LIMITATIONS: none known
## FEATURES AND POTENTIAL IMPROVEMENTS:
## AUTHOR:  Steve Dunbar
## VERSION: Version 1.0 as of Fri Jan 18 07:34:58 CST 2019
## KEYWORDS: Markov chain, stable distribution

