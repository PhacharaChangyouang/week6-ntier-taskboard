#!/bin/bash
echo "═══════════════════════════════════════════════════════"
echo "  🚀 Starting N-Tier Task Board Services"
echo "═══════════════════════════════════════════════════════"

# 1️⃣ PostgreSQL
echo "1. Starting PostgreSQL..."
sudo systemctl start postgresql
sudo systemctl status postgresql --no-pager | grep "Active:"

# 2️⃣ Nginx
echo -e "\n2. Starting Nginx..."
sudo systemctl start nginx
sudo systemctl status nginx --no-pager | grep "Active:"

# 3️⃣ Node.js Backend
echo -e "\n3. Starting Node.js Backend..."
APP_NAME="taskboard-api"
SCRIPT_PATH="../server.js"  # ปรับ path ให้ตรงกับ server.js ของคุณ

# เช็คว่า PM2 มี process อยู่แล้วหรือไม่
if pm2 list | grep -q "$APP_NAME"; then
    echo "[INFO] $APP_NAME already running. Restarting..."
    pm2 restart "$APP_NAME"
else
    echo "[INFO] Starting $APP_NAME..."
    pm2 start "$SCRIPT_PATH" --name "$APP_NAME" --watch
fi

# แสดง status สุดท้าย
pm2 list

echo -e "\n═══════════════════════════════════════════════════════"
echo "  ✅ All services started!"
echo "═══════════════════════════════════════════════════════"

echo -e "\n  📍 Access URLs:"
echo "     - HTTPS: https://taskboard.local"
echo "     - API:   https://taskboard.local/api/health"
echo "     - Direct: http://localhost:3000/api/health"

echo -e "\n  📊 Monitoring:"
echo "     - pm2 logs"
echo "     - sudo tail -f /var/log/nginx/taskboard_access.log"
