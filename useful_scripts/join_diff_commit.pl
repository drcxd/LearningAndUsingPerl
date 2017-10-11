#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

if (@ARGV != 2) {
    say "Usage: join_diff_commit.pl [diff_file] [commit_file]";
    say "diff_file should contain different files' name. ";
    say "One name per line. commit_file follows the same rule.";
    exit;
}

my $diff_file_name = shift @ARGV;
my $commit_file_name = shift @ARGV;

my @diff = `cat $diff_file_name`;

open COM, '<', $commit_file_name;
my %time_files;
while (<COM>) {
    if (m/(\d+-\d+-\d+ \d+:\d+:\d+)\s*(\w+\.(:?cpp|h))/) {
        # say "$1\t\t$2";
        $time_files{$2} = $1;
    }
}

open JOIN, "> join_files.txt";
foreach (@diff) {
    chomp;
    if (exists $time_files{$_}) {
        say JOIN "$time_files{$_}\t\t$_";
    }
}
