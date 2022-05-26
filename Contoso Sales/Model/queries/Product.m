let
    Source = Web.Contents(SourceUrl & "Product.csv"),
    Csv = Csv.Document(Source),
    #"Promoted Headers" = Table.PromoteHeaders(Csv, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ProductKey", Int64.Type}, {"Product Code", type text}, {"Product Name", type text}, {"Manufacturer", type text}, {"Brand", type text}, {"Subcategory", type text}, {"Category", type text}, {"Color", type text}})
in
    #"Changed Type"