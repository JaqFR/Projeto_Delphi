object DM_Veiculo: TDM_Veiculo
  OldCreateOrder = False
  Height = 77
  Width = 297
  object DSPVeiculo: TDataSetProvider
    DataSet = SQLVeiculo
    Constraints = False
    UpdateMode = upWhereKeyOnly
    Left = 95
    Top = 16
  end
  object CDSVeiculo: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DSPVeiculo'
    Left = 167
    Top = 16
    object CDSVeiculoIDVEICULO: TIntegerField
      FieldName = 'IDVEICULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSVeiculoPLACA: TStringField
      FieldName = 'PLACA'
      EditMask = 'LLL-9999;0;_'
      Size = 8
    end
    object CDSVeiculoVEICULO: TStringField
      FieldName = 'VEICULO'
      Size = 80
    end
    object CDSVeiculoANO: TIntegerField
      FieldName = 'ANO'
    end
    object CDSVeiculoMARCA: TStringField
      FieldName = 'MARCA'
      Size = 80
    end
    object CDSVeiculoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 80
    end
    object CDSVeiculoCOR: TStringField
      FieldName = 'COR'
      Size = 80
    end
    object CDSVeiculoCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      Size = 1
    end
    object CDSVeiculoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object CDSVeiculoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object CDSVeiculoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object CDSVeiculoRAZAOSOCIAL_NOME: TStringField
      FieldName = 'RAZAOSOCIAL_NOME'
      ProviderFlags = []
      Size = 80
    end
    object CDSVeiculototal: TAggregateField
      FieldName = 'TOTAL'
      Active = True
      Expression = 'count(idveiculo)'
    end
  end
  object DSVeiculo: TDataSource
    AutoEdit = False
    DataSet = CDSVeiculo
    Left = 236
    Top = 16
  end
  object SQLVeiculo: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'select v.*, cli.RAZAOSOCIAL_NOME'#13#10#13#10'from veiculo v '#13#10#13#10'left oute' +
      'r join CLIENTE cli '#13#10'on cli.IDCLIENTE = v.IDCLIENTE'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conexao
    Left = 24
    Top = 16
    object SQLVeiculoIDVEICULO: TIntegerField
      FieldName = 'IDVEICULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLVeiculoPLACA: TStringField
      FieldName = 'PLACA'
      EditMask = 'LLL-9999;0;_'
      Size = 8
    end
    object SQLVeiculoVEICULO: TStringField
      FieldName = 'VEICULO'
      Size = 80
    end
    object SQLVeiculoANO: TIntegerField
      FieldName = 'ANO'
    end
    object SQLVeiculoMARCA: TStringField
      FieldName = 'MARCA'
      Size = 80
    end
    object SQLVeiculoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 80
    end
    object SQLVeiculoCOR: TStringField
      FieldName = 'COR'
      Size = 80
    end
    object SQLVeiculoCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      Size = 1
    end
    object SQLVeiculoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 80
    end
    object SQLVeiculoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object SQLVeiculoIDCLIENTE: TIntegerField
      FieldName = 'IDCLIENTE'
      Required = True
    end
    object SQLVeiculoRAZAOSOCIAL_NOME: TStringField
      FieldName = 'RAZAOSOCIAL_NOME'
      ProviderFlags = []
      Size = 80
    end
  end
end
