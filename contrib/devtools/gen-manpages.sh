#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PIGEOND=${PIGEOND:-$SRCDIR/nyc3d}
PIGEONCLI=${PIGEONCLI:-$SRCDIR/nyc3-cli}
PIGEONTX=${PIGEONTX:-$SRCDIR/nyc3-tx}
PIGEONQT=${PIGEONQT:-$SRCDIR/qt/nyc3-qt}

[ ! -x $PIGEOND ] && echo "$PIGEOND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
NYC3VER=($($PIGEONCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for nyc3d if --version-string is not set,
# but has different outcomes for nyc3-qt and nyc3-cli.
echo "[COPYRIGHT]" > footer.h2m
$PIGEOND --version | sed -n '1!p' >> footer.h2m

for cmd in $PIGEOND $PIGEONCLI $PIGEONTX $PIGEONQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${NYC3VER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${NYC3VER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
