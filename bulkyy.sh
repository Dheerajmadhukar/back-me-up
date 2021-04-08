#!/bin/bash
right=$(printf '\xE2\x9C\x94')
red="\e[31m"
green="\e[32m"
end="\e[0m"
target=$1
out="output"
Usage() {
       echo -e "$green
       Usage: ./bulkyy.sh -f targets.txt
       "$end
       exit 1
      }
collect() {
printf "Total targets: $(wc -l $target | awk '{print $1}')\n"
cat $target | xargs -P 800 -I X bash -c "echo 'X' | waybackurls | tee -a waybackurls.txt > /dev/null"
cat $target | gauplus --random-agent --subs -t 5000 | anew -q waybackurls.txt
cat waybackurls.txt | cut -d"?" -f1 | cut -d"=" -f1 > filtered.txt
mv waybackurls.txt .waybackurls.txt
#printf "Wayback Data: $(wc -l .waybackurls.txt | awk '{print $1}')\n"
}
filter() {
echo "##############################"
grep -aiE "\.zip$|\.zip\.[0-9]+$|\.rar$|\.tar$|\.tar\.gz$|\.tgz$|\.sql$|\.db$|\.sqlite$|\.pgsql\.txt$|\.mysql\.txt$|\.gz$|\.config$|\.log$|\.bak$|\.backup$|\.bkp$|\.crt$|\.dat$|\.eml$|\.java$|\.lst$|\.key$|\.passwd$|\.pl$|\.pwd$|\.mysql-connect$|\.jar$|\.cfg$|\.dir$|\.orig$|\.bz2$|\.old$|\.vbs$|\.img$|\.inf$|\.sh$|\.py$|\.vbproj$|\.mysql-pconnect$|\.war$|\.go$|\.psql$|\.sql\.gz$|\.vb$|\.webinfo$|\.jnlp$|\.cgi$|\.temp$|\.ini$|\.webproj$|\.xsql$|\.raw$|\.inc$|\.lck$|\.nz$|\.rc$|\.html\.gz$\.gz$|\.env$|\.yml$" filtered.txt | sort -u | httpx -silent -follow-redirects -threads 800 -mc 200 > leaks.txt
rm filtered.txt
}
found() {
mkdir $out 2> /dev/null
echo -e "💀$green[$(grep -ai "\.zip$" leaks.txt | tee $out/zip.txt | wc -l)]$red zip $end Found.💀"$end
echo -e "💀$green[$(grep -aiE "\.zip\.[0-9]+$" leaks.txt | tee $out/zip-NUM.txt | wc -l)]$red zip[NUM] $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.rar$" leaks.txt | tee $out/rar.txt | wc -l)]$red rar $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.tar$" leaks.txt | tee $out/tar.txt | wc -l)]$red tar $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.tar\.gz$" leaks.txt | tee $out/tar.gz.txt | wc -l)]$red tar.gz $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.tgz$" leaks.txt | tee $out/tgz.txt | wc -l)]$red tgz $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.sql$" leaks.txt | tee $out/sql.txt | wc -l)]$red sql $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.db$" leaks.txt | tee $out/db.txt | wc -l)]$red db $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.sqlite$" leaks.txt | tee $out/sqlite.txt | wc -l)]$red sqlite $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.pgsql$" leaks.txt| tee $out/pgsql.txt | wc -l)]$red pgsql $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.txt$" leaks.txt | tee $out/txt.txt | wc -l)]$red txt $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.gz$" leaks.txt | tee $out/gz.txt | wc -l)]$red gz $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.config$" leaks.txt | tee $out/config.txt | wc -l)]$red config $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.log$" leaks.txt | tee $out/log.txt | wc -l)]$red log $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.bak$" leaks.txt | tee $out/bak.txt | wc -l)]$red bak $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.mysql-connect$" leaks.txt | tee $out/mysql-connect.txt | wc -l)]$red mysql-connect $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.jar$" leaks.txt | tee $out/jar.txt | wc -l)]$red jar $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.cfg$" leaks.txt | tee $out/cfg.txt | wc -l)]$red cfg $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.dir$" leaks.txt | tee $out/dir.txt | wc -l)]$red dir $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.orig$" leaks.txt | tee $out/orig.txt | wc -l)]$red orig $end Found.�""$end
echo -e "💀$green[$(grep -ai "\.bz2$" leaks.txt | tee $out/bz2.txt | wc -l)]$red bz2 $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.old$" leaks.txt | tee $out/old.txt | wc -l)]$red old $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.vbs$" leaks.txt | tee $out/vbs.txt | wc -l)]$red vbs $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.img$" leaks.txt | tee $out/img.txt | wc -l)]$red img $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.inf$" leaks.txt | tee $out/inf.txt | wc -l)]$red inf $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.sh$" leaks.txt | tee $out/sh.txt | wc -l)]$red sh $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.py$" leaks.txt| tee $out/py.txt | wc -l)]$red py $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.vbproj$" leaks.txt | tee $out/vbproj.txt | wc -l)]$red vbproj $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.mysql-pconnect$" leaks.txt | tee $out/mysql-pconnect | wc -l)]$red mysql-pconnect $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.war$" leaks.txt | tee $out/war.txt | wc -l)]$red war $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.go$" leaks.txt| tee $out/go.txt | wc -l)]$red go $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.psql$" leaks.txt | tee $out/psql.txt | wc -l)]$red psql $end Found.�""$end
echo -e "💀$green[$(grep -ai "\.sql\.gz$" leaks.txt | tee $out/sql.gz.txt | wc -l)]$red sql.gz $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.vb$" leaks.txt | tee $out/vb.txt | wc -l)]$red vb $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.webinfo$" leaks.txt | tee $out/webinfo.txt | wc -l)]$red webinfo $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.jnlp$" leaks.txt | tee $out/jnlp.txt | wc -l)]$red jnlp $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.cgi$" leaks.txt | tee $out/cgi.txt | wc -l)]$red cgi $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.temp$" leaks.txt | tee  $out/temp.txt | wc -l)]$red temp $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.ini$" leaks.txt | tee $out/ini.txt | wc -l)]$red ini $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.webproj$" leaks.txt | tee $out/webproj.txt | wc -l)]$red webproj $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.xsql$" leaks.txt | tee $out/xsql.txt | wc -l)]$red xsql $end Found.�""$end
echo -e "💀$green[$(grep -ai "\.raw$" leaks.txt | tee $out/raw.txt | wc -l)]$red raw $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.inc$" leaks.txt | tee $out/inc.txt | wc -l)]$red inc $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.lck$" leaks.txt | tee $out/lck.txt | wc -l)]$red lck $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.nz$" leaks.txt | tee $out/nz.txt | wc -l)]$red nz $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.rc$" leaks.txt | tee $out/rc.txt| wc -l)]$red rc $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.html\.gz$" leaks.txt | tee $out/html.gz.txt| wc -l)]$red html.gz $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.backup$" leaks.txt | tee $out/backup.txt| wc -l)]$red backup $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.bkp$" leaks.txt | tee $out/bkp.txt| wc -l)]$red bkp $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.crt$" leaks.txt | tee $out/crt.txt| wc -l)]$red crt $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.dat$" leaks.txt | tee $out/dat.txt| wc -l)]$red dat $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.eml$" leaks.txt | tee $out/eml.txt| wc -l)]$red eml $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.java$" leaks.txt | tee $out/java.txt| wc -l)]$red java $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.key$" leaks.txt | tee $out/key.txt| wc -l)]$red key $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\.passwd$" leaks.txt | tee $out/passwd.txt| wc -l)]$red passwd $end Found💀"$end
echo -e "💀$green[$(grep -ai "\.pl$" leaks.txt | tee $out/pl.txt| wc -l)]$red pl $end Found.💀"$end
echo -e "💀$green[$(grep -ai "\pwd$" leaks.txt | tee $out/pwd.txt| wc -l)]$red pwd $end Found.💀"$end
rm leaks.txt
find $out/ -type f -empty -delete
}
target=False
list=(
        collect
        filter
        found
)
while [ -n "$1" ]; do
                case "$1" in
                        -f | --file)
                                target=$2
                                shift
                                ;;
                        *)
                                echo -e $red"[-]"$end "Unknown Option: $1"
                                Usage
                                ;;
                esac
        shift
done
[[ $target == "False" ]] && { echo -e $red"[-]"$end "Argument: -f/--file targets.txt missing."
Usage
}
        (
        collect | pv -l -r -b -F "%t %e Data Collection Progress: %p"
        filter | pv -l -r -b -F "%t %e Filtering Data Progress: %p"
        found
)
