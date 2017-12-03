# genLocalhost
This  is a BASH script that will generate a new local
webserver with the given .test domain name.

The file `test` goes in the folder `/etc/resolver/test`
This is the DNS resolver for `*.test` domains.

This script has been built to run on OSX.

## Installation

- Install apache 2.4
- Install PHP7
- enable the apache php module.
 

## Usage

genWeb.sh takes in 1 command line argument that is the
hostname of the server. If no name is given then
`example.test` is used. If the name is already in use then
another server will not be crated.
