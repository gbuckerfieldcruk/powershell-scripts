# Delete all files in a given path that are older than a specified number of days
# Change the number of days using the $limit variable
# For safety this is configured just to echo the files that would be deleted

$limit = 365
$path = "\\someserver\someshare"

$files = ls $path -recurse
foreach($x in $files)
    {$y = ((get-date) - $x.creationtime).days
    if ($y -gt $limit -and $x.psiscontainer -ne $true)
        # To delete files, replace this line with {$x.delete()}
        {write-host $x.name}
    }
 
