[![License](https://img.shields.io/badge/license-MIT-_red.svg)](https://opensource.org/licenses/MIT)

<a href="https://www.buymeacoffee.com/medheeraj"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a beer&emoji=🍺&slug=medheeraj&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff"></a>
![Follow on Twitter](https://img.shields.io/twitter/follow/Dheerajmadhukar?style=social)

# back-me-up
This tool will check for Sensitive Data Leakage with some useful patterns/RegEx. The patterns are mostly targeted on waybackdata and filter everything accordingly.

## Usage
```
root@me_dheeraj:$ cat > targets.txt
target1.tld
target2.tld

root@me_dheeraj:$ bash bulkyy.sh
[-] Usage: bash bulkyy.sh [-f/--file] targets.txt

Output will be saved in "output" directory
```

##### Prerequisites
- waybackurls [go get github.com/tomnomnom/waybackurls] [@tomnomnom](https://github.com/tomnomnom/waybackurls)
- gauplus [go get -u -v github.com/bp0lr/gauplus] [@bp0lr](https://github.com/bp0lr/gauplus)
- anew [go get -u github.com/tomnomnom/anew] [@tomnomnom](https://github.com/tomnomnom/anew)
- httpx [@pdiscoveryio](https://github.com/projectdiscovery/httpx)
- pv [apt install pv -y]
