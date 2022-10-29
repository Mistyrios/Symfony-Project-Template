################################################################################################################
# symfony-project-template - Windows - Start Staging containers                                                #
# @author: Axel Salem                                                                                          #
################################################################################################################

function build_staging_env() {
    # Start the staging containers
    echo "-----------------------------------------------------------------------"
    echo "- (Re)generating / (Re)starting Staging containers                    -"
    echo "- Tagging them with staging prefix, forced recreation                 -"
    echo "-----------------------------------------------------------------------"
    docker-compose -f "docker-sources/global-docker-compose.yml" -f "docker-sources/staging-docker-compose.yml" -p staging up -d --force-recreate --build
    echo "-----------------------------------------------------------------------"

    # Confirm what has been done
    echo "-----------------------------------------------------------------------"
    echo "Staging symfony-project-template containers successfully started."
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
echo "- symfony-project-template Staging Containers     -"
echo "- (You need to have Docker installed to proceed)  -"
echo "---------------------------------------------------"

# Ask people if they really want to proceed
echo "Are you SURE you want to rebuild STAGING containers ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            build_staging_env
            break;;
        No )
            bypass
            break;;
    esac
done
