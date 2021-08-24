dataDir = "/Users/mkeller/research/dbmi/vitessce/baysor/data/stains"

dapi = IJ.openImage(dataDir + "/dapi_selected.tif");
membrane = IJ.openImage(dataDir + "/membrane_selected.tif");
polyA = IJ.openImage(dataDir + "/polyA_selected.tif");

imp = Concatenator.run(dapi, membrane, polyA);
imp2 = HyperStackConverter.toHyperStack(imp, 3, 9, 1, "xyzct", "Grayscale");

IJ.saveAs(imp2, "Tiff", dataDir + "/selected.tif");