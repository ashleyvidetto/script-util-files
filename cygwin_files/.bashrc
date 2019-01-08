#! /bin/bash

alias less='/bin/less -r' 
alias ll='ls -ltr' 
alias rs='rsync -av --exclude-from '/cygdrive/c/home/exclude-list.txt'' 
alias rsd='rsync -avO --del --exclude-from "/cygdrive/c/home/exclude-list.txt"' 
alias gcb='gradle clean build cleanEclipse eclipse' 
alias vi='vim' 
alias ge='gradle eclipse' 
alias gl='git pull --rebase' 
alias getl='gl' 
alias gce='gradle cleanEclipse eclipse' 
alias gced='gradle cleanEclipse eclipse -Penv=dev' 
alias gcel='gradle cleanEclipse eclipse -Penv=local' 
alias gcb='gradle clean build -x test' 
alias gul='gradle cleanEclipse eclipse clean build -x test -Penv=local uploadArchives' 
alias changes2merge='~/home/determineChangesToMerge.sh' 
alias upd='gl;gea' 
alias groovy='/cygdrive/c/Documents/Workspace/Dev/Tools/APIs_DevKits/gigaspaces-xap-premium-10.1.1-ga/tools/groovy/bin/groovy.bat' 
alias diff='/cygdrive/c/Program\ Files\ \(x86\)/Beyond\ Compare\ 2/BC2.exe' 
alias bcompare='/cygdrive/c/Program\ Files\ \(x86\)/Beyond\ Compare\ 2/BC2.exe' 
alias gs='git status' 
alias gc='git commit -m' 
alias go='git checkout ' 
alias gco='git checkout .' 
alias hist='git log --tags --oneline --pretty=format:\"%h\ %ad\ \|\ %s%d\ [\%an]\" --graph --date=short --max-count=10' 
alias hist20='git log --tags --oneline --pretty=format:\"%h\ %ad\ \|\ %s%d\ [\%an]\" --graph --date=short --max-count=20' 
alias hista='git log --branches --remotes --tags --oneline --pretty=format:\"%h\ %ad\ \|\ %s%d\ [\%an]\" --graph --date=short --max-count=40' 
alias gp='git push' 
alias ga='git add .' 
alias g='git' 
alias np='/cygdrive/c/Program\ Files\/Notepad++/notepad++.exe' 
alias n='node'
alias gb='git branch' 

#Custom Scripts
alias sf='~/scpFiles.sh' 
alias snp_cpy='~/snapshot_copy_script.sh' 
alias dlogs='~/removeDEVLogs.sh' 
alias fltlgs='~/viewFlightLogs.sh' 
alias oaglgs='~/viewOAGLogs.sh' 
alias mvdesk='~/scripts/copy_toDesktop.sh' 
alias bgr='~/buildReleaseNotes.sh' 
alias queue='~/scripts/queue_depth_prod.sh' 

#SSH
#Helper for quickly searching what I've stored
alias ssh-aliases='cat /home/ashle/scripts/ssh-aliases.sh' 
source /home/ashle/scripts/ssh-aliases.sh

#Migration--- move to certain directories
alias desk='cd /cygdrive/c/Users/ashle/OneDrive/desktop/' 
alias infra='cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Infrastructure-Release/Infrastructure/LookAhead' 
alias code='cd /cygdrive/c/LookAhead/' 
alias tarm='cd /cygdrive/c/LookAhead/Git/IPS_TarmacMonitor-Release' 
alias atc='cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Release' 
alias dply='cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Deployment-Release' 
alias deploy='cd /cygdrive/c/LookAhead/Git/IPS_LKA2.0-Deployment-Release' 
alias home='cd /cygdrive/c/Users/628196/' 
alias pers='cd /cygdrive/c/Documents/Workspace/script-util-files' 
alias sand='cd /cygdrive/c/Documents/Workspace/LearningTech_Sandbox/' 
alias c='cd /cygdrive/c' 
alias workspace='cd /cygdrive/c/Workspace/' 
alias vmsh='cd /cygdrive/c/Documents/Workspace/Dev/Tools/vmware-streamsV4.0.0-qse-v1.vmwarevm/VMShare' 
alias ui='cd /cygdrive/c/Documents/Workspace/LearningTech_Sandbox/UI\ Learning/javascript' 
alias iup='infra;go master;gl;' 
alias idea='cd /cygdrive/c/Users/628196/.IdeaIC2017.3' 
alias gren='n C:/LookAhead/Git/github-release-notes/github-release-notes.js' 
alias gr='cd /cygdrive/c/LookAhead/Git/github-release-notes' 
bind "set completion-ignore-case on" 