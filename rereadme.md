<div align="center">
  <img src="assets/logo.png" alt="logo" width="250" height="auto" />
<h1>BACK-ME-UP</h1>
  
  <p>
    A tool to automate a bugbounty process as: Tool will execute multiple tools to collect URLs from internet archives then use some useful patterns/RegEx to look for Sensitive Data Leakage in the form of multiple juicy extensions.
  </p>
  
  
<!-- Badges -->
<h4>
    <a href="https://github.com/***/***/">View Demo</a>
    <span> · </span>
    <a href="https://github.com/***/***/issues/">Report Bug</a>
  <span> · </span>
    <a href="https://github.com/***/***/issues/">Request Feature</a>
  </h4>
</div>

<br />

## Tool Description

Back-Me-Up is a powerful shell script tool designed to automate the bug bounty process by collecting URLs from internet archive data and searching for sensitive data leakage in the form of juicy extensions. The tool utilizes multiple tools, including gau, gauplus, katana, and waybackurls, to streamline the process.

## Prerequisites and Installation

### Requirements

* **go**
* **gau**
* **gauplus**
* **katana**
* **waybackurls**
* **hakrawler**

### Installation

1. Clone the repo: `git clone https://github.com/Dheerajmadhukar/back-me-up.git`
2. Change dir & run the script: `cd back-me-up/`
3. To check installed prerequisite packages/tools/libs :
```
bash backmeup.sh --check/-c
```
<img src="assets/backmeup-2.png" alt="logo" width="auto" height="auto" />

4. To install all the prerequisite packages/tools/libs :
```
bash backmeup.sh --install/-i
```
<img src="assets/backmeup-3.png" alt="logo" width="auto" height="auto" />

### Usage

To use Back-Me-Up, run the following command:

```
bash backmeup.sh --help/-h
```
<img src="assets/backmeup-1.png" alt="logo" width="auto" height="auto" />

### How it Works

Back-Me-Up works by combining the power of multiple tools to automate the bug bounty process. Here's a high-level overview of the process:

### Step 1: URL Collection

The tool uses `waybackurls` to gather URLs from internet archive data.

### Step 2: Extension Filtering

Back-Me-Up filters the URLs based on a list of juicy extensions, which are known to contain sensitive data.

### Step 3: Data Extraction

The tool uses `gau` and `gauplus` to extract data from the filtered URLs.

### Step 4: Data Analysis

Finally, Back-Me-Up analyzes the extracted data using regular expressions and patterns to discover sensitive data leakage.

## Features

* Automates the bug bounty process for sensitive data leakage discovery
* Utilizes multiple tools for URL collection, data extraction, and data analysis
* Provides a user-friendly command-line interface
* Regular expression and pattern-based data analysis

## Demo Video

Watch the demo video on [YouTube](https://www.youtube.com/watch?v=VideoID).

## Disclaimer

Back-Me-Up is designed for responsible use in legitimate penetration testing and bug bounty programs. Misuse of this tool may lead to legal consequences. The author is not responsible for any misuse of this tool.

## Author Details

**Your Name**

* Twitter: [@YourTwitterHandle](https://twitter.com/YourTwitterHandle)
* GitHub: [@YourGitHubHandle](https://github.com/YourGitHubHandle)
* Email: [youremail@example.com](mailto:youremail@example.com)

## Support Me

If you find Back-Me-Up useful, consider buying me a beer to support future development:

<a href="https://www.buymeacoffee.com/YourUsername" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me a Coffee" style="height: 60px!important;width: 217px!important;">
</a>
