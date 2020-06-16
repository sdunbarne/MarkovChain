#! /usr/bin/env python3

import numpy as np
 
class MarkovChain(object):
    def __init__(self, transition_matrix, states):
        """
        Initialize the MarkovChain instance.
 
        Parameters
        ----------
        transition_matrix: 2-D array
            A 2-D array representing the probabilities of change of 
            state in the Markov Chain.
 
        states: 1-D array 
            An array representing the states of the Markov Chain. It
            needs to be in the same order as transition_matrix.
        """
        self.transition_matrix = np.atleast_2d(transition_matrix)
        self.states = states
        self.index_dict = {self.states[index]: index for index in 
                           range(len(self.states))}
        self.state_dict = {index: self.states[index] for index in
                           range(len(self.states))}
 
    def next_state(self, current_state):
        """
        Returns the state of the random variable at the next time 
        instance.
 
        Parameters
        ----------
        current_state: str
            The current state of the system.
        """
        return np.random.choice(
         self.states, 
         p=self.transition_matrix[self.index_dict[current_state], :]
        )
 
    def generate_states(self, current_state, n=10):
        """
        Generates the next states of the system.
 
        Parameters
        ----------
        current_state: str
            The state of the current random variable.
 
        n: int
            The number of future states to generate.
        """
        future_states = []
        for i in range(n):
            next_state = self.next_state(current_state)
            future_states.append(next_state)
            current_state = next_state
        return future_states

transition_matrix = [[0.5,  0.25, 0.25], [0.5,  0.0,  0.5 ], [0.25, 0.25, 0.5 ]]

weather_chain = MarkovChain(transition_matrix=transition_matrix, states=['Rain', 'Nice', 'Snow'])
path = weather_chain.generate_states(current_state='Snow', n=10)
print(path)


## NAME: markovchain.py
##
## USAGE: From command line:  python3 markovchain.py
##
## REQUIRED ARGUMENTS: none
##
## OPTIONS: none
## DESCRIPTION: Instantiate and run the weather in Oz Markov chain
## DIAGNOSTICS: none
## CONFIGURATION AND ENVIRONMENT: python3
## DEPENDENCIES: python 3 numpy
## INCOMPATIBILITIES: none known
## PROVENANCE: lightly adapted by Steve Dunbar Tue Jan 15 08:18:55 CST 2019
## from  https://medium.com/@__amol__/markov-chains-with-python-1109663f3678
## BUGS AND LIMITATIONS: none known
## FEATURES AND POTENTIAL IMPROVEMENTS:

## AUTHOR:  Steve Dunbar
## VERSION: 1.0 as of Tue Jan 15 08:19:52 CST 2019
## KEYWORDS: Markov chain
## AUTHOR: Alessandro Molina, S Dunbar


