#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

for (@ARGV) {
    next unless -e;
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
    my $id = `echo \$UID`;
    if ($uid == $id) {
        say "file $_ is owned by me.";
    } else {
        say "file $_ is not owned by me";
    }
}
