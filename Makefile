###########################################################################################################
# symfony-project-template - Makefile - Initial Makefile for Windows, Linux & MacOS                       #
# @author: Axel Salem                                                                                     #
###########################################################################################################

#The @ at the beginning of each command is used to execute commands in silent mode (without the command being repeated at use)

init-project-win:
	@.\bin\custom-scripts\batchFiles\project-initialisation.bat

init-project-lm:
	@bash bin/custom-scripts/bashFiles/project-initialisation.sh
