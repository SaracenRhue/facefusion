FROM nvidia/cuda:12.1.0-base-rockylinux9

WORKDIR /app
COPY . .
# Update package repositories and install dependencies
RUN dnf update -y
RUN dnf install -y sudo wget git python3.10 python-is-python3 pip curl ffmpeg
RUN pip install -r requirements.txt
RUN python install.py --onnxruntime cuda

# VOLUME /home/user/facefusion/


# Expose port 7860
ENV PORT=7860
EXPOSE 7860

CMD python run.py
