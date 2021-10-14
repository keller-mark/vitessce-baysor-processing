
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

Run notebook:

```sh
jupyter lab ./processing.ipynb
```

List of processed files for Vitessce:
- `data/cells.zarr/`
- `data/molecules.zarr/`
- `data/poly_per_z_0.json`
- `data/stains/selected.ome.tiff`
