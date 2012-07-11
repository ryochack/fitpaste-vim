## fitpaste-vim

**fitpaste-vim**はVimの矩形選択モードでの一括挿入と同じ様な、一括ペーストを可能にするVimプラグインです。

### Usage

デフォルトでは以下にキーマッピングされます。
このキーマッピングは自由に変更できます。

	vmap <Leader>i <Plug>(fitpaste-insert)
	vmap <Leader>a <Plug>(fitpaste-append)
	vmap <Leader>p <Plug>(fitpaste-replace)

<br>
fitpaste-vimは無名レジスタの値を参照します。
無名レジスタには`_register_`の値が入っているとします。

	structure.member0
	structure.member1
	structure.member2
	structure.member3

矩形選択モード(<C-v>)で*の部分を選択します。

	*tructure.member0
	*tructure.member1
	*tructure.member2
	*tructure.member3

`<Plug>(fitpaste-insert)`を実行すると、選択行全ての*の前にレジスタ値が挿入されます。

	_register_structure.member0
	_register_structure.member1
	_register_structure.member2
	_register_structure.member3

また、`<Plug>(fitpaste-append)`を実行すると、選択行全ての*の後にレジスタ値が追加されます。

	s_register_tructure.member0
	s_register_tructure.member1
	s_register_tructure.member2
	s_register_tructure.member3

同様に、`<Plug>(fitpaste-replace)`で選択行全ての*をレジスタ値で置き換えます。

	_register_tructure.member0
	_register_tructure.member1
	_register_tructure.member2
	_register_tructure.member3

<br>
レジスタに2行以上の値が入っている時には、レジスタの値を繰り返してペーストします。

レジスタ値に以下２行の値が入っているとき

	_register1_
	_register2_

先ほどの選択範囲では`<Plug>(fitpaste-insert)`で以下のように展開されます。

	_register1_structure.member0
	_register2_structure.member1
	_register1_structure.member2
	_register2_structure.member3

<br>
### License
The MIT License
