#!/usr/local/bin/perl

# This program list the file(s) the user commited of the specified
# file or directory according to the log of subversion. The first
# argument is the path to the file or directory (absolute or
# relative), the second argument is the username in subversion.  This
# program will save the result in the file "commited_files.txt" in the
# directory the program is executed.


use strict;
use warnings;
use 5.010;

die "Usage: ./list_commited_files.pl [path-to-file-or-directory] [user]" if @ARGV != 2;

my $path = $ARGV[0];
my $user_name = $ARGV[1];
my @commited_files;
say "reading subversion log...";
my @version_numbers = `svn log $path | grep $user_name`;
say "fetching commited file names...";
foreach (@version_numbers) {
    m/^r(\d+)/;
    my @single_commit_files = `svn diff -c $1 --summarize /cygdrive/d/Workspace/JiuTianSVN/client/Client/Client/proj.win32/`;
    foreach (@single_commit_files) {
        push @commited_files, $_ unless $_ ~~ @commited_files;
    }
}
say "cutting off path...";
foreach (@commited_files) {
    my @path_ingredient = split /\//, $_;
    $_ = $path_ingredient[$#path_ingredient];
}
say "sorting file names...";
@commited_files = sort @commited_files;
open RESULT_FILE, '>commited_files.txt';
say "writing result to commited_files.txt";
foreach (@commited_files) {
    print RESULT_FILE $_;
}
