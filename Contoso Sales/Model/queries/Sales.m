let
    Source = Web.Contents(SourceUrl & "Sales.csv"),
    Csv = Csv.Document(Source),
    #"Promoted Headers" = Table.PromoteHeaders(Csv, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"StoreKey", Int64.Type}, {"ProductKey", Int64.Type}, {"PromotionKey", Int64.Type}, {"CurrencyKey", Int64.Type}, {"CustomerKey", Int64.Type}, {"OrderDateKey", Int64.Type},{"Order Line Number", Int64.Type}, {"Quantity", Int64.Type}, {"Unit Price", type number}, {"Unit Discount", type number}, {"Unit Cost", type number}, {"Net Price", type number}}),
    #"Parsed Date" = Table.TransformColumns(#"Changed Type",{{"Delivery Date", each Date.From(DateTimeZone.From(_)), type date}, {"Order Date", each Date.From(DateTimeZone.From(_)), type date}})
in
    #"Parsed Date"