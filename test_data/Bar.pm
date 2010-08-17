package Bar;
{
    use Moose;
    extends 'Blog::Plugin';

    __PACKAGE__->plugin_type('user');

    __PACKAGE__->meta->make_immutable;
    
    no Moose;

}
1;
