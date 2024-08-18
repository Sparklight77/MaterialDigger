# 💫MaterialDigger overwiew 
A bash script to automate upgrading and downgrading material renderdragon shaders of a popular sandbox game. This script is based on the brilliant work of [mcbegamerxx9541](https://github.com/mcbegamerxx954) which is originally known as [Material-Updater](https://github.com/mcbegamerxx954/material-updater/tree/v0.1.1).

Some part of mcpack scanner script is made with the help of chatGPT because iam not very experienced in bash script.

# ✒️Tutorial
1. Download and install [Termux](https://github.com/termux/termux-app/releases)

2. Place `shadername.mcpack` file in `Downloads` folder 

3. Open Termux and run this command `apt update -y && apt upgrade -y` (only once)

4. After that run this command (only once)
```
curl -o material.sh https://raw.githubusercontent.com/Sparklight77/MaterialDigger/main/material.sh && bash material.sh
```

5. Follow all instructions given on screen

6. After using the above command once just use `bash material.sh` to start it everytime

7. After running it you can find output file in `Downloads` folder of your device

> [!IMPORTANT]
> This tool only supports versions from 1.18.30 to latest. You can upgrade or downgrade shaders between all these versions just make sure to put a valid version code when it asks during script execution.

# 🔋List of supported version codes
Here is the list of supported version codes

**v1-18-30**

**v1-19-60**

**v1-20-80**

**v1-21-20**


# 📀All Architectures Support 
This script supports all architectures. You will get a prompt of architecture selection during script execution. However if you're not sure what to select then select `auto-detect` and watch the script do the complex process of detection and applying necessary configurations according to your device.

> [!TIP]
> Every device can upgrade/downgrade files of any architecture, however working of unsupported architecture is not guaranteed.

> [!NOTE]
> If you encounter any problems, simply open an issue in [mcbegamerxx9541 repo](https://github.com/mcbegamerxx954/material-updater/tree/v0.1.1) and tell them the problem and mention that you used this script 

# 📝Note
For further suggestions and improvements open an issue here or contact me on Discord `@sparklight77`. Iam always looking for improvements.
