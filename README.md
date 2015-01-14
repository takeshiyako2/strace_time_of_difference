# strace_time_of_difference

Get strace time of difference from line to next N line

## How to use

```
# strace -ttT -s 1024 -p [PID] -o strace-dev.txt
# ruby strace_read_line.rb

12:29:20.265882 poll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, 1471228928) = 1 ([{fd=7, revents=POLLIN}]) <0.000009>
12:29:20.266734 bind(7, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0 <0.000006>
852
-----------
12:29:20.266760 getsockname(7, {sa_family=AF_NETLINK, pid=20454, groups=00000000}, [12]) = 0 <0.000006>
12:29:20.267880 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f783a981000 <0.000008>
1120
-----------
```
