working_directory "/home/tenten/www/isp_project"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/tenten/www/isp_project/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/tenten/www/isp_project/log/unicorn.log"
stdout_path "/home/tenten/www/isp_project/log/unicorn.log"

# Unicorn socket
listen "/home/tenten/www/isp_project/tmp/unicorn.isp_project.sock"

# Number of processes
worker_processes 2
#worker_processes 2

# Time-out
timeout 30
