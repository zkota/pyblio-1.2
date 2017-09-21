#!/bin/sh

aclocal_extra=""

if [ -f .autogen.conf ] ; then
    echo "autogen.sh:sourcing .autogen.conf"
    . .autogen.conf
fi

verbose=1

error ()
{
    echo "autogen.sh: error: $*"
    exit 1
}

run ()
{
    if [ $verbose = 1 ] ; then
	echo "autogen.sh: running: $*"
    fi

    $* || error "while running $*"
}

GNOMEDOC=`which yelp-build`
    if test -z $GNOMEDOC; then
        echo "*** The tools to build the documentation are not found,"
        echo "    please intall the yelp-tools package ***"
        exit 1
    fi

run aclocal ${aclocal_extra}
run autoconf
run automake -a

if [ -x ./config.status ] ; then
    run ./config.status --recheck
    run ./config.status
else
    run ./configure $*
fi
