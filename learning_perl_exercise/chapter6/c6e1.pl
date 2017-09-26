#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my %family_name = (
    fred => 'flintstone',
    barney => 'rubble',
    wilma => 'flintstone');

say "Input a name:";
while (<STDIN>) {
    chomp;
    if (defined $family_name{$_}) {
        say "${_}'s family name is $family_name{$_}";
    } else {
        say "don't know ${_}'s family name";
    }
}
