# gyros-identifier 🍽️ 

In case you enter a shady restaurant, with suspicious prices and weird plate descriptions, not being able to verify that the food you ordered is a gyros... Fear no more! I made an app able to classify whether an image contains a [gyros](https://en.wikipedia.org/wiki/Gyros_(food)) or not.

The idea stems from the clip of Jian Yang's "Hotdog/Not Hotdog" app from the Silicon Valley series. Here's the [clip](https://www.youtube.com/watch?v=vIci3C4JkL0).

_Editor note: The certainty whether this app contributes to society is controversial._

## Boring tech details

The pretrained model used was the [MLImageClassifier](https://developer.apple.com/documentation/createml/mlimageclassifier) which was fine-tuned using the following custom dataset. 

The dataset that was used was a mix of the [Food-101 dataset from Kaggle](https://www.kaggle.com/kmader/food41) and images of gyros that I downloaded from the internet, mostly from random sources.

To split the dataset to Training and Test data I used the `dataset_creator.sh` bash script. Then I used the [CreateML](https://developer.apple.com/machine-learning/create-ml/) tool to train my model, and finally export it and add it to my XCode project.

## Examples

 Example 1             |  Example 2
:---------------------:|:-------------------------:
![gyros_identifier_example_1](https://user-images.githubusercontent.com/33265837/150557206-26aa5778-bdfb-40a3-a471-bd2ab482a101.jpeg)  | ![gyros_identifier_example_3](https://user-images.githubusercontent.com/33265837/150557220-b3a72bb1-c2f8-4963-b317-4e3c841c5f5d.jpeg)
