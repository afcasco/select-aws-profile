# AWS Profile Selector Script

This script allows you to easily select and set your AWS CLI profile from a list of available profiles, excluding the default profile. You can use it either interactively or by passing a profile name directly as an argument.

## Features

- **Interactive Selection**: Choose an AWS profile from a list by number.
- **Direct Selection**: Set an AWS profile directly by passing the profile name as an argument.
- **Excludes Default Profile**: The script automatically excludes the default profile from the list of options.

## Installation

### Copy the script in your preferred location

### Add the path of your script to your .bashrc


`if [ -f ~/.bash_scripts/select_aws_profile.sh ]; then
    source ~/.bash_scripts/select_aws_profile.sh
    fi`

### Reload .bashrc to apply changes

`source ~/.bashrc`


## Usage
### Interactive Profile Selection
Run the following command to select an AWS profile interactively:

`select_aws_profile`

You will see a list of available AWS profiles (excluding the default). Select a profile by typing its corresponding number.

### Direct Profile Selection
If you already know the profile name, you can set it directly by passing it as an argument:

`select_aws_profile my-profile`

Replace my-profile with the name of the profile you want to set. The script will set the AWS_PROFILE environment variable to the selected profile.

### Verify the Selected Profile
To verify that the correct profile is set, run:

`echo $AWS_PROFILE`

This should output the name of the currently active AWS profile.

