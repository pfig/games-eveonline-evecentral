#!perl

use Test::More tests => 2;
use Test::Mock::Class 0.0303 qw(:all);

use Games::EveOnline::EveCentral;
use Games::EveOnline::EveCentral::Request::MarketStat;

use Encode qw(encode);
use HTTP::Response;

require LWP::UserAgent::Determined;

mock_class 'LWP::UserAgent::Determined' => 'LWP::UserAgent::Determined::Mock';
my $lwp = LWP::UserAgent::Determined::Mock->new;
$lwp->mock_return(get => &fake_http_response, args => [qr//]);

my $client = Games::EveOnline::EveCentral->new(ua => $lwp);
isa_ok($client, 'Games::EveOnline::EveCentral');

my $xml = $client->marketstat(
  Games::EveOnline::EveCentral::Request::MarketStat->new(
    type_id => 34
  )->request
);
my $parser = XML::LibXML->new;
my $doc = $parser->parse_string($xml);
my @stats = $doc->findnodes('//type[@id = "34"]');
isnt(scalar @stats, 0);

$lwp->mock_tally;

sub fake_http_response {
  my $filename = 't/res/marketstat-usesystem.xml';
  my $xml;

  {
    open (my $fh, '<', $filename) or die $!;
    local $/;
    $xml = <$fh>;
  }

  my $res = HTTP::Response->new;

  $res->code(200);
  $res->content(encode('utf-8', $xml));

  return $res;
}
