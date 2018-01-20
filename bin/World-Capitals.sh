#!/bin/sh

# a world capital guessing game.

tty -s; if [ $? -ne 0 ]; then gnome-terminal -e "$0"; exit; fi

db="$HOME/.gnome2/nemo-scripts/Games/.world.capitals.txt"
randomquote="$HOME/.gnome2/nemo-scripts/Games/.randomquote.sh"

if [ ! -r $db ] ; then
  echo "$0: Can't open $db for reading." >&2
  exit 1
fi

guesses=0; correct=0; total=0

while [ "$guess" != "quit" ] ; do

  thiskey="$($randomquote $db)"

  country="$(echo $thiskey | cut -d\   -f1 | sed 's/-/ /g')"
   city="$(echo $thiskey | cut -d\   -f2 | sed 's/-/ /g')"
  match="$(echo $city | tr '[:upper:]' '[:lower:]')"

  guess="??" ; total=$(( $total + 1 )) ;

  echo ""
  echo "What city is the capital of $country?"

  while [ "$guess" != "$match" -a "$guess" != "next" -a "$guess" != "quit" ]
  do
    echo -n "Answer: "
    read guess

    if [ "$guess" = "$match" -o "$guess" = "$city" ] ; then
      echo ""
      echo "*** Absolutely correct!  Well done! ***"
      correct=$(( $correct + 1 ))
      guess=$match
    elif [ "$guess" = "next" -o "$guess" = "quit" ] ; then
      echo ""
      echo "$city is the capital of $country."
    else
      echo "I'm afraid that's not correct."
    fi
  done

done

echo "You got $correct out of $total presented."
exit 0
