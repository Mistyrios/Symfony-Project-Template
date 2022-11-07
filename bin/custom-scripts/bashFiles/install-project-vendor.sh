################################################################################################################
# symfony-project-template - Linux&MacOS - Update composer and install composer vendor                         #                                            #
# @author: Axel Salem                                                                                          #
################################################################################################################

# The functions use in this script
# If the user answered "Yes"
function update_project_vendor() {
    # Update composer
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Updating Composer                                                   -"
    echo "-----------------------------------------------------------------------"
    php composer.phar self-update
    echo "-----------------------------------------------------------------------"

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Successfully update composer                                        -"
    echo "-----------------------------------------------------------------------"

    # Update project vendor
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Updating and Installing composer vendor from composer.json          -"
    echo "-----------------------------------------------------------------------"
    php composer.phar update
    echo "-----------------------------------------------------------------------"

    # Confirm what has been done
    echo ""
    echo "-----------------------------------------------------------------------"
    echo "- Successfully update composer vendor.                                -"
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
echo "-----------------------------------------------------------------------"
echo "- symfony-project-template Update and install Composer Vendor         -"
echo "- (Using embedded PHP win64 executable)                               -"
echo "-----------------------------------------------------------------------"

echo ""
echo "Are you SURE you want to update project composer vendor? ?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            update_project_vendor
            break;;
        No )
            bypass
            break;;
    esac
done
