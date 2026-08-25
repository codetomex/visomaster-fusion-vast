FROM vastai/linux-desktop:ubuntu24.04-2026-06-16

USER root

ARG VISOMASTER_COMMIT=4af21843de60467c7c1c167d506ef1a2379dd2bc

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg git libegl1 libgl1 libglib2.0-0 libsm6 libxext6 libxrender1 \
    libxcb-cursor0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 \
    libxcb-render-util0 libxkbcommon-x11-0 && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/VisoMasterFusion/VisoMaster-Fusion.git /opt/visomaster && \
    cd /opt/visomaster && git checkout "${VISOMASTER_COMMIT}" && \
    sed -i -E '/^(cuda-toolkit|nvidia-cublas|nvidia-cuda-nvrtc|nvidia-cudnn-cu13)==/d' requirements_cu13.txt && \
    python3 -m venv /opt/visomaster/.venv && \
    /opt/visomaster/.venv/bin/pip install --no-cache-dir uv && \
    cd /opt/visomaster && /opt/visomaster/.venv/bin/uv pip install --no-cache -r requirements_cu13.txt

RUN cd /opt/visomaster && /opt/visomaster/.venv/bin/python download_models.py && \
    rm -rf /root/.cache /home/user/.cache && \
    chown -R user:root /opt/visomaster

COPY start-visomaster.sh /opt/start-visomaster.sh
COPY visomaster.conf /etc/supervisor/conf.d/visomaster.conf

RUN chmod 0755 /opt/start-visomaster.sh && \
    mkdir -p /opt/workspace-internal/input /opt/workspace-internal/output \
             /opt/workspace-internal/faces /opt/workspace-internal/projects && \
    cp /opt/start-visomaster.sh /opt/workspace-internal/start-visomaster.sh && \
    ln -s /opt/visomaster /opt/workspace-internal/VisoMaster-Fusion && \
    chown -R user:root /opt/workspace-internal

ENV VISOMASTER_HOME=/opt/visomaster \
    PYTHONUNBUFFERED=1 \
    NVIDIA_DRIVER_CAPABILITIES=all
