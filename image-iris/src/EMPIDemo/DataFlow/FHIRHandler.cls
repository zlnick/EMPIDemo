/// 
Class EMPIDemo.DataFlow.FHIRHandler Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HS.FHIRServer.Interop.Request' response='HS.FHIRServer.Interop.Response' height='2000' width='2000' >
<context>
<property name='resType' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='payload' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='5000' />
</parameters>
</property>
</context>
<sequence xend='200' yend='800' >
<code name='copyPayload' xpos='200' ypos='250' >
<![CDATA[ Set context.payload = (##class(HS.SDA3.QuickStream).%OpenId(request.QuickStreamId, .tSC)).Read()]]>
</code>
<call name='callFHIRServer' target='HS.FHIRServer.Interop.Operation' async='0' xpos='200' ypos='350' >
<request type='HS.FHIRServer.Interop.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='HS.FHIRServer.Interop.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<if name='IsPatientPost' condition='("Patient" = request.Request.RequestPath) &amp;&amp; ("POST" = request.Request.RequestMethod)' xpos='200' ypos='450' xend='200' yend='700' >
<true>
<call name='makeEmbeddings' target='EMPIDemo.Operation.MakeEmbeddingsOperation' async='1' xpos='335' ypos='600' >
<request type='EMPIDemo.Messages.PostPatientRequest' >
<assign property="callrequest.clientIP" value="request.Request.AdditionalInfo.GetAt(&quot;ClientAddr&quot;)" action="set" languageOverride="" />
<assign property="callrequest.payload" value="context.payload" action="set" languageOverride="" />
</request>
<response type='Ens.StringResponse' />
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
