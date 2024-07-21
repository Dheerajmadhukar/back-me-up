#!/bin/bash
black='\e[38;5;016m'
bluebg='\e[48;5;038m'${black}
red='\e[31m'
redbg='\e[30;41m'${black}
lightred='\e[91m'
blink='\e[5m'
lightblue='\e[38;5;109m'
green='\e[32m'
greenbg='\e[48;5;038m'${black}
yellow='\e[33m'
logo='\033[0;36m'
upper="${lightblue}╔$(printf '%.0s═' $(seq "80"))╗${end}"
lower="${lightblue}╚$(printf '%.0s═' $(seq "80"))╝${end}"
right=$(printf '\u2714')
cross=$(printf '\u2718')
end='\e[0m'
description="A tool to automate a bugbounty process as: Tool will execute multiple tools to collect URLs from internet archives then use some useful patterns/RegEx to look for Sensitive Data Leakage in the form of multiple juicy extensions."
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function help(){
      printf "\nDescription: ${description}\n"
      printf "\nUsage:\n">&2
      printf "\t-c/--check\t\t:\t\tTo check installed prerequisite packages/tools/libs\n">&2
      printf "\t-i/--install\t\t:\t\tTo install all the prerequisite packages/tools/libs\n">&2
      printf "\t-t/--target\t\t:\t\tInput from list of domains OR a target domain.tld  \n">&2
      printf "\t-h/--help\t\t:\t\tHelp\n">&2
      printf '\n\n' >&2
      printf "╔════════[ ${lightred}me_dheeraj [Author]${end} ]═════════════════════════════════════════════════════════════╗\n\n" >&2
      printf "${logo}\t - https://buymeacoffee.com/medheeraj${end}\n" >&2
      printf "${logo}\t - https://github.com/Dheerajmadhukar${end}\n" >&2
      printf "${logo}\t - https://twitter.com/Dheerajmadhukar${end}\n" >&2
      printf "${logo}\t - https://www.youtube.com/c/DheerajMadhukar${end}\n" >&2
      printf "${logo}\t - https://linkedin.com/in/dheerajtechnolegends${end}\n" >&2
      printf "╚════════════════════════════════════════════════════════════════════════════════════════════╝\n\n" >&2
 }

#####
# NOTE: On a normal GNU/Linux system you can spawn 32000 jobs using this technique with no problems. To raise the 32000 jobs limit raise /proc/sys/kernel/pid_max to 4194303.
# NOTE: On a normal Linux system check `ulimit -a`. To raise the jobs limit raise to `ulimit -u 10000`.
#####
declare -A tools='(
["hakrawler"]="go install github.com/hakluke/hakrawler@latest"
["katana"]="go install github.com/projectdiscovery/katana/cmd/katana@latest"
["waybackurls"]="go install github.com/tomnomnom/waybackurls@latest"
["gauplus"]="go install github.com/bp0lr/gauplus@latest"
["gau"]="go install github.com/lc/gau/v2/cmd/gau@latest"
["httpx"]="go install github.com/projectdiscovery/httpx/cmd/httpx@latest"
["parallel"]="apt install parallel -y -qq"
["anew"]="go install github.com/tomnomnom/anew@master"
)'

function check_install(){
if go version &> /dev/null;then
    printf "${green} [+] go ${end}\t:\t${logo}`go version | awk '{print $3}'`${end}\n"
else
    printf " ${redbg}[-] go ${end}\t:\t${red}Installing: \`${tools[$i]}\` OR \`bash tool.sh -i/--install\`${end}\n"
fi
for i in "${!tools[@]}";do

        ${i} --help &> /dev/null
        if [[ ! $? -eq 0 ]];then
            printf "${redbg} [-] ${i} ${end}\t:\t${red}Manually install: \`${tools[$i]}\` OR \`bash backmeup.sh --install\`${end}\n"
        else
            if [[ ${i} == "waybackurls" ]];then
                printf " ${green}[+] ${i}${end}:\t${logo}v0.1.0\n${end}"
            elif [[ ${i} == "gauplus" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`gauplus -version | awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "gau" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`gau --version|awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "parallel" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`parallel -V|head -1`${end}\n"
            elif [[ ${i} == "anew" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}v0.1.1${end}\n"
            elif [[ ${i} == "httpx" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`httpx -version 2>&1|grep "Current Version"| awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "katana" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`katana --version 2>&1| tail -1 | awk '{print $NF}'`${end}\n"
            fi
        fi

done
}
function install(){
    if ! go version &> /dev/null;then
                                OS="$(uname -s)"
                                ARCH="$(uname -m)"
                                case $OS in
                                    "Linux")
                                        case $ARCH in
                                                "x86_64")
                                                        ARCH=amd64
                                                        ;;
                                                "aarch64")
                                                        ARCH=arm64
                                                        ;;
                                                "armv6" | "armv7l")
                                                        ARCH=armv6l
                                                        ;;
                                                "armv8")
                                                        ARCH=arm64
                                                        ;;
                                                "i686")
                                                        ARCH=386
                                                        ;;
                                                .*386.*)
                                                        ARCH=386
                                                        ;;
                                        esac
                        PLATFORM="linux-$ARCH"
                        ;;
                                        "Darwin")
                                                case $ARCH in
                                                        "x86_64")
                                                                ARCH=amd64
                                                                ;;
                                                        "arm64")
                                                                ARCH=arm64
                                                                ;;
                                                esac
                        PLATFORM="darwin-$ARCH"
                        ;;
                                esac


                                LATEST_GO_VERSION="$(curl --silent 'https://go.dev/VERSION?m=text' | head -n 1)";
                                LATEST_GO_DOWNLOAD_URL="https://go.dev/dl/${LATEST_GO_VERSION}.${PLATFORM}.tar.gz"
                                printf "cd to home ($USER) directory \n"
                                cd $HOME
                                printf "Downloading ${LATEST_GO_DOWNLOAD_URL}\n\n";
                                curl -kOJ -L --progress-bar $LATEST_GO_DOWNLOAD_URL
                                printf "Extracting file...\n"
                                tar -xf ${HOME}/${LATEST_GO_VERSION}.linux-amd64.tar.gz -C ${HOME}

                                export GOROOT="$HOME/go" 2>&1 > /dev/null
                                export GOPATH="$HOME/go/packages" 2>&1 > /dev/null
                                export PATH=$PATH:$GOROOT/bin:$GOPATH/bin 2>&1 > /dev/null
                                printf "APPENDING THIS LINE BELOW TO YOUR ~/.bashrc OR ~/.zshrc: \n
export GOROOT=\"$HOME/go\"\n
export GOPATH=\"$HOME/go/packages\"\n
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin\n
\n"
    fi
    for i in ${!tools[@]};do
        ${i} --help &> /dev/null
        if [[ ! $? -eq 0 ]];then
                echo "${tools[${i}]}"
                ${tools[${i}]}
            if [[ $? -eq 0 ]];then
                    echo "Installing tool...: ${tools[${i}]}"
                    printf "${green} [+] ${i} Installed${end}\n"
            fi
        fi
    done
}
function regex_template(){
echo '([^.]+)\.REGEX$'
echo '([^.]+)\.REGEX\.[0-9]+$'
echo '([^.]+)\.REGEX[0-9]+$'
echo '([^.]+)\.REGEX[a-z][A-Z][0-9]+$'
echo '([^.]+)\.REGEX\.[a-z][A-Z][0-9]+$'
echo '([^.]+)\.REGEX\?(.*)=(.*)$'
}

function collect() {
       if [[ -f "${target}" ]];then
               mkdir -p ${BASE_DIR}/output/ &> /dev/null
# ╭─────────────────────╮
# |         GAU         |
# ╰─────────────────────╯
               cat "${target}" | parallel --load 100% --timeout 100% --retries 1 -j+0 -k --lb --compress --silent "if [ ! -d ${BASE_DIR}/output/{}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/{}_$(date -I) &> /dev/null;fi;gau --providers wayback,commoncrawl,otx,urlscan --retries 2 --subs --threads 50 --timeout 10 {} | anew -q ${BASE_DIR}/output/{}_$(date -I)/{}_gau.txt" &> /dev/null

# ╭─────────────────────╮
# |         GAUPLUS     |
# ╰─────────────────────╯
             cat "${target}" | parallel --load 100% --timeout 100% --retries 1 -j+0 -k --lb --compress --silent "if [ ! -d ${BASE_DIR}/output/{}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/{}_$(date -I) &> /dev/null;fi;echo {} | gauplus -random-agent -subs -retries 2 -t 50 -providers wayback,otx,commoncrawl | anew -q ${BASE_DIR}/output/{}_$(date -I)/{}_gauplus.txt" &> /dev/null

# ╭─────────────────────╮
# |     KATANA PASSIVE  |
# ╰─────────────────────╯
                cat "${target}" | parallel --load 100% --timeout 100% --retries 1 -j+0 -k --lb --compress --silent "if [ ! -d ${BASE_DIR}/output/{}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/{}_$(date -I) 2> /dev/null;fi;echo {} | katana -passive -jc -jsl -kf all -c 50 -silent | anew -q ${BASE_DIR}/output/{}_$(date -I)/{}_katana_passive.txt" 2>&1 > /dev/null

###### katana_depth-first ACTIVE
# ╭─────────────────────╮
# | KATANA ACTIVE df    |
# ╰─────────────────────╯
               cat "${target}" | parallel --load 100% --timeout 100% --retries 1 -j+0 -k --lb --compress --silent "if [ ! -d ${BASE_DIR}/output/{}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/{}_$(date -I) &> /dev/null;fi;echo {} | katana -d 5 -jc -ct 1h -fx -s depth-first -c 50 -silent | anew -q ${BASE_DIR}/output/{}_$(date -I)/{}_katana_df.txt" 2>&1 > /dev/null

###### katana_breadth-first ACTIVE
# ╭─────────────────────╮
# | KATANA ACTIVE BF    |
# ╰─────────────────────╯
               cat "${target}" | parallel --load 100% --timeout 100% --retries 1 -j+0 -k --lb --compress --silent "if [ ! -d ${BASE_DIR}/output/{}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/{}_$(date -I) &> /dev/null;fi;echo {} | katana -d 5 -jc -ct 1h -aff -fx -s breadth-first -c 50 -silent | anew -q ${BASE_DIR}/output/{}_$(date -I)/{}_katana_bf.txt" 2>&1 > /dev/null

# ╭─────────────────────╮
# |     WAYBACKURLS     |
# ╰─────────────────────╯
               cat "${target}" | parallel --load 100% --timeout 100% --retries 1 -j+0 -k --lb --compress --silent "if [ ! -d ${BASE_DIR}/output/{}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/{}_$(date -I) &>/dev/null;fi;echo {} | waybackurls | anew -q ${BASE_DIR}/output/{}_$(date -I)/{}_waybackdata.txt" &> /dev/null
#/------------------------------------------------------/
       elif [[ ! -z "${target}" ]];then
# ╭─────────────────────╮
# |         GAU         |
# ╰─────────────────────╯
               if [ ! -d ${BASE_DIR}/output/${target}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/${target}_$(date -I) &> /dev/null;fi
               echo ${target} | gau --providers wayback,commoncrawl,otx,urlscan --retries 2 --subs --threads 100 --timeout 10 2> /dev/null | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_gau.txt 2>&1 > /dev/null

# ╭─────────────────────╮
# |         GAUPLUS     |
# ╰─────────────────────╯
               echo ${target} | gauplus -random-agent -subs -retries 2 -t 100 -providers wayback,otx,commoncrawl | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_gauplus.txt 2>&1 > /dev/null

# ╭─────────────────────╮
# |     KATANA PASSIVE  |
# ╰─────────────────────╯
                echo "${target}" | katana -passive -jc -jsl -kf all -c 50 -silent | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_katana_passive.txt 2>&1 > /dev/null

###### katana_depth-first ACTIVE
# ╭─────────────────────╮
# | KATANA ACTIVE df    |
# ╰─────────────────────╯
               echo "${target}" | katana -d 5 -jc -ct 1h -aff -fx -s depth-first -c 50 -silent | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_katana_df.txt 2>&1 > /dev/null

###### katana_breadth-first ACTIVE
# ╭─────────────────────╮
# | KATANA ACTIVE BF    |
# ╰─────────────────────╯
               echo "${target}" | katana -d 5 -jc -ct 1h -aff -fx -s breadth-first -c 50 -silent | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_katana_bf.txt 2>&1 > /dev/null

# ╭─────────────────────╮
# |     WAYBACKURLS     |
# ╰─────────────────────╯
               echo "${target}" | waybackurls | egrep -v "^[[:blank:]]*$" | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_waybackdata.txt 2>&1 > /dev/null
       fi
}

function generate_regex() {

    if [[ -e "${BASE_DIR}/ext.txt" ]] && [[ -r "${BASE_DIR}/ext.txt" ]] && [[ -f "${BASE_DIR}/ext.txt" ]];then
        ext_file=$(cat ${BASE_DIR}/ext.txt|sed "s/\./\\\./g")
        for extension in $ext_file; do
                regex_template | sed "s/REGEX/${extension}/g"
        done
    else
        printf "[${red}${cross}${end}] ${yellow} Make sure ${red}\"${BASE_DIR}/ext.txt\"${end} ${yellow}exists!\n"
        exit 3
    fi
}
found(){
    if [[ -f ${target} ]] && [[ -e ${target} ]] && [[ -r ${target} ]];then
        cat ${BASE_DIR}/.hold_regex.txt | while IFS= read -r rr || [[ -n ${rr} ]]; do
          cat ${target}|while IFS= read -r tt1 || [[ -n ${tt1} ]];do 
          if [ "$(find ${BASE_DIR}/output/${tt1}_$(date -I) -type f -name '*.txt' -print0 |awk -v RS='\0' 'END{print NR}')" -gt 0 ];then
           echo ${tt1} | xargs -P500 -I@ bash -c "egrep -ai --no-filename \"${rr}\" ${BASE_DIR}/output/@_$(date -I)/@_*.txt | anew -q ${BASE_DIR}/output/@_$(date -I)/@_possible_leaked_data.txt"
          else
                printf "[${red}${cross}${end}] ${yellow}No data ! Bad luck on the target ${red}\"${tt1}\"${end}\n"
          fi
    done
        done
        cat ${target} | while IFS= read -r tt || [[ -n ${tt} ]];do
            if [ -f ${BASE_DIR}/output/${tt}_$(date -I)/${tt}_possible_leaked_data.txt ] && [ -s ${BASE_DIR}/output/${tt}_$(date -I)/${tt}_possible_leaked_data.txt ];then printf "[${right}]${greenbg}${red}`wc -l ${BASE_DIR}/output/${tt}_$(date -I)/${tt}_possible_leaked_data.txt`${end} : possible leaked data for target [${tt}]${end}\n"
            else
                printf "[${red}${cross}${end}] ${yellow}No data ! Bad luck on the target ${red}\"${tt}\"${end}\n"
            fi
        done
#/------------------------------------------------------------/
    elif [ ! -z ${target} ];then
        cat ${BASE_DIR}/.hold_regex.txt | while IFS= read -r rr || [[ -n ${rr} ]]; do
        if [ "$(find ${BASE_DIR}/output/${target}_$(date -I) -type f -name '*.txt' -print0 |awk -v RS='\0' 'END{print NR}')" -gt 0 ];then
                echo ${target} | xargs -P500 -I@ bash -c "egrep -ai --no-filename \"${rr}\" ${BASE_DIR}/output/@_$(date -I)/@_*.txt | anew -q ${BASE_DIR}/output/@_$(date -I)/@_possible_leaked_data.txt"
            else
                printf "[${red}${cross}${end}] ${yellow}No data ! Bad luck on the target ${red}\"${target}\"${end}\n"
            fi
        done
            if [ -f ${BASE_DIR}/output/${target}_$(date -I)/${target}_possible_leaked_data.txt ] && [ -s ${BASE_DIR}/output/${target}_$(date -I)/${target}_possible_leaked_data.txt ];then printf "[${green}${right}${end}] ${yellow}`wc -l ${BASE_DIR}/output/${target}_$(date -I)/${target}_possible_leaked_data.txt`${end} : ${yellow}possible leaked data for target [${target}]${end}\n"
            else
                printf "[${red}${cross}${end}] ${yellow}No data ! Bad luck on the target ${red}\"${target}\"${end}\n"
            fi
    fi
}

function run(){
set +u
    case $1 in
        '-c'|'--check')
            check_install
            shift
            ;;
        '-i'|'--install')
            install
            printf "${bluebg}Ready to go baby !!!${end}\n"
            check_install
            shift
            ;;
    '-t'|'--target')
            target=$2
            shift
            if [[ ! -z "${target}" ]];then
                generate_regex > "${BASE_DIR}/.hold_regex.txt"
                ulimit -u 10000 &> /dev/null
                collect
                find ${BASE_DIR}/output -type f -empty -delete
                found | sort  -u
            else
                printf "\n[${red}${cross}${end}] ${yellow}No target/domain <domain.tld> OR target list given. Make sure you go through the usage/help${end}\n\n"
                help
                exit 1
            fi
            ;;
        '-h'|'--help')
            help
            exit 0
            ;;
        *)
            printf "${red}Error: unknown/invalid: $1, go through help:${end}\n"
            help
            exit 1
            ;;
        "")
            printf "${red}Error: option/argument required, check '-h/--help'${end}\n"
            help
            exit 2
            ;;
    esac

}
run $@
tput sgr0
