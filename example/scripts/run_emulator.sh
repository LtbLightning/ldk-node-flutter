#!/bin/bash

# Script to run Flutter emulator with different node configurations
# Usage: ./run_emulator.sh [alice|bob|carol] [port]

NODE_NAME=${1:-alice}
PORT=${2:-9735}

echo "Starting emulator with node: $NODE_NAME on port: $PORT"

# Set environment variables for the emulator
export NODE_NAME=$NODE_NAME
export NODE_PORT=$PORT

# Run Flutter with the specified configuration
flutter run --dart-define=NODE_NAME=$NODE_NAME --dart-define=NODE_PORT=$PORT 