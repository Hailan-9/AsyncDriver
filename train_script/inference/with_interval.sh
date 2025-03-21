# 这行代码设置了一个环境变量 CUDA_VISIBLE_DEVICES，其值来自脚本的第一个参数（$1）
CUDA_VISIBLE_DEVICES=$1 python train_script/inference/simulator_llama4drive.py \
--planner path/to/ckpt \
--base_model path/to/llama-2-13b-chat-hf \
--planner_type llama4drive_lora_ins_wo_stop \
--save_dir asyncdriver_inter_$3 \
--ins_wo_stop \
--short_ins 30 \
--lora_r 8 \
--type $2 \
--llm_inf_step $3 \
--simulation_root_path path/to/simulation_save_root_path \