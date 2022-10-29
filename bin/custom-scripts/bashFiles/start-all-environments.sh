################################################################################################################
# symfony-project-template - Linux&MacOS - Docker-compose - Start all containers for all environment           #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function build_all_env() {
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- (Re)generating / (Re)starting PROD containers                       -"
    echo "- Tagging them with prod prefix, forced recreation.                   -"
    echo "-----------------------------------------------------------------------"
    docker-compose -f "docker-sources/global-docker-compose.yml" -f "docker-sources/prod-docker-compose.yml" -p prod up -d --force-recreate --build
    echo "-----------------------------------------------------------------------"

    # Start the staging containers
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- (Re)generating / (Re)starting Staging containers                    -"
    echo "- Tagging them with staging prefix, forced recreation                 -"
    echo "-----------------------------------------------------------------------"
    docker-compose -f "docker-sources/global-docker-compose.yml" -f "docker-sources/staging-docker-compose.yml" -p staging up -d --force-recreate --build
    echo "-----------------------------------------------------------------------"

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
    echo "- All symfony-project-template containers successfully started.       -"
    echo "-----------------------------------------------------------------------"

    # echo current containers
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "Those are your currently active containers."
    docker ps -a

    # echo current networks
    echo ""
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

# Start the script
# Ask for confirmation first, for this takes a long time and can be called by mistake
echo "-----------------------------------------------------------------------"
echo "- symfony-project-template All Containers                                 -"
echo "- (You need to have Docker install to proceed)                        -"
echo "-----------------------------------------------------------------------"

# Ask people if they really want to proceed
echo ""
echo "Are you SURE you want to rebuild ALL containers? ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            build_all_env
            break;;
        No )
            bypass
            break;;
    esac
done
