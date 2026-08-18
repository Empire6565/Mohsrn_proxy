#!/bin/bash

# دانلود هسته اصلی برای اجرای پروکسی
curl -L -H "Cache-Control: no-cache" -o xray https://github.com
unzip xray.zip
chmod +x xray

# ساخت فایل تنظیمات پروکسی بر روی پورت 7860 (پورت مخصوص پلتفرم‌های رایگان)
cat <<EOF > config.json
{
    "inbounds": [{
        "port": 7860,
        "protocol": "vless",
        "settings": {
            "clients": [{"id": "88888888-4444-4444-4444-121212121212"}],
            "decryption": "none"
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {"path": "/vless-ws"}
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

# روشن کردن پروکسی
./xray -config config.json
