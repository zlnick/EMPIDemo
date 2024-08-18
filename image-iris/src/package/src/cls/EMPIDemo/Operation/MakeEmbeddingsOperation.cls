Class EMPIDemo.Operation.MakeEmbeddingsOperation Extends Ens.BusinessOperation
{

Method MakeEmbeddings(pRequest As EMPIDemo.Messages.PostPatientRequest, Output pResponse As Ens.StringResponse) As %Status
{
    Set tSC = $$$OK
    Set clientIp = pRequest.clientIP
    #Dim patient As %DynamicAbstractObject = ##class(%DynamicObject).%FromJSON(pRequest.payload)
    #Dim patInfo As EMPIDemo.Model.PatientInfo = ##Class(EMPIDemo.Model.PatientInfo).%New()
    Set patInfo.ResourceId = pRequest.resourceId
    Set patInfo.Name = (patient.name.%Get(0)).family_((patient.name.%Get(0)).given).%Get(0)
    Set patInfo.DOB = patient.birthDate
    Set patInfo.Gender = $CASE(patient.gender,"male":"男性","female":"女性","other":"未说明的性别","unknown":"未知的性别",:"")
    Set patInfo.Address = (patient.address.%Get(0)).text
    Set patInfo.PhoneNumber = (patient.telecom.%Get(0)).value
    Set idents = patient.identifier
    set iter = idents.%GetIterator()
    while iter.%GetNext(.key, .value)
    {
        if ("身份证号码" = (value.type.text))
        {
            Set patInfo.IdNumber = value.value
        }
        if ("医保卡号码" = (value.type.text))
        {
            Set patInfo.InsuranceNumber = value.value
        }
    }
    Set patInfo.DemographicSummary = patInfo.Name_","_patInfo.Gender_","_patInfo.DOB_",地址："_patInfo.Address_",电话："_patInfo.PhoneNumber_",身份证号码："_patInfo.IdNumber_",医保卡号码："_patInfo.InsuranceNumber
    Set patInfo.Embedding = ##Class(EMPIDemo.Util.Vector).EmbeddingPy(patInfo.DemographicSummary)
    try {
     set emInsert = "INSERT INTO EMPIDemo_Model.PatientInfo (ResourceId,Name,Gender,DOB,Address,PhoneNumber,IdNumber,InsuranceNumber,DemographicSummary,Embedding)" 
                  _"VALUES (?,?,?,?,?,?,?,?,?,TO_VECTOR(?,double))"
     #Dim tStatement As %SQL.Statement = ##class(%SQL.Statement).%New()
     Set tSC = tStatement.%Prepare(emInsert)
     if tSC '=1 {write "%Prepare failed:" do $System.Status.DisplayError(tSC) quit}
     set rset = tStatement.%Execute(patInfo.ResourceId,patInfo.Name,patInfo.Gender,patInfo.DOB,patInfo.Address,patInfo.PhoneNumber,patInfo.IdNumber,patInfo.InsuranceNumber,patInfo.DemographicSummary,patInfo.Embedding)
     if (rset.%SQLCODE < 0) {
       throw ##class(%Exception.SQL).CreateFromSQLCODE(rset.%SQLCODE,rset.%Message)
     }
   }
   catch e {
     set tSC = e.AsStatus()
     return tSC
   }
    //Set tSC = patInfo.%Save()
    Set pResponse = ##Class(Ens.StringResponse).%New()
    Set pResponse.StringValue = patInfo.DemographicSummary
    Quit tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="EMPIDemo.Messages.PostPatientRequest">
		<Method>MakeEmbeddings</Method>
	</MapItem>
</MapItems>
}

}
