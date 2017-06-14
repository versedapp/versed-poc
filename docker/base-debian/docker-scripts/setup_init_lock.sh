if [ ! -d "$init_lock" ]; then
    mkdir $init_lock
fi
touch $init_lock/initialize

