#!/usr/bin/perl

use warnings;
use strict;

my $filename = $ARGV[0];
open( my $fh, '<', $filename ) or die "Can't open $filename: $!";

my @lines = <$fh>;

foreach my $line (grep /^TECHIO>/, @lines) { print $line; }

print "TECHIO> message --channel \"exercise results\" \"\"\n";
print "TECHIO> message --channel \"exercise results\" \"\"\n";
print "TECHIO> message --channel \"exercise results\" \"\"\n";
print "TECHIO> message --channel \"====================\" \"\"\n";

foreach my $line (grep $_ !~ /^TECHIO>/, @lines) {
    chomp $line;
    if ($line =~ /^(.*\.cs)\((\d+),(\d+)\): error (CS\d+:.*)$/) {
        print "TECHIO> annotate --file $1 --position $2:$3 --message \"$4\"\n";
    }
    print "TECHIO> message --channel \"raw output\" $line\n";
}

close($fh);
