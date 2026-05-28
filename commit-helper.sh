#!/bin/bash
           
# Universal draw_menu: pass the options as arguments to the function.
# `draw_menu` only draws the menu given the current `options`, `choices`, and `cursor`.
draw_menu() {
  local options=("$@")
  clear
  echo "Use Up/Down arrows to move, Space to select/deselect, Enter to confirm:"
  echo ""
  for i in "${!options[@]}"; do
    if [ "$i" -eq "$cursor" ]; then
      prefix=" > "
    else
      prefix="   "
    fi
    if [ "${choices[$i]:-0}" -eq 1 ]; then
      echo "${prefix}[X] ${options[$i]}"
    else
      echo "${prefix}[ ] ${options[$i]}"
    fi
  done
}


# run_menu: runs the interactive selection menu and prints selected items (one line, space-separated).
# Usage: selected=$(run_menu "One" "Two" "Three")
run_menu() {
  local options=("$@")

  # initialize choices (0 = not selected, 1 = selected)
  choices=()
  for i in "${!options[@]}"; do choices[$i]=0; done

  cursor=0
  while true; do
    draw_menu "${options[@]}"
    IFS= read -rsn1 key
    if [[ "$key" == " " ]]; then
      # Toggle selection
      if [ "${choices[$cursor]}" -eq 1 ]; then
        choices[$cursor]=0
      else
        choices[$cursor]=1
      fi
    elif [[ "$key" == $'\x1b' ]]; then
      IFS= read -rsn2 key
      if [[ $key == "[A" ]]; then # Up arrow
          ((cursor--))
          [ $cursor -lt 0 ] && cursor=$((${#options[@]} - 1))
      elif [[ $key == "[B" ]]; then # Down arrow
          ((cursor++))
          [ $cursor -ge ${#options[@]} ] && cursor=0
      fi
    elif [[ "$key" == $'\x0a' ]]; then
      break
    fi
  done

  # Print selected items one per line (safe for items containing spaces).
  local selected=()
  for i in "${!options[@]}"; do
    if [ "${choices[$i]}" -eq 1 ]; then
      selected+=("${options[$i]}")
    fi
  done
  for item in "${selected[@]}"; do
    printf "%s\n" "$item"
  done
}

# If script is executed directly, demonstrate default usage.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  selected=$(run_menu "Option A" "Option B" "Option C" "Option D")
  echo
  echo "You selected:"
  for item in ${selected}; do
    echo "- ${item}"
  done
fi
