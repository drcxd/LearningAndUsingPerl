#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my ($target, $link) = @ARGV;

die "$target doesn't exist\n" unless (-e $target);

die "Can't make a hard link to a directory\n" unless (-f $target);

link $target, $link or die "Can't link $link to $target: $!\n";
