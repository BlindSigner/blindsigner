################################################################################
#
# espeak-ng
#
################################################################################

ESPEAK_NG_VERSION = 1.52.0
ESPEAK_NG_SITE = https://github.com/espeak-ng/espeak-ng/releases/download/$(ESPEAK_NG_VERSION)
ESPEAK_NG_SOURCE = espeak-ng-$(ESPEAK_NG_VERSION).tar.gz

ESPEAK_NG_LICENSE = GPL-3.0+
ESPEAK_NG_LICENSE_FILES = COPYING

ESPEAK_NG_DEPENDENCIES = alsa-lib host-pkgconf

ESPEAK_NG_CONF_OPTS = \
    --with-audio=alsa \
    --without-portaudio \
    --without-pulseaudio \
    --disable-static

$(eval $(autotools-package))
