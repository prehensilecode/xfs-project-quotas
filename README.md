# xfs-project-quotas
A set of shell scripts for setting XFS project quotas for users' home directories

## NOTE
* While not mentioned in the 
[official documentation](http://xfs.org/docs/xfsdocs-xml-dev/XFS_User_Guide/tmp/en-US/html/xfs-quotas.html), 
or the xfs_quota(8) man page, group quotas and project quotas are mutually exclusive. 
If you turn on group quotas, you cannot turn on project quotas, and vice versa.

## Setting up projects
There are two config files:
* /etc/projects
* /etc/projid

The /etc/projects file is a list of key value pairs, matching numerical project IDs 
with directories (absolute paths):
```
project_id:directory
```
and the /etc/projid file is a list of key value pairs, matching a project name string 
with its numerical project ID:
```
project_name:project_id
```

We want set quotas on users home directories. Setting the XFS user quota would set 
quotas for users for the entire filesystem, which means that if they happen to 
use shared directories which are not under their home directory hierarchy, the usage 
in those non-home directories is also taken into account by the user quota.

So, to restrict the quota to apply only to the home directories, we define a project
for each user, and set the projects' directories to their corresponding users' home
directories.

```
### /etc/projects
536:/xfs/home/foouser
```

```
### /etc/projid
foouser:536
```

For convenience and ease of tracking, use the users' user IDs as the project IDs.
