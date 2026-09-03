#!/bin/bash

# setup.sh - Complete automated setup for GPT-OSS 20B Demo
# This script will:
# 1. Create virtual environment
# 2. Install dependencies
# 3. Download model via Ollama
# 4. Configure environment
# 5. Create necessary directories

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║   🚀 GPT-OSS 20B Demo - Complete Setup (100% Gratis)       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running on macOS, Linux, or Windows (WSL)
OS="$(uname -s)"
case "${OS}" in
    Linux*)     OS_TYPE="Linux";;
    Darwin*)    OS_TYPE="Mac";;
    MINGW*)     OS_TYPE="Windows";;
    *)          OS_TYPE="UNKNOWN";;
esac

echo -e "${BLUE}ℹ️ Detected OS: ${OS_TYPE}${NC}"
echo ""

# 1. Check Python version
echo -e "${BLUE}[1/6] Checking Python version...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${YELLOW}❌ Python 3 not found!${NC}"
    echo "Please install Python 3.10+ from https://www.python.org"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
echo -e "${GREEN}✓ Python ${PYTHON_VERSION} found${NC}"
echo ""

# 2. Create virtual environment
echo -e "${BLUE}[2/6] Creating virtual environment...${NC}"
if [ -d "venv" ]; then
    echo -e "${YELLOW}⚠️ Virtual environment already exists${NC}"
    read -p "Recreate? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf venv
        python3 -m venv venv
    fi
else
    python3 -m venv venv
fi
echo -e "${GREEN}✓ Virtual environment ready${NC}"
echo ""

# 3. Activate virtual environment
echo -e "${BLUE}[3/6] Activating virtual environment...${NC}"
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
    echo -e "${GREEN}✓ Virtual environment activated${NC}"
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
    echo -e "${GREEN}✓ Virtual environment activated (Windows)${NC}"
else
    echo -e "${YELLOW}❌ Could not find activation script${NC}"
    exit 1
fi
echo ""

# 4. Install dependencies
echo -e "${BLUE}[4/6] Installing Python dependencies...${NC}"
pip install --upgrade pip setuptools wheel > /dev/null 2>&1
pip install -r requirements.txt
echo -e "${GREEN}✓ Dependencies installed${NC}"
echo ""

# 5. Create .env file
echo -e "${BLUE}[5/6] Setting up environment configuration...${NC}"
if [ ! -f .env ]; then
    cp .env.example .env
    echo -e "${GREEN}✓ Created .env file from .env.example${NC}"
    echo -e "${YELLOW}⚠️ Edit .env file to customize settings if needed${NC}"
else
    echo -e "${YELLOW}⚠️ .env file already exists${NC}"
fi
echo ""

# 6. Check Ollama installation
echo -e "${BLUE}[6/6] Checking Ollama installation...${NC}"
if ! command -v ollama &> /dev/null; then
    echo -e "${YELLOW}⚠️ Ollama not installed!${NC}"
    echo ""
    echo "Download Ollama from: https://ollama.ai"
    echo ""
    echo "After installing Ollama, run:"
    echo -e "${BLUE}  ollama pull unsloth/gpt-oss-20b-GGUF:Q4_K_M${NC}"
    echo ""
else
    OLLAMA_VERSION=$(ollama --version)
    echo -e "${GREEN}✓ Ollama ${OLLAMA_VERSION} installed${NC}"
    
    # Try to download model
    echo ""
    read -p "Download GPT-OSS 20B model now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}Downloading model (this may take 30-60 minutes)...${NC}"
        ollama pull unsloth/gpt-oss-20b-GGUF:Q4_K_M
        echo -e "${GREEN}✓ Model downloaded successfully${NC}"
    fi
fi

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                    ✅ Setup Complete!                       ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}🎯 Next Steps:${NC}"
echo ""
echo "1️⃣  Start Ollama Server (in a new terminal):"
echo -e "   ${BLUE}ollama serve${NC}"
echo ""
echo "2️⃣  Ensure virtual environment is activated:"
echo -e "   ${BLUE}source venv/bin/activate${NC}"
echo ""
echo "3️⃣  Run the application:"
echo -e "   ${BLUE}python app.py${NC}"
echo ""
echo "4️⃣  Open in browser:"
echo -e "   ${BLUE}http://localhost:7860${NC}"
echo ""
echo -e "${YELLOW}💡 Tips:${NC}"
echo "   • Keep Ollama server running in background"
echo "   • Model requires 8GB+ VRAM minimum"
echo "   • First inference takes 30-60 seconds"
echo "   • Check DEPLOYMENT_GUIDE.md for advanced options"
echo ""
