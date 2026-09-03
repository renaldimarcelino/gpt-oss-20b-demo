# 🚀 DEPLOYMENT GUIDE - GPT-OSS 20B Demo

Panduan lengkap untuk deploy Space ke Hugging Face Spaces.

## 📋 Prerequisites

- GitHub account dengan repo ini
- Hugging Face account (gratis di [huggingface.co](https://huggingface.co))
- Docker installed (opsional, untuk testing lokal)

---

## 🎯 Step-by-Step Deployment ke Hugging Face Spaces

### Step 1: Siapkan Repository GitHub

Repository sudah siap di:
```
https://github.com/renaldimarcelino/gpt-oss-20b-demo
```

✅ Semua file sudah ada (app.py, requirements.txt, Dockerfile, etc)

### Step 2: Login ke Hugging Face

1. Buka [huggingface.co](https://huggingface.co)
2. Click **Sign Up** atau **Sign In** (jika sudah punya akun)
3. Lengkapi profil Anda

### Step 3: Buat Space Baru

1. Buka [https://huggingface.co/new-space](https://huggingface.co/new-space)
2. Isi form:
   - **Space name:** `gpt-oss-20b-demo`
   - **Select the Space SDK:** **Docker**
   - **Space visibility:** Public (agar semua orang bisa akses)
   - **License:** OpenRAIL

3. Click **Create Space**

### Step 4: Connect ke GitHub Repository

Setelah Space dibuat:

1. Buka Space settings (gear icon ⚙️)
2. Scroll ke **Linked Repository**
3. Click **Link a Repository**
4. Authorize GitHub jika diminta
5. Pilih:
   - **Repository:** `renaldimarcelino/gpt-oss-20b-demo`
   - **Branch:** `main`

6. Click **Link Repository**

### Step 5: Tunggu Deployment

- Space akan mulai build otomatis
- Buka tab **Logs** untuk melihat progress
- Proses memakan waktu 5-15 menit tergantung server

```
Expected output:
✓ Cloning repository
✓ Installing dependencies
✓ Building Docker image
✓ Starting container
✓ Space running!
```

### Step 6: Akses Space

Setelah selesai, akses Space di:
```
https://huggingface.co/spaces/username/gpt-oss-20b-demo
```

---

## 🐳 Alternative: Deploy dengan Docker Lokal (Testing)

### Prasyarat
- Docker & Docker Compose installed
- Ollama running

### Deploy Lokal

```bash
# 1. Clone repo
git clone https://github.com/renaldimarcelino/gpt-oss-20b-demo
cd gpt-oss-20b-demo

# 2. Build & run dengan docker-compose
docker-compose up -d

# 3. Cek logs
docker-compose logs -f app

# 4. Akses
# http://localhost:7860

# 5. Stop
docker-compose down
```

---

## ⚙️ Configuration di Hugging Face Spaces

### Set Environment Variables

1. Buka Space settings
2. Scroll ke **Repository secrets**
3. Add secrets:

```
OLLAMA_HOST: http://ollama:11434
OLLAMA_MODEL: unsloth/gpt-oss-20b-GGUF:Q4_K_M
TEMPERATURE: 0.7
TOP_P: 0.9
MAX_TOKENS: 2048
```

### Persistent Storage (Optional)

Jika ingin menyimpan data:
1. Settings → Persistent Storage
2. Set disk space (5GB+ recommended)

---

## 📊 Monitoring & Troubleshooting

### Cek Status Space

1. Buka Space Anda
2. Klik **⚙️ Settings**
3. Scroll ke **Health Status**

### Common Issues

#### ❌ "Connection refused to Ollama"
**Masalah:** Space tidak bisa terhubung ke Ollama backend
**Solusi:** 
- Ollama server harus berjalan di mesin yang sama
- Gunakan Docker Compose untuk link services

#### ❌ "Out of memory"
**Masalah:** GPU/CPU kehabisan memory
**Solusi:**
- Upgrade Space compute (Settings → Hardware)
- Gunakan model yang lebih kecil

#### ❌ "Model not found"
**Masalah:** Model Ollama belum didownload
**Solusi:**
- Download dulu lokal: `ollama pull unsloth/gpt-oss-20b-GGUF:Q4_K_M`
- Atau cache di persistent storage

### View Logs

1. Buka Space
2. Klik **🔍 Logs** di sidebar
3. Filter by:
   - Date
   - Log level
   - Search term

---

## 🔐 Security Considerations

### Public Sharing
```python
# app.py - untuk production
GRADIO_SHARE = False  # Jangan expose token
```

### Rate Limiting (Optional)
```python
from gradio.processing_utils import gradio_request
from functools import wraps
import time

def rate_limit(max_per_minute=10):
    def decorator(func):
        calls = []
        @wraps(func)
        def wrapper(*args, **kwargs):
            now = time.time()
            calls[:] = [c for c in calls if c > now - 60]
            if len(calls) >= max_per_minute:
                raise gr.Error("Rate limit exceeded")
            calls.append(now)
            return func(*args, **kwargs)
        return wrapper
    return decorator
```

### Authentication (Advanced)
```python
import os
from functools import wraps

def require_auth(func):
    def wrapper(*args, **kwargs):
        # Implement custom auth logic
        api_key = os.getenv("API_KEY")
        if not api_key:
            raise gr.Error("Unauthorized")
        return func(*args, **kwargs)
    return wrapper
```

---

## 📈 Performance Optimization

### Untuk Hugging Face Spaces

1. **Use Streaming:**
   ```python
   response = requests.post(url, stream=True)
   for chunk in response.iter_lines():
       yield chunk  # Stream response ke UI
   ```

2. **Cache Models:**
   ```python
   # Cache di persistent storage
   /tmp/ollama_models/
   ```

3. **Optimize Gradio:**
   ```python
   # Lazy load komponen
   with gr.Tab("Advanced"):
       # Komponen yang jarang digunakan
   ```

---

## 🌐 Custom Domain (Pro Feature)

Untuk Space berbayar, bisa custom domain:

1. Settings → Custom Domain
2. Set CNAME record di domain provider
3. Verify ownership

---

## 📊 Usage Monitoring

Hugging Face menyediakan analytics:
- Views per hari
- Unique visitors
- Session duration
- Geographic distribution

Lihat di: **Space Settings → Space usage**

---

## 🆘 Support & Resources

### Documentation
- [Hugging Face Spaces Docs](https://huggingface.co/docs/hub/spaces)
- [Hugging Face Spaces API](https://huggingface.co/docs/hub/spaces-overview)
- [Ollama Documentation](https://github.com/ollama/ollama)
- [Gradio Guides](https://gradio.app/guides/)

### Community
- [Hugging Face Discussions](https://huggingface.co/spaces)
- [Ollama GitHub Issues](https://github.com/ollama/ollama/issues)
- [Gradio GitHub](https://github.com/gradio-app/gradio)

### Get Help
- Report bugs di GitHub Issues
- Ask di Hugging Face Discussions
- Email support@huggingface.co

---

## ✅ Deployment Checklist

```
□ Repository siap di GitHub
□ Semua file ada (app.py, requirements.txt, Dockerfile)
□ README.md lengkap
□ .env.example sudah dibuat
□ Requirements.txt updated
□ Dockerfile tested locally
□ Hugging Face account ready
□ GitHub token generated (untuk linking)
□ Space created & linked
□ Deployment berhasil
□ Space accessible via URL
□ Tested basic functionality
□ Documentation updated
□ Ready for production!
```

---

**Status:** ✅ Ready to Deploy  
**Last Updated:** September 2024  
**Maintained by:** renaldimarcelino
