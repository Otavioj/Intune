#by Ojay
#20/09/2022
# Parameters for source and destination for the Image file
# Current script is edited to put the same image on LockScreen and Wallpaper

#$WallpaperURL = "WALLPAPERURL" # Change to your fitting
$LockscreenUrl = "https://rgvnetproducaodiag.blob.core.windows.net/intune-scripts/BackgroundDefault.jpg?sp=r&st=2022-09-20T14:18:41Z&se=2022-09-20T22:18:41Z&spr=https&sv=2021-06-08&sr=b&sig=TjKjwwNLGV%2BBa3ZrWzhUBzxA%2BYlx4NBx8u7Oub7uYO4%3D" # Change to your fitting

$ImageDestinationFolder = "C:\Windows\System32\oobe\info\backgrounds" # Change to your fitting - this is the folder for the wallpaper image
#$WallpaperDestinationFile = "$ImageDestinationFolder\wallpaper.png" # Change to your fitting - this is the Wallpaper image
$LockScreenDestinationFile = "$ImageDestinationFolder\backgroundDefault.jpg" # Change to your fitting - this is the Lockscreen image

# Creates the destination folder on the target computer
md $ImageDestinationFolder -erroraction silentlycontinue

# Downloads the image file from the source location
#Start-BitsTransfer -Source $WallpaperURL -Destination "$WallpaperDestinationFile"
Start-BitsTransfer -Source $LockscreenUrl -Destination "$LockScreenDestinationFile"

# Assigns the wallpaper 
$RegKeyPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'

#$DesktopPath = "DesktopImagePath"
$#DesktopStatus = "DesktopImageStatus"
#$DesktopUrl = "DesktopImageUrl"
$LockScreenPath = "LockScreenImagePath"
$LockScreenStatus = "LockScreenImageStatus"
$LockScreenUrl = "LockScreenImageUrl" 

$StatusValue = "1"
#$DesktopImageValue = "$WallpaperDestinationFile"  
$LockScreenImageValue = "$LockScreenDestinationFile"

IF(!(Test-Path $RegKeyPath))

{

New-Item -Path $RegKeyPath -Force | Out-Null

#New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
#New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
##New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null

}

ELSE {

#New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $Statusvalue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $value -PropertyType DWORD -Force | Out-Null
#New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
#New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
}


# Restart explorer.exe
    #stop-process -name explorer –force

# Clears the error log from powershell before exiting
    $error.clear()