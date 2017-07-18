$reportTypes = @(
	"tabvInfo";
	"tabdvPort";
	"tabdvSwitch";
	"tabvCD";
	"tabvCluster";
	"tabvCPU";
	"tabvDatastore";
	"tabvDisk";
	"tabvFloppy";
	"tabvHBA";
	"tabvHealth";
	"tabvHost";
	"tabvMemory";
	"tabvMultiPath";
	"tabvNetwork";
	"tabvNIC";
	"tabvPartition";
	"tabvPort";
	"tabvRP";
	"tabvSC_VMK";
	"tabvSnapshot";
	"tabvSwitch";
	"tabvTools";
)

foreach($reportType in $reportTypes) {

    Clear-Variable consolidatedReportFile -Scope Global
    Clear-Variable reportFiles -Scope Global

    $consolidatedReportFile = "$reportType$(get-date -f yyyy-MM-dd_hh_mm).csv"
	
    $reportFiles = Get-ChildItem -filter *$reportType*
    foreach($reportFile in $reportFiles) {
        (Get-Content $reportFile)[1 .. $reportFile.Length] | Add-Content $consolidatedReportFile
    }
}
