#1
dnf groupinstall "Development Tools"

#2
wget --no-check-certificate https://drive.google.com/uc?export=download&id=1Likanu92YXCZzk4zmb3tQpVF6VuczQUu
tar -xzvf "uc?export=download&id=1Likanu92YXCZzk4zmb3tQpVF6VuczQUu"
yum install boost-devel
yum install ncurses-devel
cd bastet-0.43
vim Makefile
# install:
#         cp $(PROGNAME) /usr/bin
#         chmod o+x /usr/bin/$(PROGNAME)
make install
# Теперь можно играть от любого юзера и запустить через /usr/bin/./bastat

#3
yum list installed > task3.log

#4 
dnf deplist gcc > ~/task4_1.log
rpm -q --whatrequires libgcc > ~/task4_2.log

#5
wget --no-check-certificate https://drive.google.com/uc?export=download&id=1e7JcC9qrXz2rLX47njB-6mqslGNLC3Hx
yum install createrepo
mkdir -p localrepo
cp uc?export=download&id=1e7JcC9qrXz2rLX47njB-6mqslGNLC3Hx localrepo/checkinstall-1.6.2-3.el6.1.x86_64.rpm
createrepo localrepo/
cd /etc/yum.repos.d
touch localrepo.repo
vim /etc/yum.repos.d/localrepo.repo
# [localrepo]
# name=localrepo
# enabled=1
# gpgcheck=0
# baseurl=file:///root/localrepo/

#6
cd ..
dnf repolist all > task6.log

#7
mkdir /etc/yum.repos.d/repos
mv /etc/yum.repos.d/* /etc/yum.repos.d/repos
yum list avaible
dnf install ~/localrepo/checkinstall-1.6.2-3.el6.1.x86_64.rpm

#8
wget --no-check-certificate https://drive.google.com/uc?export=download&id=1ZYzShYWq_561AEEMeSuUjBi17uhdoKxR -O fortunes-ru_1.52-2_all.deb
dnf config-manager --set-enabled powertools
yum install alien
alien --to-rpm --scripts ./fortunes-ru_1.52-2_all.deb
rpm -ihv fortunes-ru_1.52-2_noarch.rpm

#9
wget https://www.nano-editor.org/dist/v5/nano-5.4.tar.xz
tar -xvf nano-5.4.tar.xz
cd nano-5.4
./configure --prefix=/usr/ --program-prefix=new
make
make install