#!/usr/bin/perl
#usage ./downsampleReference.pl GRCh38.d1.vd1.fa chr22 > GRCh38.d1.vd1.chr22.fa

#removes all the chrX_yyyy   where X is not the same as the desired chromosome number
#keeps everything else i.e. all the viral sequences
my ($reference,$chr)=@ARGV;
my ($chrNum) = ($chr =~ /chr([0-9]+)/);
open (IN,$reference) || die;
my $printFlag=1;
while (defined(my $line=<IN>)){
	if (substr($line,0,1) eq ">"){
	   my ($currentChr)=split(' ',$line);
	   if ($currentChr =~ /chr([0-9]+)/){
	     if ($1 ne $chrNum){
		   $printFlag=0;	 
		 }
		 else{
		   $printFlag=1; 
		 }
	   }
	}
	if($printFlag){
	  print "$line";	
    }
}
