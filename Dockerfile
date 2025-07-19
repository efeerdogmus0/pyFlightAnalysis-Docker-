# Python 3.9'u temel imaj olarak kullan
FROM python:3.9-slim

# PyQt5 ve arayüz için gerekli sistem bağımlılıklarını kur
# Gerekli sistem bağımlılıklarını kur
# Gerekli sistem bağımlılıklarını kur
# Gerekli sistem bağımlılıklarını kur
# Gerekli sistem bağımlılıklarını kur
RUN apt-get update && apt-get install -y --no-install-recommends \
    qtbase5-dev \
    libqt5opengl5 \
    libqt5opengl5-dev \
    libgl1-mesa-glx \
    libegl1-mesa \
    libxkbcommon-x11-0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxcb-xinput0 \
    build-essential \
    freeglut3-dev \
    && \
    rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarla
WORKDIR /app

# requirements.txt dosyasını kopyala ve bağımlılıkları yükle
COPY requirements.txt ./

# Bağımlılıkları yükle
RUN pip install --no-cache-dir -r requirements.txt

# Proje dosyalarını kopyala
COPY . .

# Uygulamayı çalıştıracak komut
CMD ["python", "src/analysis.py"]
