function check_parm()
{
  if [ "${2}" == "" ]; then
    echo -n "${1}"
    return 1
  else
    return 0
  fi
}



if [ -f ./cluster-info ]; then
	source ./cluster-info 
else
	echo "lack of cluster-info"
	echo "CP0_IP=$(hostname -I | awk '{print $1}')" >> cluster-info
	echo "NET_IF=eth0 " >> cluster-info
	echo "CIDR=10.244.0.0/16" >> cluster-info
	source ./cluster-info 
fi
check_parm "Enter the IP address of master-01: " ${CP0_IP} 
if [ $? -eq 1 ]; then
	read CP0_IP
fi
check_parm "Enter the Net Interface: " ${NET_IF}
if [ $? -eq 1 ]; then
	read NET_IF
fi
check_parm "Enter the cluster CIDR: " ${CIDR}
if [ $? -eq 1 ]; then
	read CIDR
fi

echo """
cluster-info:
  master-01:        ${CP0_IP}
  Net Interface:    ${NET_IF}
  CIDR:             ${CIDR}
"""

