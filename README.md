# SSD1306 – I<sup>2</sup>C OLED Dot Matrix Display

Originally from [UCTRONICS/U6143_ssd1306](https://github.com/UCTRONICS/U6143_ssd1306), this is a modified driver for a front-panel status display for a Raspberry Pi.

## Prerequisites

```bash
sudo raspi-config
```
1. Choose Interface Options 
2. Enable i2c

```bash
sudo apt-get install git
```


## Clone and Compile

```bash
git clone https://github.com/scottdarch/U6143_ssd1306.git
cd U6143_ssd1306
make
```

## Install

```bash
sudo cp build/status_display /bin
sudo touch /etc/systemd/system/status-display.service
sudo chmod 664 /etc/systemd/system/status-display.service
sudo vi /etc/systemd/system/status-display.service
```

The contents of /etc/systemd/system/status-display.service:

```bash
[Unit]
Description=Drives an I2C display to show simple system status.

[Service]
ExecStart=/bin/status_display

[Install]
WantedBy=multi-user.target
```

Now enable the service to run at boot:

```
sudo systemctl daemon-reload
sudo systemctl enable status-display
sudo systemctl sart status-display
```

# UCTRONICS to QWIIC

I recommend using the [QWIIC pHAT](https://www.sparkfun.com/products/15945) from Sparkfun Electronics to connect the OLED to your Pi. Here's how to wire up an adapter cable:

| Standard / Function | GND   | 3.3V   | SDA  | SCL    |
|--------------------:|-------|--------|------|--------|
| UCTRONICS           | White | Yellow | Red  | Black  |
| QWIIC               | Black | Red    | Blue | Yellow |
