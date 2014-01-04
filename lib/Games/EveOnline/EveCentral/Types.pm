package Games::EveOnline::EveCentral::Types;

use MooX::Types::MooseLike;
use base qw(Exporter);
our @EXPORT_OK = ();


# ABSTRACT: Our own type definitions.


my $types = [
  {
    name => 'MarketDatum',
    test => sub {
      die "$_[0] is not a MarketDatum"
        unless UNIVERSAL::isa(
                $_[0],
                'Games::EveOnline::EveCentral::Response::MarketStat::Datum');
    },
    message => sub { "$_[0] is not the required type." }
  }
];

MooX::Types::MooseLike::register_types($types, __PACKAGE__);

1; # End of Games::EveOnline::EveCentral::Types;
