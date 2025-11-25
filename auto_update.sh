#!/bin/bash
echo "Auto-Skript gestartet ...."

echo "Aktualisiere die Paketliste..."
sudo apt update

echo "Aktualisiere das gesamte System auf die neueste Version..."
sudo apt dist-upgrade -y

echo "Bereinige unerwünschte Pakete..."
sudo apt autoremove -y

echo "Auto-Skript wird beendet ..."
