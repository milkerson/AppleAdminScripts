#!/bin/bash
checkdate=`date | awk '{print $1}'`
OF=all_databases-$(date +%Y%m%d)
case "$checkdate"
in
Sun)
rm /Users/fd2s_admin/Documents/Backups/mail_mysql/sunday/*
/usr/bin/mysqldump -l --all-databases | gzip > /Users/fd2s_admin/Documents/Backups/mail_mysql/sunday/$OF.gz
;;
Mon)
rm /Users/fd2s_admin/Documents/Backups/mail_mysql/monday/*
/usr/bin/mysqldump -l --all-databases | gzip > /Users/fd2s_admin/Documents/Backups/mail_mysql/monday/$OF.gz
;;
Tue)
rm /Users/fd2s_admin/Documents/Backups/mail_mysql/tuesday/*
/usr/bin/mysqldump -l --all-databases | gzip > /Users/fd2s_admin/Documents/Backups/mail_mysql/tuesday/$OF.gz
;;
Wed)
rm /Users/fd2s_admin/Documents/Backups/mail_mysql/wednesday/*
/usr/bin/mysqldump -l --all-databases | gzip > /Users/fd2s_admin/Documents/Backups/mail_mysql/wednesday/$OF.gz
;;
Thu)
rm /Users/fd2s_admin/Documents/Backups/mail_mysql/thursday/*
/usr/bin/mysqldump -l --all-databases | gzip > /Users/fd2s_admin/Documents/Backups/mail_mysql/thursday/$OF.gz
;;
Fri)
rm /Users/fd2s_admin/Documents/Backups/mail_mysql/friday/*
/usr/bin/mysqldump -l --all-databases | gzip > /Users/fd2s_admin/Documents/Backups/mail_mysql/friday/$OF.gz
;;
Sat)
rm /Users/fd2s_admin/Documents/Backups/mail_mysql/saturday/*
/usr/bin/mysqldump -l --all-databases | gzip > /Users/fd2s_admin/Documents/Backups/mail_mysql/saturday/$OF.gz
;;

esac
