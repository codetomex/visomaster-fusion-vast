FROM vastai/linux-desktop:ubuntu24.04-2026-06-16

USER root

ARG VISOMASTER_COMMIT=4af21843de60467c7c1c167d506ef1a2379dd2bc

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg git libegl1 libgl1 libglib2.0-0 libsm6 libxext6 libxrender1 \
    libxcb-cursor0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 \
    libxcb-render-util0 libxkbcommon-x11-0 && \
    rm -rf /var/lib/apt/lists/*

COPY requirements-resolved.txt /tmp/requirements-resolved.txt

RUN git clone https://github.com/VisoMasterFusion/VisoMaster-Fusion.git /opt/visomaster && \
    cd /opt/visomaster && git checkout "${VISOMASTER_COMMIT}" && \
    sed -i 's#"OutputMediaFolder", ""#"OutputMediaFolder", "/workspace/output"#' app/ui/main_ui.py && \
    sed -i '/create_control(self, "OutputMediaFolder"/a\        self.outputFolderLineEdit.setText("/workspace/output")' app/ui/main_ui.py && \
    python3 -m venv /opt/visomaster/.venv && \
    /opt/visomaster/.venv/bin/pip install --no-cache-dir uv

RUN cd /opt/visomaster && sed -n '1,5p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '6,10p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '11,15p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '16,20p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '21,25p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '26,30p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '31,35p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '36,40p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '41,45p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '46,50p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '51,55p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '56,60p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '61,65p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '66,70p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '71,75p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '76,80p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '81,85p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '86,90p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '91,95p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '96,100p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '101,105p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN cd /opt/visomaster && sed -n '106,110p' /tmp/requirements-resolved.txt > /tmp/requirements-chunk.txt && \
    /opt/visomaster/.venv/bin/uv pip install --python /opt/visomaster/.venv/bin/python --no-cache --no-deps -r /tmp/requirements-chunk.txt

RUN /opt/visomaster/.venv/bin/python -c \
    "import torch, onnxruntime, tensorrt, tensorflow; from PySide6 import QtWidgets; print(torch.__version__, onnxruntime.__version__, tensorrt.__version__)"

COPY download-model-group.py /opt/visomaster/download-model-group.py

RUN cd /opt/visomaster && MODEL_START=0 MODEL_END=1 \
    /opt/visomaster/.venv/bin/python download-model-group.py

RUN cd /opt/visomaster && MODEL_START=9 MODEL_END=10 \
    /opt/visomaster/.venv/bin/python download-model-group.py

RUN cd /opt/visomaster && MODEL_START=15 MODEL_END=16 \
    /opt/visomaster/.venv/bin/python download-model-group.py

RUN cd /opt/visomaster && MODEL_START=23 MODEL_END=24 \
    /opt/visomaster/.venv/bin/python download-model-group.py

RUN cd /opt/visomaster && MODEL_START=28 MODEL_END=29 \
    /opt/visomaster/.venv/bin/python download-model-group.py

RUN rm -rf /root/.cache /home/user/.cache && \
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
