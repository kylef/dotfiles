function colours
    echo "ANSI Codes"
    echo "0:     Reset"
    echo -e "1:     \033[1mBold\033[0m"
    echo "30-37: Foreground colour"
    echo "40-47: Background colour"
    echo

    for colour in (seq 0 7)
      set foreground (math $colour + 30)
      echo -ne "\033[$foreground""m"
      echo -ne " $colour "
      echo -ne "\e[0m "
    end
    echo
    for colour in (seq 0 7)
      set background (math $colour + 40)
      echo -ne "\033[$background""m"
      echo -ne " $colour "
      echo -ne "\e[0m "
    end
    echo
    echo

    echo "Foreground (+30)"
    for colour in (seq 0 7)
      set foreground (math $colour + 30)
      echo -ne "\033[$foreground""m"
      echo -n "\033[$foreground""m"
      echo -ne "\e[0m "
    end
    echo
    echo

    echo "Background (+40)"
    for colour in (seq 0 7)
      set background (math $colour + 40)
      echo -ne "\033[$background""m"
      echo -n "\033[$background""m"
      echo -ne "\e[0m "
    end
    echo
    echo

    echo "Foreground and Background"
    for foreground in (seq 30 37)
      for background in (seq 40 47)
        echo -ne "\033[$foreground;$background""m"
        echo -n "\033[$foreground;$background""m"
        echo -ne "\e[0m "
      end

      echo
    end
end

