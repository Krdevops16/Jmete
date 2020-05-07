param([String] $TestSCriptsFolderBasePath)
clear
try
{
 <# cd /tmp/Pertest/apache-jmeter/bin #>
 cd "/tmp/Pertest/apache-jmeter/bin"
 <# /tmp/Pertest/ #>
 $inFileSearchTest = $TestSCriptsFolderBasePath + "/TestScripts/ThreadGroupForSearch.jmx"
 $outFileSearchTest = $TestSCriptsFolderBasePath + "/Results\outputSearch.jtl"
 
 & ./jmeter.sh -n -t $inFileSearchTest -l $outFileSearchTest
 
 Write-Host("Search Test executed");
 $csvRptForSearch = $TestSCriptsFolderBasePath + "/Results/SearchTestReport.csv"
 <# below aggregated report for search #>
 java -jar /tmp/Pertest/apache-jmeter/lib/ext/ApacheJMeter_java.jar --tool Reporter --generate-csv $csvRptForSearch --input-jtl $outFileSearchTest --plugin-type AggregateReport
 Write-Host("Aggregated report generated for Search test");

 cd "/tmp/Pertest"

 cd "/tmp/Pertest/apache-jmeter/bin"

 $inFileViewReportTest = $TestSCriptsFolderBasePath + "/TestScripts/TestPlanViewReport.jmx"
 $outFileViewReport = $TestSCriptsFolderBasePath + "/Results/outputViewReport.jtl"

 & ./jmeter.sh -n -t $inFileViewReportTest -l $outFileViewReport
 Write-Host("View Report Test executed");

 $csvRptForViewReport = $TestSCriptsFolderBasePath + "/Results/ViewReport.csv"
 <# below aggregated report for search #>
 java -jar /tmp/Pertest/apache-jmeter/lib/ext/ApacheJMeter_java.jar --tool Reporter --generate-csv $csvRptForViewReport --input-jtl $outFileViewReport --plugin-type AggregateReport

 Write-Host("Aggregated report generated for View Report test");
 
 cd "/tmp/Pertest"
 cd "/tmp/Pertest/apache-jmeter/bin"
 
 $inFileCreateOrderTest = $TestSCriptsFolderBasePath + "/TestScripts/HttpRequestForCreateOrder.jmx"
 $outFileCreateOrder = $TestSCriptsFolderBasePath + "/Results\outputCreateOrder.jtl"

 & ./jmeter.sh -n -t $inFileCreateOrderTest -l $outFileCreateOrder
 Write-Host("Create Order Test executed");

 $csvRptForCreateOrder = $TestSCriptsFolderBasePath + "/Results/CreateOrderReport.csv"
 <# below aggregated report for search #>

 java -jar /tmp/Pertest/apache-jmeter/lib/ext/ApacheJMeter_java.jar --tool Reporter --generate-csv $csvRptForCreateOrder --input-jtl $outFileCreateOrder --plugin-type AggregateReport
 cd "/tmp/Pertest/"
 Write-Host("Aggregated report generated for create order test");
 Write-Host("exiting");
 }
catch
{
   cd "/tmp/Pertest/" 
   Write-Host("Failed");
 
}
