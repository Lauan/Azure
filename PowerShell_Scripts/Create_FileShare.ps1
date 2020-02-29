#Providing you already have a storage account

#Defining Resource Group and Storage Account names
$resGroupName = "nameHere"
$stgAccName = "nameHere"

#
$stgAcc = Get-AzStorageAccount -ResourceGroupName $resGroupName
$stgKey = Get-AzStorageAccountKey -ResourceGroupName $resGroupName -Name $stgAccName
$stgCtx = New-AzStorageContext $resGroupName -StorageAccountKey $stgKey[0].Value

#Create a file share
$imgs = New-AzStorageShare imgs -Context $stgCtx
$imgs = Get-AzStorageShare imgs -Context $stgCtx

#Create a folder inside the file share
New-AzStorageDirectory -Share $imgs -Path jpg

#Upload a file to the folder
Set-AzStorageFileContent -Share $imgs -Source "C:\Users\lauan.coelho\Documents\compra_wap.png" -Path jpg

#Download the file
Get-AzStorageFileContent -Share $imgs -Path jpg/compra_wap.png -Destination C:\temp

#Remove the file
Remove-AzStorageFile -Share $imgs -Path jpg/compra_wap.png