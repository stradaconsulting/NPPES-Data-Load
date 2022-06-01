IF DB_ID('medical_data') IS NOT NULL
   print 'The medical_data database already exists'
ELSE
   CREATE DATABASE [medical_data];
GO
