pkgconfig_DATA += eina/eina-sharp.pc

EXTRA_DIST += eina/eina-sharp.cs

eina-sharp.cs:
	$(output_DIR)/ender2sharp.exe -o $(top_srcdir)/eina eina

eina_BIN = eina-sharp.dll
eina_SRC = $(top_srcdir)/eina/eina-sharp.cs

einalibdir = $(libdir)/eina-sharp
einalib_DATA = $(output_DIR)/$(eina_BIN)

$(output_DIR)/$(eina_BIN): $(eina_SRC) $(output_CHECK)
	$(CSC) -nowarn:169 -unsafe -target:library -debug $(eina_SRC) \
		-out:$(output_DIR)/$(eina_BIN) -keyfile:$(top_srcdir)/eina/eina-sharp.snk
