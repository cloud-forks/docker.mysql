#!/bin/sh

exec mysqld_safe >> /var/log/mysql.log 2>&1
