################################################################################################################
# symfony-project-template - Linux&MacOS - Stop Staging containers                                             #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function stop_staging_env() {
    # Stop and delete STAGING containers and STAGING network
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Stop and delete STAGING containers                                  -"
    echo "-----------------------------------------------------------------------"

    docker container rm symfony-project-template-staging-php-cli -f
    docker container rm symfony-project-template-staging-nginx -f
    docker container rm symfony-project-template-staging-php-fpm -f
    docker container rm symfony-project-template-staging-mysql -f
    docker network rm dev_symfony-project-template_staging_network

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- STAGING symfony-project-template containers successfully stopped.   -"
    echo "-----------------------------------------------------------------------"
}

# If the user answered "No"
function bypass() {
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- OK, then. See you around! :)                                        -"
    echo "-----------------------------------------------------------------------"
}

# Start the script
# Ask people if they really want to proceed
echo "Are you SURE you want to stop STAGING environment ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            stop_staging_env
            break;;
        No )
            bypass
            break;;
    esac
done
