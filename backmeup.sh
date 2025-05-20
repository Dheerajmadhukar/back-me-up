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
spin=("😊" "😃" "😄" "😆" "😎" "😍" "😘" "😗" "😙" "😚" "😛" "😝" "😞" "😟" "😠" "😡" "😢" "😣" "😤" "😥" "😦")
end='\e[0m'
description="A tool to automate a bugbounty process as: Tool will execute multiple tools to collect URLs from internet archives then use some useful patterns/RegEx to look for Sensitive Data Leakage in the form of multiple juicy extensions."
BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

function help(){
      printf "\nDescription: ${description}\n"
      printf "\nUsage:\n">&2
      printf "\t-c/--check\t\t:\t\tTo check installed prerequisite packages/tools/libs\n">&2
      printf "\t-i/--install\t\t:\t\tTo install all the prerequisite packages/tools/libs\n">&2
      printf "\t-d/--domain\t\t:\t\tA target domain.tld  \n">&2
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
["curl"]="apt install curl -y -qq"
["git"]="apt install git -y -qq"
["pip3"]="apt install python3-pip -y -qq"
["hakrawler"]="go install github.com/hakluke/hakrawler@latest"
["cariddi"]="go install github.com/edoardottt/cariddi/cmd/cariddi@latest"
["gospider"]="go install github.com/jaeles-project/gospider@latest"
["crawley"]="go install -v github.com/s0rg/crawley/cmd/crawley@latest"
["waymore"]="pip3 install git+https://github.com/xnl-h4ck3r/waymore.git -v --break-system-packages"
["katana"]="go install github.com/projectdiscovery/katana/cmd/katana@latest"
["waybackurls"]="go install github.com/tomnomnom/waybackurls@latest"
["gauplus"]="go install github.com/bp0lr/gauplus@latest"
["gau"]="go install github.com/lc/gau/v2/cmd/gau@latest"
["httpx"]="go install github.com/projectdiscovery/httpx/cmd/httpx@latest"
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
            elif [[ ${i} == "gospider" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`gospider --version|head -1|awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "gau" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`gau --version|awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "anew" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}v0.1.1${end}\n"
            elif [[ ${i} == "httpx" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`httpx -version 2>&1|grep "Current Version"| awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "katana" ]];then
                printf " ${green}[+] ${i} ${end}\t:\t${logo}`katana --version 2>&1| tail -1 | awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "curl" ]];then
                printf " ${green}[+] curl ${end}\t:\t${logo}`curl --version|head -1|awk '{print $2}'`${end}\n"
            elif [[ ${i} == "git" ]];then
                printf " ${green}[+] git ${end}\t:\t${logo}`git --version|awk '{print $NF}'`${end}\n"
            elif [[ ${i} == "pip3" ]];then
                printf " ${green}[+] pip3 ${end}\t:\t${logo}`pip3 --version|awk '{print $2 "(python"$NF}'`${end}\n"
            elif [[ ${i} == "waymore" ]];then
                printf " ${green}[+] waymore ${end}\t:\t${logo}`curl -kLs "https://raw.githubusercontent.com/xnl-h4ck3r/waymore/main/waymore/__init__.py" | awk -F'"' '{print $2}'`${end}\n"
            elif [[ ${i} == "hakrawler" ]];then
                printf " ${green}[+] hakrawler ${end}\t:\t${logo}2.1${end}\n"
            elif [[ ${i} == "cariddi" ]];then
                printf " ${green}[+] cariddi ${end}\t:\t${logo}`cariddi -version 2>&1| egrep -o "v[0-9.]+"`${end}\n"
            elif [[ ${i} == "crawley" ]];then
                printf " ${green}[+] crawley ${end}\t:\t${logo}1.7.7${end}\n"
            fi
        fi

done
}
function install(){
    echo -e "\033[1;37m[\033[1;31m+\033[1;37m]\033[1;32m Please be aware that this installation is only compatible with\033[0m Linux (amd64)\033[0m\n"
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
emoticons(){
    PID=$!;i=0;name=${1}
    while [ -d /proc/${PID} ];do
        printf " \r└──${green}[${name}]${end} : ${spin[i++%${#spin[@]}]:0:1}"
        sleep 0.05
    done
    printf " \r└──${green}[${name}]${end} : `wc -l ${BASE_DIR}/output/${target}_$(date -I)/${target}_${name}.txt|awk '{print $1}'`\n"
}
function collect() {
       if [[ ! -z "${target}" ]];then

            printf "\n${target} ${yellow}BACK-ME-UP ${end}[${logo}Author: Dheeraj Madhukar${end}]\n"
            if [ ! -d ${BASE_DIR}/output/${target}_$(date -I) ];then mkdir -p ${BASE_DIR}/output/${target}_$(date -I) &> /dev/null;fi
# ╭─────────────────────╮
# |         GOSPIDER    |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
                gospider -s "https://${target}" --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" --quiet --depth 5 --concurrent 80 --threads 100 --delay 1 --random-delay 1 --timeout 10 --js --robots --other-source --include-subs --include-other-source --subs --sitemap --no-redirect --raw 2> /dev/null | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_gospider.txt &> /dev/null &
                emoticons "gospider"
# ╭─────────────────────╮
# |         CRAWLEY     |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
                crawley -all -user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36" -subdomains -headless -depth -1 -silent -skip-ssl -workers 50 -timeout 10s -robots crawl https://${target} 2> /dev/null | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_crawley.txt &> /dev/null &
                emoticons "crawley"
# ╭─────────────────────╮
# |         CARIDDI     |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
                echo https://${target} | cariddi -s -d 2 -c 200 -e -ext 7 -cache -t 10 -intensive -rua -err -info 2> /dev/null | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_cariddi.txt &> /dev/null &
                emoticons "cariddi"
# ╭─────────────────────╮
# |         GAU         |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
               echo ${target} | gau --providers wayback,commoncrawl,otx,urlscan --retries 2 --subs --threads 100 --timeout 10 2> /dev/null | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_gau.txt 2>&1 > /dev/null &
                emoticons "gau"

# ╭─────────────────────╮
# |         GAUPLUS     |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
               echo ${target} | gauplus -random-agent -subs -retries 2 -t 100 -providers wayback,otx,commoncrawl | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_gauplus.txt 2>&1 > /dev/null &
                emoticons "gauplus"

# ╭─────────────────────╮
# |     hakrawler       |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
                echo "https://www.${target}" | hakrawler -d 5 -dr -insecure -t 10 -timeout 3600 -subs | tee ${BASE_DIR}/output/${target}_$(date -I)/${target}_hakrawler.txt 2>&1 > /dev/null &
                emoticons "hakrawler"


# ╭─────────────────────╮
# |     KATANA PASSIVE  |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
                echo "${target}" | katana -passive -jc -jsl -fx -xhr -kf all -c 50 -silent | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_katana_passive.txt 2>&1 > /dev/null &
                emoticons "katana_passive"

###### katana_depth-first ACTIVE
# ╭─────────────────────╮
# | KATANA ACTIVE df    |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
               echo "${target}" | katana -d 5 -jc -ct 1h -aff -fx -s depth-first -c 50 -silent | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_katana_df.txt 2>&1 > /dev/null &
                emoticons "katana_df"

###### katana_breadth-first ACTIVE
# ╭─────────────────────╮
# | KATANA ACTIVE BF    |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
              echo "${target}" | katana -d 5 -jc -ct 1h -aff -fx -s breadth-first -c 50 -silent | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_katana_bf.txt 2>&1 > /dev/null &
                emoticons "katana_bf"

# ╭─────────────────────╮
# |     WAYBACKURLS     |
# ╰─────────────────────╯
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
               echo "${target}" | waybackurls | egrep -v "^[[:blank:]]*$" | anew -q ${BASE_DIR}/output/${target}_$(date -I)/${target}_waybackurls.txt 2>&1 > /dev/null &
                emoticons "waybackurls"

# ╭─────────────────────╮
# |     WAYMORE         |
# ╰─────────────────────╯
                # APIs
                trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
               echo "${target}" | waymore -i ${target} -mode U --retries 3 --timeout 10 --memory-threshold 95 --processes 5 --config ~/.config/waymore/config.yml --output-urls ${BASE_DIR}/output/${target}_$(date -I)/${target}_waymore.txt &> /dev/null &
                emoticons "waymore"
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
        if [ ! -z ${target} ] && [ ! -f ${target} ];then
            cat ${BASE_DIR}/.hold_regex.txt | while IFS= read -r rr || [[ -n ${rr} ]]; do
                if [ "$(find ${BASE_DIR}/output/${target}_$(date -I) -type f -name '*.txt' -print0 |awk -v RS='\0' 'END{print NR}')" -gt 0 ];then
                    echo ${target} | xargs -P500 -I@ bash -c "egrep -ai --no-filename \"${rr}\" ${BASE_DIR}/output/@_$(date -I)/@_*.txt | anew -q ${BASE_DIR}/output/@_$(date -I)/@_possible_leaked_data.txt"
                else
                    printf "[${red}${cross}${end}] ${yellow}No data ! Bad luck on the target ${red}\"${target}\"${end}\n"
                fi
            done
        fi
}
subs(){
        if [ ! -z "${target}" ] && [ "$(find ${BASE_DIR}/output/${target}_$(date -I) -type f -name '*.txt' -print0 |awk -v RS='\0' 'END{print NR}')" -gt 0 ];then
            trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
            find ${BASE_DIR}/output/${target}_$(date -I) -type f -iname '*.txt' -exec egrep --no-filename -ao "(http|https|ftp|gopher|ftps|file)?://([a-z0-9_-]+[.])*${target}" "{}" \; | cut -d"/" -f3- | anew -q "${BASE_DIR}/output/${target}_$(date -I)/${target}_uniq_subs.txt" &
            emoticons "uniq_subs"
        fi
}
ctrlc_count=0
dotraps(){
        let ctrlc_count++
        echo
        if [[ $ctrlc_count == 1 ]]; then
            printf "${red}[Warn] No CTRL+C please...${end}\n"
        elif [[ $ctrlc_count == 2 ]]; then
            printf "${red}[Warn] Once more and I quit.${end}\n"
        else
            declare -a tools_n=("gospider" "crawley" "cariddi" "gau" "gauplus" "hakrawler" "katana" "waybackurls" "waymore")
            printf "${red}[Warn] That's it. I quit.${end}\n"
            printf "\r${red}[Warn] killing all ${tool} PID/PPIDs for you ;)${end} ── ${logo} ${tools_n[*]} ${end}\n"
            for x in ${!tools_n[@]};do
                    killall -q ${tools_n[$x]}
            done
            printf "\n╔════════[ ${lightred}\360\237\246\204 Thanks for using this tool ${end} ]════════════════════════════════════╗\n\n"
            printf "${logo}\t - https://buymeacoffee.com/medheeraj${end}\n"
            printf "${logo}\t - https://github.com/Dheerajmadhukar${end}\n"
            printf "${logo}\t - https://twitter.com/Dheerajmadhukar${end}\n"
            printf "${logo}\t - https://www.youtube.com/c/DheerajMadhukar${end}\n"
            printf "${logo}\t - https://linkedin.com/in/dheerajtechnolegends${end}\n"
            printf "╚═══════════════════════════════════════════════════════════════════════════════╝\n\n"
            exit 10
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
        '-d'|'--domain')
            target=$2
            shift
            if [[ ! -z "${target}" ]];then
                generate_regex > "${BASE_DIR}/.hold_regex.txt"
                ulimit -u 10000 &> /dev/null
                collect 2> /dev/null
                find ${BASE_DIR}/output -type f -empty -delete
                printf "${target} ${yellow}[LOOT(s)] ${end}\n"
                    trap dotraps SIGINT SIGPIPE SIGTERM SIGHUP
                found 2> /dev/null &
                    emoticons "possible_leaked_data"
                subs 2> /dev/null
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
