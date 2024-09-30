CUDA_VISIBLE_DEVICES=$1 python train_script/inference/simulator_llama4drive.py \
--planner path/to/ckpt \
--base_model path/to/llama-2-13b-chat-hf \
--planner_type llama4drive_lora_ins_wo_stop \
--save_dir asyncdriver_exp \
--ins_wo_stop \
--short_ins 30 \
--lora_r 8 \
--type $2 \
--simulation_root_path path/to/simulation_save_root_path \