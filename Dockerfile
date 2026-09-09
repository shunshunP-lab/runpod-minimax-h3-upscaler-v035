FROM runpod/comfyui:cuda12.8

USER root

# ComfyUI v0.35.0
RUN rm -rf /opt/comfyui-baked && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui-baked && \
    cd /opt/comfyui-baked && \
    git checkout 40c4fcdf513a4523e39d54a9d391908af8df8171

# KJNodes
RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git \
    /opt/comfyui-baked/custom_nodes/ComfyUI-KJNodes && \
    cd /opt/comfyui-baked/custom_nodes/ComfyUI-KJNodes && \
    git checkout 3f20054214fec9f9234fd3841ae6f1e4287948f6

# MiniMax H3 Latent Upscaler
RUN git clone https://github.com/LBH-123-AI/Comfyui_Minimax_h3_latent_Upscaler.git \
    /opt/comfyui-baked/custom_nodes/Comfyui_Minimax_h3_latent_Upscaler && \
    cd /opt/comfyui-baked/custom_nodes/Comfyui_Minimax_h3_latent_Upscaler && \
    git checkout d7c01b9011f2e8439493f6c02c29995a27df276f

# MiniMax H3 TAE preview
RUN mkdir -p /opt/comfyui-baked/models/vae_approx && \
    wget -O /opt/comfyui-baked/models/vae_approx/taeh3.safetensors \
    https://huggingface.co/Kijai/MiniMax-H3-TAE/resolve/main/vae_approx/taeh3.safetensors

    # ComfyUI v0.35.0 に合わせて依存関係を更新
RUN pip install --no-cache-dir --force-reinstall \
    "comfy-kitchen==0.2.33" \
    "comfy-aimdo==0.5.3"

EXPOSE 8188 8888 8080 22
