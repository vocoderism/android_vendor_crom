# audio
include frameworks/base/data/sounds/NewAudio.mk

# common
$(call inherit-product, vendor/crom/config/common.mk)

# media
PRODUCT_COPY_FILES += \
    vendor/crom/prebuilt/common/media/hdpi/bootanimation.zip:system/media/bootanimation.zip

# ringtones
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Hydra.ogg \
    ro.config.notification_sound=Proxima.ogg \
    ro.config.alarm_alert=Cesium.ogg

$(call inherit-product, vendor/crom/config/telephony.mk)
