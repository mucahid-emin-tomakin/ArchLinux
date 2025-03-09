Erstellen von Bilder -> Video zu Picture
mkdir png
ffmpeg -i ottoman.mp4 png/frame%03d.png

Erstellung von TXT mit Farbe -> Picture zu Text
mkdir asciiart
for img in $(ls png/frame*.png | sort -V); do      ascii-image-converter "$img" --color -c -f | tee -a ottoman/$(basename "$img" .png).txt;     clear; done
for frame in $(ls frame*.png | sort -V); ascii-image-converter "$frame" --color -c | tee -a asciiart/$(basename "$frame" .png).txt; clear; done
for frame in png/frame*.png; do   ascii-image-converter "$frame" --color | tee -a asciiart/$(basename "$frame" .png).txt; done
for frame in png/frame*.png; do   ascii-image-converter "$frame" --color -d 55,44 | tee -a asciiart/$(basename "$frame" .png).txt; done
for frame in png/frame*.png; do   ascii-image-converter "$frame" --color -c -d 55,44 | tee -a asciiart/$(basename "$frame" .png).txt; done
for frame in png/frame*.png; do   ascii-image-converter "$frame" --color -c -b -d 55,44 | tee -a asciiart/$(basename "$frame" .png).txt; done

Wiedergabe in einer Schleife
while true; do
    for frame in asciiart/*.txt; do
        clear; # Gibt die ASCII-Art farbig aus
        cat "$frame";
        sleep 0.01; # Geschwindigkeit der Anzeige (kann angepasst werden)
    done;
done

for i in $(seq 1 50); do
    cp frame2881.txt frame$(printf "%04d" $((2881 + i))).txt
done

