#!/bin/perl

use strict;
use warnings;
use 5.010;
use List::Util qw(shuffle);

open WORDS, "<", "word_list.txt";

my %word_hash;

while (<WORDS>)
{
    my $word = $_;
    my $meaning = <WORDS>;
    $word_hash{$word} = $meaning;
}

my @random_keys = keys %word_hash;
@random_keys = shuffle @random_keys;
for (@random_keys)
{
    print $_;
    <STDIN>;
    print $word_hash{$_};
    print "\n";
}
