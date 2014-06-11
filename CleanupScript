#$limit = (get-date).adddays(-15)
$path = "\\someserver\someshare"

$files = ls $path -recurse
foreach($x in $files)
    {$y = ((get-date) - $x.creationtime).days
    if ($y -gt 365 -and $x.psiscontainer -ne $true)
        {write-host $x.name}
    }
 
