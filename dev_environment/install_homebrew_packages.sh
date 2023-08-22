#!/bin/bash

# Function to install jq if not found
install_jq() {
    echo "jq not found. Installing jq..."
    brew install jq
}

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    install_jq
fi

# Check if the homebrew_packages.json file exists
if [ ! -f "homebrew_packages.json" ]; then
    echo "homebrew_packages.json not found. Please create the JSON file containing the list of packages."
    exit 1
fi

# Read the cask and formula package names from the JSON file
casks=$(jq -r '.casks[]' homebrew_packages.json)
formulas=$(jq -r '.formulae[]' homebrew_packages.json)

# Install formulae using Homebrew
for package in $formulas; do
    echo "Installing formula: $package..."
    brew install "$package"
done

# Install casks using Homebrew
for package in $casks; do
    echo "Installing cask: $package..."
    brew install --cask "$package"
done

echo "All packages installed successfully!"

