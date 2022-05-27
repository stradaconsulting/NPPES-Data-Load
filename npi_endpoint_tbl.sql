USE NPPES

-- Create NPI Endpoint table


   If OBJECT_ID('npi_endpoint', 'U') IS NOT NULL
      DROP TABLE [npi_endpoint]
   GO
   
   CREATE TABLE [dbo].[npi_endpoint] (
      [NPI]                             numeric(18,0),
      [Endpoint_Type]                   varchar(7),
      [Endpoint_Type_Description]       varchar(24),
      [Endpoint]                        varchar(1000),
      [Affiliation]                     varchar(1),
      [Endpoint_Description]            varchar(1000),
      [Affiliation_Legal_Business_Name] varchar(200),
      [Use_Code]                        varchar(6),
      [Use_Description]                 varchar(50),
      [Other_Use_Description]           varchar(200),
      [Content_Type]                    varchar(5),
      [Content_Description]             varchar(5),
      [Other_Content_Description]       varchar(200),
      [Affiliation_Address_Line_One]    varchar(55),
      [Affiliation_Address_Line_Two]    varchar(55),
      [Affiliation_Address_City]        varchar(40),
      [Affiliation_Address_State]       varchar(40),
      [Affiliation_Address_Country]     varchar(2),
      [Affiliation_Address_Postal_Code] varchar(20)

   )

   CREATE INDEX npi_endpoint_idx on [dbo].[npi_endpoint] (NPI);
   GO
