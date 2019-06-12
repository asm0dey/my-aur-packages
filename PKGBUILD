# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=cb-bin
_pkgname=cb
pkgver=0.1.0
pkgrel=2
arch=('x86_64')
url="https://github.com/yaa110/cb"
license=("MIT")

pkgdesc='Command line interface to manage clipboard'

source=("LICENSE::https://raw.githubusercontent.com/yaa110/$_pkgname/master/LICENSE-MIT")
source_x86_64=("https://github.com/yaa110/$_pkgname/releases/download/$pkgver/cb")
sha512sums=("6f22b5be709772ea56833d7f5a4e16874c5bdc5a91f2d0d3bc3acdc778be00cf680ea03b2099dc581d09b96c420511391b475165d587f56fee476b29b2c917fa")
sha512sums_x86_64=("85e09a8e12ad2008582d446f19e47f1f4a158c8fee285d339469d481f5b6a501c20671b4de432b0e60990aae82335f46b5b4732f7e7588f9853e56e827648562")
depends=('gcc-libs' 'libxcb')
conflicts=('cb-git' 'cb')
provides=('cb')

package() {
    install -Dm755 "$srcdir/cb" "$pkgdir/usr/bin/cb"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
