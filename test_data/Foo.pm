package Foo;
{
    use Moose;
    extends 'Blog::Plugin';

    __PACKAGE__->plugin_type('cron');

    __PACKAGE__->meta->make_immutable;
    
    no Moose;

}
1;
