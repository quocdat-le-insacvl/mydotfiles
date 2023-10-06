#!/bin/bash

# Define an array of problem names
problems=("A" "B" "C" "D" "E" "F")

# Loop through the problems and copy the template file to each destination
for problem in "${problems[@]}"; do
  cp ~/mycp/template.cpp "$problem.cpp"
done
