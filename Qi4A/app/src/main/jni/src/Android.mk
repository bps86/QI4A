
LOCAL_PATH:= $(call my-dir)

#--------------------------------------------------------
# libdarkplaces.so
#--------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_MODULE := jpeg
#LOCAL_SRC_FILES := $(LOCAL_PATH)/../../deps/lib/libjpeg.a
#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../deps/include/jpeg
LOCAL_SRC_FILES := $(LOCAL_PATH)/deps/lib/libjpeg.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/deps/include/jpeg
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_ARM_NEON := true
#LOCAL_MODULE			:= darkplaces_neon
TARGET_ARCH_ABI			:= armeabi armeabi-v7a

LOCAL_MODULE			:= darkplaces

#LOCAL_CFLAGS			:= -fPIC -DUSE_EGL -DUSE_GLES2 -DUSE_OGG -DUSE_VORBIS -DLINK_TO_LIBVORBIS -DSND_MODPLUG_STATIC -fno-builtin-sin -fno-builtin-cos -mthumb-interwork -O3 -s
LOCAL_CFLAGS			:= -fPIC -DUSE_EGL -DUSE_GLES2 -DUSE_OGG -DUSE_VORBIS -DLINK_TO_LIBVORBIS -DSND_MODPLUG_STATIC -fno-builtin-sin -fno-builtin-cos -O3 -s

LOCAL_LDLIBS			:= -ldl -llog -landroid -lGLESv2 -lEGL

#shared libraries
#LOCAL_SHARED_LIBRARIES	:= vorbis vorbisfile ogg modplug
#LOCAL_STATIC_LIBRARIES	:= systemutils jpeg

#static libraries
#LOCAL_STATIC_LIBRARIES	:= systemutils vorbis vorbisfile ogg modplug jpeg
LOCAL_STATIC_LIBRARIES	:= vorbis vorbisfile ogg modplug jpeg

LOCAL_C_INCLUDES		+=	$(LOCAL_PATH)\
							$(LOCAL_PATH)/../libogg/include/ \
							$(LOCAL_PATH)/../vorbis/include/ \
							$(LOCAL_PATH)/../libmodplug/include/ \

# CD objects
SRC_NOCD=cd_null.c

SRC_SND_COMMON=snd_main.c snd_mem.c snd_mix.c snd_ogg.c snd_wav.c snd_modplug.c

###### Common objects and flags #####

# Common objects
SRC_COMMON= \
	bih.c \
	cap_avi.c \
	cap_ogg.c \
	cd_shared.c \
	crypto.c \
	cl_collision.c \
	cl_demo.c \
	cl_dyntexture.c \
	cl_input.c \
	cl_main.c \
	cl_parse.c \
	cl_particles.c \
	cl_screen.c \
	cl_video.c \
	clvm_cmds.c \
	cmd.c \
	collision.c \
	common.c \
	console.c \
	csprogs.c \
	curves.c \
	cvar.c \
	dpsoftrast.c \
	dpvsimpledecode.c \
	filematch.c \
	fractalnoise.c \
	fs.c \
	ft2.c \
	utf8lib.c \
	gl_backend.c \
	gl_draw.c \
	gl_rmain.c \
	gl_rsurf.c \
	gl_textures.c \
	hmac.c \
	host.c \
	host_cmd.c \
	image.c \
	image_png.c \
	jpeg.c \
	keys.c \
	lhnet.c \
	libcurl.c \
	mathlib.c \
	matrixlib.c \
	mdfour.c \
	menu.c \
	meshqueue.c \
	mod_skeletal_animatevertices_sse.c \
	mod_skeletal_animatevertices_generic.c \
	model_alias.c \
	model_brush.c \
	model_shared.c \
	model_sprite.c \
	mvm_cmds.c \
	netconn.c \
	palette.c \
	polygon.c \
	portals.c \
	protocol.c \
	prvm_cmds.c \
	prvm_edict.c \
	prvm_exec.c \
	r_explosion.c \
	r_lerpanim.c \
	r_lightning.c \
	r_modules.c \
	r_shadow.c \
	r_sky.c \
	r_sprites.c \
	sbar.c \
	snprintf.c \
	sv_demo.c \
	sv_main.c \
	sv_move.c \
	sv_phys.c \
	sv_user.c \
	svbsp.c \
	svvm_cmds.c \
	sys_shared.c \
	vid_shared.c \
	view.c \
	wad.c \
	world.c \
	zone.c

SRC_ANDROID= builddate.c sys_linux.c vid_android.c thread_pthread.c $(SRC_SND_COMMON) snd_android.c  $(SRC_NOCD) $(SRC_COMMON)

LOCAL_SRC_FILES = $(SRC_ANDROID) 

include $(BUILD_SHARED_LIBRARY)
