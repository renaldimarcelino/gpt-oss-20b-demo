# 🚀 GPT-OSS 20B Demo dengan Ollama

Demo interaktif untuk **GPT-OSS 20B** menggunakan backend Ollama di Hugging Face Spaces.

## 📋 Daftar Isi

- [Fitur](#fitur)
- [Persiapan](#persiapan)
- [Cara Menggunakan](#cara-menggunakan)
- [Konfigurasi](#konfigurasi)
- [Lisensi](#lisensi)

## ✨ Fitur

- 🤖 **Model GPT-OSS 20B** - Model open-source berukuran 20 miliar parameter
- 💬 **Chat Interface** - Antarmuka percakapan yang user-friendly dengan Gradio
- 🔧 **Ollama Backend** - Inferensi cepat dengan dukungan GPU
- 📊 **Token Counter** - Menampilkan jumlah token input/output
- ⚡ **Streaming Response** - Respons real-time saat model sedang berpikir
- 🎨 **Dark Mode** - UI yang nyaman untuk penggunaan jangka panjang

## 🛠️ Persiapan

### Prasyarat

- Python 3.10+
- Ollama terpasang ([Download di sini](https://ollama.ai))
- GPU (NVIDIA/AMD) untuk performa optimal (optional tapi disarankan)

### Instalasi Lokal

1. **Clone repository:**
   ```bash
   git clone https://github.com/renaldimarcelino/gpt-oss-20b-demo
   cd gpt-oss-20b-demo
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Download model Ollama:**
   ```bash
   ollama pull unsloth/gpt-oss-20b-GGUF:Q4_K_M
   ```

4. **Jalankan aplikasi:**
   ```bash
   python app.py
   ```

5. **Buka browser ke:**
   ```
   http://localhost:7860
   ```

## 📖 Cara Menggunakan

### Interface Gradio

1. Ketik pertanyaan atau perintah di text box
2. Tekan **Submit** atau Enter
3. Model akan memproses dan menampilkan respons secara real-time
4. Token count ditampilkan di bawah setiap respons

### Contoh Prompt

**Summarization (Ringkasan):**
```
Ringkaskan artikel berikut dalam 3 kalimat:
[Tempel artikel di sini]
```

**Creative Writing (Menulis Kreatif):**
```
Tulis cerita pendek tentang petualangan di luar angkasa, maksimal 200 kata.
```

**Code Generation (Generasi Kode):**
```
Buat fungsi Python untuk menghitung fibonacci dengan memoization.
```

**Q&A:**
```
Apa itu machine learning? Jelaskan secara sederhana.
```

## ⚙️ Konfigurasi

### Environment Variables

Buat file `.env` atau set di environment Anda:

```env
# Ollama Configuration
OLLAMA_HOST=http://localhost:11434
OLLAMA_MODEL=unsloth/gpt-oss-20b-GGUF:Q4_K_M

# App Configuration
GRADIO_SHARE=false
MAX_TOKENS=2048
TEMPERATURE=0.7
TOP_P=0.9
```

### Parameter Model

Edit di `app.py`:

```python
TEMPERATURE = 0.7      # Kreativitas (0-1, lebih rendah = lebih fokus)
TOP_P = 0.9            # Diversity sampling
MAX_TOKENS = 2048      # Panjang maksimal respons
```

## 📁 Struktur Project

```
gpt-oss-20b-demo/
├── app.py              # Aplikasi Gradio utama
├── requirements.txt    # Dependencies Python
├── agents.md          # Dokumentasi agents
├── README.md          # File ini
├── .env.example       # Template environment variables
└── config.py          # Konfigurasi aplikasi
```

## 🚀 Deploy ke Hugging Face Spaces

1. Buat Space baru di [huggingface.co/new-space](https://huggingface.co/new-space)
2. Pilih **Gradio** sebagai SDK
3. Connect ke repository ini
4. Space akan auto-deploy!

## 📊 Performa

- **Model:** GPT-OSS 20B (Quantized Q4_K_M)
- **Ukuran Model:** ~12GB
- **VRAM Minimum:** 8GB (dengan quantization)
- **Kecepatan Inference:** ~5-15 token/detik (tergantung GPU)

## 🔗 Resources

- [Ollama Documentation](https://github.com/ollama/ollama)
- [Gradio Guide](https://gradio.app)
- [Hugging Face Model Card](https://huggingface.co/unsloth/gpt-oss-20b-GGUF)
- [GPT-OSS Repository](https://github.com/xzyao/gpt-oss)

## ⚖️ Lisensi

Project ini menggunakan lisensi **MIT License**. Model GPT-OSS 20B memiliki lisensinya sendiri.

## 📧 Support

Jika ada pertanyaan atau issues, silakan buat GitHub Issue di repository ini.

---

**Dibuat dengan ❤️ menggunakan Ollama & Gradio**
