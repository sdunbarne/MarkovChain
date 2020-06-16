library("markovchain")

stateNames <- c("Rain","Nice","Snow")
P <- matrix(c(1/3, 1/3, 1/3, 1/3, 1/3, 1/3, 1/3, 1/3, 1/3),
             nrow=3, byrow=TRUE)
rownames(P) <- stateNames
colnames(P) <- stateNames

pi <-  c(2/5, 1/5, 2/5)
s <- matrix(c(1, 1, 1, 1, 1, 1, 1, 1, 1),
            nrow=3, byrow=TRUE)

for (i in 1:3) {
    for (j in 1:3) {
        alpha[i, j] <- s[i, j] * ( 1 + (pi[i]/pi[j])*(P[i,j]/P[j,i]))
    }
}

Q <- matrix(0, 3,3)
for (i in 1:3) {
    for (i in 1:3) {
        if (i != j) {
            Q[i, j] <- P[i, j] * alpha[i, j]
        }
    Q[i, i] <- 1 - sum( Q[i, ] ) 
    }
}

hastMetWeather <- new("markovchain", states = stateNames,
                   transitionMatrix = Q,
                 name = "hastMetWeather")
initialState <- c(0,1,0)
