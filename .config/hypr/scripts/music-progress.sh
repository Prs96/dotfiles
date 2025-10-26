#!/bin/bash
status=$(mpc -p 6601 status)
if ! echo "$status" | grep -q '\[playing\]'; then
  echo "[ -------------------- ] Paused"
  exit
fi
# Extract current time and total length (e.g. 0:45/3:12)
times=$(echo "$status" | awk 'NR==2 {print $3}')
pos=$(echo "$times" | cut -d'/' -f1)
len=$(echo "$times" | cut -d'/' -f2)
# Convert time (MM:SS) → seconds
to_seconds() {
  local IFS=:
  read -r m s <<<"$1"
  echo $((10#$m * 60 + 10#$s))
}
pos_s=$(to_seconds "$pos")
len_s=$(to_seconds "$len")
bar_length=20
progress=$(( pos_s * bar_length / len_s ))
bar=""
for ((i=0; i<bar_length; i++)); do
  if (( i < progress )); then
    bar+="▓"
  else
    bar+="-"
  fi
done
echo "[ $bar ] $pos / $len"
