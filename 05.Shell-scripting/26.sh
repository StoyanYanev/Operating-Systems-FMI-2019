#Напишете shell script guess, която си намисля число, което вие трябва да познате. 
#В зависимост от вашия отговор, програмата трябва да ви казва "надолу" или "нагоре", 
#докато не познате числото. Когато го познаете, програмата да ви казва с колко опита сте успели.

#: Един начин да направите рандъм число е с $(( (RANDOM % b) + a  )), 
#което ще генерира число в интервала [a, b]. Може да вземете a и b като параметри, 
#но не забравяйте да направите проверката.

#!/bin/bash
echo "Guess the number"
counter=0
#guess=5
guess=$(( (RANDOM % 100) + 1)) # Generate ranodom number from [1;100]
while [[ ! ($guess -eq $number) ]]; do
	read -p "Enter guess: " number
	if [[ $guess -gt $number ]]; then
		echo "Your guess is higher"
	elif [[ $guess -lt $number ]]; then
		echo "Your guess is lower"
	fi
	counter=$(($counter + 1))
done
echo "RIGHT! Guessed in $counter tries"
