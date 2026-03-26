1. Build Image OpenClaw:

   `docker build -t openclaw .`

   (Lưu ý: Có dấu chấm ở cuối lệnh)

2. Khởi động Gateway:

   `openclaw gateway`

3. Chỉnh sửa cấu hình (Sử dụng Nano):

   `nano /root/.openclaw/openclaw.json`

   (Sửa loopback thành lan và thêm đoạn controlUi bên dưới)

   ```
   "controlUi": {
    "enabled": true,
    "allowedOrigins": ["http://localhost:18789"]
   },
   ```

4. Xác thực kết nối Telegram:

   `openclaw pairing approve telegram [PAIRING_CODE_CỦA_BẠN]`
