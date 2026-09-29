# -- KECEPATAN MENGAMBIL DARI DETIK SISTEM LINUXNYA --
#!/bin/bash
#TEXT="Dimasalalu"                   # Ganti dengan teks/nama yang kamu inginkan
#LEN=${#TEXT}
#SEC=$(date +%s)               # Mengambil detik sistem

# Siklus: Panjang huruf + 3 detik jeda diam setelah selesai mengetik
#CYCLE=$((LEN + 3))
#STEP=$((SEC % CYCLE))

#if [ $STEP -eq 0 ]; then
#    echo "_"
#elif [ $STEP -le $LEN ]; then
#    echo "${TEXT:0:$STEP}_"    # Menampilkan teks bertahap + kursor kerdip '_'
#else
#    echo "$TEXT"              # Menampilkan teks penuh sebelum diulang
#fi

# -- LEBIH SMOOT --
#!/bin/bash
TEXT="I'm fine:)"
LEN=${#TEXT}

# Mengambil waktu sistem dalam skala persepuluh detik (0.1 detik)
TIME_TENTHS=$(($(date +%s%N) / 100000000))

# Kecepatan mengetik:
# 1 = muncul tiap 0.1 detik (sangat cepat)
# 2 = muncul tiap 0.2 detik (sangat mulus & pas)
SPEED=2

# Jeda diam setelah nama selesai diketik (20 = 2 detik)
PAUSE=20

TOTAL_FRAMES=$(( (LEN * SPEED) + PAUSE ))
CURRENT_FRAME=$(( TIME_TENTHS % TOTAL_FRAMES ))
CHAR_COUNT=$(( CURRENT_FRAME / SPEED ))

if [ $CHAR_COUNT -eq 0 ]; then
    echo "_"
elif [ $CHAR_COUNT -le $LEN ]; then
    echo "${TEXT:0:$CHAR_COUNT}_"
else
    echo "$TEXT"
fi
