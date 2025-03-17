# Função para excluir arquivos das pastas temporarias

function LimparPasta {
    param (
        [string]$caminho
    )

    if (Test-Path $caminho){
        Write-Output "Limpando: $caminho"

        #Exclui arquivos
        Get-ChildItem -Path $caminho -File -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
        #Excluir pastas
        Get-ChildItem =-Path $caminho -Directory -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue

        Write-Output "Limpeza finalizada para: $caminho"      
    }else{
    Write-Error "Caminho não encontrato"
    }
}

# limpar a pasta Temp
LimparPasta "C:\Windows\Temp"

#Pegar todos os usuarios
$usuarios = Get-ChildItem -Path "C:\Users" -Directory | Select-Object -ExpandProperty Name

#Limpa pasta de cada uruario
foreach($usuario in $usuarios){
    $caminhoTemp ="C:\Users\$usuario\AppData\Local\Temp"
    LimparPasta $caminhoTemp
}

Write-Output "Limpeza concluida"
