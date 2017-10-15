#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

for (@ARGV) {
    if (-e) {
        say "file $_ exists";
    } else {
        say "file $_ doesn't exists";
        next;
    }
    # if (-r) {
    #     say "file $_ is readable";
    # } else {
    #     say "file $_ is not readable";
    # }
    # if (-w) {
    #     say "file $_ is writable";
    # } else {
    #     say "file $_ is not writable";
    # }
    # if (-x) {
    #     say "file $_ is executable";
    # } else {
    #     say "file $_ is not executable";
    # }
    my ($dev, $ino, $mode, $nlink, $uid, $gid, $rdev,
        $size, $atime, $mtimt, $ctime, $blksize, $blocks) = stat($_);
    if ($mode & 0400) {
        say "file $_ is readable";
    } else {
        say "file $_ is not readable";
    }
    if ($mode & 0200) {
        say "file $_ is writable";
    } else {
        say "file $_ is not writable";
    }
    if ($mode & 0100) {
        say "file $_ is executable";
    } else {
        say "file $_ is not executable";
    }
}
