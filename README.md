
Requires:
- `tiffcomment`
- `bfconvert`
- FIJI

Data:
- Move files from `baysor_selected_3d.zip` into `data/`
- Move files from `stains.zip` into `data/stains/`


Set up environment:

```sh
conda env create -f environment.yml
conda activate vitessce-baysor-env
```

Run pipeline:

```sh
snakemake -j 1
```

List of processed files for Vitessce:
- `data/molecules.json`
- `data/poly_per_z_0.json`
- `data/segmentation.zarr/`
- `data/stains/selected.ome.tiff`