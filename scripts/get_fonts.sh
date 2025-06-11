mkdir $HOME/.cache/uwdot
cd $HOME/.cache/uwdot

wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Monaspace.tar.xz"
mkdir mona
mv Monaspace.tar.xz mona
cd mona
tar xvf Monaspace.tar.xz --wildcards 'MonaspiceNe*'
rm Monaspace.tar.xz
mv Monaspice* $HOME/.local/share/fonts
cd ..
rm -rf mona

wget "https://font.download/dl/font/helvetica-255.zip"
unzip helvetica-255.zip
mv *.otf *.ttf $HOME/.local/share/fonts
rm helvetica-255.zip

cd ..
rm -rf uwdot
