object dtm: Tdtm
  OldCreateOrder = False
  Height = 270
  Width = 601
  object PortariaConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Portaria')
    Connected = True
    LoginPrompt = False
    Left = 83
    Top = 40
  end
  object VeiculoTable: TFDQuery
    Active = True
    Connection = PortariaConnection
    SQL.Strings = (
      'SELECT * FROM VEICULO')
    Left = 267
    Top = 43
    object VeiculoTableCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
      Origin = 'COD_VEICULO'
      Required = True
    end
    object VeiculoTableMARCA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 50
    end
    object VeiculoTableMODELO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 50
    end
    object VeiculoTablePLACA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLACA'
      Origin = 'PLACA'
      EditMask = '!aaa-aaaa;1;_'
      Size = 10
    end
  end
  object MovimentoTable: TFDQuery
    Active = True
    Connection = PortariaConnection
    SQL.Strings = (
      'SELECT * FROM MOVIMENTO')
    Left = 462
    Top = 67
    object MovimentoTableID_MOVIMENTO: TIntegerField
      FieldName = 'ID_MOVIMENTO'
      Origin = 'ID_MOVIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MovimentoTableCOD_VISITANTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_VISITANTE'
      Origin = 'COD_VISITANTE'
    end
    object MovimentoTableNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object MovimentoTableCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object MovimentoTableCOD_VEICULO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'COD_VEICULO'
      Origin = 'COD_VEICULO'
    end
    object MovimentoTableMARCA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 50
    end
    object MovimentoTableMODELO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 50
    end
    object MovimentoTablePLACA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Size = 10
    end
    object MovimentoTableHORA_ENTRADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'HORA_ENTRADA'
      Origin = 'HORA_ENTRADA'
      Size = 10
    end
    object MovimentoTableHORA_SAIDA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
      Size = 10
    end
    object MovimentoTableMOTIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
      Size = 100
    end
    object MovimentoTableDATA: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA'
      Origin = 'DATA'
    end
  end
  object VisitanteTable: TFDQuery
    Active = True
    Connection = PortariaConnection
    SQL.Strings = (
      'SELECT * FROM VISITANTE')
    Left = 197
    Top = 47
    object VisitanteTableCOD_VISITANTE: TIntegerField
      FieldName = 'COD_VISITANTE'
      Origin = 'COD_VISITANTE'
      Required = True
    end
    object VisitanteTableNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object VisitanteTableDATA_NASCIMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
      EditMask = '!99/99/0000;1;_'
      Size = 10
    end
    object VisitanteTableCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '000\.000\.000\-00;1;_'
      Size = 14
    end
  end
end
