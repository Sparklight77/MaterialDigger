# 💫MaterialDigger overwiew 
A bash script to automate upgrading and downgrading material renderdragon shaders of a popular sandbox game. This script is based on the brilliant work of [mcbegamerxx9541](https://github.com/mcbegamerxx954) which is originally known as [Material-Updater](https://github.com/mcbegamerxx954/material-updater/tree/v0.1.1).

Some part of mcpack scanner script is made with the help of chatGPT because iam not very experienced in bash script.

# ✒️Tutorial
1. Download and install [Termux](https://github.com/termux/termux-app/releases)

2. Place `shadername.mcpack` file in `Downloads` folder 

3. Open Termux and run this command `apt update -y && apt upgrade -y` (only once)

4. After that run this command (only once)
```
curl -o material.sh https://raw.githubusercontent.com/Sparklight77/MaterialDigger/main/material.sh && material.sh
```

5. Follow all instructions given on screen

6. After using the above command once just use `bash material.sh` to start it everytime

7. After running it you can find output file in `Downloads` folder of your device

> [!IMPORTANT]
> This tool only supports versions from 1.80.30 to 1.20.80. You can upgrade or downgrade shaders between all these versions just make sure to put a valid version code when it asks during script execution.

# 🔋List of supported version codes
Here is the list of Minecraft Bedrock Edition versions from 1.18.30 to 1.20.81

1. **1.18.30** - April 19, 2022
2. **1.18.31** - May 5, 2022
3. **1.18.32** - June 7, 2022
4. **1.18.33** - August 2, 2022
5. **1.19.0** - June 7, 2022 (The Wild Update)
6. **1.19.10** - July 12, 2022
7. **1.19.11** - July 19, 2022
8. **1.19.20** - August 9, 2022
9. **1.19.21** - September 20, 2022
10. **1.19.30** - September 20, 2022
11. **1.19.31** - October 4, 2022
12. **1.19.40** - November 8, 2022
13. **1.19.41** - November 16, 2022
14. **1.19.50** - December 6, 2022
15. **1.19.51** - December 13, 2022
16. **1.19.60** - January 17, 2023
17. **1.19.62** - February 7, 2023
18. **1.19.63** - February 21, 2023
19. **1.19.70** - March 14, 2023
20. **1.19.71** - March 28, 2023
21. **1.19.72** - April 19, 2023
22. **1.19.73** - April 26, 2023
23. **1.20.0** - June 7, 2023 (Trails & Tales Update)
24. **1.20.10** - July 11, 2023
25. **1.20.12** - August 22, 2023
26. **1.20.30** - October 3, 2023
27. **1.20.31** - October 10, 2023
28. **1.20.32** - November 7, 2023
29. **1.20.50** - December 5, 2023
30. **1.20.51** - December 12, 2023
31. **1.20.70** - March 22, 2024
32. **1.20.72** - March 29, 2024
33. **1.20.73** - April 1, 2024
34. **1.20.80** - April 19, 2024
35. **1.20.81** - April 29, 2024

# 📀All Architectures Support 
This script supports all architectures. You will get a prompt of architecture selection during script execution. However if you're not sure what to select then select `auto-detect` and watch the script do the complex process of detection and applying necessary configurations according to your device.

> [!TIP]
> Every device can upgrade/downgrade files of any architecture, however working of unsupported architecture is not guaranteed.

> [!NOTE]
> If you encounter any problems, simply open an issue in [mcbegamerxx9541 script](https://github.com/mcbegamerxx954/material-updater/tree/v0.1.1) and tell them the problem and mention that you used this script 

# 📝Note
For further suggestions and improvements open an issue here or contact me on Discord `@sparklight77`. Iam always looking for improvements.
