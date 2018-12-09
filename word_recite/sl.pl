#!/bin/perl

use strict;
use warnings;
use 5.010;
use List::Util qw(shuffle);

die "Usage: perl sl.pl [file_name] [number]\n" unless @ARGV == 2;

(my $fname, my $number) = @ARGV;
my %word_hash;
open WORDS, "<", $fname;
while (<WORDS>)
{
    my $word = $_;
    if (exists $word_hash{$word})
    {
        say "duplicate word $word";
    }
    my $meaning = <WORDS>;
    $word_hash{$word} = $meaning;
}
close WORDS;
my @words = keys %word_hash;
my $wn = int(@words / $number);
@words = shuffle @words;
for (1 .. $number)
{
    my $new_file_name = "word_slice${_}.txt";
    open OUT, ">", $new_file_name;
    for (1 .. $wn)
    {
        my $word = shift @words;
        my $meaning = $word_hash{$word};
        print OUT $word;
        print OUT $meaning;
    }
    if ($_ == $number)
    {
        while (@words)
        {
            my $word = shift @words;
            my $meaning = $word_hash{$word};
            print OUT $word;
            print OUT $meaning;
        }
    }
    close OUT;
}
