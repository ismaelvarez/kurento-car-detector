  execute_process (COMMAND /usr/bin/kurento-module-creator -r /home/ismael/Documentos/Modules/CarDetector/car-detector/src/server/interface ;-dr;/usr/share/kurento/modules -o /home/ismael/Documentos/Modules/CarDetector/car-detector/obj-x86_64-linux-gnu/src/server/)

  file (READ /home/ismael/Documentos/Modules/CarDetector/car-detector/obj-x86_64-linux-gnu/src/server/cardetector.kmd.json KMD_DATA)

  string (REGEX REPLACE "\n *" "" KMD_DATA ${KMD_DATA})
  string (REPLACE "\"" "\\\"" KMD_DATA ${KMD_DATA})
  string (REPLACE "\\n" "\\\\n" KMD_DATA ${KMD_DATA})
  set (KMD_DATA "\"${KMD_DATA}\"")

  file (WRITE /home/ismael/Documentos/Modules/CarDetector/car-detector/obj-x86_64-linux-gnu/src/server/cardetector.kmd.json ${KMD_DATA})
