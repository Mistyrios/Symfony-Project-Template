################################################################################################################
# symfony-project-template - Windows - Start Prod containers                                                   #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function build_prod_env() {
    # Start the Production containers
    echo "-----------------------------------------------------------------------"
    echo "- (Re)generating / (Re)starting PROD containers                       -"
    echo "- Tagging them with prod prefix, forced recreation.                   -"
    echo "-----------------------------------------------------------------------"
    docker-compose -f "docker-sources/global-docker-compose.yml" -f  "docker-sources/prod-docker-compose.yml" -p prod up -d --force-recreate --build
    echo "-----------------------------------------------------------------------"

    # Confirm what has been done
    echo "-----------------------------------------------------------------------"
    echo "- PROD symfony-project-template containers successfully started.      -"
    echo "-----------------------------------------------------------------------"

    # echo current containers
    echo "-----------------------------------------------------------------------"
    echo "Those are your currently active containers."
    docker ps -a

    # echo current networks
    echo "Those are your currently active networks."
    docker network ls
    echo "-----------------------------------------------------------------------"
}

# If the user answered "No"
function bypass() {
    echo "-----------------------------------------------------------------------"
    echo "- OK, then. See you around! :)                                        -"
    echo "-----------------------------------------------------------------------"
}

# The script for build the containers
# Ask for confirmation first, for this takes a long time and can be called by mistake
echo "---------------------------------------------------"
echo "- symfony-project-template Prod Containers        -"
echo "- (You need to have Docker installed to proceed)  -"
echo "---------------------------------------------------"

# Ask people if they really want to proceed
echo "Are you SURE you want to rebuild PROD containers ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            build_prod_env
            break;;
        No )
            bypass
            break;;
    esac
done
