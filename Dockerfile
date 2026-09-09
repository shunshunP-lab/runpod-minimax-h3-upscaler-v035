FROM runpod/comfyui:cuda12.8

USER root

# ComfyUI v0.35.0
RUN rm -rf /opt/comfyui-baked && \
    mkdir -p /opt/comfyui-baked && \
    curl -fSL https://github.com/comfyanonymous/ComfyUI/archive/40c4fcdf513a4523e39d54a9d391908af8df8171.tar.gz \
    | tar xz --strip-components=1 -C /opt/comfyui-baked

# Custom Nodes
RUN mkdir -p /opt/comfyui-baked/custom_nodes/Civicomfy && \
    curl -fSL https://github.com/MoonGoblinDev/Civicomfy/archive/3e83e70824e26672c32615142217bb0006c8e562.tar.gz \
    | tar xz --strip-components=1 -C /opt/comfyui-baked/custom_nodes/Civicomfy

RUN mkdir -p /opt/comfyui-baked/custom_nodes/ComfyUI-KJNodes && \
    curl -fSL https://github.com/kijai/ComfyUI-KJNodes/archive/e0c3fcb388464ffba5ef775bd29e2f793c032ca9.tar.gz \
    | tar xz --strip-components=1 -C /opt/comfyui-baked/custom_nodes/ComfyUI-KJNodes

RUN mkdir -p /opt/comfyui-baked/custom_nodes/ComfyUI-Manager && \
    curl -fSL https://github.com/ltdrdata/ComfyUI-Manager/archive/8d5a95d1864de3660fcff872c893f6fb6b96ef9c.tar.gz \
    | tar xz --strip-components=1 -C /opt/comfyui-baked/custom_nodes/ComfyUI-Manager

RUN mkdir -p /opt/comfyui-baked/custom_nodes/ComfyUI-RunpodDirect && \
    curl -fSL https://github.com/MadiatorLabs/ComfyUI-RunpodDirect/archive/a59de479cbf06064d3a67f1457f48dbbd7f42e0a.tar.gz \
    | tar xz --strip-components=1 -C /opt/comfyui-baked/custom_nodes/ComfyUI-RunpodDirect

# MiniMax H3 Latent Upscaler
RUN mkdir -p /opt/comfyui-baked/custom_nodes/Comfyui_Minimax_h3_latent_Upscaler && \
    curl -fSL https://github.com/LBH-123-AI/Comfyui_Minimax_h3_latent_Upscaler/archive/d7c01b9011f2e8439493f6c02c29995a27df276f.tar.gz \
    | tar xz --strip-components=1 -C /opt/comfyui-baked/custom_nodes/Comfyui_Minimax_h3_latent_Upscaler

EXPOSE 8188 8888 8080 22
