# Runs BackProp for a range of inputs and collects log files using nvprof
declare -a input=(65536 131072 262144 524288)

for i in ${input[@]}; do
  nvprof --print-gpu-trace --log-file trace_"$i".txt ./backprop $i
  nvprof --print-gpu-trace --csv --log-file trace_"$i".csv ./backprop $i
  nvprof --metrics ipc --log-file metrics_"$i".txt ./backprop $i
  nvprof --metrics ipc --csv --log-file metrics_"$i".csv ./backprop $i
done

