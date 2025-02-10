###!/usr/bin/env nix-shell
###!nix-shell -i bash --packages gum

DOTDIR="$HOME/.config"
CONTAINER_HOME="$DOTDIR/custom-scripts/containers"

if [ ! -d "$CONTAINER_HOME" ]; then
  echo "Error: path $CONTAINER_HOME not found. Exiting."
  exit 1
fi

if [ ! -d "$CONTAINER_HOME" ]; then
  echo "Error: path $CONTAINER_HOME not found. Exiting."
  exit 1
fi

YML_FILES=$(find "$CONTAINER_HOME" -type f -name "*.yml")
BASENAMES=()
FULL_LIST=()

while IFS= read -r file; do
  BASENAMES+=("$(basename "$file")")
  FULL_LIST+=("$file")
done <<<"$YML_FILES"

OPTIONS="All\n"$(printf "%s\n" "${BASENAMES[@]}")

SELECTED_FILES=$(echo -e "$OPTIONS" | gum choose --no-limit --header "Choose docker files to start:")

SELECTED_PATHS=()

echo "Selected file paths:"
for path in "${SELECTED_PATHS[@]}"; do
  echo "$path"
done

### 'select all' logic
if [[ "$SELECTED_FILES" == *"All"* ]]; then
  SELECTED_PATHS=$YML_FILES
else
  for selected_file in $SELECTED_FILES; do
    for file in "${FULL_LIST[@]}"; do
      if [[ "$selected_file" == "$(basename "$file")" ]]; then
        SELECTED_PATHS+=("$file")
        break
      fi
    done
  done
fi

SELECTED_PATHS_STRING=$(printf "%s\n" "${SELECTED_PATHS[@]}")

# echo "You selected the following YAML files:"
# echo -e $SELECTED_PATHS_STRING
# exit

echo "Checking for warnings..."
echo "$SELECTED_PATHS_STRING" | while read -r FOO; do
  echo "> docker compose -f $FOO config"
  ### link env file to corresponding directory
  ln -sf $CONTAINER_HOME/.env $(dirname "$FOO")
  output=$(docker compose -f "$FOO" config)
done

echo "Do you want to continue? (yes/no)"
answer=$(gum confirm "Please check for warnings above before proceeding, continue?")
OK=$?

echo 'answer:' $OK
if [[ $OK == "1" ]]; then
  echo "Exiting..."
  exit 1
fi

echo "$SELECTED_PATHS_STRING" | while read -r FOO; do
  echo "> docker compose -f $FOO down"
  docker compose -f "$FOO" down
  echo "> docker compose -f $FOO up -d"
  docker compose -f "$FOO" up -d
done

# ### check for corresponding .env file
# echo "$SELECTED_FILES" | while read -r FOO; do
#   DIR=$(dirname "$FOO")
#   FILE=$(basename "$FOO")
#   echo "Parsing $DIR, $FILE"
#   if [ -f "${FOO//.yml/.env}" ]; then
#     if [ ! -f "$DIR/.env" ]; then
#       echo "$DIR/$FILE" does not have a corresponding .env file
#       exit 1
#     fi
#   fi
# done

# find "$SEARCH_DIR" -type f -name "*.env" | while read -r ENV_FILE; do
#   # Get the directory of the found .env file
#   DIR=$(dirname "$ENV_FILE")

#   # Check if the .env file exists in that directory
#   if [ -f "$DIR/.env" ]; then
#     gum style --foreground 255 --background 28 "Found .env file in '$DIR'."
#   else
#     gum style --foreground 0 --background 220 "Warning: No .env file found in '$DIR'."
#   fi
# done

