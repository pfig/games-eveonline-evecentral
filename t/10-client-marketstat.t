#!perl

BEGIN { chdir 't' if -d 't' }

use lib 'lib';

use Test::More tests => 26;
use Test::Mock::Class 0.0303 qw(:all);

use Games::EveOnline::EveCentral;
use Games::EveOnline::EveCentral::Request::MarketStat;

use Games::EveOnline::EveCentral::Tests qw(fake_http_response);
require LWP::UserAgent::Determined;

mock_class 'LWP::UserAgent::Determined' => 'LWP::UserAgent::Determined::Mock';
my $lwp = LWP::UserAgent::Determined::Mock->new;
$lwp->mock_return(
  get => fake_http_response('res/marketstat-usesystem.xml'), args => [qr//]
);

my $client = Games::EveOnline::EveCentral->new(ua => $lwp);
isa_ok($client, 'Games::EveOnline::EveCentral');

my $xml = $client->marketstat_xml(
  Games::EveOnline::EveCentral::Request::MarketStat->new(
    type_id => 34
  )->request
);
my $doc = $client->xml->XMLin($xml);
my $stats = $doc;
is(scalar @stats, 0);

my $stats = $client->marketstat(
  Games::EveOnline::EveCentral::Request::MarketStat->new(
    type_id => 34
  )->request
);
$lwp->mock_tally;

is(scalar @$stats, 1);
my $stat = $stats->[0];
isa_ok($stat, 'Games::EveOnline::EveCentral::Response::MarketStat');

is($stat->type_id, 34);

my ($buy, $sell, $all) = _setup_fixtures();

ok($stat->buy->volume == $buy->volume);
ok($stat->buy->average == $buy->average);
ok($stat->buy->max == $buy->max);
ok($stat->buy->min == $buy->min);
ok($stat->buy->stddev == $buy->stddev);
ok($stat->buy->median == $buy->median);
ok($stat->buy->percentile == $buy->percentile);

ok($stat->sell->volume == $sell->volume);
ok($stat->sell->average == $sell->average);
ok($stat->sell->max == $sell->max);
ok($stat->sell->min == $sell->min);
ok($stat->sell->stddev == $sell->stddev);
ok($stat->sell->median == $sell->median);
ok($stat->sell->percentile == $sell->percentile);

ok($stat->all->volume == $all->volume);
ok($stat->all->average == $all->average);
ok($stat->all->max == $all->max);
ok($stat->all->min == $all->min);
ok($stat->all->stddev == $all->stddev);
ok($stat->all->median == $all->median);
ok($stat->all->percentile == $all->percentile);


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
