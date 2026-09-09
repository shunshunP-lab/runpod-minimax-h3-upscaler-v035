FROM runpod/comfyui:cuda12.8

USER root

# ComfyUI v0.35.0
RUN rm -rf /opt/comfyui-baked && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui-baked && \
    cd /opt/comfyui-baked && \
    git checkout 40c4fcdf513a4523e39d54a9d391908af8df8171

# MiniMax H3 Latent Upscaler
RUN git clone https://github.com/LBH-123-AI/Comfyui_Minimax_h3_latent_Upscaler.git \
    /opt/comfyui-baked/custom_nodes/Comfyui_Minimax_h3_latent_Upscaler && \
    cd /opt/comfyui-baked/custom_nodes/Comfyui_Minimax_h3_latent_Upscaler && \
    git checkout d7c01b9011f2e8439493f6c02c29995a27df276f

EXPOSE 8188 8888 8080 22
