Class EMPIDemo.REST.Service Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

/// Default the Content-Type for this application.
Parameter CONTENTTYPE = "application/json";

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

/// Sets the response charset to utf-8
Parameter CHARSET = "utf-8";

XData UrlMap [ XMLNamespace = "https://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/Patient" Method="POST" Call="AddPatient" />
    <Route Url="/PatientIds" Method="Get" Call="GetPatientIds" />
</Routes>
}

ClassMethod AddPatient() As %Status
{
    #Dim tSC = $$$OK
    Try {
        Set patInfo = ##class(EMPIDemo.REST.EMPIRequest).%New()
        Do patInfo.%JSONImport(%request.Content)
        Set summary =  patInfo.Name_","_patInfo.Gender_","_patInfo.DOB_",地址："_patInfo.Address_",电话："_patInfo.PhoneNumber_",身份证号码："_patInfo.IdNumber_",医保卡号码："_patInfo.InsuranceNumber
        Set threhold = (patInfo.Threhold)/100
        Set ^Temp = summary
        Set embedding = ##Class(EMPIDemo.Util.Vector).EmbeddingPy(summary)
        Set emQuery = "select top 5 ResourceId,DemographicSummary,Similarity"
        _" from ("
        _" select ResourceId, DemographicSummary,VECTOR_COSINE(TO_VECTOR(pat.Embedding,double),(select TO_VECTOR(?))) as Similarity"
        _" from EMPIDemo_Model.PatientInfo as pat"
        _") as ret"
        _" where ret.similarity>? order by ret.similarity desc"
         #Dim tStatement As %SQL.Statement = ##class(%SQL.Statement).%New()
         Set tSC = tStatement.%Prepare(emQuery)
         If tSC '=1 {Write "%Prepare failed:" Do $SYSTEM.Status.DisplayError(tSC) Quit}
         #Dim rset As %SQL.StatementResult = tStatement.%Execute(embedding,threhold)
         Set rtnArray = []
         While rset.%Next(){
            Set record = {}
            Set record.ResourceId = rset.%Get("ResourceId")
            Set record.DemographicSummary = rset.%Get("DemographicSummary")
            Set record.Similarity = rset.%Get("Similarity")
            Do rtnArray.%Push(record)
         }
        //Do req.%JSONExportToString(.ret)
        Do ##class(%REST.Impl).%WriteResponse(rtnArray.%ToJSON())
    } Catch (ex) {
        Do ##class(%REST.Impl).%SetStatusCode("500")
        Return {"errormessage": "Server error"}
    }
    Quit tSC
}

ClassMethod GetPatientIds() As %Status
{
    #Dim tSC = $$$OK
    Set emQuery = "SELECT ResourceId FROM EMPIDemo_Model.PatientInfo"
    #Dim tStatement As %SQL.Statement = ##class(%SQL.Statement).%New()
    Set tSC = tStatement.%Prepare(emQuery)
    If tSC '=1 {Write "%Prepare failed:" Do $SYSTEM.Status.DisplayError(tSC) Quit}
    #Dim rset As %SQL.StatementResult = tStatement.%Execute()
    Set rtnArray = []
    While rset.%Next(){
        Do rtnArray.%Push(rset.%Get("ResourceId"))
    }
    //Set ^Temp(2) = rtnArray.%ToJSON()
    Do ##class(%REST.Impl).%WriteResponse(rtnArray)
    Quit tSC
}

}
