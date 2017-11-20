#* FileName: deploy.ps1
#*=============================================
#* Script Name: IIS-AISF.ALAR.Application
#* Created: 21/03/2016
#* Author: Emmanuel Delcon
#* Email: manu.delcon@acerta.be
#* Reqrmnts: Windows 2012 - IIS 8 - Carbon 2.x framework
#*=============================================
#* Purpose:
#*	Creates the IIS site including the
#*	virtual folders, app pool and binding
#*=============================================
$Sitename = "AISF.ALAR.Application"
$webRoot = "D:\Inetpub\wwwroot"
$LogRoot = "D:\logs\Applications"
$LogRootApp = ([System.IO.Path]::Combine("$LogRoot","$Sitename"))
$Sitebindings = "http/*:80:aisf-alar-Application.global.dns"
$RuntimeVersion = "v2.0"
#*=============================================
#* SCRIPT BODY
#*=============================================
Write-Host "Load Carbon Powershell Module...."
Import-Module 'Carbon'

Write-Host "***********************************************"
Write-Host "Using following parameters"
Write-Host "Site Name:" $Sitename
Write-Host "Webroot:" $webRoot
Write-Host "Application logging root:" $LogRootApp
Write-Host "Site Bindings:"  $Sitebindings
Write-Host "Runtime Version:" $RuntimeVersion
Write-Host "***********************************************"

Write-Host "Create Applicationpool:" $Sitename
Install-IisAppPool -Name $Sitename -ManagedRuntimeVersion $RuntimeVersion

Write-Host "Create IIS site:" $Sitename
Install-IisWebsite -Name $Sitename -PhysicalPath $webRoot -Bindings $Sitebindings -AppPoolName $Sitename

Write-Host "Enable anonymous authentication"
Enable-IisSecurityAuthentication -SiteName $Sitename -Anonymous

Write-Host "Create Application logging folder" 
New-Item -ErrorAction Ignore -ItemType directory -Path $LogRootApp
Write-Host "Setting security on logging folder:" $LogRootApp
cmd /c icacls "$LogRootApp" /grant ("IIS AppPool\$Sitename" + ':(OI)(CI)M') /t /c /q
#*=============================================
#* END OF SCRIPT
#*=============================================