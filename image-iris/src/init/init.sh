
###
 # @Author: zlnick zlnick79@gmail.com
 # @Date: 2024-08-14 19:03:49
 # @LastEditors: zlnick zlnick79@gmail.com
 # @LastEditTime: 2024-08-15 16:31:55
 # @FilePath: \EMPIDemo\image-iris\src\init\init.sh
 # @Description: 
 # 
 # Copyright (c) 2024 by Lin Zhu, All Rights Reserved. 
### 

### 
# DIR=$(dirname $0)
# if [ "$DIR" = "." ]; then
# DIR=$(pwd)
# fi
# iris-community login need no username and password

# echo " Merge configuration..." 
# iris merge iris /external/irismerge.conf /usr/irissys/iris.cpf

iris session $ISC_PACKAGE_INSTANCENAME -U USER <<- EOF
do \$SYSTEM.OBJ.Load("/dur/init/WebTerminal-v4.9.5.xml", "cuk")
do \$SYSTEM.OBJ.Load("/dur/init/zpm-0.7.0.xml", "cuk")
zpm "version"
write "zpm and webterminal installed"

set ns="FHIRSERVER"
zn "HSLIB"
set namespace=ns
Set appKey = "/csp/healthshare/fhirserver/fhir/r4"
Set strategyClass = "HS.FHIRServer.Storage.JsonAdvSQL.InteractionsStrategy"
set metadataPackages = $lb("hl7.fhir.r4.core@4.0.1")
Set metadataConfigKey = "HL7v40"

// Install a Foundation namespace and change to it
// Do ##class(HS.HC.Util.Installer).InstallFoundation(namespace)
Do ##class(HS.Util.Installer.Foundation).Install(namespace)
zn namespace

// Install elements that are required for a FHIR-enabled namespace
do ##class(HS.FHIRServer.Installer).InstallNamespace()

// Install an instance of a FHIR Service into the current namespace
if '##class(HS.FHIRServer.ServiceAdmin).EndpointExists(appKey) { do ##class(HS.FHIRServer.Installer).InstallInstance(appKey, strategyClass, metadataPackages) }

set strategy = ##class(HS.FHIRServer.API.InteractionsStrategy).GetStrategyForEndpoint(appKey)
set config = strategy.GetServiceConfigData()
set config.DebugMode = 4
do strategy.SaveServiceConfigData(config)

// Disable user password expiration as a demo platform
zn "%SYS"
do ##class(Security.Users).UnExpireUserPasswords("*")


exit
halt
EOF

echo ""
echo "Installation complete."
echo ""

echo "stop iris and purge unnecessary files..."
iris stop $ISC_PACKAGE_INSTANCENAME quietly
rm -rf $ISC_PACKAGE_INSTALLDIR/mgr/journal.log 
rm -rf $ISC_PACKAGE_INSTALLDIR/mgr/IRIS.WIJ
rm -rf $ISC_PACKAGE_INSTALLDIR/mgr/journal/*
#rm -rf /dur/*

exit 0
