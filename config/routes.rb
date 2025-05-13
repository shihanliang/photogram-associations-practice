Rails.application.routes.draw do
  # Home page should redirect to /users
  get("/", { controller: "users", action: "index" })

  # User routes
  get("/users", { controller: "users", action: "index" })
  get("/users/:username", { controller: "users", action: "show" })
  post("/insert_user", { controller: "users", action: "create" })       # ✔️ 改成 insert_user
  post("/update_user/:username", { controller: "users", action: "update" })  # ✔️ username 是主键

  # Photo routes
  get("/photos", { controller: "photos", action: "index" })
  get("/photos/:path_id", { controller: "photos", action: "show" })     # ✔️ id 改成 path_id，统一风格
  get("/delete_photo/:path_id", { controller: "photos", action: "destroy" }) # ✔️ action 改成 destroy
  post("/insert_photo", { controller: "photos", action: "create" })     # ✔️ 改名 insert_photo
  post("/update_photo/:path_id", { controller: "photos", action: "update" })

  # Comment routes
  post("/insert_comment", { controller: "comments", action: "create" }) # ✔️ 移到 comments 控制器
end
