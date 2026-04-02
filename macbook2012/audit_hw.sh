#!/usr/bin/env bash

set -euo pipefail

OUTDIR="$HOME/auditoria_hw"
TS="$(date +%Y%m%d_%H%M%S)"
OUTFILE="$OUTDIR/hw_audit_$TS.txt"

mkdir -p "$OUTDIR"

exec > >(tee "$OUTFILE") 2>&1

echo "===== SYSTEM ====="
uname -a
echo

echo "===== OS ====="
cat /etc/os-release || true
echo

echo "===== CPU ====="
lscpu || true
echo

echo "===== MEMORY ====="
free -h || true
echo

echo "===== PCI DEVICES ====="
lspci -nnk || true
echo

echo "===== USB DEVICES ====="
lsusb || true
echo

echo "===== BLOCK DEVICES ====="
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT || true
echo

echo "===== LOADED KERNEL MODULES ====="
lsmod | sort || true
echo

echo "===== AUDIO ====="
aplay -l || true
arecord -l || true
pactl list short sinks || true
pactl list short sources || true
echo

echo "===== NETWORK ====="
ip a || true
echo
nmcli device status || true
echo

echo "===== BLUETOOTH ====="
rfkill list || true
echo
bluetoothctl show || true
echo

echo "===== VIDEO ====="
v4l2-ctl --list-devices || true
echo

echo "===== KERNEL MESSAGES (HARDWARE RELATED) ====="
dmesg | grep -Ei 'hda|snd|audio|bluetooth|brcm|wifi|firmware' || true
echo

echo "===== DONE ====="
echo "Report saved at: $OUTFILE"
