#!/usr/bin/perl -w

# recode_coptic.pl Version 1.2.0

# this assumes a UTF-8 file in one word per line format and 
# automatically converts Coptic encodings
# usage:
# recode_coptic.pl file
# See help (-h) for options

use Getopt::Std;
use utf8;
binmode(STDOUT, ":utf8");
binmode(STDIN);

my $usage;
{
$usage = <<"_USAGE_";
This script converts characters from one Coptic encoding to another.

Notes and assumptions:
- Supralinear strokes in Coptic font are supported
- Other decorations not yet supported

Usage:  recode_coptic.pl [options] <FILE>

Options and argument:

-h              print this message and quit
-f <format>     Specify the input format. Default is Coptic font, other options are "CopticLS", "CMCL", "NagHamadi", "avva_shenouda", "low" (converts all upper case utf8 Coptic to all lower case)

<FILE>    A text file with Coptic text in a supported encoding

Examples:

Read a file in Coptic font encoding and output standard Unicode as UTF-8:
  recode_coptic.pl in_Coptic.txt > out_utf8.txt

Read a file in CMCL encoding and output standard Unicode as UTF-8:
  recode_coptic.pl -f CMCL in_Coptic.txt > out_utf8.txt

  
Copyright 2013-2018, Amir Zeldes, Caroline T. Schroeder and So Miyagawa

This program is free software. You may copy or redistribute it under
the same terms as Perl itself.
_USAGE_
}

### OPTIONS BEGIN ###
%opts = ();
getopts('hf:',\%opts) or die $usage;

#help
if ($opts{h} || (@ARGV == 0)) {
    print $usage;
    exit;
}

#format
if (!($format = $opts{f})) 
    {$format = "Coptic";}
elsif($format eq "CopticLS")
	{$format="CopticLS"}
elsif($format eq "CMCL") 
	{$format="CMCL";}
elsif($format eq "NagHamadi") 
	{$format="NagHamadi";}
elsif($format eq "low") 
	{$format="low";}
elsif($format eq "avva_shenouda") 
	{$format="avva_shenouda";}
elsif($format eq "funk1") 
	{$format="funk1";}
elsif($format eq "marcion") 
	{$format="marcion";}
else {$format = "Coptic"}
### OPTIONS END ###

open FILE,"<:encoding(UTF-8)",shift or die "could not find input document";

while (<FILE>) {

    chomp;
    $line = $_;

	if ($format eq "Coptic")
	{
	#consonants (Replace various consonants and digraphs with IPA symbols)
	$line =~ s/a/ⲁ/g;
	$line =~ s/b/ⲃ/g;
	$line =~ s/c/ⲑ/g;
	$line =~ s/d/ⲇ/g;
	$line =~ s/e/ⲉ/g;
	$line =~ s/f/ϥ/g;
	$line =~ s/g/ⲅ/g;
	$line =~ s/h/ⲏ/g;
	$line =~ s/i/ⲓ/g;
	$line =~ s/j/ϫ/g;
	$line =~ s/k/ⲕ/g;
	$line =~ s/l/ⲗ/g;
	$line =~ s/m/ⲙ/g;
	$line =~ s/n/ⲛ/g;
	$line =~ s/o/ⲟ/g;
	$line =~ s/p/ⲡ/g;
	$line =~ s/q/ϭ/g;
	$line =~ s/r/ⲣ/g;
	$line =~ s/s/ⲥ/g;
	$line =~ s/t/ⲧ/g;
	$line =~ s/u/ⲩ/g;
	$line =~ s/v/ⲫ/g;
	$line =~ s/w/ⲱ/g;
	$line =~ s/x/ϩ/g;
	$line =~ s/y/ⲭ/g;
	$line =~ s/z/ⲍ/g;
	$line =~ s/¥/ϣ/g;
	$line =~ s/\+/ϯ/g;

	#NB psi and xi in Coptic font are 2, 3
	#these numbers will be replaced
	$line =~ s/2/ⲯ/g;
	$line =~ s/3/ⲝ/g;

	#capitals express supralinear stroke in Coptic font
	$line =~ s/A/ⲁ̄/g;
	$line =~ s/B/ⲃ̄/g;
	$line =~ s/C/ⲑ̄/g;
	$line =~ s/D/ⲇ̄/g;
	$line =~ s/E/ⲉ̄/g;
	$line =~ s/F/ϥ̄/g;
	$line =~ s/G/ⲅ̄/g;
	$line =~ s/H/ⲏ̄/g;
	$line =~ s/I/ⲓ̄/g;
	$line =~ s/J/ϫ̄/g;
	$line =~ s/K/ⲕ̄/g;
	$line =~ s/L/ⲗ̄/g;
	$line =~ s/M/ⲙ̄/g;
	$line =~ s/N/ⲛ̄/g;
	$line =~ s/O/ⲟ̄/g;
	$line =~ s/P/ⲡ̄/g;
	$line =~ s/Q/ϭ̄/g;
	$line =~ s/R/ⲣ̄/g;
	$line =~ s/S/ⲥ̄/g;
	$line =~ s/T/ⲧ̄/g;
	$line =~ s/U/ⲩ̄/g;
	$line =~ s/V/ⲫ̄/g;
	$line =~ s/W/ⲱ̄/g;
	$line =~ s/X/ϩ̄/g;
	$line =~ s/Y/ⲭ̄/g;
	$line =~ s/Z/ⲍ̄/g;
	#$line =~ s/¥/ϣ̄/g;
	#$line =~ s/\+/ϯ̄/g;
	}
	elsif ($format eq "CopticLS")
	#need to add c±s
	{

	$line =~ s/a/ⲁ/g;
	$line =~ s/b/ⲃ/g;
	$line =~ s/c/ⲭ/g;
	$line =~ s/d/ⲇ/g;
	$line =~ s/e/ⲉ/g;
	$line =~ s/f/ⲫ/g;
	$line =~ s/g/ⲅ/g;
	$line =~ s/h/ⲏ/g;
	$line =~ s/i/ⲓ/g;
	$line =~ s/j/ϫ/g;
	$line =~ s/k/ⲕ/g;
	$line =~ s/l/ⲗ/g;
	$line =~ s/m/ⲙ/g;
	$line =~ s/n/ⲛ/g;
	$line =~ s/o/ⲟ/g;
	$line =~ s/p/ⲡ/g;
	$line =~ s/q/ϭ/g;
	$line =~ s/r/ⲣ/g;
	$line =~ s/s/ⲥ/g;
	$line =~ s/t/ⲧ/g;
	$line =~ s/u/ⲩ/g;
	$line =~ s/v/ϣ/g;
	$line =~ s/w/ⲱ/g;
	$line =~ s/x/ⲝ/g;
	$line =~ s/y/ⲯ/g;
	$line =~ s/z/ⲍ/g;
	$line =~ s/v/ϣ/g;
	$line =~ s/C/ϭ/g;
	$line =~ s/D/Ⲇ/g;
	$line =~ s/F/ϥ/g;
	$line =~ s/G/ⳉ/g;
	$line =~ s/H/ϩ/g;
	$line =~ s/J/ϧ/g;
	$line =~ s/Q/ⳋ/g;
	$line =~ s/R/ⳁ/g;
	$line =~ s/T/ϯ/g;
	$line =~ s/Z/ⲹ/g;

	#diacritics and strokes
	$line =~ s/±(.)=±(.)/︤$1︦$2︥/g;
	$line =~ s/±(.)/︤$1︥/g; #place binding supralinear strokes after each character
	$line =~ s/±/︤/g; 
	$line =~ s/†/<gap reason="illegible">…̣<\/gap>/g;	#gap symbol in Brakke transcriptions
	$line =~ s/=/̄/g; #equals sign after letter is a supralinear stroke
	$line =~ s/O/᷍/g;
	$line =~ s/P/̂/g;
	$line =~ s/\//̣/g;
	$line =~ s/Ú/̈/g;
	$line =~ s/A/ⲏ̂/g;
	$line =~ s/E/ⲉ̄/g;
	$line =~ s/I/ⲓ̄/g;
	$line =~ s/M/ⲛ̀/g;
	$line =~ s/N/ⲛ̄/g;
	$line =~ s/S/ⲏ⳰/g;
	$line =~ s/U/ⲩ̄/g;

	$line =~ s/K/K/g; #couldn't find keyboard character
	$line =~ s/L/L/g; #couldn't find keyboard character
	$line =~ s/V/V/g; #couldn't find keyboard character
	$line =~ s/W/W/g; #couldn't find keyboard character
	$line =~ s/X/X/g; #couldn't find keyboard character
	$line =~ s/Y/Y/g; #couldn't find keyboard character
	
	#punctuation
	$line =~ s/\}/·/g;
	$line =~ s/B/⟦/g;
	$line =~ s/ı/⟧/g;
	$line =~ s/:/:/g;
	$line =~ s/…/;/g;
	$line =~ s/\{/⳿/g;
	

	
	}
	elsif ($format eq "CMCL")
	{
	$line =~ s/a/ⲁ/g;
	$line =~ s/b/ⲃ/g;
	$line =~ s/q/ⲑ/g;
	$line =~ s/d/ⲇ/g;
	$line =~ s/e/ⲉ/g;
	$line =~ s/f/ϥ/g;
	$line =~ s/g/ⲅ/g;
	$line =~ s/H/ⲏ/g;
	$line =~ s/i/ⲓ/g;
	$line =~ s/j/ϫ/g;
	$line =~ s/k/ⲕ/g;
	$line =~ s/l/ⲗ/g;
	$line =~ s/m/ⲙ/g;
	$line =~ s/n/ⲛ/g;
	$line =~ s/o/ⲟ/g;
	$line =~ s/p/ⲡ/g;
	$line =~ s/c/ϭ/g;
	$line =~ s/r/ⲣ/g;
	$line =~ s/s/ⲥ/g;
	$line =~ s/t/ⲧ/g;
	$line =~ s/u/ⲩ/g;
	$line =~ s/P/ⲫ/g;
	$line =~ s/w/ⲱ/g;
	$line =~ s/h/ϩ/g;
	$line =~ s/C/ⲭ/g;
	$line =~ s/z/ⲍ/g;
	$line =~ s/y/ϣ/g;
	$line =~ s/Y/ϯ/g;
	$line =~ s/T/ⲯ/g;
	$line =~ s/x/ⲝ/g;
	
	}
	elsif ($format eq "NagHamadi")
	{
$line =~ s/A/︦/g;
	$line =~ s/B/ⲛ̇/g;
	$line =~ s/C/ϧ/g;
	$line =~ s/D/ⲫ/g;
	$line =~ s/E/⟧/g;
	$line =~ s/F/ⲫ/g;
	$line =~ s/G/G/g;
	$line =~ s/H/H/g;
	$line =~ s/I/ⲓ̈/g;
	$line =~ s/J/`/g;
	$line =~ s/K/ⲝ/g;
	$line =~ s/L/ⲗ,/g;
	$line =~ s/M/⸌ⲛ/g;
	$line =~ s/N/ⲛ̄/g;
	$line =~ s/O/̣/g;
	$line =~ s/P/ⲯ/g;
	$line =~ s/Q/q/g;
	$line =~ s/R/ⳁ/g;
	$line =~ s/S/ⲋ/g;
	$line =~ s/T/ϯ/g;
	$line =~ s/U/ⲩ/g;
	$line =~ s/Ú/̈/g;
	$line =~ s/V/V/g;
	$line =~ s/W/⟦/g;
	$line =~ s/X/·/g;
	$line =~ s/Y/./g;
	$line =~ s/Z/·/g;
	$line =~ s/a/ⲁ/g;
	$line =~ s/b/ⲃ/g;
	$line =~ s/c/ϭ/g;
	$line =~ s/d/ⲇ/g;
	$line =~ s/e/ⲉ/g;
	$line =~ s/f/ϥ/g;
	$line =~ s/g/ⲅ/g;
	$line =~ s/h/ϩ/g;
	$line =~ s/i/ⲓ/g;
	$line =~ s/j/ϫ/g;
	$line =~ s/k/ⲕ/g;
	$line =~ s/l/ⲗ/g;
	$line =~ s/m/ⲙ/g;
	$line =~ s/n/ⲛ/g;
	$line =~ s/o/ⲟ/g;
	$line =~ s/p/ⲡ/g;
	$line =~ s/q/ϣ/g;
	$line =~ s/r/ⲣ/g;
	$line =~ s/s/ⲥ/g;
	$line =~ s/t/ⲧ/g;
	$line =~ s/u/ⲩ/g;
	$line =~ s/v/ⲑ/g;
	$line =~ s/w/ⲱ/g;
	$line =~ s/x/ⲭ/g;
	$line =~ s/y/ⲏ/g;
	$line =~ s/z/ⲍ/g;
	$line =~ s/=/̄/g;
	$line =~ s/≥/·/g;
	$line =~ s/ﬂ/ϥⲗ/g;
	$line =~ s/\+/︦/g;
	}
	elsif ($format eq "low")
	{
	$line =~ s/Ⲁ/ⲁ/g;
	$line =~ s/Ⲃ/ⲃ/g;
	$line =~ s/Ⲑ/ⲑ/g;
	$line =~ s/Ⲇ/ⲇ/g;
	$line =~ s/Ⲉ/ⲉ/g;
	$line =~ s/Ϥ/ϥ/g;
	$line =~ s/Ⲅ/ⲅ/g;
	$line =~ s/Ⲏ/ⲏ/g;
	$line =~ s/Ⲓ/ⲓ/g;
	$line =~ s/Ϫ/ϫ/g;
	$line =~ s/Ⲕ/ⲕ/g;
	$line =~ s/Ⲗ/ⲗ/g;
	$line =~ s/Ⲙ/ⲙ/g;
	$line =~ s/Ⲛ/ⲛ/g;
	$line =~ s/Ⲟ/ⲟ/g;
	$line =~ s/Ⲡ/ⲡ/g;
	$line =~ s/Ϭ/ϭ/g;
	$line =~ s/Ⲣ/ⲣ/g;
	$line =~ s/Ⲥ/ⲥ/g;
	$line =~ s/Ⲧ/ⲧ/g;
	$line =~ s/Ⲩ/ⲩ/g;
	$line =~ s/Ⲫ/ⲫ/g;
	$line =~ s/Ⲱ/ⲱ/g;
	$line =~ s/Ϩ/ϩ/g;
	$line =~ s/Ⲭ/ⲭ/g;
	$line =~ s/Ⲍ/ⲍ/g;
	$line =~ s/Ϣ/ϣ/g;
	$line =~ s/Ϯ/ϯ/g;
	$line =~ s/Ⲯ/ⲯ/g;
	$line =~ s/Ⲝ/ⲝ/g;
	
	}
	elsif ($format eq "avva_shenouda")
	{
	$line =~ s/=(.)/$1̄/g; #place supralinear stroke after character, not before as in avva shenouda
	$line =~ s/a/ⲁ/g;
	$line =~ s/b/ⲃ/g;
	$line =~ s/c/ⲥ/g; #c is sigma
	$line =~ s/d/ⲇ/g;
	$line =~ s/e/ⲉ/g;
	$line =~ s/f/ϥ/g;
	$line =~ s/g/ⲅ/g;
	$line =~ s/y/ⲏ/g; #y is eta
	$line =~ s/i/ⲓ/g;
	$line =~ s/j/ϫ/g;
	$line =~ s/k/ⲕ/g;
	$line =~ s/l/ⲗ/g;
	$line =~ s/m/ⲙ/g;
	$line =~ s/n/ⲛ/g;
	$line =~ s/o/ⲟ/g;
	$line =~ s/p/ⲡ/g;
	$line =~ s/\[/ϭ/g; #chima is an opening square bracket
	$line =~ s/r/ⲣ/g;
	$line =~ s/\;/ⲑ/g; #semi colon is theta
	$line =~ s/t/ⲧ/g;
	$line =~ s/u/ⲩ/g;
	$line =~ s/v/ⲫ/g;
	$line =~ s/w/ⲱ/g;
	$line =~ s/h/ϩ/g; #h is hori
	$line =~ s/y/ⲭ/g;
	$line =~ s/z/ⲍ/g;
	$line =~ s/s/ϣ/g; #s is shai
	$line =~ s/\]/ϯ/g; #right square bracket is ti
	$line =~ s/v/ⲯ/g;
	$line =~ s/x/ⲝ/g;

	}
	elsif ($format eq "funk1")
	{
	$line =~ s/\]/ⲱ̣/g;
	$line =~ s/ü/ⲁ/g;
	$line =~ s/ó/ⲥ/g;
	$line =~ s/ƒ/ⲟ/g;
	$line =~ s/¼/ϥ/g;
	$line =~ s/f/ϥ̄/g;
	$line =~ s/х/ⲙ̄/g;
	$line =~ s/¢/ⲙ/g;
	$line =~ s/ò/ⲓ/g;
	$line =~ s/£/ⲛ/g;
	$line =~ s/Ä/ⲉ/g;
	$line =~ s/@/ⲣ̄/g;
	$line =~ s/¬/ϣ/g;
	$line =~ s/ч/ⲛ̄/g;
	$line =~ s/í/ⲣ/g;
	$line =~ s/á/ⲡ/g;
	$line =~ s/░/ϩ/g;
	$line =~ s/Æ/ⲑ/g;
	$line =~ s/æ/ⲏ/g;
	$line =~ s/Ü/ⲗ/g;
	$line =~ s/ĳ/ⲕ/g;
	$line =~ s/≈/·/g;
	$line =~ s/Ñ/ⲩ/g;
	$line =~ s/⌐/ⲱ/g;
	$line =~ s/ú/ⲧ/g;
	$line =~ s/▒/ϫ/g;
	$line =~ s/п/ⲓ̈/g;
	$line =~ s/▓/ϭ/g;
	$line =~ s/■/’/g;
	$line =~ s/ⁿ/:/g;
	$line =~ s/р/᷍ⲓ/g;
	$line =~ s/・/ⲟ̂/g;
	$line =~ s/C/ⲥ̄/g;
	$line =~ s/Й/ⲏ̄/g;
	$line =~ s/R/ⲩ̂/g;
	$line =~ s/С/ⲕ̄/g;
	$line =~ s/А/ⲁ̄/g;
	$line =~ s/u/ϫ̄/g;
	$line =~ s/З/ⲉ̇/g;
	$line =~ s/г/ⲅ̄/g;
	$line =~ s/ä/ⲃ/g;
	$line =~ s/å/ⲅ/g;
	$line =~ s/r/ϩ̄/g;
	$line =~ s/¿/ⲯ/g;
	$line =~ s/º/ⲭ/g;
	$line =~ s/Ш/ⲛ̣/g;
	$line =~ s/G/ⲧ̣/g;
	$line =~ s/⌡/†/g;
	$line =~ s/Ц/ⲙ̣/g;
	$line =~ s/Ж/ⲉ̣/g;
	$line =~ s/²/. /g;
	$line =~ s/F/ⲧ̄/g;
	$line =~ s/Ф/ⲗ̄/g;
	$line =~ s/ё/ⲉ̄/g;
	$line =~ s/x/ϭ̄/g;
	$line =~ s/ì/ⲇ/g;
	$line =~ s/α/ⲧ⳿/g;
	$line =~ s/▀/ⲡ⳿/g;
	$line =~ s/Э/ⲣ̄/g;
	$line =~ s/н/ⲓ̄/g;
	$line =~ s/Ф/ⲗ̄/g;
	$line =~ s/ε/̀/g;
	$line =~ s/φ/´/g;
	$line =~ s/ñ/ϯ/g;
	$line =~ s/≥/⸗/g;
	$line =~ s/Э/ⲡ̄/g;
	$line =~ s/√/|/g;
	$line =~ s/В/ⲃ̄/g;
	$line =~ s/▀/ⲡ⳿/g;
	$line =~ s/▐/ⲕ⳿/g;
	$line =~ s/Ж/ⲉ̣/g;
	$line =~ s/ì/ⲇ/g;
	$line =~ s/ш/ⲛ̣̄/g;
	$line =~ s/О/ⲓ̣/g;
	$line =~ s/а/ⲁ̣/g;
	$line =~ s/ы/ⲟ̣/g;
	$line =~ s/A/ⲣ̣/g;
	$line =~ s/Д/ⲅ̣/g;
	$line =~ s/й/ⲏ̣/g;
	$line =~ s/F/ⲧ̄/g;
	$line =~ s/₧/ⲝ/g;
	$line =~ s/Л/ⲏ⳱/g;
	$line =~ s/ª/ⲫ/g;
	$line =~ s/α/ⲧ⳿/g;
	$line =~ s/э/ⲡ̣/g;
	$line =~ s/G/ⲧ̣/g;
	$line =~ s/ф/ⲗ̣/g;
	$line =~ s/ц/ⲙ̣̄/g;
	$line =~ s/{/ⲓ̣̈/g;
	$line =~ s/D/ⲥ̣/g;
	$line =~ s/v/ϫ̣/g;
	$line =~ s/щ/ⲝ̄/g;
	$line =~ s/л/ⲏ⳰/g;
	$line =~ s/μ/ⲏ̄/g;
	$line =~ s/▄/ⳁ/g;
	$line =~ s/ⲓ̣̈(.*?\})/\{$1/g;
	$line =~ s/Å/ⲍ/g;
	$line =~ s/Щ/ⲛ̣/g;
	$line =~ s/M/ⲩ̣/g;
	$line =~ s/g/ϥ̣/g;
	$line =~ s/h/ϥ̣̄/g;
	$line =~ s/V/ⲭ̄/g;
	$line =~ s/К/ⲏ̣̄/g;
	$line =~ s/a/ϣ̣/g;
	$line =~ s/Ю/ⲡ̣̄/g;
	$line =~ s/s/ϩ̣/g;
	$line =~ s/W/ⲭ̣/g;
	$line =~ s/B/ⲣ̣̄/g;
	$line =~ s/P/ⲩ̈/g;
	$line =~ s/Ы/ⲟ̄/g;
	$line =~ s/L/ⲩ̄/g;
	$line =~ s/y/ϭ̣/g;
	$line =~ s/E/ⲥ̣̄/g;
	$line =~ s/Ь/ⲟ̣̄/g;
	$line =~ s/a/ϣ̣/g;
	$line =~ s/W /ⲭ̣/g;
	$line =~ s/ü/ⲁ/g;
	$line =~ s/ó/ⲥ/g;
	$line =~ s/ƒ/ⲟ/g;
	$line =~ s/¼/ϥ/g;
	$line =~ s/f/ϥ̄/g;
	$line =~ s/х/ⲙ̄/g;
	$line =~ s/¢/ⲙ/g;
	$line =~ s/ò/ⲓ/g;
	$line =~ s/£/ⲛ/g;
	$line =~ s/Ä/ⲉ/g;
	$line =~ s/@/ⲣ̄/g;
	$line =~ s/¬/ϣ/g;
	$line =~ s/ч/ⲛ̄/g;
	$line =~ s/í/ⲣ/g;
	$line =~ s/á/ⲡ/g;
	$line =~ s/░/ϩ/g;
	$line =~ s/Æ/ⲑ/g;
	$line =~ s/æ/ⲏ/g;
	$line =~ s/Ü/ⲗ/g;
	$line =~ s/ĳ/ⲕ/g;
	$line =~ s/≈/·/g;
	$line =~ s/Ñ/ⲩ/g;
	$line =~ s/⌐/ⲱ/g;
	$line =~ s/ú/ⲧ/g;
	$line =~ s/▒/ϫ/g;
	$line =~ s/п/ⲓ̈/g;
	$line =~ s/▓/ϭ/g;
	$line =~ s/■/’/g;
	$line =~ s/ⁿ/:/g;
	$line =~ s/р/᷍ⲓ/g;
	$line =~ s/・/ⲟ̂/g;
	$line =~ s/C/ⲥ̄/g;
	$line =~ s/Й/ⲏ̄/g;
	$line =~ s/R/ⲩ̂/g;
	$line =~ s/С/ⲕ̄/g;
	$line =~ s/А/ⲁ̄/g;
	$line =~ s/u/ϫ̄/g;
	$line =~ s/З/ⲉ̇/g;
	$line =~ s/г/ⲅ̄/g;
	$line =~ s/ä/ⲃ/g;
	$line =~ s/å/ⲅ/g;
	$line =~ s/r/ϩ̄/g;
	$line =~ s/¿/ⲯ/g;
	$line =~ s/º/ⲭ/g;
	$line =~ s/Ш/ⲛ̣/g;
	$line =~ s/G/ⲧ̣/g;
	$line =~ s/⌡/†/g;
	$line =~ s/Ц/ⲙ̣/g;
	$line =~ s/Ж/ⲉ̣/g;
	$line =~ s/²/./g;
	$line =~ s/F/ⲧ̄/g;
	$line =~ s/Ф/ⲗ̄/g;
	$line =~ s/ё/ⲉ̄/g;
	$line =~ s/x/ϭ̄/g;
	$line =~ s/ì/ⲇ/g;
	$line =~ s/α/ⲧ⳿/g;
	$line =~ s/▀/ⲡ⳿/g;
	$line =~ s/Э/ⲣ̄/g;
	$line =~ s/н/ⲓ̄/g;
	$line =~ s/Ф/ⲗ̄/g;
	$line =~ s/ε/̀/g;
	$line =~ s/φ/´/g;
	$line =~ s/ñ/ϯ/g;
	$line =~ s/≥/⸗/g;
	$line =~ s/Э/ⲡ̄/g;
	$line =~ s/√/|/g;
	$line =~ s/В/ⲃ̄/g;
	$line =~ s/▀/ⲡ⳿/g;
	$line =~ s/▐/ⲕ⳿/g;
	$line =~ s/Ж/ⲉ̣/g;
	$line =~ s/ì/ⲇ/g;
	$line =~ s/ш/ⲛ̣̄/g;
	$line =~ s/О/ⲓ̣/g;
	$line =~ s/а/ⲁ̣/g;
	$line =~ s/ы/ⲟ̣/g;
	$line =~ s/A/ⲣ̣/g;
	$line =~ s/Д/ⲅ̣/g;
	$line =~ s/й/ⲏ̣/g;
	$line =~ s/F/ⲧ̄/g;
	$line =~ s/₧/ⲝ/g;
	$line =~ s/Л/ⲏ⳱/g;
	$line =~ s/ª/ⲫ/g;
	$line =~ s/α/ⲧ⳿/g;
	$line =~ s/э/ⲡ̣/g;
	$line =~ s/G/ⲧ̣/g;
	$line =~ s/ф/ⲗ̣/g;
	$line =~ s/ц/ⲙ̣̄/g;
	$line =~ s/{/ⲓ̣̈/g;
	$line =~ s/D/ⲥ̣/g;
	$line =~ s/v/ϫ̣/g;
	$line =~ s/щ/ⲝ̄/g;
	$line =~ s/л/ⲏ⳰/g;
	$line =~ s/μ/ⲏ̄/g;
	$line =~ s/▄/ⳁ/g;
	$line =~ s/Å/ⲍ/g;
	$line =~ s/Щ/ⲛ̣/g;
	$line =~ s/M/ⲩ̣/g;
	$line =~ s/g/ϥ̣/g;
	$line =~ s/h/ϥ̣̄/g;
	$line =~ s/V/ⲭ̄/g;
	$line =~ s/К/ⲏ̣̄/g;
	$line =~ s/a/ϣ̣/g;
	$line =~ s/Ю/ⲡ̣̄/g;
	$line =~ s/s/ϩ̣/g;
	$line =~ s/W/ⲭ̣/g;
	$line =~ s/B/ⲣ̣̄/g;
	$line =~ s/P/ⲩ̈/g;
	$line =~ s/Ы/ⲟ̄/g;
	$line =~ s/L/ⲩ̄/g;
	$line =~ s/y/ϭ̣/g;
	$line =~ s/E/ⲥ̣̄/g;
	$line =~ s/Ь/ⲟ̣̄/g;
	$line =~ s/ⲁⲩ\]/ⲁⲩⲱ̣/g;
	$line =~ s/ⲟⲩ̣\]ϩ/ⲟⲩ̣ⲱ̣ϩ/g;
	$line =~ s/a/ϣ̣/g;
	$line =~ s/W/ⲭ̣/g;
	$line =~ s/J/ϯ̣/g;
	$line =~ s/\]ⲡ/ⲱ̣ⲡ/g;
	$line =~ s/ⲡⲥ\]/ⲡⲥⲱ̣/g;
	$line =~ s/ⲩ̣]/ⲩ̣ⲱ̣/g;
	$line =~ s/¡/ϧ/g;
	$line =~ s/Ч/ⲙ̇/g;
	$line =~ s/П/ⲓ̇/g;
	$line =~ s/S/ⲫ̄/g;
	$line =~ s/I/ϯ̄/g;
	$line =~ s/ⲣ̄/ⲡ̄/g;
	$line =~ s/≤/⟦/g;
	$line =~ s/⌠/⟧/g;
	$line =~ s/ⲓ̣̈/\{/g;
	$line =~ s/j/ϧ̣/g;
	$line =~ s/T/ⲫ̣/g;
	$line =~ s/Е/ⲇ̄/g;
	$line =~ s/€/ⲋ̄/g;
	$line =~ s/М/ⲑ̄/g;
	$line =~ s/\\/ⲱ̄/g;
	$line =~ s/\^/ⲱ̣̄/g;
	$line =~ s/П/ⲓ̇/g;
	$line =~ s/SI/ⲫ︦ϯ︦/g;
	$line =~ s/ⲣ̄I/ⲡ︦ϯ︦/g;
	$line =~ s/Ч/ⲙ̣/g;
	$line =~ s/X/ⲭ̣̄/g;
		$line =~ s/ⲱ̣/\]/g;
	$line =~ s/б/ⲁ̇/g;
	$line =~ s/з/ⲍ̄/g;
	$line =~ s/ь/ⲟ̇/g;
		$line =~ s/_/ⲱ̇/g;
			$line =~ s/O/ⲩ̇/g;
			$line =~ s/к/ⲏ̇/g;
}
	elsif ($format eq "marcion")
	{
	$line =~ s/a/ⲁ/g;
	$line =~ s/b/ⲃ/g;
	$line =~ s/g/ⲅ/g;
	$line =~ s/d/ⲇ/g;
	$line =~ s/e/ⲉ/g; 	
	$line =~ s/z/z/g;
	$line =~ s/h/ⲏ/g;
	$line =~ s/q/ⲑ/g;
	$line =~ s/i/ⲓ/g;
	$line =~ s/k/ⲕ/g;
	$line =~ s/l/ⲗ/g;
	$line =~ s/m/ⲙ/g;
	$line =~ s/n/ⲛ/g;
	$line =~ s/j/ⲝ/g;
	$line =~ s/o/ⲟ/g; 
	$line =~ s/p/ⲡ/g;
	$line =~ s/r/ⲣ/g;
	$line =~ s/s/ⲥ/g;
	$line =~ s/t/ⲧ/g;
	$line =~ s/u/ⲩ/g;
	$line =~ s/f/ⲫ/g;
	$line =~ s/x/ⲭ/g;
	$line =~ s/c/ⲯ/g;
	$line =~ s/w/ⲱ/g;
	$line =~ s/S/ϣ/g;
	$line =~ s/F/ϥ/g;
	$line =~ s/H/ϩ/g;
	$line =~ s/j/ϫ/g;
	$line =~ s/G/ϭ/g;
	$line =~ s/T/ϯ/g;
	$line =~ s/K/ϧ/g;

	}
	print $line ."\n";
}

