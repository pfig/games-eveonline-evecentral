#!perl

use Test::More tests => 9;
use Test::Exception;

use Error;

use Games::EveOnline::EveCentral::Response::MarketStat;
use Games::EveOnline::EveCentral::Response::MarketStat::Datum;

my ($buy, $sell, $all) = _setup_fixtures();

my $stat = Games::EveOnline::EveCentral::Response::MarketStat->new(
  type_id => 34,
  buy => $buy,
  sell => $sell,
  all => $all
);
isa_ok($stat, 'Games::EveOnline::EveCentral::Response::MarketStat');
is($stat->type_id, 34);
is_deeply($stat->buy, $buy);
is_deeply($stat->sell, $sell);
is_deeply($stat->all, $all);

throws_ok {
  eval {
    $stat = Games::EveOnline::EveCentral::Response::MarketStat->new(
      buy => $buy,
      sell => $sell,
      all => $all
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $stat = Games::EveOnline::EveCentral::Response::MarketStat->new(
      type_id => 34,
      sell => $sell,
      all => $all
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $stat = Games::EveOnline::EveCentral::Response::MarketStat->new(
      type_id => 34,
      buy => $buy,
      all => $all
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $stat = Games::EveOnline::EveCentral::Response::MarketStat->new(
      type_id => 34,
      buy => $buy,
      sell => $sell
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

# TODO: Move to the Tests module
sub _setup_fixtures {
  return (
    Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 25639403860,
      average => 4.59,
      max => 4.75,
      min => 2.00,
      stddev => 0.55,
      median => 4.68,
      percentile => 4.73
    ),
    Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 26462662005,
      average => 5.49,
      max => 8.42,
      min => 4.78,
      stddev => 0.64,
      median => 4.99,
      percentile =>4.80
    ),
    Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
      volume => 52114176976,
      average => 5.05,
      max => 8.42,
      min => 0.26,
      stddev => 0.87,
      median => 4.79,
      percentile => 4.10
    )
  );
}
