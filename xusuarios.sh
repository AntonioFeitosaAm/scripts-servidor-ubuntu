#!/bin/bash

# Função para exibir o menu de opções
exibir_menu() {
    clear
    echo "----- Menu de Administração de Usuários -----"
    echo "1. Adicionar usuário"
    echo "2. Remover usuário"
    echo "3. Listar usuários"
    echo "4. Usuarios logados"
    echo "0. Sair"
    echo "-------------------------------------------"
}

function aguarde() {
  read -p "Pressione qualquer tecla para continuar..." tecla

}

# Função para adicionar um novo usuário
adicionar_usuario() {
    echo -n "Digite o nome do novo usuário: "
    read novo_usuario
    sudo adduser $novo_usuario
    aguarde
}

# Função para remover um usuário
remover_usuario() {
    echo -n "Digite o nome do usuário a ser removido: "
    read usuario_remover
    sudo deluser --remove-home $usuario_remover
    aguarde
}

# Função para listar todos os usuários
listar_usuarios() {
    echo "Lista de usuários:"
    cut -d: -f1 /etc/passwd
    aguarde
}

logados() {
  while true; do
    clear
    echo "Usuários logados na máquina local e seus respectivos IPs:"
    echo "---------------------------------------------------------"
    who | awk '{print $1, $5}'
    sleep 30  # intervalo de atualização em segundos (pode ser ajustado)
done


}

# Loop do menu
while true; do
    exibir_menu

    echo -n "Digite o número da opção desejada: "
    read opcao

    case $opcao in
        1)  adicionar_usuario;;
        2)  remover_usuario;;
        3)  listar_usuarios;;
        4)  logados;;
        0)  exit 0;;
        *)  echo "Opção inválida"
            aguarde ;;
    esac

    echo # Linha em branco para melhorar a visualização
done
