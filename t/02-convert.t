#!perl -T

use Test::More tests => 3;
use Parse::ISF;

$isf = 't/test.isf';
$csv = 't/test.csv';
$ret = Parse::ISF::ConvertToCSV($isf);
ok((-e $csv), "check if csv file is converted");
ok($ret, "check return value of ConvertToCSV()");
open F, $csv;
while ($l = <F>) {
    last if $. == 6450;
}
close F;
chomp $l;
is($l, '-1.102e-07,0.0113625', 'check value written in CSV file');
