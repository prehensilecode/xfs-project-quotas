# xfs-project-quotas
A set of shell scripts for setting XFS project quotas for users' home directories

## NOTE
* While not mentioned in the [official documentation](http://xfs.org/docs/xfsdocs-xml-dev/XFS_User_Guide/tmp/en-US/html/xfs-quotas.html), or the xfs_quota(8) man page, group quotas and project quotas are mutually exclusive. If you turn on group quotas, you cannot turn on project quotas, and vice versa.
