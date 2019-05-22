#Да се напише shell скрипт, който приканва потребителя да въведе име (низ) и изпечатва "Hello, името".
#!/bin/sh
read -p "What is you name: " name
echo "Hello, "${name}"" 
