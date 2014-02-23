# Kaggle digit recognizer #

This script can be used to predict Digits based on hand-written images. 
It uses training and testdata provided by kaggle. 
It will have multible implementations using different algorithms. <br>
training set size: 42000
test set size: 28000


## Current implementations ##

### Neural network - no framework ###

lambda: 1<br>
iterations: 2000<br>
hidden layers: 2 (including output layer)<br>
hidden layer size = 200<br>
training set accuracy: 98.259524%<br>
test set accuracy: 0.9451%<br>

### Neural network - neural network toolbox ###

iterations: ~ 100
hidden layer sizes: 50 30 20
test set accuracy: 97,657%
