let
    Source = Web.Contents(SourceUrl & "Customer.csv"),
    Csv = Csv.Document(Source, [QuoteStyle=QuoteStyle.Csv]),
    #"Promoted Headers" = Table.PromoteHeaders(Csv, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"CustomerKey", Int64.Type}, {"Customer Code", type text}, {"Title", type text}, {"Name", type text}, {"Marital Status", type text}, {"Gender", type text}, {"Yearly Income", type number}, {"Total Children", Int64.Type}, {"Children At Home", Int64.Type}, {"Education", type text}, {"Occupation", type text}, {"House Ownership", type text}, {"Cars Owned", Int64.Type}, {"Continent", type text}, {"City", type text}, {"State", type text}, {"CountryRegion", type text}, {"Address Line 1", type text}, {"Address Line 2", type text}, {"Phone", type text}, {"Customer Type", type text}, {"Company Name", type text}}),
    #"Parsed Date" = Table.TransformColumns(#"Changed Type",{{"Birth Date", each Date.From(DateTimeZone.From(_)), type date}, {"Date First Purchase", each Date.From(DateTimeZone.From(_)), type date}})
in
    #"Parsed Date"