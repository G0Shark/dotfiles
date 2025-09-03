#!/bin/bash
sudo systemctl restart clash-meta.service
sleep 3
sudo systemctl restart awgproxy.service