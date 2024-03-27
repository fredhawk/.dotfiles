#!/bin/bash

# RusT
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Node manager
curl -fsSL https://fnm.vercel.app/install | bash

# Go
yay -S go
