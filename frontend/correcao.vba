Function CORRECAOK8S() As String
    Dim Nome As String
    Dim Funciona As Boolean
    Dim HPA As Boolean
    Dim FachadaUnica As Boolean
    Dim OutrosHosts As Boolean
    Dim UsaIngress As Boolean
    Dim OutrosBonus As Boolean
    Dim MultiplasInstancias As Boolean
    Dim ExplicaUpdateComTag As Boolean
    Dim HealthCheck As Boolean
    Dim DescreveOsComponentes As Boolean
    Dim DescreveComoExecutar As Boolean
    Dim Texto As String

    ' ObtÃ©m a linha atual
    Linha = Application.Caller.Row

    ' Pega os valores das colunas especÃ­ficas
    Nome = Cells(Linha, 1).Value ' Nome do Aluno
    Funciona = Cells(Linha, 5).Value
    HPA = Cells(Linha, 6).Value
    FachadaUnica = Cells(Linha, 8).Value
    OutrosHosts = Cells(Linha, 9).Value
    UsaIngress = Cells(Linha, 10).Value
    OutrosBonus = Cells(Linha, 12).Value
    MultiplasInstancias = Cells(Linha, 13).Value
    ExplicaUpdateComTag = Cells(Linha, 14).Value
    HealthCheck = Cells(Linha, 17).Value
    DescreveOsComponentes = Cells(Linha, 18).Value
    DescreveComoExecutar = Cells(Linha, 19).Value

    ' Inicializa o texto com o nome do aluno
    Texto = "Caro " & Nome & "," & vbCrLf

    Texto = Texto & "Seu projeto " & IsOk(Funciona) & "funcionou corretamente. " & vbCrLf
    Texto = Texto & "Um dos requisitos era que o nginx atuasse como proxy proporcionando um único ponto de entrada e você  " & IsOk(FachadaUnica) & "cumpriu." & vbCrLf
    Texto = Texto & "você  " & IsOk(HealthCheck) & "implementou um HealthCheck funcional."
    If HealthCheck Then
        Texto = Texto & vbCrLf
    Else
        Texto = Texto & " Além de defini-lo, seria necessário configurar o resources do container para ele poder saber sobre o que atuar" & vbCrLf
    End If

    Texto = Texto & "Sua documentação " & IsOk(DescreveOsComponentes) & " descreve os componentes utilizados, "
    If DescreveComoExecutar Then
        Texto = Texto & " você  descreveu como executar o projeto e utilizá-lo, isso também era requisito. "
    Else
        Texto = Texto & " porem você  não descreveu como executar o projeto e utilizá-lo, isso também era requisito. "
    End If

    Texto = Texto & "Verifiquei que vocÃª " & IsOk(MultiplasInstancias) & "configurou múltiplas instâncias de backend, era requisito conforme o projeto anterior no Docker Compose." & vbCrLf


     If OutrosHosts Or OutrosBonus Or UsaIngress Or ExplicaUpdateComTag Then
        Texto = Texto & "Como bô´nus avaliei outros pontos. "
        If OutrosHosts Then Texto = Texto & " Você configurou de forma que no somente um host declarado no build do front funcionasse, utilizando um caminho relativo no REACT_BACKEND_URL. " & vbCrLf
        If UsaIngress Then Texto = Texto & " Você usou Ingress para gerenciar a entrada no cluster." & vbCrLf
        If OutrosBonus Then Texto = Texto & " Criou um chart Helm para instalar o sistema " & vbCrLf
        If ExplicaUpdateComTag Then Texto = Texto & " Explicou o processo de atualização usando outra tag no deployment. " & vbCrLf
    End If
    
    If Not (Funciona) Or Not (HPA) Or Not (FachadaUnica) Or Not (HealthCheck) Or Not (DescreveComoExecutar) Or Not (MultiplasInstancias) Or Not (DescreveOsComponentes) Then
        Texto = Texto & "Revise o que pontuei para um melhor entendimento do kubernetes." & vbCrLf
    End If
    If Not (OutrosBonus) Or Not (UsaIngress) Or Not (ExplicaUpdateComTag) Then
        Texto = Texto & "Outros pontos que Você ª poderia ter abordado foram: " & vbCrLf
        If Not (OutrosBonus) Then Texto = Texto & " - Implementar corretamente um Helm chart." & vbCrLf
        If Not (UsaIngress) Then Texto = Texto & " - Utilizar o ingress controller para a única fachada." & vbCrLf
        If Not (ExplicaUpdateComTag) Then Texto = Texto & " - Explicar como utilizar tags para o rolling update." & vbCrLf
        If Not (OutrosHosts) Then Texto = Texto & " - Preparar o projeto para funcionar sem depender de uma única url, utilizando um caminho relativo no REACT_BACKEND_URL."
    End If
    ' Retorna o texto gerado
    CORRECAOK8S = Texto
End Function


Function IsOk(v As Boolean)
    If v Then IsOk = "não "
End Function