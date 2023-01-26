<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<wps:Capabilities xmlns:ows="http://www.opengis.net/ows/1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:wps="http://www.opengis.net/wps/1.0.0" xml:lang="en-US" service="WPS" updateSequence="1" version="1.0.0">
	<ows:ServiceIdentification>
		<ows:Title>AHW WPS</ows:Title>
		<ows:Abstract>This service uses GSKY - A Scalable, Distributed Geospatial Data Service.</ows:Abstract>
		<ows:Keywords>
			<ows:Keyword>WPS</ows:Keyword>
			<ows:Keyword>GIS</ows:Keyword>
			<ows:Keyword>Geoprocessing</ows:Keyword>
			<ows:Keyword>Geospatial Data</ows:Keyword>
		</ows:Keywords>
		<ows:ServiceType>WPS</ows:ServiceType>
		<ows:ServiceTypeVersion>1.0.0</ows:ServiceTypeVersion>
	        <ows:Fees>None</ows:Fees>
		<ows:AccessConstraints>None</ows:AccessConstraints>
	</ows:ServiceIdentification>
	<ows:ServiceProvider>
		<ows:ProviderName>WMO RAF</ows:ProviderName>
		<ows:ServiceContact>
			<ows:IndividualName>WMO RAF</ows:IndividualName>
			<ows:PositionName>AHW</ows:PositionName>
			<ows:ContactInfo>
				<ows:Address>
					<ows:DeliveryPoint>WMO RAF</ows:DeliveryPoint>
					<ows:City>Addis Ababa</ows:City>
					<ows:AdministrativeArea>Addis Ababa</ows:AdministrativeArea>
					<ows:Country>Ethiopia</ows:Country>
				</ows:Address>
			</ows:ContactInfo>
		</ows:ServiceContact>
	</ows:ServiceProvider>
	<ows:OperationsMetadata>
		<ows:Operation name="GetCapabilities">
			<ows:DCP>
				<ows:HTTP>
					<ows:Get xlink:href="{{ .ServiceConfig.OWSProtocol }}://{{ .ServiceConfig.OWSHostname }}/ows"/>
				</ows:HTTP>
			</ows:DCP>
		</ows:Operation>
		<ows:Operation name="DescribeProcess">
			<ows:DCP>
				<ows:HTTP>
					<ows:Get xlink:href="{{ .ServiceConfig.OWSProtocol }}://{{ .ServiceConfig.OWSHostname }}/ows"/>
				</ows:HTTP>
			</ows:DCP>
		</ows:Operation>
		<ows:Operation name="Execute">
			<ows:DCP>
				<ows:HTTP>
					<ows:Get xlink:href="{{ .ServiceConfig.OWSProtocol }}://{{ .ServiceConfig.OWSHostname }}/ows"/>
				</ows:HTTP>
			</ows:DCP>
		</ows:Operation>
	</ows:OperationsMetadata>
	<wps:ProcessOfferings>
		{{ range $index, $value := .Processes }}
		<wps:Process wps:processVersion="1.0.0">
			<ows:Identifier>{{ .Identifier }}</ows:Identifier>
			<ows:Title>{{ .Title }}</ows:Title>
			<ows:Abstract>{{ .Abstract }}</ows:Abstract>
			<ows:Metadata xlink:title="Time Series Extractor"/>
		</wps:Process>
		{{ end }}
	</wps:ProcessOfferings>
	<wps:Languages>
		<wps:Default>
			<ows:Language>en-US</ows:Language>
		</wps:Default>
		<wps:Supported>
			<ows:Language>en-US</ows:Language>
		</wps:Supported>
	</wps:Languages>
</wps:Capabilities>