dataDir = "/Users/mkeller/research/dbmi/vitessce/baysor/data/stains"

dapi = IJ.openImage(dataDir + "/dapi_selected.tif");
membrane = IJ.openImage(dataDir + "/membrane_selected.tif");
polyA = IJ.openImage(dataDir + "/polyA_selected.tif");

imp = Concatenator.run(dapi, membrane, polyA);
imp2 = HyperStackConverter.toHyperStack(imp, 3, 9, 1, "xyzct", "Grayscale");

IJ.run(imp2, "16-bit", "");

// Begin restrict to 0th z slice
IJ.run(imp2, "Make Substack...", "channels=1-3 slices=1");
imp3 = IJ.getImage();
// End

IJ.saveAs(imp3, "Tiff", dataDir + "/selected.tif");