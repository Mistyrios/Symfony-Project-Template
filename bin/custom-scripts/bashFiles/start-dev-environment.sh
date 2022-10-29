################################################################################################################
# symfony-project-template - Linux&MacOS - Start DEV containers                                                #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function build_dev_env() {
    # Start the dev containers
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- (Re)generating / (Re)starting DEV containers                        -"
    echo "- Tagging them with dev prefix, forced recreation                     -"
    echo "-----------------------------------------------------------------------"
    docker-compose -f "docker-sources/global-docker-compose.yml" -f "docker-sources/dev-docker-compose.yml" -p dev up -d --force-recreate --build
    echo "-----------------------------------------------------------------------"

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- DEV symfony-project-template containers successfully started.       -"
    echo "-----------------------------------------------------------------------"

    # echo current containers
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "Those are your currently active containers.";
    docker ps -a;

    # echo current networks
    echo "Those are your currently active networks.";
    docker network ls;
    echo "-----------------------------------------------------------------------"
}

# If the user answered "No"
function bypass() {
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- OK, then. See you around! :)                                        -"
    echo "-----------------------------------------------------------------------"
}

# The script for build the containers
# Ask for confirmation first, for this takes a long time and can be called by mistake
echo "-----------------------------------------------------------------------"
echo "- symfony-project-template Dev Containers                             -"
echo "- (You need to have Docker installed to proceed)                      -"
echo "-----------------------------------------------------------------------"

# Ask people if they really want to proceed
echo ""
echo "Are you SURE you want to rebuild DEV containers ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            build_dev_env
            break;;
        No )
            bypass
            break;;
    esac
done
