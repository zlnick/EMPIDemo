Class EMPIDemo.Messages.PostPatientRequest Extends Ens.Request
{

Property clientIP As %String;

Property resourceId As %String;

Property payload As %String(MAXLEN = 5000);

Storage Default
{
<Data name="PostPatientRequestDefaultData">
<Subscript>"PostPatientRequest"</Subscript>
<Value name="1">
<Value>clientIP</Value>
</Value>
<Value name="2">
<Value>payload</Value>
</Value>
<Value name="3">
<Value>resourceId</Value>
</Value>
</Data>
<DefaultData>PostPatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
