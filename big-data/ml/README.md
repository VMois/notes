# Machine learning

## Table of contents

1. [Neural Networks](nn/)

## Types of ML training

## Trained with human supervision or not

- **supervised** - data is labeled with solution;
- **unsupervised** - data without a labels (solutions);
- **semisupervised** - part of data is labeled and another part is unlabeled;
- **reinforcement** - model observs an environment, select and perform actions, get results in form of rewards or penalties. After, model learns from both negative and positive "experience" to receive rewards most of the time.

## Can they learn incrementally on the fly

- **online (incremental)** learning - system can learn on the fly, by receiving individual or small batched data to learn from.
- **batch** learning - system should be learned before going to production. Cannot learn on fly and if changes required should be retrained and redeployed.

## Generalization categories

- **instance-based** - system is learning by heart, and later predicts new data using similiraty measure compare to learned data.
- **model-based** - system builds a general model from learned examples (like linear), and later predicts new data using chosen model.
