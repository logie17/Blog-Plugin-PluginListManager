package Blog::Plugin;
{
    use Moose;

    use overload '""' =>\&to_string, 'fallback' => 1;

    sub to_string 
    {
        my ($self) = @_;
        ref $self;
    }

    sub plugin_type
    {
        my ($proto, $type) = @_;

        my $class = ref $proto;

        if ( $type )
        {
            $class::plugin_type = $type;
        }
k
        return $class::plugin_type;
    }


    __PACKAGE__->meta->make_immutable;
    
    no Moose;

}
1;
