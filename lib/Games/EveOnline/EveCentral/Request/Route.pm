package Games::EveOnline::EveCentral::Request::Route;


# ABSTRACT: Create a request for the route endpoint.


use Moo 1.003001;
use MooX::Types::MooseLike 0.25;
use MooX::StrictConstructor 0.006;
use MooX::Types::MooseLike::Base qw(AnyOf Int Str);

use 5.012;

extends 'Games::EveOnline::EveCentral::Request';

use Readonly 1.03;


Readonly::Scalar my $ENDPOINT => 'route';


has 'from_system' => (
  is => 'ro',
  isa => AnyOf[Int, Str],
  required => 1
);

has 'to_system' => (
  is => 'ro',
  isa => AnyOf[Int, Str],
  required => 1
);

has '_path' => (
  is => 'lazy',
  isa => Str,
);


=head1 DESCRIPTION

This class is used to create HTTP::Request objects suitable to call the
`route` method on EVE Central.

Examples:

=over 4

=item * L<http://api.eve-central.com/api/route/from/Jita/to/V2-VC2>

=back

=for test_synopsis
no strict 'vars'


=head1 SYNOPSIS

  my $req = Games::EveOnline::EveCentral::Request::Route->new(
    from_system => 'Jita', # Or 30000142, mandatory
    to_system => 'Amarr' # Or 30002187, mandatory
  )->request;

Please take care to only use valid type ids.


=head1 METHODS

=head2 request

Returns an HTTP::Request object which can be used to call the 'route'
endpoint.

=cut

sub request {
  my $self = shift;
  my $path = $self->_path;

  return $self->http_request($path);
}


=begin private

=cut

sub _build__path {
  my $self = shift;

  my $path = $ENDPOINT . '/';

  $path .= 'from/' . $self->from_system . '/';
  $path .= 'to/' . $self->to_system;

  return $path;
}

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

1; # End of Games::EveOnline::EveCentral::Request::Route

