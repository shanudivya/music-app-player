#!/bin/bash

# Define the files with their full paths (existing files)
FILES=(
  "src/App.js"
  "src/index.js"
  "src/reportWebVitals.js"
  "src/index.css"
  "src/component/Control.js"
  "src/component/Detail.js"
  "src/component/Player.js"
)

# Define the number of total commits and weeks we want
TOTAL_COMMITS=365

# Function to add space at the beginning of the first line
add_space_to_first_line() {
  local file=$1
  # Add space before the first character in the first line
  sed -i '' '1s/^/ /' "$file"
}

# Function to remove space from the beginning of the first line
remove_space_from_first_line() {
  local file=$1
  # Remove space from before the first character in the first line, if it exists
  sed -i '' '1s/^ //' "$file"
}

# Loop through the year and make commits
for i in $(seq 1 $TOTAL_COMMITS)
do
  # Randomly decide whether to commit on a random day or an entire week
  if (( RANDOM % 10 < 7 )); then
    # Commit on a random day
    COMMIT_DATE=$(date -v-$((RANDOM % 365))d '+%Y-%m-%dT12:00:00')

    # Choose a random file from the list and modify it
    RANDOM_FILE=${FILES[$RANDOM % ${#FILES[@]}]}
    
    # Get the number of previous changes for this file
    change_count=$(git log --oneline "$RANDOM_FILE" | wc -l)

    # If the number of changes is odd, add space, if even, remove space
    if (( change_count % 2 != 0 )); then
      add_space_to_first_line "$RANDOM_FILE"
    else
      remove_space_from_first_line "$RANDOM_FILE"
    fi
    
    # Add and commit the change
    git add "$RANDOM_FILE"
    export GIT_COMMITTER_DATE="$COMMIT_DATE"
    export GIT_AUTHOR_DATE="$COMMIT_DATE"
    git commit --allow-empty -m "Commit from $COMMIT_DATE"
  else
    # Commit for an entire week
    WEEK_START=$(date -v-$((RANDOM % 365))d '+%Y-%m-%d')
    WEEK_END=$(date -v+7d -j -f "%Y-%m-%d" "$WEEK_START" '+%Y-%m-%d')

    # Choose a random file from the list and modify it
    RANDOM_FILE=${FILES[$RANDOM % ${#FILES[@]}]}
    
    # Get the number of previous changes for this file
    change_count=$(git log --oneline "$RANDOM_FILE" | wc -l)

    # If the number of changes is odd, add space, if even, remove space
    if (( change_count % 2 != 0 )); then
      add_space_to_first_line "$RANDOM_FILE"
    else
      remove_space_from_first_line "$RANDOM_FILE"
    fi
    
    # Add and commit the change
    git add "$RANDOM_FILE"
    export GIT_COMMITTER_DATE="$WEEK_START"
    export GIT_AUTHOR_DATE="$WEEK_START"
    git commit --allow-empty -m "Commit from $WEEK_START to $WEEK_END"
  fi
done
