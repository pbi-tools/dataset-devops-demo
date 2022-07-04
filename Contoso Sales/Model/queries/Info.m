let
    Source = #table(type table
    [
        #"Label"             = text, 
        #"Timestamp"         = datetime,
        #"Text"              = text
    ], 
    {
        { "Data Updated", DateTimeZone.RemoveZone(DateTimeZone.UtcNow()), null },
        { "Version",            null,   #"[Version]" },
        { "GitHub SHA",         null,   #"[GH-SHA]" },
        { "GitHub RunID",       null,   #"[GH-RunId]" },
        { "Branch",             null,   #"[GH-Branch]" },
        { "pbi-tools Version",  null,   #"[PBITOOLS_VERSION]" },
        { "Environment",        null,   #"[Environment]"}
    }
)
in
    Source