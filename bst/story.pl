use strict;
my $tree;

for my $n (split ',', config()->{list}){
  print "add $n ... \n";
  add_n($n, $tree );
}


traverse_t ( $tree->{left}, sub { print shift(), "\n" } ) if $tree->{left};

print $tree->{key}, "\n";

traverse_t ( $tree->{right}, sub { print shift(), "\n" } ) if $tree->{right};

sub add_n {

  my $n = shift;
  my $root = shift;

  if (! defined $root ) {
    $tree = { key => $n };
  } elsif ( $n >= $root->{key} && $root->{right} ){
    add_n($n, $root->{right})
  } elsif ( $n < $root->{key} && $root->{left} ) {
    add_n($n,$root->{left})
  } elsif ( $n >= $root->{key} && ! $root->{right}  ) {
    $root->{right} = { key => $n }
  } elsif ( $n < $root->{key} && ! $root->{left}  ) {
    $root->{left} = { key => $n }
  }
}

use Data::Dumper;

print Dumper $tree;

sub traverse_t {

  my $root = shift;
  my $f = shift;

  if ( $root->{left} ){
    traverse_t ($root->{left}, $f);
    $f->( $root->{key} );
    traverse_t ($root->{right}, $f) if $root->{right};
  } else {
    $f->( $root->{key} );
    traverse_t ($root->{right}, $f) if $root->{right};
  }
}




