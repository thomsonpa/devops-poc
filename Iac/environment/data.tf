data "template_file" "iam_policy" {
    template = file("policy_template/policy.json")
}
data "template_file" "iam_role" {
    template = file("policy_template/role_policy.json")
}
data "template_file" "user_data" {
    template = file("user_data/user_data.tmpl")
    vars = {
        cluster_name = var.ecs_name
    }
}
data "template_file" "ecs_task_definition" {
    template = file ("task_definitions/ecs_task_definition.json")
}
data "template_file" "nginx_task_definition" {
    template = file ("task_definitions/nginx_definition.json")
}
data "template_file" "ecs_policy" {
    template = file("policy_template/ecs_policy.json")
}
data "template_file" "ecs_role" {
    template = file("policy_template/ecs_role_policy.json")
}