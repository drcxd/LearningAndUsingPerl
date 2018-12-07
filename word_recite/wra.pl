#!/bin/perl

use strict;
use warnings;
use 5.010;
use List::Util qw(shuffle);
use Term::ReadKey;

die "Usage: perl word_recite_advanced.pl [file_name]\n" unless @ARGV == 1;

my $file_name = $ARGV[0];
my $key;

open WORDS, "<", $file_name;

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
    say "$count/$total";
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');    
    print $word_hash{$_};
    ReadMode('cbreak');
    $key = ReadKey(0);
    ReadMode('normal');    
    if ($key =~ m/r/i)
    {
        say "word recorded!";
        push @forget_list, $_;
    }
    print "\n";
}

open BACKUP, ">", "${file_name}_review.txt";
for (@forget_list)
{
    print BACKUP $_;
    print BACKUP $word_hash{$_};    
}
close BACKUP;

print("Do you want to exercise the forgetting words?\n");
ReadMode('cbreak');
$key = ReadKey(0);
ReadMode('normal');
die "End\n" unless $key =~ m/y/i;

while (@forget_list != 0 || @exchange_list != 0)
{
    if (@forget_list != 0)
    {
        $total = @forget_list;
        $count = 0;
        @forget_list = shuffle @forget_list;
        for (@forget_list)
        {
            ++$count;
            print $_;
            say "$count/$total";
            ReadMode('cbreak');
            $key = ReadKey(0);
            ReadMode('normal');    
            print $word_hash{$_};            
            ReadMode('cbreak');
            $key = ReadKey(0);
            ReadMode('normal');    
            if ($key =~ m/r/i)
            {
                say "word recorded!";
                push @exchange_list, $_;
            }
            print "\n";
        }
        @forget_list = ();
        print("Do you want to exercise the forgetting words?\n");
        ReadMode('cbreak');
        $key = ReadKey(0);
        ReadMode('normal');    
        die "End\n" unless $key =~ m/y/i;
    }
    else
    {
        $total = @exchange_list;
        $count = 0;
        @exchange_list = shuffle @exchange_list;
        for (@exchange_list)
        {
            ++$count;
            print $_;
            say "$count/$total";
            ReadMode('cbreak');
            $key = ReadKey(0);
            ReadMode('normal');    
            print $word_hash{$_};            
            ReadMode('cbreak');
            $key = ReadKey(0);
            ReadMode('normal');    
            if ($key =~ m/r/i)
            {
                say "word recorded!";
                push @forget_list, $_;
            }
            print "\n";
        }
        @exchange_list = ();
        print("Do you want to exercise the forgetting words?\n");
        ReadMode('cbreak');
        $key = ReadKey(0);
        ReadMode('normal');    
        die "End\n" unless $key =~ m/y/i;
    }
}
