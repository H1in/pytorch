FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-devel

# Install system dependencies
RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

# Update Conda
RUN conda update -n base -c defaults conda

# Install PyTorch and related packages using Conda
RUN conda install pytorch==2.0.0 torchvision==0.15.0 torchaudio==2.0.0 pytorch-cuda=11.7 -c pytorch -c nvidia

# Install pip packages
RUN pip install --upgrade pip && \
    pip install torchvision \
                tqdm \
                ftfy \
                regex \
                diffusers==0.24.0 \
                accelerate==0.24.1 \
                transformers==4.35.2 \
                matplotlib==3.7.3 \
                openai==1.3.0 \
                nltk==3.8.1 \
                gpustat==1.1.1 \
                sentence-transformers

# Copy fonts (if you still need this)
COPY ./fonts/* /opt/conda/lib/python3.8/site-packages/matplotlib/mpl-data/fonts/ttf/

# Set Python 3.8 as the default Python version
RUN echo "alias python=python3.8" >> ~/.bashrc
RUN echo "alias pip=pip3" >> ~/.bashrc
