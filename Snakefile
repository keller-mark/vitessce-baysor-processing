import os
import platform
from os.path import join
import pandas as pd

# Directory / file constants
SRC_DIR = "src"
DATA_DIR = "data"

FIJI_CMD = "java -jar -Xmx4096m /Applications/Fiji.app/jars/ij-1.53c.jar -ijpath /Applications/Fiji.app/ -batch"
BFCONVERT_CMD = "~/software/bftools/bfconvert"

rule all:
  input:
    join(DATA_DIR, "stains", "selected.ome.tiff")

rule convert_to_ome_tiff:
  input:
    join(DATA_DIR, "stains", "selected.tif")
  output:
    img=join(DATA_DIR, "stains", "selected.ome.tiff"),
    in_xml=join(DATA_DIR, "stains", "selected.in.ome.xml"),
    out_xml=join(DATA_DIR, "stains", "selected.out.ome.xml")
  params:
    script=join(SRC_DIR, "add_channel_names.py"),
  shell:
    """
    {BFCONVERT_CMD} -tilex 512 -tiley 512 -pyramid-resolutions 6 -pyramid-scale 2  -compression LZW {input} {output.img} \
    && tiffcomment {output.img} > {output.in_xml} \
    && python {params.script} -i {output.in_xml} -o {output.out_xml} \
    && tiffcomment -set '{output.out_xml}' {output.img}
    """

rule stack:
  input:
    join(DATA_DIR, "stains", "dapi_selected.tif"),
    join(DATA_DIR, "stains", "membrane_selected.tif"),
    join(DATA_DIR, "stains", "polyA_selected.tif")
  output:
    join(DATA_DIR, "stains", "selected.tif")
  shell:
    """
    {FIJI_CMD} ./src/t_to_z.js
    """