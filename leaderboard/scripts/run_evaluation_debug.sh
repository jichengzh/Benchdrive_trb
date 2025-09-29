#!/bin/bash
BASE_PORT=21000
BASE_TM_PORT=24000
IS_BENCH2DRIVE=True
BASE_ROUTES=leaderboard/data/bench2drive220
TEAM_AGENT=/home/ziyuan/Bench2Drive/leaderboard/team_code/vad_b2d_agent_trt.py  # for UniAD and VAD
# TEAM_AGENT=/data1/jcz/Bench2Drive/leaderboard/team_code/uniad_onnx_b2d_agent.py
# TEAM_CONFIG=your_team_agent_ckpt.pth   # for TCP and ADMLP
TEAM_CONFIG=/home/ziyuan/Bench2Drive/Bench2DriveZoo/adzoo/vad/configs/VAD/VAD_tiny_e2e_b2d.py+/home/ziyuan/DL4AGX/AV-Solutions/vad-trt/VAD/ckpts/VAD_tiny.pth # for UniAD and VAD
# TEAM_CONFIG=/home/ziyuan/Bench2Drive/Bench2DriveZoo/adzoo/vad/configs/VAD/VAD_base_e2e_b2d.py+/home/ziyuan/Bench2Drive/Bench2DriveZoo/ckpts/vad_b2d_base.pth 
BASE_CHECKPOINT_ENDPOINT=eval
SAVE_PATH=./eval_v1/
PLANNER_TYPE=only_traj

GPU_RANK=2
PORT=$BASE_PORT
TM_PORT=$BASE_TM_PORT
ROUTES="${BASE_ROUTES}.xml"
CHECKPOINT_ENDPOINT="${BASE_CHECKPOINT_ENDPOINT}.json"
bash leaderboard/scripts/run_evaluation.sh $PORT $TM_PORT $IS_BENCH2DRIVE $ROUTES $TEAM_AGENT $TEAM_CONFIG $CHECKPOINT_ENDPOINT $SAVE_PATH $PLANNER_TYPE $GPU_RANK
