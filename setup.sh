#!/bin/bash

# Setup script untuk persiapan lokal development

echo "🚀 Memulai setup GPT-OSS 20B Demo..."

# Check Python version
echo "✓ Checking Python version..."
python --version

# Create virtual environment
echo "✓ Creating virtual environment..."
python -m venv venv

# Activate virtual environment
echo "✓ Activating virtual environment..."
source venv/bin/activate || . venv/Scripts/activate

# Install dependencies
echo "✓ Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Create .env file
if [ ! -f .env ]; then
    echo "✓ Creating .env file from .env.example..."
    cp .env.example .env
else
    echo "⚠ .env file already exists, skipping..."
fi

# Download model
echo ""
echo "📥 Downloading GPT-OSS 20B model..."
echo "Note: This may take 10-30 minutes depending on your internet speed"
ollama pull unsloth/gpt-oss-20b-GGUF:Q4_K_M

echo ""
echo "✅ Setup complete!"
echo ""
echo "🎯 Next steps:"
echo "  1. Start Ollama server in a new terminal:"
echo "     ollama serve"
echo ""
echo "  2. Run the application:"
echo "     python app.py"
echo ""
echo "  3. Open browser to:"
echo "     http://localhost:7860"
