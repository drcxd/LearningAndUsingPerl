#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;


my $oldest = 0;
my $oldest_file;
for (@ARGV) {
    my $cur = -C $_;
    if ($cur > $oldest) {
        $oldest = $cur;
        $oldest_file = $_;
    }
}

if (defined $oldest_file) {
    say "The oldest file is $oldest_file";
} else {
    say "No Input!";
}
