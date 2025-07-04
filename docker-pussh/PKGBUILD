# Maintainer: Yufan You <ouuansteve at gmail>
# Maintainer: asm0dey <me@asm0dey.site>

pkgname=docker-pussh
pkgver=0.1.1
pkgrel=1
pkgdesc='Push docker images directly to remote servers without an external registry'
arch=(any)
url='https://github.com/psviderski/unregistry'
license=('Apache-2.0')
source=("docker-pussh-$pkgver::$url/raw/refs/tags/v$pkgver/docker-pussh")
sha256sums=('5e6042cb2c37a2a26591c615387db1977fcf54ed2eeef670044f5ac663a558d5')
depends=(docker bash openssh)

package() {
    install -Dm 755 "$srcdir/docker-pussh-$pkgver" "$pkgdir"/usr/lib/docker/cli-plugins/docker-pussh
}
