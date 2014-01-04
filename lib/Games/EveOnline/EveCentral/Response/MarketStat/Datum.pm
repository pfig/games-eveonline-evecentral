package Games::EveOnline::EveCentral::Response::MarketStat::Datum;


# ABSTRACT: A data point for a market product;


use Moo 1.003001;
use MooX::Types::MooseLike 0.25;
use MooX::StrictConstructor 0.006;
use MooX::Types::MooseLike::Base qw(Int Num);

use 5.012;


=head1 DESCRIPTION

This class is used to create objects representing a data point for a market
product.


=for test_synopsis
no strict 'vars'

=head1 SYNOPSIS

  my $datum = Games::EveOnline::EveCentral::Request::MarketStat::Datum->new(
    volume => 34530503860,
    average => 4.50,
    max => 4.75,
    min => 2.00,
    stddev => 0.49,
    median => 4.67,
    percentile => 4.73
  );

=cut

has 'volume' => (
  is => 'ro',
  isa => Int,
  required => 1
);

has 'average' => (
  is => 'ro',
  isa => Num,
  required => 1
);

has 'max' => (
  is => 'ro',
  isa => Num,
  required => 1
);

has 'min' => (
  is => 'ro',
  isa => Num,
  required => 1
);

has 'stddev' => (
  is => 'ro',
  isa => Num,
  required => 1
);

has 'median' => (
  is => 'ro',
  isa => Num,
  required => 1
);

has 'percentile' => (
  is => 'ro',
  isa => Num,
  required => 1
);

=head1 METHODS

=head2 new

Creates a new data point:

  my $datum = Games::EveOnline::EveCentral::Response::MarketStat::Datum->new(
    volume => 34530503860,
    average => 4.50,
    max => 4.75,
    min => 2.00,
    stddev => 0.49,
    median => 4.67,
    percentile => 4.73
  );

=cut

=begin private
=end private


=head1 AUTHOR

Pedro Figueiredo, C<< <me at pedrofigueiredo.org> >>


=head1 BUGS

Please report any bugs or feature requests through the web interface at
L<https://github.com/pfig/games-eveonline-evecentral/issues>.  I will be
notified, and then you'll automatically be notified of progress on your bug as
I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Games::EveOnline::EveCentral


You can also look for information at:

=over 4

=item * GitHub Issues (report bugs here)

L<https://github.com/pfig/games-eveonline-evecentral/issues>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Games-EveOnline-EveCentral>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Games-EveOnline-EveCentral>

=item * CPAN

L<http://metacpan.org/module/Games::EveOnline::EveCentral>

=back


=head1 ACKNOWLEDGEMENTS

=over 4

=item * The people behind EVE Central.

L<http://eve-central.com/>

=back


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Pedro Figueiredo.

This program is free software; you can redistribute it and/or modify it
under the terms of the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Games::EveOnline::EveCentral::Response::MarketStat::Datum

