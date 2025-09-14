# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=httpjail-bin
pkgdesc='Monitor and restrict HTTP/HTTPS requests from processes'
pkgver=0.1.7
pkgrel=1
url='https://github.com/coder/httpjail'
arch=('x86_64' 'aarch64')
license=('CC0-1.0')
source_x86_64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
source_aarch64=("httpjail.${pkgver}.tar.gz::https://github.com/coder/httpjail/releases/download/v$pkgver/httpjail-$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('43a62dcbd1c9162ce9f600e6df0c00e3efcceb61927af9b73633a3d44f2788d6')
sha256sums_aarch64=('f3a9f995f555d3f14b2125a397de31d034adc0761d7b93cdec7d443cdfc5d01d')

package() {
    cd "$srcdir/httpjail-$pkgver-linux-$CARCH"
    install -Dm 755 httpjail $pkgdir/usr/bin/httpjail
}
