# gyros-identifier 🍽️ 

In case you enter a shady restaurant, with suspicious prices and weird plate descriptions, not being able to verify that the food you ordered is a gyros... Fear no more! I made an app able to classify whether an image contains a [gyros](https://en.wikipedia.org/wiki/Gyros_(food)) or not.

_Editor note: The certainty whether this app contributes to society is controversial._

## Boring tech details

The pretrained model used was the [MLImageClassifier](https://developer.apple.com/documentation/createml/mlimageclassifier) which was fine-tuned using the following custom dataset. 

The dataset that was used was a mix of the [Food-101 dataset from Kaggle](https://www.kaggle.com/kmader/food41) and images of gyros that I downloaded from the internet, mostly from random sources.

To split the dataset to Training and Test data I used the `dataset_creator.sh` bash script. Then I used the [CreateML](https://developer.apple.com/machine-learning/create-ml/) tool to train my model, and finally export it and add it to my XCode project.
