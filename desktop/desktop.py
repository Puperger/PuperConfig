import os
from PIL import Image, ImageDraw, ImageFont
from datetime import datetime

import calendarConnector

#Get current Time
now = datetime.now()

current_time = now.strftime("%d.%m %H:%M")

PATH = "~/Documents/GitHub/PuperConfig/desktop/"

# Battery
statusf = "/sys/class/power_supply/BAT0/capacity"
with open(statusf) as f:
    power = f"{f.read()}%".replace("\n","")

# Events
events = calendarConnector.getNextEvents(4)

#Open Wallpaper Template
with Image.open("/home/puperger/Documents/GitHub/PuperConfig/desktop/wallpaper/Template.png").convert("RGB") as base:

    print(base.format, base.size, base.mode)

    #Write Text
    draw = ImageDraw.Draw(base)
    font = ImageFont.truetype("/home/puperger/Documents/GitHub/PuperConfig/desktop/font.ttf", 70)
    fontS= ImageFont.truetype("/home/puperger/Documents/GitHub/PuperConfig/desktop/font.ttf", 30)
    draw.text((1580,12), current_time, (255,255,255), font=font)    # Time
    draw.text((12,6), f"{power}", (255,255,255),font=font)          # Battery
    for i in range(len(events)):                                    # Events
        draw.text((1680,700+100*(i)), events[i][0], (255,255,255),font=fontS)
        draw.text((1680,740+100*(i)), events[i][1], (255,255,255),font=fontS)
    base.save("/home/puperger/Documents/GitHub/PuperConfig/desktop/wallpaper/out.png", "PNG")

os.system("gsettings set org.gnome.desktop.background picture-uri "+PATH+"wallpaper/out.png")
os.system("gsettings set org.gnome.desktop.background picture-uri-dark "+PATH+"wallpaper/out.png")

