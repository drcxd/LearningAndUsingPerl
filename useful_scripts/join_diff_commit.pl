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
my @com = `cat $commit_file_name`;

my @join;

foreach (@diff) {
    if ($_ ~~ @com) {
        push @join, $_;
    }
}

open JOIN, "> join_files.txt";
foreach (@join) {
    print JOIN $_;
}
