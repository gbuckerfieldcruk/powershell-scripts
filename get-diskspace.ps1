Function Get-DiskSpace

{

 Param ([string[]]$servers)

  Foreach ($s in $servers)

   {

     Get-WmiObject -Class win32_volume -cn $s |

       Select-Object @{LABEL='Computer';EXPRESSION={$s}},driveletter,label,@{LABEL='Freespace_GB';EXPRESSION={"{0:N2}" -f ($_.freespace/1GB)}},@{LABEL='Capacity_GB';EXPRESSION={"{0:N2}" -f ($_.capacity/1GB)}},@{LABEL='FreePct'; EXPRESSION={"{0:N2}" -f ((($_.freespace/1GB)/($_.capacity/1GB))*100)}} |
       Sort-Object driveletter | format-table

    } #end foreach $s

} #end function Get-DiskSpace