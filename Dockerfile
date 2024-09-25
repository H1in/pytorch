FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

# Install system dependencies
RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

# Update Conda
RUN conda update -n base -c defaults conda

# Install PyTorch and related packages using Conda
RUN conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia

# Install pip packages
RUN pip install --upgrade pip && \
    pip install torchvision \
                tqdm \
                ftfy \
                regex \
                diffusers \
                accelerate \
                transformers \
                matplotlib \
                openai \
                nltk \
                gpustat \
                sentence-transformers

# Copy fonts (if you still need this)
COPY ./fonts/* /opt/conda/lib/python3.8/site-packages/matplotlib/mpl-data/fonts/ttf/

# Set Python 3.8 as the default Python version
RUN echo "alias python=python3.8" >> ~/.bashrc
RUN echo "alias pip=pip3" >> ~/.bashrc
