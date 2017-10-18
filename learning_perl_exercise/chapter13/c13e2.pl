#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

print "Enter a directory: ";
my $dest = <STDIN>;
chomp $dest;
if ($dest =~ /\A\s+\Z/) {
    chdir;
} else {
    chdir $dest or die "Can't chdir to $dest Error: $!\n";
}
my @files = glob '* .*';
for (@files) {
    say;
}
