locals {
    ambiente                = lookup(var.ambiente,var.env)
    server_sku_name         = lookup(var.tamanho_servidor,var.env)
    reundancia_regiao_backup = var.env == "p" ? true : var.reundancia_regiao_backup
    db_storage_auto_grow    = var.env == "p" ? true : var.db_storage_auto_grow

    tags = {
        env         = var.env
        ambiente    = local.ambiente
        sistema     = var.nome_sistema
    }
}