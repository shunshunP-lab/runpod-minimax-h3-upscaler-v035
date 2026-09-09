FROM runpod/comfyui:cuda12.8

USER root

# ComfyUI v0.35.0 を固定
RUN rm -rf /opt/comfyui-baked && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui-baked && \
    cd /opt/comfyui-baked && \
    git checkout 40c4fcdf513a4523e39d54a9d391908af8df8171

# Custom Nodes を固定
RUN cd /opt/comfyui-baked/custom_nodes && \
    rm -rf Civicomfy ComfyUI-KJNodes ComfyUI-Manager ComfyUI-RunpodDirect && \
    git clone https://github.com/MoonGoblinDev/Civicomfy.git Civicomfy && \
    cd Civicomfy && git checkout 3e83e70824e26672c32615142217bb0006c8e562 && \
    cd .. && \
    git clone https://github.com/kijai/ComfyUI-KJNodes.git ComfyUI-KJNodes && \
    cd ComfyUI-KJNodes && git checkout e0c3fcb388464ffba5ef775bd29e2f793c032ca9 && \
    cd .. && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git ComfyUI-Manager && \
    cd ComfyUI-Manager && git checkout 8d5a95d1864de3660fcff872c893f6fb6b96ef9c && \
    cd .. && \
    git clone https://github.com/MadiatorLabs/ComfyUI-RunpodDirect.git ComfyUI-RunpodDirect && \
    cd ComfyUI-RunpodDirect && git checkout a59de479cbf06064d3a67f1457f48dbbd7f42e0a

# MiniMax H3 Latent Upscaler
RUN cd /opt/comfyui-baked/custom_nodes && \
    git clone https://github.com/LBH-123-AI/Comfyui_Minimax_h3_latent_Upscaler.git Comfyui_Minimax_h3_latent_Upscaler && \
    cd Comfyui_Minimax_h3_latent_Upscaler && \
    git checkout d7c01b9011f2e8439493f6c02c29995a27df276f

# ComfyUIをv0.35.0として認識させる
RUN cd /opt/comfyui-baked && \
    git init && \
    git add -A && \
    git -c user.name=runpod -c user.email=runpod@local commit -m "ComfyUI v0.35.0"

EXPOSE 8188 8888 8080 22
