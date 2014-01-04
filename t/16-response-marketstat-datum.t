#!perl

use Test::More tests => 15;
use Test::Exception;

use Error;

use Games::EveOnline::EveCentral::Response::MarketStat::Datum;

my $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
  volume => 34530503860,
  average => 4.50,
  max => 4.75,
  min => 2.00,
  stddev => 0.49,
  median => 4.67,
  percentile => 4.73
);

isa_ok($datum, 'Games::EveOnline::EveCentral::Response::MarketStat::Datum');
is($datum->volume, 34530503860);
is($datum->average, 4.50);
is($datum->max, 4.75);
is($datum->min, 2.00);
is($datum->stddev, 0.49);
is($datum->median, 4.67);
is($datum->percentile, 4.73);

throws_ok {
  eval {
    $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      average => 4.50,
      max => 4.75,
      min => 2.00,
      stddev => 0.49,
      median => 4.67,
      percentile => 4.73
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 34530503860,
      max => 4.75,
      min => 2.00,
      stddev => 0.49,
      median => 4.67,
      percentile => 4.73
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 34530503860,
      average => 4.50,
      min => 2.00,
      stddev => 0.49,
      median => 4.67,
      percentile => 4.73
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 34530503860,
      average => 4.50,
      max => 4.75,
      stddev => 0.49,
      median => 4.67,
      percentile => 4.73
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 34530503860,
      average => 4.50,
      max => 4.75,
      min => 2.00,
      median => 4.67,
      percentile => 4.73
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 34530503860,
      average => 4.50,
      max => 4.75,
      min => 2.00,
      stddev => 0.49,
      percentile => 4.73
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 34530503860,
      average => 4.50,
      max => 4.75,
      min => 2.00,
      stddev => 0.49,
      median => 4.67
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';
