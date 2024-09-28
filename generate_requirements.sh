#!/bin/bash

# Directory containing the Jupyter notebooks
NOTEBOOK_DIR=${1:-.}

# Step 1: Convert all Jupyter notebooks to Python scripts
echo "Converting Jupyter notebooks to Python scripts..."
jupyter nbconvert --to script "$NOTEBOOK_DIR"/*.ipynb

# Step 2: Generate requirements.txt using pipreqs
echo "Generating requirements.txt..."
pipreqs "$NOTEBOOK_DIR" --force

# Step 3: Clean up Python scripts
echo "Cleaning up Python scripts..."
rm "$NOTEBOOK_DIR"/*.py

echo "requirements.txt generated successfully."
