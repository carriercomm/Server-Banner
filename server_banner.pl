# Developed by Deepak Mourya, Information Security Consultant
# Usage: perl banner.pl
# 'iplist.txt' contains multiple urls and url in the form of www.google.co.in


use LWP::Simple;
use IO::File;
use IO::Handle;
use LWP::UserAgent;

$filename = 'iplist.txt';    
chomp $filename;
open FILE,"<$filename" or die "Cannot read the file $filename: $!\n";

while($url1 = <FILE>)
{
 my $browser = LWP::UserAgent->new;
 $url='http://'.$url1;
 $ssl_url='https://'.$url1;
 
#$url='http://www.google.com';
print "\nIP Address: ".$url1;
 $response = $browser->get($url);
 my $srv = $response->header(Server);
 if($srv) {
	print "\nServer Banner: ".$srv."\n";
	}
 
 $ssl_response = $browser->get($ssl_url);
 my $ssl_srv = $ssl_response->header(Server);
 if($ssl_srv) {
	print "SSL Server Banner: ".$ssl_srv."\n";
	}
print "\n################\n\n";

}
