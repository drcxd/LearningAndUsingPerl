#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my ($src, $dest) = @ARGV;

unless (-e $dest) {
    rename $src, $dest or die "Can't reanme $src to $dest: $!\n";
} elsif (-f $dest) {
    rename $src, $dest or die "Can't reanme $src to $dest: $!\n";
} elsif (-d $dest) {
    my $new_dest = $dest . $src;
    rename $src, $new_dest or die "Can't rename $src to $new_dest: $!\n";
}
