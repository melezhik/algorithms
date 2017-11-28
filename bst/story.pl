use strict;
my @tree;

for my $n (split ',', config()->{list}){
  print "add $n ... \n";
  add_n($n, $tree[0] );
}


sub add_n {

  my $n = shift;
  my $root = shift;

  if (! defined $root ) {
    push @tree, { key => $n };
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

print Dumper \@tree;
