## ⚙ Maya Production Environment Setup

This repository contains scripts to automate the setup of a Production environment, primarily for Maya projects on Ubuntu. The scripts install required packages and create configuration files for later use.

---

## 🔧 Manual Installation (preferred)

1. Install Subversion package to download just a particular folder from my repo
```shell
sudo apt install subversion
```
2. Clone the particular folder only 
```shell
svn export https://github.com/StealthIQ/Arch-Mastery-Hub.git/trunk/Maya-Production-Environment
```
3. Execute the script
```shell
cd Maya-Production-Environment
chmod +x ubuntu.sh # Makes the script excutable if not already
bash ubuntu.sh # Runs the script
```
## 🧲 Automated Install (Under Development)

**Using Wget:** (Use this)

```bash
wget -qO- https://raw.githubusercontent.com/StealthIQ/Arch-Mastery-Hub/master/Maya-Production-Environment/ubuntu.sh | bash
```

**Using Curl (if wget is not there):**

```bash
curl -fsSL https://raw.githubusercontent.com/StealthIQ/Arch-Mastery-Hub/master/Maya-Production-Environment/ubuntu.sh | bash
```

These scripts simplify and expedite the setup of your Production environment.

---

## 🦄 **Setting Up Git and GitHub**

1. **Install Git (if not installed):**

   ```shell
   sudo apt install git -y
   ```
   
2. **Configure Git:**

   Open your terminal and set your Git username and email address:

   ```shell
   git config --global user.name "Your username"
   git config --global user.email "youremail@example.com"
   ```
---

### 🔑 **GitHub Authentication (No Credentials Every Time)**

1. **Using SSH Key Authentication for GitHub:**

   Generate an SSH key (for Linux only):

   ```shell
   ssh-keygen -t ed25519 -C "yourmail@gmail.com"
   ```

2. Navigate to the `.ssh` folder on your system.
3. Open and copy the contents of the `id_ed25519.pub` file.
4. Go to your GitHub account settings [here](https://github.com/settings/keys).
5. Click on "New SSH Key."
6. Paste the copied `id_ed25519.pub` key and save it.
7. When cloning a GitHub repository, use the SSH link option and copy the link.
8. During the cloning process, you may be prompted to add the repository to your known hosts. Type "yes" when prompted.
---
### 🔓 **After Authentication**

1. **Clone a GitHub Repository:**

   To work with your GitHub repository on your local machine, use this command (replace `repository-url` with your repository's URL):

   ```shell
   git clone repository-url
   ```

2. **Create and Switch to a New Branch:**

   Open your terminal, navigate to the cloned repository's directory, and create a new branch:

   ```shell
   git checkout -b new-branch-name
   ```

   Verify the active branch with:

   ```shell
   git branch
   ```

3. **Add and Commit Changes:**

   Make changes to your local repository's files, and then stage and commit your changes:

   ```shell
   git add .
   git commit -m "Your commit message (describe what you did)"
   ```

4. **Push Changes to GitHub:**

   To upload your changes to your GitHub repository, use this command (replace `master` with your branch name if not working on the default branch):

   ```shell
   git push origin master
   ```

That's it! You've successfully set up Git and GitHub, authenticated using SSH keys, and pushed your code to GitHub. Congratulations! 
