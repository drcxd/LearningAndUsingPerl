#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my $option, $target, $link;
($option, $target, $link) = @ARGV if @ARGV == 3;
($target, $link) = @ARGV if @ARGV == 2;

if (defined $option and $option eq '-s') {
    die "$target doesn't exist\n" unless (-e $target);
    symlink $target, $link or die "Can't link $link to $target: $!\n";
} elsif (defined $option) {
    die "invalid option $option\n";
} else {
    die "$target doesn't exist\n" unless (-e $target);
    die "Can't make a hard link to a directory\n" unless (-f $target);
    link $target, $link or die "Can't link $link to $target: $!\n";
}
