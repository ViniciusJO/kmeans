all: color_juicer
	
color_juicer: zig-out/stbi.zig zig-out/stbiw.zig zig-out/stbir.zig
	zig \
		build-exe \
		src/main.zig \
		stb_image.o \
		stb_image_write.o \
		stb_image_resize2.o \
		-lc \
		-femit-bin='color_juicer' \
		--color on
zig-out/stbi.zig: src/stb/stb_image.h
	zig translate-c -I /usr/include -DSTB_IMAGE_IMPLEMENTATION $< > $@
zig-out/stbiw.zig: src/stb/stb_image_write.h
	zig translate-c -I /usr/include -DSTB_IMAGE_WRITE_IMPLEMENTATION $< > $@
zig-out/stbir: src/stb/stb_image_resize.h
	zig translate-c -I /usr/include -DSTB_IMAGE_RESIZE_IMPLEMENTATION $< > $@
