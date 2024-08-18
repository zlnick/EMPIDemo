
iris session $ISC_PACKAGE_INSTANCENAME -U %SYS <<- EOF
// Disable user password expiration as a demo platform
zn "%SYS"
do ##class(Security.Users).UnExpireUserPasswords("*")

set ns="FHIRSERVER"
zn ns
// Start FHIR Production
write ##Class(Ens.Director).SetAutoStart("EMPIDemo.Production.EMPIProduction")

// Set FHIRServer Service Config Name
Set cspconfig = ##Class(HS.Util.RESTCSPConfig).%OpenId(1)
Set cspconfig.ServiceConfigName = "HS.FHIRServer.Interop.Service"
Write cspconfig.%Save()

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
rm -rf /dur/*

exit 0
