FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

RUN conda install -y scikit-learn pandas flake8 yapf isort yacs future libgcc

RUN pip install --upgrade pip && python -m pip install --upgrade setuptools 

RUN pip install cython scipy shapely timm scikit-image numpy==1.23.1 setuptools==59.5.0 matplotlib==3.3.4 pillow==9.1.0 shapely==1.8.0 open-clip-torch einops resampy soundfile easydict

COPY ./fonts/* /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/
