# vcs_info
autoload vcs_info
# gitのみ有効にする
zstyle ":vcs_info:*" enable git
# commitしていない変更をチェックする
zstyle ":vcs_info:git:*" check-for-changes true
# gitリポジトリに対して、変更情報とリポジトリ情報を表示する
zstyle ":vcs_info:git:*" formats "%c%u[%b:%r]"
# gitリポジトリに対して、コンフリクトなどの情報を表示する
zstyle ":vcs_info:git:*" actionformats "%c%u<%a>[%b:%r]"
# addしていない変更があることを示す文字列
zstyle ":vcs_info:git:*" unstagedstr "<A>"
# commitしていないstageがあることを示す文字列
zstyle ":vcs_info:git:*" stagedstr "<C>"

# git：まだpushしていないcommitあるかチェックする
my_git_info_push () {
	if [ "$(git remote 2>/dev/null)" != "" ]; then
		local head="$(git rev-parse HEAD)"
		local remote
		for remote in $(git rev-parse --remotes) ; do
			if [ "$head" = "$remote" ]; then return 0 ; fi
		done
		# pushしていないcommitがあることを示す文字列
		echo "<P>"
	fi
}

# git：stashに退避したものがあるかチェックする
my_git_info_stash () {
	if [ "$(git stash list 2>/dev/null)" != "" ]; then
		# stashがあることを示す文字列
		echo "{s}"
	fi
}

# vcs_infoの出力に独自の出力を付加する
my_vcs_info () {
	vcs_info
	echo $(my_git_info_stash)$(my_git_info_push)$vcs_info_msg_0_
}

