#!perl

use Test::More tests => 1;

use Games::EveOnline::EveCentral;

my $o = Games::EveOnline::EveCentral->new;
isa_ok( $o, 'Games::EveOnline::EveCentral' );
