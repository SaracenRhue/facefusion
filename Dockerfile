FROM nvidia/cuda:11.8.0-base-ubuntu22.04

WORKDIR /app
COPY . .
# Update package repositories and install dependencies
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata.
RUN apt install -y git wget curl python3.10 ffmpeg python-is-python3
RUN apt install -y pip
RUN pip install --upgrade pip
RUN pip install inquirer
RUN python install.py --torch cuda --onnxruntime cuda

VOLUME /app/.assets:/facefusion/.assets

# Expose port 7860
ENV PORT=7860
EXPOSE 7860

CMD python run.py --execution-providers cuda
