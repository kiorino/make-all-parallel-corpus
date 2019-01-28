#!/usr/bin/perl

my $infile = $ARGV[0];

if($#ARGV != 0){
		die("Usage: $0 <wiki-filename.xml>");
}
if(!open(IN, $infile)){
		die("Cannot file open: $infile");
}

my $sent_status = 0;
my @ja_sent;
my @en_sent;
while (<IN>) {
		chomp($_);
		my $line = $_;
		if($line =~ /^<sen id=/){
				$sent_status = 1;
		}
		if($sent_status == 1){
				if($line =~ /^<j>/){
						$line =~ /<j>(.+)<\/j>/;
						push(@ja_sent, $1);
						break;
				}
				if($line =~ /^<e /){
						$line =~ /<e.+>(.+)<\/e>/;
						push(@en_sent, $1);
						break;
				}
				if($line =~ /^<\/sen>/){
						for ($ja_index = 0; $ja_index <= $#ja_sent; $ja_index++){
								for ($en_index = 0; $en_index <= $#en_sent; $en_index++){
										print "$ja_sent[$ja_index]\t$en_sent[$en_index]\n";
								}
						}
						@ja_sent = ();
						@en_sent = ();
						$sent_status = 0;
				}
		}

}

