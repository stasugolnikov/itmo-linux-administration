cd $HOME
mkdir test && cd test
ls -Ap /etc/ >list
ls -d /etc/*/ | wc -l >>list
find /etc/ -mindepth 1 -maxdepth 1 -type f -name '.*' | wc -l >>list
mkdir links
cd links
ln ../test/list list_hlink
ln -s ../test/list list_slink
stat --format=%h list_hlink # 2
stat --format=%h ../list    # 2
stat --format=%h list_slink # 1
wc -l ../list >>list_hlink
cmp list_slink list_hlink && echo YES || echo NO # YES
mv list list1
cmp list_slink list_hlink && echo YES || echo NO # cmp: list_slink No such file or directory
# NO
cd $HOME
ln test/list1 list_link
find /etc/ -name "*.conf" >list_conf
find /etc/ -maxdepth 1 -name "*.d" -type d >list_d
cat list_conf list_d >list_conf_d
mkdir ./test/.sub
cp list_conf_d test/.sub/
cp -b list_conf_d test/.sub/
ls -aR ./test/
man man >man.txt
split -b 1024 man.txt "man.txt_"
mkdir man.dir
mv man.txt_* man.dir
cat man.dir/* >man.txt
cmp man.txt man.dir/man.txt && echo YES || echo NO # YES
echo fdgdfgfg >tmp.txt && cat man.txt >>tmp.txt && cat tmp.txt >man.txt && rm tmp.txt && echo gfdsdfg >>man.txt
diff man.txt man.dir/man.txt >diff.txt
mv diff.txt man.dir/
patch ./man.dir/man.txt ./man.dir/diff.txt
cmp man.txt man.dir/man.txt && echo YES || echo NO # YES
