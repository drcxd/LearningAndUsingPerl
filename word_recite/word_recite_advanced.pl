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
    if (exists $word_hash{$word})
    {
        say "duplicate word $word";
    }
    my $meaning = <WORDS>;
    $word_hash{$word} = $meaning;
}

my @forget_list;
my @exchange_list;
my @random_keys = keys %word_hash;
@random_keys = shuffle @random_keys;

my $count = 0;
my $total = @random_keys;
for (@random_keys)
{
    $count++;
    print $_;    
    print "$count/$total";
    <STDIN>;
    print $word_hash{$_};
    my $reply = <STDIN>;
    if ($reply =~ m/y/)
    {
        say "word recorded!";
        push @forget_list, $_;
    }
}

print("Do you want to exercise the forgetting words?");
my $reply = <STDIN>;
die "End\n" unless $reply =~ m/y/;

while (@forget_list != 0 || @exchange_list != 0)
{
    my $reply;
    if (@forget_list != 0)
    {
        $total = @forget_list;
        $count = 0;
        for (@forget_list)
        {
            ++$count;
            print $_;
            print "$count/$total";
            <STDIN>;
            print $word_hash{$_};            
            $reply = <STDIN>;
            if ($reply =~ m/y/)
            {
                say "word recorded!\n";
                push @exchange_list, $_;
            }
        }
        @forget_list = ();
        print("Do you want to exercise the forgetting words?");
        $reply = <STDIN>;
        die "End\n" unless $reply =~ m/y/;
    }
    else
    {
        $total = @exchange_list;
        $count = 0;
        for (@exchange_list)
        {
            ++$count;
            print $_;
            print "$count/$total";
            <STDIN>;
            print $word_hash{$_};            
            $reply = <STDIN>;
            if ($reply =~ m/y/)
            {
                say "word recorded!";
                push @forget_list, $_;
            }
        }
        @exchange_list = ();
        print("Do you want to exercise the forgetting words?");
        $reply = <STDIN>;
        die "End\n" unless $reply =~ m/y/;
    }
}
