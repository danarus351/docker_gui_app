FROM balenalib/intel-nuc-python:3.8

# Install necessary packages
RUN apt-get update && apt-get install -y \
    xorg \
    openbox \
    libxkbcommon-x11-0 \
    libxcb-xinerama0 \
    libxcb1 \
    libx11-xcb1 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-xkb1 \
    libxcb-xv0 \
    libxcb-cursor0 \
    xserver-xorg-input-all \
    xserver-xorg-input-evdev \
    tzdata \
    xinput


# Copy your application code
COPY . /app
COPY openbox /etc/xdg/openbox
COPY xorg.conf /etc/X11/xorg.conf


WORKDIR /app

ENV UDEV=1

# Copy the start script
COPY start.sh /start.sh

RUN pip install PyQt6

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

#CMD ["python /app/gui_app.py"]