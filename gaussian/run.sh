# Runs Gaussian for a range of inputs and collects log files using nvprof
declare -a input=(256 512 1024 2048 4096)

for i in ${input[@]}; do
  nvprof --print-gpu-trace --log-file trace_"$i".txt ./gaussian -s $i
  nvprof --print-gpu-trace --csv --log-file trace_"$i".csv ./gaussian -s $i
  nvprof --metrics all --log-file metrics_"$i".txt ./gaussian -s $i
  nvprof --metrics all --csv --log-file metrics_"$i".csv ./gaussian -s $i
done

