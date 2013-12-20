#!perl

use Test::More tests => 19;
use Test::Exception;
use Error;

use Games::EveOnline::EveCentral::HTTPRequest;

my $o = Games::EveOnline::EveCentral::HTTPRequest->new(
  method => 'GET',
  path => 'frobnitzer'
);
isa_ok($o, 'Games::EveOnline::EveCentral::HTTPRequest');

$o = Games::EveOnline::EveCentral::HTTPRequest->new(
  method => 'POST',
  path => 'frobnitzer'
);
isa_ok($o, 'Games::EveOnline::EveCentral::HTTPRequest');

throws_ok {
  eval {
    $o = Games::EveOnline::EveCentral::HTTPRequest->new(
      path => 'frobnitzer'
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $o = Games::EveOnline::EveCentral::HTTPRequest->new(
      method => 'GET',
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

throws_ok {
  eval {
    $o = Games::EveOnline::EveCentral::HTTPRequest->new(
      method => 'PUT',
      path => 'frobnitzer'
    );
  };
  throw Error::Simple($!) if $@;
} 'Error::Simple';

my $expected_headers = { 'UserAgent' => 'Games::EveOnline::EveCentral' };
my $expected_content = 'CONTENTCONTENTCONTENT';
$o = Games::EveOnline::EveCentral::HTTPRequest->new(
  method => 'GET',
  path => 'frobnitzer',
  headers => { 'UserAgent' => 'Games::EveOnline::EveCentral' },
  content => 'CONTENTCONTENTCONTENT'
);
is_deeply($o->headers, $expected_headers);
is($o->content, $expected_content, 'Object retains values');

my $req = $o->http_request;
isa_ok($req, 'HTTP::Request');
is($req->method, 'GET');
is($req->uri, 'http://api.eve-central.com/api/frobnitzer');
is($req->content, '');
is($req->header('UserAgent'), 'Games::EveOnline::EveCentral');

$o = Games::EveOnline::EveCentral::HTTPRequest->new(
  method => 'POST',
  path => 'frobnitzer',
  headers => { 'UserAgent' => 'Games::EveOnline::EveCentral' },
  content => 'CONTENTCONTENTCONTENT'
);
is_deeply($o->headers, $expected_headers);
is($o->content, $expected_content, 'Object retains values');

my $req = $o->http_request;
isa_ok($req, 'HTTP::Request');
is($req->method, 'POST');
is($req->uri, 'http://api.eve-central.com/api/frobnitzer');
is($req->content, $expected_content);
is($req->header('UserAgent'), 'Games::EveOnline::EveCentral');
