let
    Source = Web.Contents(SourceUrl & "Promotion.csv"),
    Csv = Csv.Document(Source),
    #"Promoted Headers" = Table.PromoteHeaders(Csv, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"PromotionKey", Int64.Type}, {"Promotion Code", type text}, {"Promotion", type text}, {"Discount", type number}, {"Promotion Type", type text}, {"Promotion Category", type text}}),
    #"Parsed Date" = Table.TransformColumns(#"Changed Type",{{"Start Date", each Date.From(DateTimeZone.From(_)), type date}, {"End Date", each Date.From(DateTimeZone.From(_)), type date}})
in
    #"Parsed Date"