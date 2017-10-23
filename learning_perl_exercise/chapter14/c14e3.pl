#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

say "Input the string: ";
chomp (my $string = <STDIN>);
say "Input the substring: ";
chomp (my $subs = <STDIN>);

my $where = 0;
while (($where = index($string, $subs, $where)) >= 0) {
    say $where;
    ++$where;
}
