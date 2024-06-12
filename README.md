# 💫MaterialDigger overwiew 
A bash script to automate upgrading and downgrading material renderdragon shaders of a popular sandbox game. This script is based on the brilliant work of [mcbegamerxx9541](https://github.com/mcbegamerxx954) which is originally known as [Material-Updater](https://github.com/mcbegamerxx954/material-updater/tree/v0.1.1).

Some part of mcpack scanner script is made with the help of chatGPT because iam not very experienced in bash script.

# ✒️Tutorial
1. Download and install [Termux](https://github.com/termux/termux-app/releases)

2. Place `shadername.mcpack` file in `Downloads` folder 

3. Open Termux and run this command `apt update -y && apt upgrade -y` (only once)

4. After that run this command (only once)

5. Follow all instructions given on screen

6. After using the above command once just use `bash materialdigger.sh` to start it everytime

7. After running it you can find output file in `Downloads` folder of your device

> [!IMPORTANT]
> This tool only supports versions from 1.80.30 to 1.20.80. You can upgrade or downgrade shaders between all these versions just make sure to put a valid version code when it asks during script execution.

