#!/usr/bin/perl
#usage downsampleCounts.pl gtf counts
my ($gtf,$counts)=@ARGV;

my %geneIds;
print STDERR  "Reading gtf $gtf\n"; 

open (IN,$gtf) || die;
while (defined(my $line=<IN>)){
	chomp($line);
	my(@parts) = split(/\t/,$line);
	my($geneStr)=split(/\;/,$parts[8]);
	my $geneId=substr($geneStr,9,-1);
	$geneIds{$geneId}++;
}
print STDERR "Reading counts $counts\n";
open (IN,$counts) || die;
while (defined(my $line=<IN>)){
	my ($geneId)=split(' ',$line);
	if (exists ($geneIds{$geneId})){
		print "$line";
	}
} 
