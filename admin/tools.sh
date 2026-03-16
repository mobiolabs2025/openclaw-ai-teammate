#!/bin/bash
# AI Teammate - Tool Definitions 조회
# OpenClaw에서 사용 가능한 도구 목록을 조회합니다.

source "$(dirname "$0")/common.sh"

api_call "/openclaw/tools"
