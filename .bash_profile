# ALIASE
alias idea="nohup ~/IntelliJ/ideaIU-2019.3.4/idea-IU-193.6911.18/bin/idea.sh > /dev/null 2>&1 &"
alias postman="nohup /snap/bin/postman > /dev/null 2>&1 &"
alias sql="nohup ~/sqldeveloper-19.2.1.247.2212-no-jre/sqldeveloper/sqldeveloper.sh >/dev/null 2>&1 &"
alias ll="ls -ltrha"
alias lfe="docker logs -f pagseguro-fe"
alias lbe="docker logs -f pagseguro-be-mdbs"
alias lba="docker logs -f pagseguro-admin"
alias om="cd ~/workspace/pscore/maven-project"
alias gs="git status"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gpd="git pull origin develop"
alias gpm="git pull origin master"
alias regex_not_start="echo '^((?!regex).)*$'"
alias regex_remove_blank_line="echo '^(?:[\t ]*(?:\r?\n|\r))+'"

#EXPORTS
pscore="/home/rhoracio/workspace/pscore/maven-project"

# FUNCTIONS
function open() {
	opera $@ 
}

function build() {
	cd $pscore
	./gradlew clean && ./gradlew build  \
	-Dorg.gradle.parallel=true \
	-Dorg.gradle.workers.max=4 \
	-x test -PskipAll \
	-x checkstyleMain \
	-x checkstyleTest && ./gradlew docker
}

function vpn() {
	cd ~/
	sudo vpnssl.sh
}

function fc() {
	find $pscore -name "*$@*.java"
}

function grep() {
	grep '$@' -Rn --color .
}

function gc() {
	if [ $# -eq 0 ]
	then
		echo "Commit message is null"
	else
		local cur_branch=`git rev-parse --abbrev-ref HEAD`
	        git add --all && \
        	git commit -m $@ && \
	        git push origin $cur_branch
	fi
}
