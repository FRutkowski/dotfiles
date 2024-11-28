{ pkgs, config, inputs, ... }:
let

  configDirectory = config.var.configDirectory;
  hostname = config.var.hostname;

  power = pkgs.writeShellScriptBin "power" # Zmieniamy nazwę na "power"
    # bash
    ''
      function exec() {
        $@
      }

      function ui(){
        DEFAULT_ICON="󰘳"

        # "icon;name;command"[]
        apps=(
          "󰓅;Performance Mode;powerprofilesctl set performance"
          ";Balanced Mode;powerprofilesctl set balanced"
          ";Power Save Mode;powerprofilesctl set power-saver"
          "󰚰;Current Profile;powerprofilesctl get"
        )


        # Apply default icons if empty:
        for i in "''${!apps[@]}"; do
          apps[i]=$(echo "''${apps[i]}" | sed 's/^;/'$DEFAULT_ICON';/')
        done

        fzf_result=$(printf "%s\n" "''${apps[@]}" | awk -F ';' '{print $1" "$2}' | fzf)
        [[ -z $fzf_result ]] && exit 0
        fzf_result=''${fzf_result/ /;}
        line=$(printf "%s\n" "''${apps[@]}" | grep "$fzf_result")
        command=$(echo "$line" | sed 's/^[^;]*;//;s/^[^;]*;//')

        exec "$command"
        exit 0
      }

      [[ $1 == "" ]] && ui

      if [[ $1 == "performance" ]]; then
        powerprofilesctl set performance
      elif [[ $1 == "balanced" ]]; then
        powerprofilesctl set balanced
      elif [[ $1 == "power-save" ]]; then
        powerprofilesctl set power-saver
      elif [[ $1 == "status" ]]; then
        powerprofilesctl get
      elif [[ $1 == "loop" ]]; then
        while true; do
          power
          echo "Press enter to continue, e to exit"
          read -n 1 REPLY
          clear
          [[ $REPLY == "e" ]] && exit 0
        done
      else
        echo "Unknown argument"
      fi
    '';

in { home.packages = [ power ]; }
