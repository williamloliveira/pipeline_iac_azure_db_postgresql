variable "rg" {
    description = "Resource Group que será criado|utilizado na criação dos recursos de banco de dados"
}

variable "regiao" {
    description = "Região ao qual os recursos serão criados"
}

variable "ambiente" {
    type = map
    default = {
        d = "dev",
        h = "hml",
        p = "prd"
    }
}

variable "env" {
    default = "d"

    validation {
        condition = contains(["d","h","p"],var.env)
        error_message = "Argument 'env' must be either 'd' (dev), 'h' (hml) or 'p' (prd)"
    }
}

variable "nome_sistema" {
    description = "Nome do sistema ao qual os recursos serão destinados"
}

variable "storage_account_tier" {
    description = "Tipo de Storage Account que pode ser Standard ou Premium. Por padrão será Standard"
    default = "Standard"
}

variable "storage_account_repl_type" {
    description = "Tipo de Replicação de Storage Account que pode ser LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Por padrão será LRS"
    default = "LRS"
}

variable "admin_user_login" {
    description = "Usuario para logar no servidor e banco de dados"
    default = "admindb"
}

variable "admin_user_passwd" {
    description = "Senha do usuario para logar no servidor e banco de dados"
    sensitive = true
}

variable "db_collation" {
    description = "Collation do banco de dados."
    default = "English_United States.1252"
}

variable "db_charset" {
    description = "Conjunto de caracteres do banco de dados. Por padrão será UTF8"
    default = "UTF8"
}

variable "db_storage_max_size_mb" {
    description = "Tamanho máximo do banco de dados em Megabytes. Por padrão 5120MB"
    default = 5120
}

variable "db_storage_auto_grow" {
    description = "Habilita crescimento automatico de storage."
    default = false
}

variable "tamanho_servidor" {
    description = "Especifica o tipo de perfil do servidor de banco de dados que será criado. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server"
    default = {
        d = "B_Gen4_1",
        h = "B_Gen5_2",
        p = "GP_Gen5_8"
    }
}

variable "versao_postgresql" {
    description = "Versão do PostgreSQL que será utilizado, por padrão será a mais recente disponivel neste momento: 11"
    default = "11"
}

variable "dias_retencao_backup" {
    description = "Quantidade de dias que o backup ficará disponível para ser restaurado. Por padrão 7 dias"
    default = 7
}

variable "reundancia_regiao_backup" {
    description = "Ativa a redundancia de backup para outras região para casos de DR."
    default = false
}