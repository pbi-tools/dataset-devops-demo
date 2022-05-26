let
    Source = Web.Contents(SourceUrl & "Store.csv"),
    Csv = Csv.Document(Source),
    #"Promoted Headers" = Table.PromoteHeaders(Csv, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"StoreKey", Int64.Type}, {"Store Type", type text}, {"Store Name", type text}, {"Status", type text}, {"Zip Code", type text}, {"Zip Code Extension", type text}, {"Store Phone", type text}, {"Continent", type text}, {"City", type text}, {"State", type text}, {"CountryRegion", type text}, {"Address Line 1", type text}, {"Address Line 2", type text}, {"Close Reason", type text}, {"Employees", Int64.Type}, {"Selling Area", type number}}),
    #"Parsed Date" = Table.TransformColumns(#"Changed Type",{{"Open Date", each Date.From(DateTimeZone.From(_)), type date}, {"Close Date", each Date.From(DateTimeZone.From(_)), type date}, {"Last Remodel Date", each Date.From(DateTimeZone.From(_)), type date}})
in
    #"Parsed Date"