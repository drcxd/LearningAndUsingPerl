#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

die "Usage: ./list_diff_files.pl [path-to-directory1] [path-to-directory2]" unless @ARGV == 2;

my $path1 = $ARGV[0];
my $path2 = $ARGV[1];
my @raw_input = `diff -q $path1 $path2`;
foreach (@raw_input) {
    my @ingredient = split /\//, $_;
    $_ = $ingredient[$#ingredient];
    print $_;
}
