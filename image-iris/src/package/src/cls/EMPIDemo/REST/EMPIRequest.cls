Class EMPIDemo.REST.EMPIRequest Extends (%Persistent, %JSON.Adaptor)
{

Property Name As %String(MAXLEN = 50);

Property Gender As %String;

Property DOB As %String;

Property Address As %String(MAXLEN = 512);

Property PhoneNumber As %String(MAXLEN = 32);

Property IdNumber As %String(MAXLEN = 50);

Property InsuranceNumber As %String(MAXLEN = 50);

Property Threhold As %String;

Storage Default
{
<Data name="EMPIRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Gender</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>Address</Value>
</Value>
<Value name="6">
<Value>PhoneNumber</Value>
</Value>
<Value name="7">
<Value>IdNumber</Value>
</Value>
<Value name="8">
<Value>InsuranceNumber</Value>
</Value>
<Value name="9">
<Value>Threhold</Value>
</Value>
</Data>
<DataLocation>^EMPIDemo.REST.EMPIRequestD</DataLocation>
<DefaultData>EMPIRequestDefaultData</DefaultData>
<IdLocation>^EMPIDemo.REST.EMPIRequestD</IdLocation>
<IndexLocation>^EMPIDemo.REST.EMPIRequestI</IndexLocation>
<StreamLocation>^EMPIDemo.REST.EMPIRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
