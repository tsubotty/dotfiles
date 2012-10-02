DOT_FILES = .zshrc .vimrc .gvimrc .vim .gemrc .zsh .vimperatorrc .emacs.d .gitconfig

all: install

#それぞれ（全て）をインストール（linkを貼る)
install: $(foreach f, $(DOT_FILES), link-dot-file-$(f))

#zshだけinstallする
zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))
	
	#cleanは例外
.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))
	

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
