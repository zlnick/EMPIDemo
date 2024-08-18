Class EMPIDemo.Model.PatientInfo Extends %Persistent
{

Property ResourceId As %String(MAXLEN = 200);

Property Name As %String;

Property DOB As %String;

Property Gender As %String;

Property Address As %String;

Property PhoneNumber As %String;

Property IdNumber As %String;

Property InsuranceNumber As %String;

Property DemographicSummary As %String(MAXLEN = 512);

Property Embedding As %Library.Vector(DATATYPE = "double", LEN = 768);

Storage Default
{
<Data name="PatientInfoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ResourceId</Value>
</Value>
<Value name="3">
<Value>Embedding</Value>
</Value>
<Value name="4">
<Value>DemographicSummary</Value>
</Value>
<Value name="5">
<Value>Name</Value>
</Value>
<Value name="6">
<Value>DOB</Value>
</Value>
<Value name="7">
<Value>Gender</Value>
</Value>
<Value name="8">
<Value>Address</Value>
</Value>
<Value name="9">
<Value>PhoneNumber</Value>
</Value>
<Value name="10">
<Value>IdNumber</Value>
</Value>
<Value name="11">
<Value>InsuranceNumber</Value>
</Value>
</Data>
<DataLocation>^EMPIDemo.Model.PatientInfoD</DataLocation>
<DefaultData>PatientInfoDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^EMPIDemo.Model.PatientInfoD</IdLocation>
<IndexLocation>^EMPIDemo.Model.PatientInfoI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Address">
<AverageFieldSize>20</AverageFieldSize>
<OutlierSelectivity>.999999:"杭州市中山北街4号"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>12</AverageFieldSize>
<OutlierSelectivity>.999999:"1985-04-14"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="DemographicSummary">
<AverageFieldSize>96</AverageFieldSize>
<OutlierSelectivity>.999999:"卫香薇,女性,1985-04-14,杭州市中山北街4号,417286184012312559,"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Embedding">
<AverageFieldSize>8516</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Gender">
<AverageFieldSize>6</AverageFieldSize>
<OutlierSelectivity>.999999:"女性"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="IdNumber">
<AverageFieldSize>20</AverageFieldSize>
<OutlierSelectivity>.999999:417286184012312559</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="InsuranceNumber">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>8</AverageFieldSize>
<OutlierSelectivity>.999999:"卫香薇"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="PhoneNumber">
<AverageFieldSize>15</AverageFieldSize>
<OutlierSelectivity>.999999:"121-7266-4575"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="ResourceId">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-12</BlockCount>
</SQLMap>
<StreamLocation>^EMPIDemo.Model.PatientInfoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
