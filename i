#!/bin/bash
#Tool By dKs

clear
neofetch

echo "─────█─▄▀█──█▀▄─█─────"
echo "────▐▌──────────▐▌────"
echo "────█▌▀▄──▄▄──▄▀▐█────"
echo "───▐██──▀▀──▀▀──██▌───"
echo "──▄████▄──▐▌──▄████▄──"

echo "Tool Ip Forwarding";
echo "1. Tambah Forward";
echo "2. Cek Rule Forwarding Dan IP Tables";
echo "3. Hapus Forwarding";
echo "4. Keluar";
echo ""
echo "Masukkan Angka 1 Sampai 4"
read  pilihan


#menu1
if [ $pilihan = 1 ]
then
clear
echo "Masukkan Port Yang Belum Digunakan Di Server Ini"
read pgcp
echo "Masukkan IP dan Port Tujuan , Contoh Vmess Azure Ada Di 54.100.21.2:443 "
read ptujuan
sysctl net.ipv4.ip_forward=1
iptables -t nat -A PREROUTING -p tcp --dport $pgcp -j DNAT --to-destination $ptujuan
iptables -t nat -A PREROUTING -p udp --dport $pgcp -j DNAT --to-destination $ptujuan
sysctl -p
ipf


#menu2
elif [ $pilihan == 2 ]
then
clear
echo "Cek Forwarding Dan Ip Tables"
iptables -t nat -L --line-number
echo "Tekan 1 Untuk ke menu Utama / Tekan Sembarang Untuk Exit"
read kemenu
if [ $kemenu == 1 ] 
then
	ipf
else
    exit	
fi


#menu3
elif [ $pilihan == 3 ]
then
iptables -t nat -L --line-number
echo "Silahkan Amati Tabel Di Atas!!Amati Nomer Baris Dan Ip"
read -p "Silahkan Masukan Baris Yang Mau Di Hapus : " hapus
iptables -t nat -D PREROUTING $hapus
read -p "takan 1 Untuk Lanjut edit / tekan sembarang untuk exit :   " kemenu
if [ $kemenu == 1 ] 
then
	ipf
else
    exit	
fi




#menu4
elif [ $pilihan == 4 ]
then
clear
	exit
else
clear
echo "bye"
sleep 1
ipf
fi
