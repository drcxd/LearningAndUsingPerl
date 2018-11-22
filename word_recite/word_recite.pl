#!/bin/perl

use strict;
use warnings;
use 5.010;
use List::Util qw(shuffle);

# open WL, "<", "word_list.txt";

# while (<WL>)
# {
    
# }

my @wl = `cat word_list.txt`;
@wl = shuffle @wl;
foreach (@wl)
{
    print $_;
}
