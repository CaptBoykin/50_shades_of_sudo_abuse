#!/bin/bash -x

HOMEDIRS='home/'

HOMEDIRS_LIST=("section10_apps3"
        "section11_pwfeedback"
        "section12_limited_shell"
        "section13_path2"
        "section14_2019-14287"
        "section1_opensudo"
        "section2_apps"
        "section3_apps2"
        "section4_pagers"
        "section5_cron"
        "section6_ldpreload"
        "section7_installers"
        "section8_path"
        "section9_editors")

### Backup up and appending to /etc/passwd
cp -v '/etc/passwd' '/etc/passwd.bak' &&\
PASSWD=$(cat etc/passwd)
echo "${PASSWD}" >> '/etc/passwd' &&\
###

### Backing up and appending to /etc/shadow
cp -v '/etc/shadow' '/etc/shadow.bak' &&\
SHADOW=$(cat etc/shadow)
echo "${SHADOW}" >> '/etc/shadow' &&\
###


echo "[***** New /etc/shadow *****]"
cat /etc/shadow
echo "[***************************]"


### Backing up and appending to sudoers
cp -v '/etc/sudoers' '/etc/sudoers.bak' &&\
echo '#includedir /etc/sudoers_fifty/' > '/etc/sudoers' &&\
SUDOERS=$(cat /etc/sudoers.bak)
echo "${SUDOERS}" >> '/etc/sudoers' &&\
###


echo "[***** New /etc/sudoers *****]"
cat /etc/sudoers
echo "[****************************]"


### Creating new sudoers.d styled include
mkdir -pv '/etc/sudoers_fifty/' &&\
SUDOERS_D=$(cat etc/sudoers)
echo "${SUDOERS_D}" >> '/etc/sudoers_fifty/sudoers_fifty' &&\
###

### Backing up and appending to crontab
cp -v '/etc/crontab' '/etc/crontab.bak' &&\
CRONTAB=$(cat etc/crontab)
echo "${CRONTAB}" >> '/etc/crontab' &&\
###

echo "[***** New /etc/crontab *****]"
cat /etc/crontab
echo "[****************************]"


### Backing up and appending to /etc/group
cp -v '/etc/group' '/etc/group.bak' &&\
GROUP=$(cat etc/group)
echo "${GROUP}" >> '/etc/group' &&\
###

echo "[***** new /etc/group *****]"
cat /etc/group
echo "[**************************]"

### Backing up /home and creating dirs
mkdir -v '/home.bak' &&\
cp -vr '/home' '/home.bak' &&\

for dir in ${HOMEDIRS_LIST[*]}
do
        unzip "${HOMEDIRS}/${dir}.zip" -d '/home/'
done
###


### Ensuring new sudo binaries are owned by 0 and have SUID
chown -v root:root /home/section9_editors/bin/* ;\
chmod u+s /home/section9_editors/bin/* ;\
chmod +x /home/section9_editors/bin/* ;\

chown -v root:root /home/section11_pwfeedback/bin/* ;\
chmod u+s /home/section11_pwfeedback/bin/* ;\
chmod +x /home/section11_pwfeedback/bin/* ;\

chown -v root:root /home/section14_2019-14287/bin/* ;\
chmod u+s /home/section14_2019-14287/bin/* ;\
chmod +x /home/section14_2019-14287/bin/* ;\

ls -alh /home/section9_editors/bin/ ;\
ls -alh /home/section11_pwfeedback/bin/ ;\
ls -alh /home/section14_2019-14287/bin/ ;\

echo "[+] ALL DONE!"
