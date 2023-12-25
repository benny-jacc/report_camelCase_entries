#!/usr/bin/perl
use strict;
use warnings;

my $ext = $ARGV[0];

my @files = glob "*$ext";

my $pattern = qr/\b[a-z]+[A-Z][a-zA-Z]*\b/;

for my $file_name (@files) {
    open(fh, $file_name);
    
    print "Processing file $file_name..\n\n";

    my $line_number = 0;

    while (my $line = <fh>) {
        $line_number++;

        if ($line =~ /$pattern/g) {
            my $match = $&;

            print qq/Found camelCase pattern: $match at line number $line_number\n/;     
       }
        else {
            print "Couldn't find camelCase entry in line $line_number\n";
        }
    }
}
