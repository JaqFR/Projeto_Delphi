object DM_Cliente: TDM_Cliente
  OldCreateOrder = False
  Height = 81
  Width = 302
  object CDSCliente: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSPCliente'
    Left = 168
    Top = 16
    object CDSClienteIDCLIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSClienteDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object CDSClienteTIPOPESSOA: TStringField
      FieldName = 'TIPOPESSOA'
      Size = 1
    end
    object CDSClienteRAZAOSOCIAL_NOME: TStringField
      FieldName = 'RAZAOSOCIAL_NOME'
      Size = 80
    end
    object CDSClienteNOMEFANTASIA_APELIDO: TStringField
      FieldName = 'NOMEFANTASIA_APELIDO'
      Size = 80
    end
    object CDSClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object CDSClienteIE_RG: TStringField
      FieldName = 'IE_RG'
    end
    object CDSClienteSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object CDSClienteDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object CDSClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object CDSClienteNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object CDSClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object CDSClienteCEP: TStringField
      FieldName = 'CEP'
      EditMask = '99999\-999;0;_'
      Size = 10
    end
    object CDSClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object CDSClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object CDSClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object CDSClienteTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      EditMask = '!\(99\)0000-0000;0;_'
      Size = 15
    end
    object CDSClienteTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      EditMask = '!\(99\)0000-0000;0;_'
      Size = 15
    end
    object CDSClienteCELULAR1: TStringField
      FieldName = 'CELULAR1'
      EditMask = '!\(99\)0000-0000;0;_'
      Size = 15
    end
    object CDSClienteCELULAR2: TStringField
      FieldName = 'CELULAR2'
      EditMask = '!\(99\)0000-0000;0;_'
      Size = 15
    end
    object CDSClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object CDSClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object CDSClientetotal: TAggregateField
      FieldName = 'TOTAL'
      Active = True
      Expression = 'count(idcliente)'
    end
  end
  object DSCliente: TDataSource
    AutoEdit = False
    DataSet = CDSCliente
    Left = 240
    Top = 16
  end
  object DSPCliente: TDataSetProvider
    DataSet = SQLCliente
    Constraints = False
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 16
  end
  object SQLCliente: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select * from cliente'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 24
    Top = 16
    object SQLClienteIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLClienteDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object SQLClienteTIPOPESSOA: TStringField
      FieldName = 'TIPOPESSOA'
      Size = 1
    end
    object SQLClienteRAZAOSOCIAL_NOME: TStringField
      FieldName = 'RAZAOSOCIAL_NOME'
      Size = 80
    end
    object SQLClienteNOMEFANTASIA_APELIDO: TStringField
      FieldName = 'NOMEFANTASIA_APELIDO'
      Size = 80
    end
    object SQLClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
    object SQLClienteIE_RG: TStringField
      FieldName = 'IE_RG'
    end
    object SQLClienteSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object SQLClienteDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object SQLClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 80
    end
    object SQLClienteNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object SQLClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 80
    end
    object SQLClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object SQLClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object SQLClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object SQLClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object SQLClienteTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Size = 15
    end
    object SQLClienteTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object SQLClienteCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Size = 15
    end
    object SQLClienteCELULAR2: TStringField
      FieldName = 'CELULAR2'
      Size = 15
    end
    object SQLClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 80
    end
    object SQLClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
  end
end
