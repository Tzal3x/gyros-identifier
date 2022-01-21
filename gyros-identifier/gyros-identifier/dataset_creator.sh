#!/usr/bin/env bash

# This script separates the files to a folder (i.e. dir_to_split)
# to Training_Data/ and Test_Data/. 
# dir_to_split contains a layer of subfolders and each subfolder contains the data:
# i.e. 
# dir_to_split/
# | apple_pie/
# | | image_1.jpg
# | | image_2.jpg
# | cake/
# | | image_3.jpg
# 
# The new folder should have this structure:
# 
# new_dataset/
# | Training_Data/
#   | apple_pie/
#     | image_1.jpg
#  ...
# | Test_Data 
#   | apple_pie/
#     | image_1.jpg
# ...
# 
# * An amount of the images goes to the Training_Data, and the rest to Test_Data.
#   Usually we need more for the Training_Data. *

echo 'SEPARATING FILES TO TRAINING AND TEST FOLDERS'
# P A R A M E T E R S #
dir_to_split="$HOME/Downloads/archive/images"  # archive/images/ contains the downloaded images from kaggle
destination_dir="$HOME/Documents/side-projects/split_dataset"  # the new folder with the split data
# # # # # # # # # # # #

training_dir="$destination_dir/Training_Data" 
test_dir="$destination_dir/Test_Data"
echo "Creating training dir if not exists: $training_dir"; mkdir -vp $training_dir 
echo "Creating training dir if not exists: $test_dir"; mkdir -vp $test_dir

folders=$(ls $dir_to_split)
for folder in $folders
do
  directory_to_copy="$dir_to_split/$folder"

  training_destination="$training_dir/$folder"
  echo "Creating training destination if not exists: $training_destination"
  mkdir -vp $training_destination

  echo "Creating test destination if not exists: $test_destination"
  test_destination="$test_dir/$folder"
  mkdir -vp $test_destination
  c=$((0))
  for image in $(ls $directory_to_copy)
  do
    c=$(($c+1))
    fullpath_image_to_copy="$directory_to_copy$image"
    if [ $c -lt 501 ]
    then
      fullpath_image_destination="$training_destination$image"
    else
      fullpath_image_destination="$test_destination$image"
    fi
    cp -v $fullpath_image_to_copy $fullpath_image_destination
  done
done




