# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=PolesApart™ Kernel by PolesApart @ xda-developers
do.devicecheck=0
do.initd=0
do.modules=0
do.cleanup=1
device.name1=wt88047
device.name2=Redmi 2
device.name3=
device.name4=
device.name5=

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk


## AnyKernel install
dump_boot;
# begin ramdisk changes
mount -o rw,remount -t auto /system
insert_line /system/vendor/etc/fstab.qcom "zram0" after "do specify MF_CHECK" "/dev/block/zram0\tnone\tswap\tdefaults\tzramsize=536870912"
insert_line /system/vendor/etc/init/hw/init.target.rc "on init" before "on boot" "on init"
insert_line /system/vendor/etc/init/hw/init.target.rc "/system/vendor/etc/fstab.qcom" after "on init" " write /sys/block/zram0/comp_algorithm lz4"
insert_line /system/vendor/etc/init/hw/init.target.rc "/system/vendor/etc/fstab.qcom" after "write /sys/block/zram0" " write /proc/sys/vm/page-cluster 0\n"
insert_line /system/vendor/etc/init/hw/init.target.rc "/system/vendor/etc/fstab.qcom" before "on property:sys.ims.QMI_DAEMON_STATUS=1" "on property:sys.boot_completed=1"
insert_line /system/vendor/etc/init/hw/init.target.rc "/system/vendor/etc/fstab.qcom" after "boot_completed=1" "  swapon_all /system/vendor/etc/fstab.qcom\n"
replace_string /system/vendor/etc/init/hw/init.qcom.power.rc "scaling_min_freq 200000" "scaling_min_freq 800000" "scaling_min_freq 200000"
replace_string /system/vendor/etc/init/hw/init.qcom.power.rc "target_loads \"10 " "target_loads.*$" "target_loads \"10 533333:60 800000:85 998400:90 1094400:80\""
replace_file /system/vendor/etc/wifi/WCNSS_qcom_cfg.ini 644 WCNSS_qcom_cfg-prima.ini
#replace_file /system/vendor/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin 644 WCNSS_qcom_wlan_nv.bin
#replace_file /system/vendor/firmware/wlan/prima/WCNSS_cfg.dat 644 WCNSS_cfg.dat
mount -o ro,remount -t auto /system
# end ramdisk changes

write_boot;

## end install

