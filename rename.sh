#!/bin/bash

# Step 1: Check if the `mix` command exists
if ! command -v mix &> /dev/null; then
    echo "Error: The 'mix' command is not found. Make sure Elixir and Phoenix are installed."
    exit 1
fi

# Step 2: Run mix.deps.get
echo "Running mix deps.get..."
if ! mix deps.get >/dev/null 2>&1; then
    echo "Error: Failed to run 'mix deps.get'. Please make sure your project is set up correctly."
    exit 1
fi

# Step 3: Prompt the user for the new App, validating it as PascalCase
read -p "Enter the new App name (PascalCase): " app_name

if [[ ! $app_name =~ ^[A-Z][a-zA-Z0-9]*$ ]]; then
    echo "Error: Invalid App name. The name should be in PascalCase."
    exit 1
fi

# Step 4: Run `mix rename PhoenixSolidJSTemplate <user_input>`
mix rename PhoenixSolidJSTemplate "$app_name"

# Step 5: Convert PascalCase to snake_case
snake_case_name=$(echo "$app_name" | sed 's/\(.\)\([A-Z]\)/\1_\2/g' | tr '[:upper:]' '[:lower:]')

# Step 6: Replace instances of phoenix_solid_js_template in .github folder with snake_case user input
if [ -d ".github" ]; then
    find ./.github -type f -exec sed -i '' -e "s/phoenix_solid_js_template/$snake_case_name/g" {} +
fi
