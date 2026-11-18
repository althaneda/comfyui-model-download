pip install -U huggingface_hub

hf download Comfy-Org/MiniMax-H3 \
  diffusion_models/minimax_h3_fl2va_pruned_int8_convrot.safetensors \
  --local-dir /workspace/ComfyUI/models

hf download Comfy-Org/MiniMax-H3 \
text_encoders/qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors \
--local-dir /workspace/ComfyUI/models

hf download Comfy-Org/MiniMax-H3 \
  vae/minimax_h3_video_vae_int8_convrot.safetensors \
  --local-dir /workspace/ComfyUI/models

hf download Comfy-Org/MiniMax-H3 \
vae/minimax_h3_audio_vae_fp32.safetensors \
--local-dir /workspace/ComfyUI/models

hf download lightx2v/Minimax-h3-Turbo \
minimax_h3_fl2v_turbo_8step_v1.0_comfyui_bf16.safetensors \
--local-dir /workspace/ComfyUI/models/loras
