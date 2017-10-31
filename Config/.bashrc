alias less='/bin/less -r' 
alias ll='ls -ltr' 
alias rs='rsync -av --exclude-from '/cygdrive/c/home/exclude-list.txt'' 
alias rsd='rsync -avO --del --exclude-from "/cygdrive/c/home/exclude-list.txt"' 
alias gcb='gradle clean build cleanEclipse eclipse' 
alias vi='vim' 
alias ge='gradle cleanEclipse eclipse' 
alias tf='/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/TF.exe' 
alias gl='git pull --rebase' 
alias getl='gl' 
alias tfc='/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/TF.exe checkin . -r' 
alias tfs='/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/TF.exe status . -r ' 
alias gce='gradle cleanEclipse eclipse' 
alias gced='gradle cleanEclipse eclipse -Penv=dev' 
alias gcel='gradle cleanEclipse eclipse -Penv=local' 
alias gcb='gradle clean build -x test' 
alias gul='gradle cleanEclipse eclipse clean build -x test -Penv=local uploadArchives' 
alias df='tf diff . -r -f:visual' 
alias dfs='tf diff . -r -f:ss_sidebyside' 
alias merge='tf merge . -r' 
alias tfu='tf undo . -r' 
alias tfa='tf add . -r' 
alias tfd='tf reconcile -promote . -r -deletes' 
alias tfch='tf changeset' 
alias changes2merge='~/home/determineChangesToMerge.sh' 
alias upd='gl;gea' 
alias groovy='/cygdrive/c/Documents/Workspace/Dev/Tools/APIs_DevKits/gigaspaces-xap-premium-10.1.1-ga/tools/groovy/bin/groovy.bat' 
alias kd='/cygdrive/c/Program\ Files/KDiff3/kdiff3.exe' 
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
alias gem='/cygdrive/c/Ruby23-x64/bin/gem.cmd' 
alias rake='/cygdrive/c/Ruby23-x64/bin/rake.bat' 
alias g='git' 
alias gcp='git cherry-pick ' 
alias mrgt='grep -lr "<<<<<<<" . | xargs git checkout --theirs' 
alias mrgo='grep -lr "<<<<<<<" . | xargs git checkout --ours' 
alias gmt='git mergetool' 
alias np='/cygdrive/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe' 
alias gb='git branch' 
alias sf='~/scpFiles.sh' 

#Migration--- move to certain directories
alias desk='cd /cygdrive/c/Users/628196/Desktop/' 
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
alias workspace='cd /cygdrive/c/Documents/Workspace' 
alias vmsh='cd /cygdrive/c/Documents/Workspace/Dev/Tools/vmware-streamsV4.0.0-qse-v1.vmwarevm/VMShare' 
bind "set completion-ignore-case on" 