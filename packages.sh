#!/usr/bin/env bash

while read -r package;do
yes | julia -e "using Pkg; Pkg.add(\"$package\")"
done<requirements.txt

while read -r package;do
julia -e "using $package"
done<requirements.txt
# yes | rm /root/.julia/lib/v0.6/Compose.ji

# while read -r package;do
# yes | julia -e "] add $package"
# julia -e "using $package"
# done<requirements.txt
# yes | rm /root/.julia/lib/v0.6/Compose.ji
