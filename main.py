# import gdown

# url = 'https://drive.google.com/u/0/uc?id=1xrD9bL78mbxpp-DdOw1EHhz1nzin_6dX&export=download'
# output = 'data'  # replace with your output file name and extension
# gdown.download(url, output, quiet=False)
import pandas as pd
file = "tuning/1-1.mr-en.mined-pairs"

df = pd.read_csv(file, sep="\t", header=None)
df.columns = ["kas", "en"]
df.to_excel("mined-pairs.xlsx", index=False)
