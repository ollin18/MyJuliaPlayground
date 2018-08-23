while read -r package;do
yes | julia -e "] add $package"
julia -e "using $package"
done<requirements.txt
yes | rm /root/.julia/lib/v0.6/Compose.ji
