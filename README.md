
Requires:
- `tiffcomment`
- `bfconvert`
- FIJI

```sh
conda env create -f environment.yml
conda activate vitessce-baysor-env
```


```sh
tiffcomment ./data/stains/selected.ome.tiff > ./data/stains/selected.in.ome.xml
python src/add_channel_names.py -i ./data/stains/selected.in.ome.xml -o ./data/stains/selected.out.ome.xml
tiffcomment -set './data/stains/selected.out.ome.xml' ./data/stains/selected.ome.tiff
```