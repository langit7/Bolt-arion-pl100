# Bolt-arion-pl100
OEM /STOK Partition 

```
mtd0: 02000000 00010000 "ALL"
mtd1: 00020000 00010000 "Bootloader"
mtd2: 00020000 00010000 "Config"
mtd3: 00010000 00010000 "Factory"
mtd4: 00fb0000 00010000 "Kernel"
```
STOK url untuk lock LTE http://192.168.1.1/engineering password superadmin

switchconfig
```
hash  port(0:6)   fid   vid  age   mac-address     filter my_mac
0b8:   ---- --1-    0     1  145  d4c8b0462570     -     -
120:   1--- --1-    0   103  255  d4c8b0462570     -     -
578:   --1- ----    0     1  149  2cf05d70f6bd     -     -
5c8:   1--- ----    0  4094  149  000a3bf00130     -     -
758:   ---- --1-    0  4094  149  d4c8b0462570     -     -
```
Unlock menggunakan Telnet tanpa software unlock bolt
```
1.login telnet user dan password admin
2. jalankan command dibawah
nvram_set config_simlock_plmn_list ""
nvram_set simlock_plmn_list ""
nvram_set ODMC_simlock_plmn_list ""
```
Cara ganti IMEI
```
ilegal
pastikan hanya menggunakan imei agan sendiri;
telnet ke modem telnet 169.254.0.1
ketik 'diag set imei nomorimei' yang diinginkan
```
