#!/bin/bash

PASSWD=$(cat etc/passwd)
SHADOW=$(cat etc/shadow)
CRONTAB=$(cat etc/crontab)
SUDOERS=$(cat etc/sudoers)
GROUP=$(cat etc/group)
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


cp -v '/etc/passwd' '/etc/passwd.bak' &&\
echo "${PASSWD}" >> '/etc/passwd' &&\

cp -v '/etc/shadow' '/etc/shadow.bak' &&\
echo "${SHADOW}" >> '/etc/shadow' &&\

cp -v '/etc/sudoers' '/etc/sudoers.bak' &&\
echo "${SUDOERS}" >> '/etc/sudoers' &&\

cp -v '/etc/crontab' '/etc/crontab.bak' &&\
echo "${CRONTAB}" >> '/etc/crontab' &&\

cp -v '/etc/group' '/etc/group.bak' &&\
echo "${GROUP}" >> '/etc/group' &&\

mkdir -v '/home.bak' &&\
cp -vr '/home' '/home.bak' &&\

for dir in ${HOMEDIRS_LIST[*]}
do
	cp -vr "${HOMEDIRS}/${dir}" '/home'
done


chown -v root:root '/home/section9_editors/bin/sudo' ;\
chmod u+s '/home/section9_editors/bin/sudo' ;\

chown -v root:root '/home/section11_pwfeedback/bin/sudo' ;\
chmod u+s '/home/section11_pwfeedback/bin/sudo' ;\

chown -v root:root '/home/section14_2019-14287/bin/sudo' ;\
chmod u+s '/home/section14_2019-14287/bin/sudo' ;\

ls -alh '/home/section9_editors/bin/sudo' ;\
ls -alh '/home/section11_pwfeedback/bin/sudo' ;\
ls -alh '/home/section14_2019-14287/bin/sudo' ;\

echo "[+] ALL DONE!"
