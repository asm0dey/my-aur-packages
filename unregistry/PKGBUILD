# Maintainer: asm0dey <me@asm0dey.site>
pkgname=unregistry
pkgver=0.1.0
pkgrel=1
pkgdesc="Push docker images directly to remote servers without an external registry"
arch=(any)
url="https://github.com/psviderski/unregistry/"
license=('Apache-2.0')
source=("docker-pussh-$pkgver::https://raw.githubusercontent.com/psviderski/unregistry/refs/tags/v$pkgver/docker-pussh")
sha256sums=('b602dbb15ff9160fd737dc79e2fdddc76d4306e0ca04abec24df257b5183c3c5')
depends=(docker bash)

package() {
    install -dm 755 $pkgdir/usr/lib/docker/cli-plugins
    install -m 755 "$srcdir/docker-pussh-$pkgver" $pkgdir/usr/lib/docker/cli-plugins/docker-pussh
}
