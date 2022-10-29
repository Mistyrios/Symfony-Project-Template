################################################################################################################
# symfony-project-template - Linux&MacOS - Stop Dev containers                                                 #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function stop_dev_env() {
    # Stop and delete DEV containers and DEV network
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Stop and delete DEV containers                                      -"
    echo "-----------------------------------------------------------------------"

    docker container rm symfony-project-template-dev-php-cli -f
    docker container rm symfony-project-template-dev-nginx -f
    docker container rm symfony-project-template-dev-php-fpm -f
    docker container rm symfony-project-template-dev-mysql -f
    docker network rm dev_symfony-project-template_dev_network

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- DEV symfony-project-template containers successfully stopped.       -"
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
echo "Are you SURE you want to stop DEV environment ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            stop_dev_env
            break;;
        No )
            bypass
            break;;
    esac
done
