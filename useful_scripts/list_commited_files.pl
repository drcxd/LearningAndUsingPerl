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

die "Usage: ./list_commited_files.pl [path-to-file-or-directory] [user]\n" if @ARGV != 2;

# my $path = $ARGV[0];
# my $user_name = $ARGV[1];
my ($path, $user_name) = @ARGV;
my %commited_files;
say "reading subversion log...";
my @version_numbers = `svn log $path | grep $user_name`;
say "fetching commited file names...";
foreach (@version_numbers) {
    m/\Ar(?<version>\d+)/;
    my $version = $+{version};
    m/ (?<time>\d+-\d+-\d+ \d+:\d+:\d+) /;
    my $time = $+{time};
    my @single_commit_files = `svn diff -c $version --summarize $path`;
    foreach (@single_commit_files) {
        m!/(?<filename>\w+\.(:?cpp|h))!;
        if (defined $+{filename}) {
            my $filename = $+{filename};
            if (exists $commited_files{$filename}) {
                ;
            } else {
                $commited_files{$filename} = $time;
            }
        }
    }
}

open RESULT_FILE, '>', 'commited_files.txt';
say "writing result to commited_files.txt";
foreach (sort keys %commited_files) {
    chomp;
    say RESULT_FILE "$commited_files{$_}\t\t\t$_";
}
