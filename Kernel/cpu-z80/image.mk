tools/analysemap: tools/analysemap.c

tools/visualize: tools/visualize.c

tools/bihx: tools/bihx.c

tools/binmunge: tools/binmunge.c

tools/memhogs: tools/analysemap
	cp tools/analysemap tools/memhogs

tools/binman: tools/binman.c

tools/cartman: tools/cartman.c

tools/bintomdv: tools/bintomdv.c

tools/bin2sna: tools/bin2sna.c

tools/bin2z80: tools/bin2z80.c

tools/flat2z80: tools/flat2z80.c

tools/makedck: tools/makedck.c

tools/plus3boot: tools/plus3boot.c

tools/raw2dsk: tools/raw2dsk.c

tools/raw2mgt: tools/raw2mgt.c

tools/bankld/sdldz80:
	+(cd tools/bankld; $(MAKE))

cpm-loader/cpmload.bin:	cpm-loader/cpmload.s cpm-loader/fuzixload.s cpm-loader/makecpmloader.c
	+$(MAKE) -C cpm-loader

tools/makejv3: tools/makejv3.c

tools/trslabel: tools/trslabel.c

fuzix.ihx: target $(OBJS) platform-$(TARGET)/fuzix.lnk tools/bankld/sdldz80
	$(CROSS_LD) -n -k $(LIBZ80) -f platform-$(TARGET)/fuzix.lnk

fuzix.bin: fuzix.ihx tools/bihx tools/analysemap tools/memhogs tools/binman tools/bintomdv tools/binmunge tools/bin2sna tools/bin2z80 cpm-loader/cpmload.bin tools/flat2z80 tools/makejv3 tools/trslabel tools/visualize tools/raw2dsk tools/raw2mgt tools/cartman tools/makedck tools/plus3boot
	-cp hogs.txt hogs.txt.old
	tools/memhogs <fuzix.map |sort -nr >hogs.txt
	head -5 hogs.txt
	tools/bihx fuzix.ihx
	tools/binprep
	+$(MAKE) -C platform-$(TARGET) image
	tools/visualize < fuzix.map

