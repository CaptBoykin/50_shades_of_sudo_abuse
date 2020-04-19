#!/bin/bash -x


HOMEDIRS=("section10_apps3"
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


cp -v '/etc/passwd.bak' '/etc/passwd' ;\
rm -v '/etc/passwd.bak' ;\

cp -v '/etc/shadow.bak' '/etc/shadow' ;\
rm -v '/etc/shadow.bak' ;\

cp -v '/etc/sudoers.bak' '/etc/sudoers' ;\
rm -v '/etc/sudoers.bak' ;\

cp -v '/etc/crontab.bak' '/etc/crontab' ;\
rm -v '/etc/crontab.bak' ;\

cp -v '/etc/group.bak' '/etc/group' ;\
rm -v '/etc/group.bak' ;\

rm -rfv '/etc/sudoers_fifty/'

for dir in ${HOMEDIRS[*]}
do
        rm -rfv "/home/${dir}/"
done

rm -rfv '/home.bak'

echo "[+] ALL DONE!  Please double-check for any leftover files or entries"
