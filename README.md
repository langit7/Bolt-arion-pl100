# Bolt-arion-pl100
OEM /STOK Partition 

```
mtd0: 02000000 00010000 "ALL"
mtd1: 00020000 00010000 "Bootloader"
mtd2: 00020000 00010000 "Config"
mtd3: 00010000 00010000 "Factory"
mtd4: 00fb0000 00010000 "Kernel"
```
Layout partisi linux modem GCT GDM7243
```
Creating 17 MTs on "gdm7243":
0x000000000000-0x000000080000 : "u-boot"
0x000000080000-0x000000100000 : "env"
0x000000100000-0x000000200000 : "rev0"
0x000000200000-0x000000300000 : "ltenv"
0x000000300000-0x000000400000 : "wmnv"
0x000000400000-0x000000500000 : "cmnnv"
0x000000500000-0x000000600000 : "cmnnv2"
0x000000600000-0x000000a00000 : "rev1"
0x000000a00000-0x000000e00000 : "linux"
0x000000e00000-0x000001200000 : "linux2"
0x000001200000-0x000003000000 : "rootfs"
0x000003000000-0x000004e00000 : "rootfs2"
0x000004e00000-0x000005300000 : "tk"
0x000005300000-0x000005800000 : "tk2"
0x000005800000-0x000005880000 : "customize"
0x000005880000-0x000005b00000 : "log"
0x000005b00000-0x000007b00000 : "update"
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
