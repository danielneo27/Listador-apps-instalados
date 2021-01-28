<#	
	.NOTAS
	===========================================================================
	 Criado em:   	16/12/2020 15:59
	 Criado por:   	Daniel Neo
     Versão:        0.2.1
     Atualizado:    19/01/2021
	 Nome do arquivo:  Listador de programas instalados
	===========================================================================
	.DESCRIÇÃO
		Listador de programas, ele grava todos os programas instalados no PC do usuário em um arquivo de texto na pasta Downloads chamado "programas_instalados.txt".
        
        Nessa lista terá informações sobre o nome do programa e a sua versão corresponte.
#>
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Host off
$host.UI.RawUI.ForegroundColor = "DarkGreen"
$host.UI.RawUI.BackgroundColor = "Black"
Clear-Host

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | Sort-Object -Property DisplayName -Unique | Format-Table -AutoSize > “$env:userprofile\downloads\programas_instalados.txt”

#faz uma pausa na quantidade de tempo Em "SEGUNDOS", altere o valor do "Sleep" para funcionar.

[System.Threading.Thread]::Sleep(1000)