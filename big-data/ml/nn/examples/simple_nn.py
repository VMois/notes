# Source 1: https://medium.com/technology-invention-and-more/how-to-build-a-simple-neural-network-in-9-lines-of-python-code-cc8f23647ca1
# Source 2: https://iamtrask.github.io/2015/07/12/basic-python-network/
# Source 3: https://www.youtube.com/watch?v=h3l4qz76JhQ&list=PL2-dafEMk2A5BoX3KyKu6ti5_Pytp91sk

'''
Description:
- simple three layer network (input, hidden, output)
'''

import numpy as np

# Seed the random number generator, so it generates the same numbers
# every time the program runs.
np.random.seed(1)


# S shaped function. We pass the weighted sum to normalize it between 0 and 1
def sigmoid(x, deriv=False):
    if deriv:
        return x * (1 - x)
    
    return 1 / (1 + np.exp(-x))

training_set_inputs = np.array([
    [0, 0, 1], 
    [1, 1, 1], 
    [1, 0, 1], 
    [0, 1, 1]
])
training_set_outputs = np.array([[0, 1, 1, 0]]).T # transpose matrix from horizontal to vertical


# synapses, weights between layers

# weights between input and hidden layer. 3 inputs to 4 hidden
syn0 = 2 * np.random.random((3, 4)) - 1

# weights between hidden and output layer. 4 hidden to 1 output
syn1 = 2 * np.random.random((4, 1)) - 1

# training interation. Aim to reduce error.
for j in range(60000):
    l0 = training_set_inputs # input layer

    # np.dot(l, syn) - sum of all weights and inputs
    l1 = sigmoid(np.dot(l0, syn0)) # hidden layer
    l2 = sigmoid(np.dot(l1, syn1)) # output layer

    l2_error = training_set_outputs - l2

    if j % 10000 == 0:
        print("Error: {0}".format(np.mean(np.abs(l2_error))))
    
    l2_delta = l2_error * sigmoid(l2, deriv=True)
    l1_error = l2_delta.dot(syn1.T)

    l1_delta = l1_error * sigmoid(l1, deriv=True)

    # update weights
    syn1 += l1.T.dot(l2_delta)
    syn0 += l0.T.dot(l1_delta)

print("Output of training:")
print(l2)
