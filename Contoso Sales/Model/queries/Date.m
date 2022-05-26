let
    Source = Web.Contents(SourceUrl & "Date.csv"),
    Csv = Csv.Document(Source),
    #"Promoted Headers" = Table.PromoteHeaders(Csv, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"DateKey", Int64.Type}, {"Calendar Year Number", Int64.Type}, {"Calendar Year", type text}, {"Calendar Year Quarter Number", Int64.Type}, {"Calendar Year Quarter", type text}, {"Calendar Year Month Number", Int64.Type}, {"Month Number", Int64.Type}, {"Month", type text}, {"Day of Week Number", Int64.Type}, {"Day of Week", type text}, {"Fiscal Year Number", Int64.Type}, {"Fiscal Year", type text}, {"Fiscal Quarter Number", Int64.Type}, {"Fiscal Quarter", type text}, {"Fiscal Year Quarter Number", Int64.Type}, {"Fiscal Year Quarter", type text}, {"Fiscal Month Number", Int64.Type}, {"Fiscal Month", type text}, {"Working Day", type text}, {"Is Holiday", Int64.Type}, {"Holiday Name", type text}, {"Europe Season", type text}, {"North America Season", type text}, {"Asia Season", type text}}),
    #"Parsed Date" = Table.TransformColumns(#"Changed Type",{{"Date", each Date.From(DateTimeZone.From(_)), type date}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Parsed Date",{{"Is Holiday", type logical}})
in
    #"Changed Type1"