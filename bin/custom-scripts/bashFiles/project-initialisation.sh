################################################################################################################
# symfony-project-template - Linux&MacOS - Script Batch - Initialization of the project                        #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function initialise_project() {
    # Install composer to use different plugin
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Composer - self-update and install vendor                           -"
    echo "-----------------------------------------------------------------------"

    echo ""
    echo "Update of composer.phar"
    php composer.phar self-update

    echo ""
    echo "Installation of"
    echo "   * Symfony Twig Bundle"
    echo "   * Symfony Framework Bundle"
    echo "   * Symfony Maker Bundle"
    echo "   * Symfony Orm Pack"
    echo "   * Symfony CRUD Generator"
    php composer.phar update

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Successfully install composer vendor.                               -"
    echo "-----------------------------------------------------------------------"

    # Creation of the specific OS Makefile
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Creation of the specific OS Makefile                                -"
    echo "- Copying linuxAndMacOS-makefile-sample to Makefile                   -"
    echo "-----------------------------------------------------------------------"
    cp Makefiles/linuxAndMacOS-makefile-sample Makefile

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Successfully create makefile.                                       -"
    echo "-----------------------------------------------------------------------"

    # Git Initialization
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Git initialisation                                                  -"
    echo "-----------------------------------------------------------------------"

    # Initialization of git
    echo ""
    echo "Are you SURE you want to initialise git (If git was already by you or other people, enter No) ?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes )
                initialise_git
                break;;
            No )
                bypass
                break;;
        esac
    done
}

function initialise_git() {
    if [ -d ./.git ]
    then
        rm -rf .git
        git init
    else
        git init
    fi

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Successfully initialise git.                                        -"
    echo "-----------------------------------------------------------------------"
}

# If the user answered "No"
function bypass() {
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- OK, then. See you around! :)                                        -"
    echo "-----------------------------------------------------------------------"
}

# Start the initialization of the project
# Ask for confirmation first, for this takes a long time and can be called by mistake
echo "-----------------------------------------------------------------------"
echo "- symfony-project-template project initialisation                     -"
echo "-----------------------------------------------------------------------"

# Ask people if they really want to proceed
echo ""
echo "Are you SURE you want to launch the initialization script ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            initialise_project
            break;;
        No )
            bypass
            break;;
    esac
done
