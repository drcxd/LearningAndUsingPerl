#!/usr/local/bin/perl

# This program list the differet files between to specified
# directories. The program generally process the output of diff a
# little.

use strict;
use warnings;
use 5.010;

die "Usage: ./list_diff_files.pl [path-to-directory1] [path-to-directory2]" unless @ARGV == 2;

my $path1 = $ARGV[0];
my $path2 = $ARGV[1];
my @raw_input = `diff -q $path1 $path2`;
my $count = 0;
foreach (@raw_input) {
    chomp;
    say $1 if m/([[:alpha:]]+\.(?:cpp|h))/;
}
