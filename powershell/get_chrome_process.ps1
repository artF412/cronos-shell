Get-Process | Where-Object { $_.ProcessName -like "chrome*" } | ForEach-Object {
    try {
        $path = (Get-Process -Id $_.Id -ErrorAction Stop).Path
    } catch {
        $path = "Access Denied"
    }
    [PSCustomObject]@{
        ProcessName = $_.ProcessName
        Id          = $_.Id
        Path        = $path
    }
} | Format-Table -AutoSize