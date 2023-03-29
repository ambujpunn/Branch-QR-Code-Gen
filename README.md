# Branch-QR-Code-Gen
Generate a basic qr code quickly with its link 

## Instructions

1. Clone repo
2. Give executable permissions if not already: `chmod u+x qr.sh`
3. Open .zshrc using your text editor (example here using VI): `vi ~/.zshrc` to set your zsh shell settings
4. Add this line in .zshrc: `export PATH=/path/to/your/file:$PATH' (`/path/to/your/file` should be the path where your `qr.sh` is located)
5. Run this command from the command line: `source ~/.zshrc`
6. You should be able to use `qr.sh` anywhere from the command line now

Note: You can also create a symlink to the shell script and use that as a command too
