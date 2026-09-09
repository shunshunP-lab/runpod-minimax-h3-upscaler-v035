FROM runpod/comfyui:cuda12.8

USER root

# ComfyUI v0.35.0
RUN rm -rf /opt/comfyui-baked && \
    mkdir -p /opt/comfyui-baked && \
    curl -fSL https://github.com/comfyanonymous/ComfyUI/archive/40c4fcdf513a4523e39d54a9d391908af8df8171.tar.gz \
    | tar xz --strip-components=1 -C /opt/comfyui-baked

# Custom Nodes
WORKDIR /opt/comfyui-baked/custom_nodes

RUN curl -fSL https://github.com/ltdrdata/ComfyUI-Manager/archive/8d5a95d1864de3660fcff872c893f6fb6b96ef9c.tar.gz \
    | tar xz --strip-components=1 -C /tmp && \
    mv /tmp/ComfyUI-Manager-8d5a95d1864de3660fcff872c893f6fb6b96ef9c ComfyUI-Manager

RUN curl -fSL https://github.com/kijai/ComfyUI-KJNodes/archive/e0c3fcb388464ffba5ef775bd29e2f793c032ca9.tar.gz \
    | tar xz --strip-components=1 -C /tmp && \
    mv /tmp/ComfyUI-KJNodes-e0c3fcb388464ffba5ef775bd29e2f793c032ca9 ComfyUI-KJNodes

RUN curl -fSL https://github.com/MoonGoblinDev/Civicomfy/archive/3e83e70824e26672c32615142217bb0006c8e562.tar.gz \
    | tar xz --strip-components=1 -C /tmp && \
    mv /tmp/Civicomfy-3e83e70824e26672c32615142217bb0006c8e562 Civicomfy

RUN curl -fSL https://github.com/MadiatorLabs/ComfyUI-RunpodDirect/archive/a59de479cbf06064d3a67f1457f48dbbd7f42e0a.tar.gz \
    | tar xz --strip-components=1 -C /tmp && \
    mv /tmp/ComfyUI-RunpodDirect-a59de479cbf06064d3a67f1457f48dbbd7f42e0a ComfyUI-RunpodDirect

# MiniMax H3 Latent Upscaler
RUN curl -fSL https://github.com/LBH-123-AI/Comfyui_Minimax_h3_latent_Upscaler/archive/d7c01b9011f2e8439493f6c02c29995a27df276f.tar.gz \
    | tar xz --strip-components=1 -C /tmp && \
    mv /tmp/Comfyui_Minimax_h3_latent_Upscaler-d7c01b9011f2e8439493f6c02c29995a27df276f Comfyui_Minimax_h3_latent_Upscaler

# Version information
RUN cd /opt/comfyui-baked && \
    git init && \
    git add -A && \
    git -c user.name=runpod -c user.email=runpod@local commit -m "ComfyUI v0.35.0"

EXPOSE 8188 8888 8080 22
