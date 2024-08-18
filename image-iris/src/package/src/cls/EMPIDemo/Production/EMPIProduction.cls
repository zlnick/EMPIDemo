Class EMPIDemo.Production.EMPIProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="EMPIDemo.Production.EMPIProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EMPIDemo.DataFlow.FHIRHandler" Category="" ClassName="EMPIDemo.DataFlow.FHIRHandler" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EMPIDemo.Operation.MakeEmbeddingsOperation" Category="" ClassName="EMPIDemo.Operation.MakeEmbeddingsOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">EMPIDemo.DataFlow.FHIRHandler</Setting>
  </Item>
</Production>
}

}
