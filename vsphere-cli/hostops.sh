#!/bin/bash


helpFunction()
{
   echo ""
   echo "Usage: $0 -s <server> -u <username> -p <password> -o <operation> -d <datacenter> "
   echo -e "\t-s Server IP/NAME"
   echo -e "\t-u Vcenter username"
   echo -e "\t-p Vcenter username password"
   echo -e "\t-o Vcenter operation (shutdown / reboot / etc..)"
   echo -e "\t-d Vcenter datacenter name"
   exit 1 # Exit script after printing help
}

while getopts "s:u:p:o:d:" opt
do
   case "$opt" in
      s ) parameterS="$OPTARG" ;;
      u ) parameterU="$OPTARG" ;;
      p ) parameterP="$OPTARG" ;;
      o ) parameterO="$OPTARG" ;;
      d ) parameterD="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterS" ] || [ -z "$parameterU" ] || [ -z "$parameterP" ] || [ -z "$parameterO" ] || [ -z "$parameterD" ]


then
   echo $@
   echo "Some or all of the parameters are empty";
   helpFunction
fi

#vicfg-hostops --server $parameterS --username $parameterU --password $parameterP --operation $parameterO --datacenter $parameterD --force
echo "vicfg-hostops --server $parameterS --username $parameterU --password $parameterP --operation $parameterO --datacenter $parameterD --force"
