# brand
PRODUCT_BRAND ?= C-RoM

#SuperUser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

# overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.sys.root_access=3

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1

# packages
PRODUCT_PACKAGES += \
    Apollo \
    BlueBalls \
    Calendar \
    Camera \
    CMFileManager \
    CRoMWallpapers \
    CTool \
    DashClock \
    Development \
    Galaxy4 \
    HALO \
    HoloSpiralWallpaper \
    Focal \
    LiveWallpapers \
    LiveWallpapersPicker \
    NoiseField \
    PermissionsManager \
    PhaseBeam \
    BlueBalls \
    PhotoTable \
    ROMStats \
    SunBeam \
    Superuser \
    su \
    Trebuchet \
    VoicePlus

# CM Packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    DSPManager \
    libcyanogen-dsp

# prebuilts
PRODUCT_PACKAGES += \
    LatinIME \
    LockClock 

# tools
PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

PRODUCT_PACKAGES += \
    armzipalign \
    e2fsck \
    fsck.exfat \
    mke2fs \
    tune2fs \
    mkfs.exfat \
    mount.exfat \
    nano \
    ntfsfix \
    ntfs-3g


# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# Launcher
#PRODUCT_COPY_FILES += \
#    vendor/crom/proprietary/NovaLauncher/NovaLauncher.apk:system/app/NovaLauncher.apk

# SunBeam LWP
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/app/SunBeam.apk:system/app/SunBeam.apk

# Update Me
PRODUCT_COPY_FILES += \
    vendor/crom/proprietary/UpdateMe/UpdateMe.apk:system/app/UpdateMe.apk

# Languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Themes
include vendor/crom/config/theme_chooser.mk

#korean
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/crom/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/crom/overlay/common

# bin
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/sysinit:system/bin/sysinit

# etc
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.crom.rc:root/init.crom.rc

# initd
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/crom/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/crom/prebuilt/common/etc/liberty.bsh:system/etc/liberty.bsh \
    vendor/crom/prebuilt/common/etc/init_trigger.disabled:system/etc/init_trigger.disabled

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# build.prop tweaks
PRODUCT_PROPERTY_OVERRIDES += \
  lpa.decode=false \
  ro.kernel.android.checkjni=0 \
  ro.media.enc.jpeg.quality=100 \
  debug.sf.hw=1 \
  pm.sleep_mode=0 \
  video.accelerate.hw=1 \
  persist.sys.root_access=3

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/crom/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/xbin/sysro:system/xbin/sysro \
    vendor/crom/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/crom/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/crom/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

#backup tool
CROM_BUILD = true
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/crom/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/crom/prebuilt/common/bin/50-crom.sh:system/addon.d/50-crom.sh \
    vendor/crom/prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    vendor/crom/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/crom/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# version
RELEASE = false
CROM_VERSION_MAJOR = 5
CROM_VERSION_MINOR = 0
CROM_VERSION := "C-RoM-v"$(CROM_VERSION_MAJOR).$(CROM_VERSION_MINOR)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.crom.version=$(CROM_VERSION)

# ROM Statistics and ROM Identification
PRODUCT_PROPERTY_OVERRIDES += \
ro.romstats.askfirst=1 \
ro.romstats.ga=UA-20205669-1 \
ro.romstats.name=C-RoM \
ro.romstats.url=http://stats.c-rom.biz \
ro.romstats.version=$(CROM_VERSION)

-include vendor/crom/sepolicy/sepolicy.mk
