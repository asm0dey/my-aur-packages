# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=3proxy
pkgver=0.8.12
pkgrel=3
pkgdesc="A tiny crossplatform proxy server"
arch=('any')
url="http://www.3proxy.ru/"
license=('BSD')
depends=('glibc')
makedepends=('gcc' 'make')
backup=('etc/3proxy/3proxy.cfg')
source=("https://github.com/z3APA3A/3proxy/archive/$pkgver.tar.gz"
        "3proxy.service"
)
md5sums=('f8ccbe689ff8da8ff67942fc440187ae'
         '107033a7d0d3584c72de16f7953b139e'
)
_prefix=/usr
_etcdir=/etc/3proxy
package() {
    cd "$srcdir/3proxy-$pkgver"
    cp Makefile.Linux Makefile.Linux~ && sed 's/^\(CFLAGS =\)/\1 -Werror-implicit-function-declaration /' Makefile.Linux~ > Makefile.Linux || return 1
    make='make -f Makefile.Linux INSTALL=/usr/bin/install'
    $make prefix="$_prefix" ETCDIR="$_etcdir"
    $make prefix="$_prefix" install DESTDIR="$pkgdir" ETCDIR="${pkgdir}${_etcdir}"
    ( cd ${pkgdir}${_prefix}/bin && mv proxy 3proxy-proxy ) || return 1
    rm -f ${pkgdir}${_etcdir}/counters ${pkgdir}${_etcdir}/passwd ${pkgdir}${_etcdir}/bandlimiters
    install -D -m644 copying ${pkgdir}${_prefix}/share/licenses/$pkgname/copying
    install -D -m644 cfg/3proxy.cfg.sample ${pkgdir}${_etcdir}/3proxy.cfg.sample
    install -D -m644 cfg/counters.sample ${pkgdir}${_etcdir}/counters.sample
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    install -D -m644 "$srcdir/3proxy.service" "$pkgdir/usr/lib/systemd/system/"
}

# vim: ts=4 sw=4 et:

