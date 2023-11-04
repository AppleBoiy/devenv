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

# Get a list of installed formulae and casks from Homebrew
installed_formulae=$(brew list --formula)
installed_casks=$(brew list --cask)

# Create a JSON object with an array for formulae and an array for casks
json_object=$(jq -n --argjson formulae "$(echo "$installed_formulae" | jq -R . | jq -s .)" \
                      --argjson casks "$(echo "$installed_casks" | jq -R . | jq -s .)" \
                      '{ "formulae": $formulae, "casks": $casks }')

# Save the JSON object to a file named "homebrew_packages.json"
echo "$json_object" > $HOMW/.devenv/homebrew/homebrew_packages.json

echo "Installed packages have been saved to homebrew_packages.json!"

