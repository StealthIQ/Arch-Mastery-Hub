## Unleashing the Power of Arch Linux: Boosting Productivity and Unleashing Creative Freedom

![Imgur](https://i.imgur.com/P2k2LrG.png)

## My Arch Linux Journey

* Arch is a free, open-source operating system delivering the latest software and features.
* My Personal experience in Arch Linux completely transformed my computing experience, providing me unparalleled control and customization.

### Chapter 1: Embracing the Arch Philosophy

* Arch Wiki: An invaluable resource for finding answers and guidance.
* GitHub readmes: Essential for smooth installations and updates.
* Erik Dubois' [YouTube](https://www.youtube.com/@ErikDubois) videos: Enlightening tutorials that enhanced my understanding of Arch Linux.
* [Arco Linix](https://arcolinux.com/) - helped me understand arch linux (learning path)

### Chapter 2: Exploring Window Managers and Beyond

* Window Managers (LeftWM, BSPWM, i3WM): Helped me in customization for aesthetics and efficiency.
* Polybar: very customizable fast and easy-to-use status bar
* SXHKD: a hotkey daemon that helped me to fully the control of keyboard. 
* Open-source ad-blocks - Saved tons of time 

### Chapter 3: Unleashing Unprecedented Productivity

* Custom keyboard shortcuts and gestures: Effortlessly access applications and websites.
* Using Vim and a tiling window manager, I enhanced my learning experience by watching tutorials on one side while coding on the other.

### Chapter 4: Community: A Supportive Ecosystem

* Arch Linux community: A strong support system fostering collaboration and problem-solving.
* Community page and Reddit: Valuable platforms for troubleshooting and engaging in discussions.
* GitHub readme pages: Simplifying complex wiki pages into easy to understand readmes.

### Chapter 5: Cons I have experienced so far

* Updates sometimes break the system (but usually very easy to fix)
* Ngl Arch Linux has a steep learning curve.
* Nevertheless there is a solution to everything.

### Conclusion

* Arch Linux revolutionized my computing experience, offering limitless customization, productivity and creative freedom.
* Made me very comfortable with Command line and Linux and its workings.
* I would say it was totally worth it 😏

## Arch Installation

* [Download Page](https://archlinux.org/download/)
* [Arch Installation wiki](https://wiki.archlinux.org/title/installation_guide)

## List of useful README

* Troubleshooting
* My Dotfiles(soon)
* Customization (soon)
* [Collection Usefull Apps](https://github.com/StealthIQ/Arch-Mastery-Hub/tree/0xFCE/Arch-Packages)
* [Easy Vim Guide](https://github.com/StealthIQ/Arch-Mastery-Hub/tree/0xFCE/NeoZen)
* Virtulization in Arch
* Privacy & Security

## Linux Command Line Basics

### Kill a Specific Process (Including Scripts)

````
pkill -9 -e -f <processname> 
````

### Making a directory

````
mkdir <filename>
````

### Making a file

````
touch <filename>
````

### Removing a file

````
rm <filename>
````

### Opening file manager - Using Terminal

````
nautilus
````

* open certain directory in file manager (tip-do -> pwd)

````
nautilus <Directory which you want to opean>
````

### Getting Date and time

````
date           --> Prints the date and time in cli
time           --> 
uptime         --> OS uptime
````

### Calander

````
cal            --> Prints the calander
cal -3         --> Prints previous months calander
cal jan 2018   --> Prints that 
````

### Disk Space Information

````
df             --> Prints Disk Space Usage in shit form
df -h          --> Prints Disk Space in human readable form
````

* `-h ` for human readable form

### List Directory

````
ls            -->normal files
ls -la        -->normal files + hidden files
la -lh        -->human readable
````

### Check how much space is used

````
du / du -h   --> prints the space used by the current dir
du /home/nitroplex/Downloads/Programs --> Prints space used by that secific directory
````

### Running Tasks

````
ps / ps -h      ---> prints current programs
ps ax / ps axh  ---> prints all the running programs
ps ax | less    ---> pipes it into an another program (easy to navigate)
ps man          ---> for more...

pidof firefox   ---> prints firefox's running task id
kill 8829282(firefox id) --> kills the specific process  

top             ---> same like htop
````

### Pipe Command | Run's another program along with the current command

````
wifite --help | less --> used for easy scrolling 
````

### Finds files

````
grep filename
````

### Prints Kernel (Current Running OS)

````
uname
````

---

## File Manipulation

````
ls              --> View contents of a directory (list)
````

````
pwd             --> Print the path of the current directory
````

````
cd              --> Change directory
````

````
mkdir           --> Make a new directory
````

````
mv              --> Move or rename files
````

````
cp              --> Copy files
````

````
rm              --> Remove files
````

````
touch           --> Create a new blank file
````

````
rmdir           --> Delete an empty directory
````

````
cat             --> Display file contents in the terminal
````

````
clear           --> Clear the terminal window
````

````
echo            --> Move data into a file
````

````
less            --> Read a text file one screen at a time
````

````
man             --> Show the manual of Linux commands
````

---

## System Information and Management

````
sudo            --> Execute a command with administrative or root permissions
````

````
top             --> Task manager in the terminal
````

````
tar             --> Archive multiple files into a tarball
````

````
grep            --> Search for specific words in files
````

````
head            --> View the first lines of a text file
````

````
tail            --> View the last lines of a text file
````

````
diff            --> Compare the contents of two files line by line
````

````
kill            --> Terminate or kill unresponsive programs
````

````
jobs            --> Display all current jobs along with their statuses
````

````
sort            --> Sort lines of text files
````

````
df              --> Show disk space information
````

````
du              --> Check the space used by files or directories
````

````
zip             --> Compress files into a zip archive
````

````
unzip           --> Extract files from a zip archive
````

````
ssh             --> Securely connect to another host over an insecure network
````

````
cal             --> Display a calendar
````

````
apt             --> Command-line tool for interacting with the packaging system
````

````
alias           --> Create custom shortcuts for commands
````

````
w               --> Show information about current users
````

````
whereis         --> Locate binary, source, and manual page files
````

````
whatis          --> Display one-line descriptions of man pages
````

````
useradd         --> Create a new user
````

````
passwd          --> Change the password of the current user
````

````
whoami          --> Print the current user
````

````
uptime          --> Display the current system uptime
````

````
free            --> Show information about free disk space
````

````
history         --> Display the history of used commands
````

````
uname           --> Print detailed information about the Linux system
````

````
ping            --> Check the connectivity status to a server
````

````
chmod           --> Change permissions of files and directories
````

````
chown           --> Change ownership of files and directories
````

````
find            --> Search for files and directories
````

````
locate          --> Locate a file using the search command
````

````
ifconfig        --> Print IP address information
````

````
ip a            --> Display network interface information
````

---

## How to Remove All Files from a Directory in Linux:

* **To delete all non-hidden files from a directory, type:**

````
$ rm -f /path/to/directory/*
````

* **To remove all files with the extension .txt from a directory, type:**

````
$ rm -f /path/to/directory/*.txt
````

* **To delete all non-hidden files and sub-directories along with all of their contents from a directory, run:**

````
$ rm -rf /path/to/directory/*
````

* **To delete all hidden files and directories from a folder, type:**

````
$ rm -rf /path/to/directory/{*,.*}
````

* **To delete all files from inside a folder but not remove its sub-directories, type:**

````
$ rm -f /path/to/directory/{*,.*}
````

* **To remove a folder whose name has a space, make sure to always use quotes like:**

````
$ rm -rf "directory name"
````

* **To see what is being done when deleting all files in a directory, pass the -v option to the rm command:**

````
$ rm -v /path/to/directory/*
````

* **To remove all the files from a directory having the extension .sh using the find command, you can use:**

````
$ find . -type f -name "*.sh" -exec rm -i {} \;
````

**Note**: In place of "*.sh," you can use "*" to delete all the files.

## Feedback

If you have any feedback, please reach out to me at stealthiq\[at\]protonmail\[.\]com or [twitter](https://twitter.com/StealthIQQ)

## Authors

* [@Stealthiq](https://www.github.com/stealthiq)
