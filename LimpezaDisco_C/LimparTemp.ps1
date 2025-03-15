# Função para excluir arquivos das pastas temporarias

function LimparPasta {
    param (
        [string]$caminho
    )

    if (Test-Path $caminho){

    }else{
    Write-Error "Caminho não encontrato"
    }
}