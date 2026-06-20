#!/bin/bash
# Script to download datasets without requiring Git LFS

# Ensure data folder exists
mkdir -p data

# List of datasets to download
DATASETS=(
  "zoo.csv"
  "winequality.csv"
  "webtender.csv"
  "webtender_binary.csv"
  "optdigits.csv"
  "RT_IOT2022.csv"
  "wave_energy_converters.csv"
  "online_news_popularity.csv"
  "glass.csv"
  "diabetes.csv"
  "bodyfat.csv"
  "breastcancer.csv"
  "communities.csv"
  "conductivity.csv"
  "covtype.csv"
  "creditcard.csv"
  "human_activity.csv"
)

echo "Starting dataset downloads..."
for name in "${DATASETS[@]}"; do
  # Check if file exists and is larger than a standard Git LFS pointer (approx 200 bytes)
  if [ -f "data/$name" ] && [ $(wc -c < "data/$name") -gt 200 ]; then
    echo "data/$name already exists. Skipping."
  else
    echo "Downloading $name..."
    curl -L "https://media.githubusercontent.com/media/florian-chen/invis/main/data/$name" -o "data/$name"
  fi
done
echo "Dataset downloads finished!"