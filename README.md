# pyFlightAnalysis - Docker Edition

This project is a Dockerized version of the original [pyFlightAnalysis](https://github.com/Marxlp/pyFlightAnalysis) tool, which is a PX4 flight log (ulog) visual analysis tool inspired by FlightPlot.

![pyFlightAnalysis GUI](https://github.com/Marxlp/pyFlightAnalysis/raw/master/images/gui.png)

## Why Docker?

Running pyFlightAnalysis with all its dependencies can be challenging due to complex system requirements. This Docker implementation solves that by providing:

- **One-command setup** - No need to install dependencies manually
- **Isolation** - Keeps your system clean
- **Portability** - Works consistently across different systems
- **Easy updates** - Just pull the latest image

## Prerequisites

- Docker installed on your system
- X11 server (for GUI display on Linux)
- `make` utility (recommended)

## Quick Start

1. **Clone this repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/pyFlightAnalysis.git
   cd pyFlightAnalysis
   ```

2. **Build the Docker image:**
   ```bash
   make build
   ```

3. **Run the application:**
   ```bash
   make run
   ```

## Available Commands

- `make build` - Build the Docker image
- `make run` - Start the application
- `make stop` - Stop the running container
- `make clean` - Remove Docker image and containers
- `make help` - Show available commands

## Features

- Visualize PX4 flight logs (ulog format)
- 3D visualization of drone attitude and position
- Dynamic data filtering
- Easy playback with pyqtgraph's ROI (Region Of Interest)
- No system-wide Python or library installations required

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Original pyFlightAnalysis by [Marxlp](https://github.com/Marxlp/pyFlightAnalysis)
- PX4 Flight Stack
- All the open-source libraries that made this possible
