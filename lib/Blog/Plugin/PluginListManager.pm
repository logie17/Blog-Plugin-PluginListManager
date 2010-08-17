package Blog::Plugin::PluginListManager;
{
    use Moose;
    use Blog::Plugin;

    has build_data_store => (
        is              => 'ro',
        isa             => 'Int',
        lazy_build      => 1,
    );

    has plugin_path => (
        is       => 'rw',
        isa      => 'Str',
        required => 1,
    );

    has list => (
        is          => 'rw',
        isa         => 'ArrayRef[Blog::Plugin]',
        default     => sub { [] },
    );

    has iterator => (
        is      => 'ro',
        isa     => 'Blog::Plugin::Iterator',
    );

    sub find {
        my ($self, %params) = @_;

        if ( $params{type} )
        {
            $self->list($self->{data_store}->{$params{type}});
            my $end = scalar @
            
            if ( scalar @{$self->list} > 0 )
            {
                return Blog::Plugin::Iterator->new(index => 0);
            }
        }
        
    }

    sub _build_build_data_store {
        my $self = shift;

        $self->list_total(0);

        if ( my $plugin_path = $self->plugin_path )
        {
            return $self->list_total if !-e $plugin_path;  

            opendir(DIR, $plugin_path) || die "There was a problem opening path: $!\n";    

            my @modules = grep {/\.pm$/} readdir(DIR);

            if ( scalar @modules > 0 )
            {
                for my $module ( @modules )
                {
                    require $plugin_path . '/' . $module;
                    $module =~ s/\.pm//g;
                    push @{$self->{data_store}->{$module->plugin_type}, $module->new;
                    $self->list_total($self->list_total+1);
                }
            }
               
            closedir(DIR);
        }
        $self->list_total;
    }

    __PACKAGE__->meta->make_immutable;
    
    no Moose;

}
1;

package Blog::Plugin::Iterator;
{
    use Moose;

    __PACKAGE__->meta->make_immutable;
    
    no Moose;

}

1;
