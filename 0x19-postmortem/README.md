# Postmortem: Personal website outage
![funny html tombstone](https://i.vgy.me/R42zun.jpg)

## Issue Summary:
**Duration:** 1st June 2024 at 10:30 am UTC+1 - 1st June 2024 at 12:30 UTC+1.

**Impact:** My local hosted website went down while throwing 500 errors.

**Root Cause:** A data corruption occured on the hosting HDD, causing the corruption of the database and stopping the mysqldb service.

![my poor hdd was dead](https://i.vgy.me/I6sND7.png)

## Timeline:

**10:30 am UTC+1:** Issue detected by [uptimerobot.com](http://uptimerobot.com)

**10:35 am UTC+1:** I read the email, and hurried up investigating this issue before the world's economy break down.

**10:55 am UTC+1:** After checking apache2 and mysqldb services, I found out that the mysqldb service is crashing, and the cause is still mysterious.

**11:15 am UTC+1:** Found out the cause, the main HDD containing the website files and database is corrupted, ran an fsck and tried to repair the database without success. Time to restore a backup.

**11:30 am UTC+1:** Attached a new HDD time to restore the backup

**12:00 am UTC+1:** The latest database backup is restored, the services rebooted and the website is live again, Hurray!!

## Root Cause and Resolution:

The issue was caused by a failing HDD, since it is just for my personal website, I deemed useless using a RAID configuration, and a daily backup was all I needed, also it is not the first time a Seagate HDD fails me, among all the HDD that I use regularily Seagate's are the worst in terms of failure rates. According to my own experience, [other users experience](https://news.ycombinator.com/item?id=22876616), and [blackblaze](https://www.backblaze.com/blog/hard-drive-stats-q2-2019/).

### Resolution:

-   Changed the HDD
    
-   Restored the Database
    
-   Rebooted the services

## Corrective and Preventative Measures:

Since it is a small website, It doesn't need further improvement, however if it was a bigger service I would apply the following:

### Improvements:

-   Configure a RAID-5 configuration for file and database redunduncy
    
-   Configure a second duplicate machine for redunduncy
    
-   Use 2 load balancers to allow redunduncy.
    
-   Use a premium monitoring tool, to allow such as Datadog, to allo further reource monitoring and prevent downtime.
    
-   Use daily backups using the 3-2-1 Backup Strategy
    
## Conclusion:

I believe that implementing these strategies in case of a bigger scale website, that actually would cost millions in term of downtime, would increase drastically the uptime.
