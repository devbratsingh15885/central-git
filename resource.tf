resource "azurerm_resource_group" "Jawani_jane_man" {
    for_each=var.dev_rg
  name     = each.value.test_rg
  location =each.value.location
}
resource "azurerm_storage_account" "Storage_account1585"{
    for_each=var.dev_rg
  name                     = each.key
  resource_group_name      = each.value.test_rg
  location                 = each.value.location
  account_tier             = each.value.tier
  account_replication_type = each.value.account
  depends_on = [ azurerm_resource_group.Jawani_jane_man ]
}