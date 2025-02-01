#!/bin/bash

# Paths
WAL_COLORS="$HOME/.cache/wal/colors.json"
BTOP_THEMES_DIR="$HOME/.config/btop/themes"
BTOP_THEME_NAME="wal.theme"

# Check if colors.json exists
if [[ ! -f "$WAL_COLORS" ]]; then
  echo "Error: Pywal colors.json not found at $WAL_COLORS"
  exit 1
fi

# Extract colors from Pywal's colors.json
BACKGROUND=$(jq -r '.special.background' "$WAL_COLORS")
FOREGROUND=$(jq -r '.special.foreground' "$WAL_COLORS")

COLOR0=$(jq -r '.colors.color0' "$WAL_COLORS")
COLOR1=$(jq -r '.colors.color1' "$WAL_COLORS")
COLOR2=$(jq -r '.colors.color2' "$WAL_COLORS")
COLOR3=$(jq -r '.colors.color3' "$WAL_COLORS")
COLOR4=$(jq -r '.colors.color4' "$WAL_COLORS")
COLOR5=$(jq -r '.colors.color5' "$WAL_COLORS")
COLOR6=$(jq -r '.colors.color6' "$WAL_COLORS")
COLOR7=$(jq -r '.colors.color7' "$WAL_COLORS")
COLOR8=$(jq -r '.colors.color8' "$WAL_COLORS")
COLOR9=$(jq -r '.colors.color9' "$WAL_COLORS")
COLOR10=$(jq -r '.colors.color10' "$WAL_COLORS")
COLOR11=$(jq -r '.colors.color11' "$WAL_COLORS")
COLOR12=$(jq -r '.colors.color12' "$WAL_COLORS")
COLOR13=$(jq -r '.colors.color13' "$WAL_COLORS")
COLOR14=$(jq -r '.colors.color14' "$WAL_COLORS")
COLOR15=$(jq -r '.colors.color15' "$WAL_COLORS")

# Create btop theme
mkdir -p "$BTOP_THEMES_DIR"
BTOP_THEME="$BTOP_THEMES_DIR/$BTOP_THEME_NAME"

cat >"$BTOP_THEME" <<EOF
# Generated from Pywal
theme[main_bg]="$BACKGROUND"
theme[main_fg]="$FOREGROUND"
theme[title]="$FOREGROUND"
theme[hi_fg]="$COLOR5"
theme[selected_bg]="$COLOR4"
theme[selected_fg]="$FOREGROUND"
theme[inactive_fg]="$COLOR8"
theme[graph_text]="$COLOR3"
theme[meter_bg]="$COLOR2"
theme[proc_misc]="$COLOR6"
theme[cpu_box]="$COLOR9"
theme[mem_box]="$COLOR9"
theme[net_box]="$COLOR9"
theme[proc_box]="$COLOR9"
theme[div_line]="$COLOR8"
theme[temp_start]="$COLOR2"
theme[temp_mid]="$COLOR5"
theme[temp_end]="$COLOR1"
theme[cpu_start]="$COLOR2"
theme[cpu_mid]="$COLOR4"
theme[cpu_end]="$COLOR1"
theme[free_start]="$COLOR1"
theme[free_mid]="$COLOR4"
theme[free_end]="$COLOR2"
theme[cached_start]="$COLOR1"
theme[cached_mid]="$COLOR4"
theme[cached_end]="$COLOR2"
theme[available_start]="$COLOR1"
theme[available_mid]="$COLOR4"
theme[available_end]="$COLOR2"
theme[used_start]="$COLOR2"
theme[used_mid]="$COLOR4"
theme[used_end]="$COLOR1"
theme[download_start]="$COLOR2"
theme[download_mid]="$COLOR5"
theme[download_end]="$COLOR1"
theme[upload_start]="$COLOR2"
theme[upload_mid]="$COLOR5"
theme[upload_end]="$COLOR1"
theme[process_start]="$COLOR8"
theme[process_mid]="$COLOR4"
theme[process_end]="$COLOR9"
EOF

echo "BTOP theme successfully created at $BTOP_THEME"
