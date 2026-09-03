# Configuration file untuk GPT-OSS 20B Demo

import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# ===== OLLAMA CONFIGURATION =====
OLLAMA_HOST = os.getenv("OLLAMA_HOST", "http://localhost:11434")
OLLAMA_MODEL = os.getenv("OLLAMA_MODEL", "unsloth/gpt-oss-20b-GGUF:Q4_K_M")

# ===== APPLICATION CONFIGURATION =====
GRADIO_SHARE = os.getenv("GRADIO_SHARE", "false").lower() == "true"
GRADIO_PORT = int(os.getenv("GRADIO_PORT", 7860))
GRADIO_SERVER_NAME = os.getenv("GRADIO_SERVER_NAME", "0.0.0.0")

# ===== MODEL PARAMETERS =====
TEMPERATURE = float(os.getenv("TEMPERATURE", 0.7))
TOP_P = float(os.getenv("TOP_P", 0.9))
MAX_TOKENS = int(os.getenv("MAX_TOKENS", 2048))

# ===== DEBUG =====
DEBUG = os.getenv("DEBUG", "false").lower() == "true"
LOG_LEVEL = os.getenv("LOG_LEVEL", "INFO")

# ===== CONSTANTS =====
APP_TITLE = "🚀 GPT-OSS 20B Demo dengan Ollama"
APP_DESCRIPTION = """
Demo interaktif untuk GPT-OSS 20B menggunakan backend Ollama.
Berinteraksi dengan model language terbuka terbesar dalam Bahasa Indonesia.
"""

# Example prompts for demonstration
EXAMPLE_PROMPTS = [
    ("Jelaskan apa itu machine learning dengan bahasa yang sederhana", 0.7, 0.9),
    ("Buat kode Python untuk menghitung faktorial dengan rekursi", 0.5, 0.8),
    ("Tulis puisi pendek tentang petualangan di bulan", 0.9, 0.95),
    ("Apa perbedaan antara AI, Machine Learning, dan Deep Learning?", 0.6, 0.85),
]

# Model limits
MIN_TEMPERATURE = 0.0
MAX_TEMPERATURE = 1.0
MIN_TOP_P = 0.0
MAX_TOP_P = 1.0
MIN_TOKENS = 100
MAX_TOKENS_LIMIT = 4096
