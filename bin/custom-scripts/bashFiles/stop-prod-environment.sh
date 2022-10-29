################################################################################################################
# symfony-project-template - Linux&MacOS - Stop Prod containers                                                #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function stop_prod_env() {
    # Stop and delete PROD containers and PROD network
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Stop and delete PROD containers                                     -"
    echo "-----------------------------------------------------------------------"

    docker container rm symfony-project-template-prod-php-cli -f
    docker container rm symfony-project-template-prod-nginx -f
    docker container rm symfony-project-template-prod-php-fpm -f
    docker container rm symfony-project-template-prod-mysql -f
    docker network rm dev_symfony-project-template_prod_network

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- PROD symfony-project-template containers successfully stopped.      -"
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
echo "Are you SURE you want to stop PROD environment ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            stop_prod_env
            break;;
        No )
            bypass
            break;;
    esac
done
