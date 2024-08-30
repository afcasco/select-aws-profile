select_aws_profile() {
    # Get the list of profiles, excluding the default profile
    profiles=$(aws configure list-profiles | grep -v "default")
    profile_array=($profiles)

    # If a parameter is passed, try to select that profile directly
    if [[ -n $1 ]]; then
        for profile in "${profile_array[@]}"; do
            if [[ "$profile" == "$1" ]]; then
                export AWS_PROFILE="$profile"
                echo "AWS_PROFILE set to '$AWS_PROFILE'"
                return
            fi
        done
        echo "Profile '$1' not found."
        return 1
    fi

    # Display the profiles if no parameter is passed
    echo "Available AWS profiles:"
    for i in "${!profile_array[@]}"; do
        echo "$((i+1)). ${profile_array[i]}"
    done

    # Prompt the user to choose a profile or exit
    read -p "Select a profile by number (0 to exit): " choice

    # Handle the user's choice
    if [[ $choice -eq 0 ]]; then
        echo "Exiting without changing AWS_PROFILE."
        return
    elif [[ $choice -ge 1 && $choice -le ${#profile_array[@]} ]]; then
        export AWS_PROFILE="${profile_array[choice-1]}"
        echo "AWS_PROFILE set to '$AWS_PROFILE'"
    else
        echo "Invalid selection."
    fi
}
