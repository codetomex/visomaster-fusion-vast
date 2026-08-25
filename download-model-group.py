import os

from app.helpers.downloader import download_file
from app.processors.models_data import models_list

start = int(os.environ["MODEL_START"])
end = int(os.environ["MODEL_END"])

for model_data in models_list[start:end]:
    download_file(
        model_data["model_name"],
        model_data["local_path"],
        model_data["hash"],
        model_data["url"],
    )
