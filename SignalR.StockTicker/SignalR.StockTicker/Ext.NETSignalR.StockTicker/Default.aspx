﻿<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head runat="server">
		<title>SignalR Stock Ticker example using Ext.NET</title>

		<link href="style.css" rel="stylesheet" />

		<ext:ResourcePlaceHolder runat="server" />
		<script>
			Ext.ns("ExtNETTicker");
		</script>

	    <script src="../bundles/jquery"></script>
		<script src="../Scripts/jquery.signalR-1.0.0.js"></script>
		<script src="../signalr/hubs"></script>
		<script src="SignalR.StockTicker.js"></script>
	</head>
	<body>
		<ext:ResourceManager ID="ResourceManager1" runat="server" />
		
		<ext:Window runat="server" Layout="Fit" Icon="Table" Title="SignalR Stock Ticker with Ext.NET" Closable="false" Width="550" Height="300" Border="false">
			<Items>
				<ext:GridPanel ID="GridPanel1" runat="server">
					<TopBar>
						<ext:Toolbar runat="server">
							<Items>
								<ext:Button ItemID="btnOpen" Text="Open Market" Icon="PlayGreen">
									<Listeners>
										<Click Handler="ExtNETTicker.open();" />
									</Listeners>
								</ext:Button>
								<ext:Button ItemID="btnClose" Text="Close Market" Enabled="false" Icon="StopRed">
									<Listeners>
										<Click Handler="ExtNETTicker.close();" />
									</Listeners>
								</ext:Button>
								<ext:Button ItemID="btnReset" Text="Reset">
									<Listeners>
										<Click Handler="ExtNETTicker.reset();" />
									</Listeners>
								</ext:Button>
							</Items>
						</ext:Toolbar>
					</TopBar>
					<Store>
						<ext:Store runat="server">
							<Model>
								<ext:Model runat="server" IDProperty="Symbol">
									<Fields>
										<ext:ModelField Name="Symbol" />
										<ext:ModelField Name="Price" Type="Float">
											<Convert Handler="return ExtNETTicker.convertPrice.apply(this, arguments)" />
										</ext:ModelField>
										<ext:ModelField Name="DayOpen" Type="Float" />
										<ext:ModelField Name="DayHigh" Type="Float" />
										<ext:ModelField Name="DayLow" Type="Float" />
										<ext:ModelField Name="Direction" />
										<ext:ModelField Name="LastChange" Type="Float" />
										<ext:ModelField Name="Change" Type="Float" />
										<ext:ModelField Name="PercentChange" Type="Float">
											<Convert Handler="return ExtNETTicker.convertPercentChange.apply(this, arguments)" />
										</ext:ModelField>
									</Fields>
								</ext:Model>
							</Model>
						</ext:Store>
					</Store>
					<ColumnModel>
						<Columns>
							<ext:Column Width="80" DataIndex="Symbol" Text="Symbol" />
							<ext:Column Width="50" DataIndex="Price" Text="Price" Align="Right" />
							<ext:Column Width="50" DataIndex="DayOpen" Text="Open" Align="Right" />
							<ext:Column Width="50" DataIndex="DayHigh" Text="High" Align="Right" />
							<ext:Column Width="50" DataIndex="DayLow" Text="Low" Align="Right" />
							<ext:Column Width="50" DataIndex="Direction" Text="Direction" Align="Center">
								<Renderer Handler="return ExtNETTicker.renderDirection.apply(this, arguments);" />
							</ext:Column>
							<ext:Column Width="80" DataIndex="LastChange" Text="Last Change" Align="Right" />
							<ext:Column Width="50" DataIndex="Change" Text="Change" Align="Right" />
							<ext:Column Width="50" DataIndex="PercentChange" Text="%" Align="Right" />
						</Columns>
					</ColumnModel>
					<View>
						<ext:GridView MarkDirty="false" />
					</View>
				</ext:GridPanel>
			</Items>
		</ext:Window>
	</body>
</html>