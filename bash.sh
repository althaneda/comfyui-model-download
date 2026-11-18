```bash
#!/usr/bin/env bash

# MiniMax-H3 Model Downloader
# Repository: ComfyUI MiniMax-H3 Setup
# Downloads five required models sequentially.

set -euo pipefail

MODEL_DIR="/workspace/ComfyUI/models"

# Check Hugging Face CLI
if ! command -v hf >/dev/null 2>&1; then
    echo "Error: Hugging Face CLI (hf) is not installed."
    echo "Install it with: pip install -U huggingface_hub"
    exit 1
fi

download_model() {
    local name="$1"
    shift

    echo ""
    echo "=========================================="
    echo "Downloading: ${name}"
    echo "=========================================="

    hf download "$@"

    echo "Successfully downloaded: ${name}"
}

# Model 1 — Main diffusion model
download_model "Main Diffusion Model" \
    Comfy-Org/MiniMax-H3 \
    diffusion_models/minimax_h3_fl2va_pruned_int8_convrot.safetensors \
    --local-dir "$MODEL_DIR"

# Model 2 — Qwen3-VL text encoder
download_model "Qwen3-VL Text Encoder" \
    Comfy-Org/MiniMax-H3 \
    text_encoders/qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors \
    --local-dir "$MODEL_DIR"

# Model 3 — Video VAE
download_model "Video VAE" \
    Comfy-Org/MiniMax-H3 \
    vae/minimax_h3_video_vae_int8_convrot.safetensors \
    --local-dir "$MODEL_DIR"

# Model 4 — Audio VAE
download_model "Audio VAE" \
    Comfy-Org/MiniMax-H3 \
    vae/minimax_h3_audio_vae_fp32.safetensors \
    --local-dir "$MODEL_DIR"

# Model 5 — Turbo LoRA
download_model "Turbo LoRA" \
    lightx2v/Minimax-h3-Turbo \
    minimax_h3_fl2v_turbo_8step_v1.0_comfyui_bf16.safetensors \
    --local-dir "$MODEL_DIR/loras"

echo ""
echo "=========================================="
echo "All five models downloaded successfully!"
echo "=========================================="
```
