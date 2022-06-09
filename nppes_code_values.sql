-- NPPES Code Table Values as per the NPPES_Data_Dissemination_CodeValues.pdf document
-- Includes table creation, indexes, Foreign Key and data population scripts
-- It should be noted that not everything may have a Foreign Key.  The State table in particular contains
-- much more than the US State codes.  There are full names of regions, states and countries from other parts
-- of the world.

--The references shown here (eg, 1.1) are taken from the source document.


---------------------------------------
--  1.1 Entity Type Codes 
---------------------------------------
   If OBJECT_ID('npi_entity_type', 'U') IS NOT NULL
      DROP TABLE [npi_entity_type]
   GO
   
   CREATE TABLE [dbo].[npi_entity_type] (
      [Entity_Type_Code]       int,
      [Entity_Type_Description] varchar(50)
   )

   CREATE INDEX npi_entity_type_idx on [dbo].[npi_entity_type] (Entity_Type_Code);
   GO

   INSERT INTO npi_entity_type
      (Entity_Type_Code,
       Entity_Type_Description)
   VALUES 
      (1,
       'Individual'); 

   INSERT INTO npi_entity_type
      (Entity_Type_Code,
       Entity_Type_Description)
   VALUES 
      (2,
       'Organization'); 


---------------------------------------
--  1.2 Sole Proprietor Codes 
---------------------------------------
   If OBJECT_ID('npi_proprietor', 'U') IS NOT NULL
      DROP TABLE [npi_proprietor]
   GO

   CREATE TABLE [dbo].[npi_proprietor] (
      [Sole_Proprietor_Code]  varchar(1), 
      [Sole_Proprietor_Desc]  varchar(20)
   )

   INSERT INTO [dbo].[npi_proprietor] 
     ([Sole_Proprietor_Code], 
      [Sole_Proprietor_Desc])
   VALUES 
     ('X',
      'Not Answered')

   INSERT INTO [dbo].[npi_proprietor] 
     ([Sole_Proprietor_Code], 
      [Sole_Proprietor_Desc])
   VALUES
     ('Y',
      'Yes')

   INSERT INTO [dbo].[npi_proprietor] 
     ([Sole_Proprietor_Code], 
      [Sole_Proprietor_Desc])
   VALUES
     ('N',
      'No')

---------------------------------------
--  1.3 Subpart Codes
---------------------------------------
   If OBJECT_ID('npi_subpart', 'U') IS NOT NULL
      DROP TABLE [npi_subpart]
   GO

   CREATE TABLE [dbo].[npi_subpart] (
      [Subpart_Code]  varchar(1), 
      [Subpart_Desc]  varchar(20)
   )

   INSERT INTO [dbo].[npi_subpart] 
      ([Subpart_Code],
       [Subpart_Desc])
   VALUES
      ('X',
       'Not Answered')

   INSERT INTO [dbo].[npi_subpart] 
      ([Subpart_Code],
       [Subpart_Desc])
   VALUES
      ('Y',
       'Yes')

   INSERT INTO [dbo].[npi_subpart] 
      ([Subpart_Code],
       [Subpart_Desc])
   VALUES
      ('N',
       'No')

---------------------------------------
--  1.4 Gender Codes
---------------------------------------
   If OBJECT_ID('npi_gender', 'U') IS NOT NULL
      DROP TABLE [npi_gender]
   GO

   CREATE TABLE [dbo].[npi_gender] (
      [Gender_Code] varchar(1),
      [Gender_Desc] varchar(6)
   )

   INSERT INTO [dbo].[npi_gender]
      ([Gender_Code], 
       [Gender_Desc])
   VALUES
      ('M',
       'Male')

   INSERT INTO [dbo].[npi_gender]
      ([Gender_Code], 
       [Gender_Desc])
   VALUES
      ('F',
       'Female')



---------------------------------------
--  1.5 Deactivation Reason Codes
---------------------------------------

  --The fields NPI_Deactivation_Reason_Code does not seem to be populated
  --and according to the documentaiton, there are no codes used as the description
  --would be used directly as a value. No reference table is needed.



-----------------------------------------
--  1.6 Other Provider Name Type Codes 
-----------------------------------------
   If OBJECT_ID('npi_other_provider_name_type', 'U') IS NOT NULL
      DROP TABLE [npi_other_provider_name_type]
   GO

   CREATE TABLE [dbo].[npi_other_provider_name_type](
       [Name_Type_Code]  varchar(1),
       [Name_Type_Desc]  varchar(26),
       [Entity Name Type Code] varchar(20)
   ) 

   INSERT INTO [dbo].[npi_other_provider_name_type]
      ([Name_Type_Code],
       [Name_Type_Desc],
       [Entity Name Type Code]) 
   VALUES
       ('1',
        'Former Name',
        'I - Individual')

   INSERT INTO [dbo].[npi_other_provider_name_type]
      ([Name_Type_Code],
       [Name_Type_Desc],
       [Entity Name Type Code]) 
   VALUES
       ('2',
        'Professional Name',
        'I - Individual')

   INSERT INTO [dbo].[npi_other_provider_name_type]
      ([Name_Type_Code],
       [Name_Type_Desc],
       [Entity Name Type Code]) 
   VALUES
       ('3',
        'Doing Business As',
        'O - Organization')

   INSERT INTO [dbo].[npi_other_provider_name_type]
      ([Name_Type_Code],
       [Name_Type_Desc],
       [Entity Name Type Code]) 
   VALUES
       ('4',
        'Former Legal Business Name',
        'O - Organization')

   INSERT INTO [dbo].[npi_other_provider_name_type]
      ([Name_Type_Code],
       [Name_Type_Desc],
       [Entity Name Type Code]) 
   VALUES
       ('5',
        'Other Name',
        'B - Both')


-------------------------------------
--  1.7 Name Prefix Codes
-------------------------------------

  --It is not necessary to create this reference table because the codes
  --are exactly the same as the descriptions. For example 'Mr.' maps to 'Mr.'

-------------------------------------
--  1.8 Name Suffix Codes
-------------------------------------

  --It is not necessary to create this reference table because the codes
  --are exactly the same as the descriptions. For example 'Jr.' maps to 'Jr.'

-------------------------------------
--  1.9 State Codes
-------------------------------------
   If OBJECT_ID('npi_state', 'U') IS NOT NULL
      DROP TABLE [npi_state]
   GO

   CREATE TABLE [dbo].[npi_state](
      [State_Reference_Code] varchar(2),
      [State_Name]           varchar(50),
      [State_Type_Code]      varchar(1)
   )

  --NB - Load will be done by BCP command line command elsewhere using
  --     the npi_state.dat data file


-------------------------------------
--  1.10 Country Codes
-------------------------------------
   If OBJECT_ID('npi_country', 'U') IS NOT NULL
      DROP TABLE [npi_country]
   GO

   CREATE TABLE [dbo].[npi_country](
      [Country_Code] varchar(2),
      [Country_Name] varchar(50)
   )

  --NB - Load will be done by BCP command line command elsewhere using
  --     the npi_country.dat data file

--------------------------------------------------
--  1.11 Other Provider Identifirer Issuer Codes
--------------------------------------------------
   If OBJECT_ID('npi_other_provider_issuer', 'U') IS NOT NULL
      DROP TABLE [npi_other_provider_issuer]
   GO

   CREATE TABLE [dbo].[npi_other_provider_issuer](
      [Other_Provider_Type_Code] varchar(2),
      [Other_Provider_Type_Desc] varchar(8)
   )

   INSERT INTO [dbo].[npi_other_provider_issuer]
      ([Other_Provider_Type_Code],
       [Other_Provider_Type_Desc])
   VALUES
      ('01',
       'OTHER')

   INSERT INTO [dbo].[npi_other_provider_issuer]
      ([Other_Provider_Type_Code],
       [Other_Provider_Type_Desc])
   VALUES
      ('05',
       'MEDICAID')

Other_Provider_Identifier_Type_Code varchar(2)

-------------------------------------
--  1.12 Taxonomy Codes
-------------------------------------
   --Taxonomy codes are handled in its own script since it requires downloading
   --directly from the source site and transforming before being loaded

-------------------------------------
-- 1.13 Primary Taxonomy 
-------------------------------------
   If OBJECT_ID('npi_primary_taxonomy', 'U') IS NOT NULL
      DROP TABLE [npi_primary_taxonomy]
   GO

   CREATE TABLE [dbo.][npi_primary_taxonomy(
      [Primary_Taxonomy_Switch_Code].[
   )
Primary_Taxoinomy_Switch_Code varchar(1)

-------------------------------------
-- 1.14 Postal Codes
-------------------------------------

   --No reference chart needed as these are ZIP codes and are self-referencing

-------------------------------------
-- 1.15 Group Taxonomy
-------------------------------------
   If OBJECT_ID('npi_group_taxonomy', 'U') IS NOT NULL
      DROP TABLE [npi_group_taxonomy]
   GO


group_taxonomy_code varchar(10)


-------------------------------------
-- 1.16 Endpoint Type Codes
-------------------------------------
   If OBJECT_ID('npi_endpoint_type', 'U') IS NOT NULL
      DROP TABLE [npi_endpoint_type]
   GO


endpoint_type varchar(7)

-------------------------------------
-- 1.17 Endpoint Affiliation
-------------------------------------
   If OBJECT_ID('npi_endpoint_affiliation', 'U') IS NOT NULL
      DROP TABLE [npi_endpoint_affiliation]
   GO

endpoint_affiliation_code varchar(1)

