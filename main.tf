module "data" {
  source = "./modules/data"
}

module "networks" {
  source = "./modules/networks"

  availability_zone         = var.availability_zone
  open_cidr_block           = var.open_cidr_block
  vpc_cidr_block            = var.vpc_cidr_block
  vpc_private_cidr_block    = var.vpc_private_cidr_block
  vpc_private_cidr_block2   = var.vpc_private_cidr_block2  
  igw_cidr_block            = var.igw_cidr_block
  igw_cidr_block2           = var.igw_cidr_block2
}

module "web" {
  source = "./modules/web"
  depends_on = [module.networks]

  ami                   = var.ami
  region                = var.availability_zone
  instance_type         = var.instance_type
  instance_tag          = var.instance_tag
  key_name              = var.key_name
  security_group        = module.networks.sg_tf_web
  subnet_id             = module.networks.subnet_tf_web
  vpc_id                = module.networks.vpc_id
}
