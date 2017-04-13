#!/usr/bin/perl

use warnings;
use strict;
use File::Find;

sub process_project($);

if (scalar(@ARGV) < 1) {
    print "\nUsage: desanitize_project.pl <project_dir>\n\n";
    exit;
}

my $project_dir = $ARGV[0];
process_project($project_dir);

sub process_project($) {
    my $project_dir = shift;

    print "Process project: $project_dir\n";

    my $wanted = sub {
        if (-f && /(.*\.orig)$/) {
            my $orig_filename = $1;
            my $dest_filename = $1;
            $dest_filename =~ s/.orig$//;
            print "unlink($dest_filename)\n";
            unlink($dest_filename);
            print "rename($orig_filename, $dest_filename)\n";
            rename($orig_filename, $dest_filename);
        }
    };

    find({ wanted => $wanted, no_chdir => 1 }, $project_dir);
}
