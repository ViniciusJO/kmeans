all:
	zig build-exe src/main.zig stb_image.o stb_image_write.o stb_image_resize2.o -lc -femit-bin='color_juicer' --color on
