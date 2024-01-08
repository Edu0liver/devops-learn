
resource "local_file" "exemplo" {
  filename = "test.txt"
  content  = var.content
}

variable "content" {
  type = string
  default = "Hello World!"
}

output "file-id" {
  value = resource.local_file.exemplo.id
}

output "file-content" {
  value = resource.local_file.exemplo.content
}

data "local_file" "data-source-exemplo" {
  filename = "test.txt"
}

output "data-source-file-content" {
  value = data.local_file.data-source-exemplo.content
}