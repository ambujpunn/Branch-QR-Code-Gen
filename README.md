# Branch-QR-Code-Gen
Generate a basic qr code quickly with its link using the terminal (ZSH Shell)

## Prerequisites
1. Install `zbar` using Homebrew: https://formulae.brew.sh/formula/zbar (this does the decoding of the qr code to get the wrapped link)

## Set up

1. Clone repo
2. Give executable permissions if not already: `chmod u+x qr.sh`
3. Open .zshrc using your text editor (example here using VI): `vi ~/.zshrc` to set your zsh shell settings
4. Add this line in .zshrc: `export PATH=/path/to/your/file:$PATH' (`/path/to/your/file` should be the path where your `qr.sh` is located)
5. Run this command from the command line: `source ~/.zshrc`
6. You should be able to use `qr.sh` anywhere from the command line now

Note: You can also create a symlink to the shell script and use that as a command too

## Script Instructions

Follow the script instructions and enter the required fields. The only field that is **required** is your Branch App Key

## Output

The script will store the QR Code image in the file you included in the script prompts or if not included, it will save it in this format: `qr-code-<random id>` within the same directory

The script will also print out the underlying link of the QR Code
