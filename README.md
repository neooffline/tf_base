# tf_base
Terraform Base Homework

Outputs
Для вывода данных после применения конфигурации, используется конструкция outputs (как говорилось в уроке). Ее удобно применять, когда нужно вернуть какие-то параметры созданной инфраструктуры, например IP адреса, по которым можно подключиться к виртуальным машинам. В этом задании мы научимся это делать.

1. Измените конфигурацию виртуальных машин в проекте, чтобы у них были белые IP адреса (см документацию к ресурсу yandex_compute_instance)
2. Добавьте вывод белых IP адресов виртуальных машин с помощью outputs.
3. После создания инфраструктуры попробуйте подключиться к виртуальным машинам по SSH по выведенным IP
4. По завершении задания, удалите инфраструктуру