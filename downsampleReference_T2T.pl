#!/usr/bin/perl
#usage ./downsampleReference.pl GRCh38.d1.vd1.fa chr22 > GRCh38.d1.vd1.chr22.fa

my ($reference, $chr) = @ARGV;
open (IN, $reference) || die;
my $printFlag = 0;
while (defined(my $line = <IN>)) {
    if (substr($line, 0, 1) eq ">") {
        if (index($line, $chr) != -1) {
            $printFlag = 1;
        } else {
            $printFlag = 0;
        }
    }
    if($printFlag) {
        print "$line";
    }
}

