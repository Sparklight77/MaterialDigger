#!/bin/bash
# Define color variables
RESET='\033[0m'
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_MAGENTA='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'

# Decorative fancy text
echo -e "${YELLOW} Initializing Material Updater... ${RESET}"
sleep 1

# Check storage permissions
storage_dir="storage"
if [ -d "$storage_dir" ]; then
    echo -e " ${GREEN} Storage permission already granted. Proceeding... ${RESET}\n"
else
    echo -e " ${YELLOW} Granting Storage... ${RESET}"
    termux-setup-storage
fi

# Function to auto-detect architecture
auto_detect() {
    detected_arch=$(uname -m)
    case "$detected_arch" in
        aarch64)
            arch="aarch64"
            material_url="https://github.com/mcbegamerxx954/material-updater/releases/download/v0.1.11-hotfix2/material-updater-aarch64-linux-android.tar.gz"
            material_filename="material-updater-aarch64-linux-android.tar.gz"
            ;;
        armv7)
            arch="armv7"
            material_url="https://github.com/mcbegamerxx954/material-updater/releases/download/v0.1.11-hotfix2/material-updater-armv7-linux-androideabi.tar.gz"
            material_filename="material-updater-armv7-linux-androideabi.tar.gz"
            ;;
        x86_64)
            arch="x86_64"
            material_url="https://github.com/mcbegamerxx954/material-updater/releases/download/v0.1.11-hotfix2/material-updater-x86_64-unknown-linux-gnu.tar.gz"
            material_filename="material-updater-x86_64-unknown-linux-gnu.tar.gz"
            ;;
        *)
            echo -e "${RED} Unsupported architecture detected: $detected_arch. Exiting... ${RESET}"
            exit 1
            ;;
    esac
}

# Prompt user to choose the architecture
echo -e "${GREEN}Please select the architecture:${RESET}"
echo -e "${GREEN} 1) aarch64 ${RESET}"
echo -e "${GREEN} 2) armv7 ${RESET}"
echo -e "${GREEN} 3) Linux x86_64 ${RESET}"
echo -e "${GREEN} 4) Auto-detect \(experimental\)  ${RESET}"
read -p "$(echo -e ${YELLOW}Enter the number corresponding to the desired architecture:${RESET} ) " arch

# Set variables according to the user's selection
case "$arch" in
    1)
        arch="aarch64"
        material_url="https://github.com/mcbegamerxx954/material-updater/releases/download/v0.1.11-hotfix2/material-updater-aarch64-linux-android.tar.gz"
        material_filename="material-updater-aarch64-linux-android.tar.gz"
        ;;
    2)
        arch="armv7l"
        material_url="https://github.com/mcbegamerxx954/material-updater/releases/download/v0.1.11-hotfix2/material-updater-armv7-linux-androideabi.tar.gz"
        material_filename="injector-armv7-linux-androideabi.tar.gz"
        ;;
    3)
        arch="x86_64"
        material_url="https://github.com/mcbegamerxx954/material-updater/releases/download/v0.1.11-hotfix2/material-updater-x86_64-unknown-linux-gnu.tar.gz"
        material_filename="material-updater-x86_64-unknown-linux-gnu.tar.gz"
        ;;
    4)
        auto_detect
        ;;
    *)
        echo -e "${RED} Invalid selection. Exiting... ${RESET}"
        exit 1
        ;;
esac

# Define the directory
DOWNLOADS_DIR="/storage/emulated/0/Download"
OUT_DIR="/storage/emulated/0/MaterialBin"

# Find all .mcpack files in the Downloads directory and store them in an array
mapfile -t MCPACK_FILES < <(find "$DOWNLOADS_DIR" -type f -name "*.mcpack")

# Check if any .mcpack files were found
if [ ${#MCPACK_FILES[@]} -eq 0 ]; then
  echo -e " ${RED} No .mcpack files found in the Downloads directory. ${RESET}"
  exit 1
fi

# List the found .mcpack files
echo " ${CYAN} Found the following .mcpack files: ${RESET}"
for i in "${!MCPACK_FILES[@]}"; do
  echo "$((i+1)). ${MCPACK_FILES[$i]}"
done

# Prompt the user to select a file by number
echo -n " Select a file by number: "
read -r FILE_NUMBER

# Validate the input
if ! [[ "$FILE_NUMBER" =~ ^[0-9]+$ ]] || [ "$FILE_NUMBER" -le 0 ] || [ "$FILE_NUMBER" -gt ${#MCPACK_FILES[@]} ]; then
  echo " ${RED} Invalid selection. ${RESET}"
  exit 1
fi

# Store the selected file path in the PACK variable
PACK="${MCPACK_FILES[$((FILE_NUMBER-1))]}"
FILENAME=$(basename "$PACK")

echo -e " ${YELLOW} selected $FILENAME ${RESET}"
# Move the selected file to the Termux home directory
mv "$PACK" "$HOME"



# Prompt for additional details
echo -e "{YELLOW} Provide the following details to initiate material updater: ${RESET}"
read -p "shader Version (use correct code): " version
read -p "Output File Name (include .mcpack extension): " output

# Download the injector if not already present
if [ -f "$injector_filename" ]; then
    echo -e "${YELLOW} Injector Found. Skipping download... ${RESET}"
else
    echo -e "${YELLOW} Downloading the injector for '$arch'... ${RESET}"
    curl -L -o "$material_filename" "$material_url"
fi

# Extract material updater
echo -e "${BLUE} Extracting the material updater for $arch...${RESET}"
tar xvzf "$material_filename"

# updater command 
if ./material-updater "$FILENAME" -t v"$version" -o "$output"; then
     echo -e "${BLUE} pack updated successfully ${RESET}"
else
     echo -e "${RED} Update Failed ${RESET}"
     exit 1
fi


# Create output directory if it doesn't exist
if [ ! -d "$OUT_DIR" ]; then
  mkdir -p "$OUT_DIR"
  echo -e "${BOLD_YELLOW} 'MaterialBin' folder on home directory created successfully. Moving files...${RESET}"
  sleep 3
else
  echo -e "${BOLD_YELLOW} Moving files...${RESET}"
  sleep 3
fi

# Move the output file to the MaterialBin directory
mv "$output" "$OUT_DIR"
echo -e "${GREEN} Process completed successfully.${RESET}"
exit 0
