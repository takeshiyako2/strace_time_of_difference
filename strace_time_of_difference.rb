#!/usr/bin/ruby

# Get strace time of difference from line to next N line
#
# How to use)
# strace -ttT -s 1024 -p [PID] -o strace-dev.txt
# ./strace_read_line.rb
#
#12:29:20.265882 poll([{fd=7, events=POLLIN|POLLERR|POLLHUP}], 1, 1471228928) = 1 ([{fd=7, revents=POLLIN}]) <0.000009>
#12:29:20.266734 bind(7, {sa_family=AF_NETLINK, pid=0, groups=00000000}, 12) = 0 <0.000006>
#852
#-----------
#12:29:20.266760 getsockname(7, {sa_family=AF_NETLINK, pid=20454, groups=00000000}, [12]) = 0 <0.000006>
#12:29:20.267880 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f783a981000 <0.000008>
#1120
#-----------
#

file = 'strace-dev.txt'
line_count_num = 10

# initialization
i = 0
first_line = ''

def get_decimal_point(num)
  num[9, 6]
end

def integer_string?(str)
  Integer(str)
  true
rescue ArgumentError
  false
end

File.open file do |f|
  f.each_line do |line|
    first_line = line if i == 0
    i = i + 1
    if i == 10

      first_decimal_point = get_decimal_point(first_line)
      end_decimal_point = get_decimal_point(line)

      if integer_string?(first_decimal_point)  && integer_string?(end_decimal_point)
        puts first_line
        puts line
        puts (end_decimal_point.to_i - first_decimal_point.to_i)
        puts '-----------'
      end

      # initialization
      i = 0
      first_line = ''

    end
  end 
end

