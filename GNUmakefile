
#export CROSS_COMPILE = /opt/AndroidSDK/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
export CROSS_COMPILE = arm-none-eabi-
export KAFLAGS = -Wa,-meabi=5
export ARCH=arm
LDCMD=$(CROSS_COMPILE)ld --no-warn-mismatch
_all:
	$(MAKE) LD="$(LDCMD)" -f Makefile $@
%:
	$(MAKE) LD="$(LDCMD)" -f Makefile $@
