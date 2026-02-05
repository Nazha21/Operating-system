#!/bin/bash
# Creates server.log if missing, then counts lines containing "Error"

LOG="server.log"

if [ ! -f "$LOG" ]; then
  cat > "$LOG" << 'EOF'
Info: Service started
Error: Failed login attempt
Warning: Disk nearing capacity
Error: Database connection failed
Info: Request completed
Error: Timeout occurred
EOF
fi

COUNT=$(grep -c "Error" "$LOG")
echo "Lines containing 'Error': $COUNT"
