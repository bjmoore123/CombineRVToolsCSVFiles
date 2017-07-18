#CombineRVToolsCSVReports.ps1
#Ben Moore
#7/18/17
#Used to prep RVTools reports for import to dashboard

#build array of report types
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

    #built consolidated report file name
    $consolidatedReportFile = "$reportType$(get-date -f yyyy-MM-dd_hh_mm).csv"
	
    #identify reports of same type in running directory
    $reportFiles = Get-ChildItem -filter *$reportType*
    foreach($reportFile in $reportFiles) {
        #combine reports and drop header line from each file
        (Get-Content $reportFile)[1 .. $reportFile.Length] | Add-Content $consolidatedReportFile
	
	#uncomment the line below to remove the original report file
	#Remove-Item $reportFile
    }
}
