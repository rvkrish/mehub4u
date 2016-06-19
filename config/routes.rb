Rails.application.routes.draw do
 
  
  resources :keys
  resources :assignments
  resources :assignment_trackings
  # get 'keys/index'

  resources :keys

  resources :project_tackings
  resources :projects
  get 'welcome/index'

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
 

  get 'home_pages/index'
  get 'paypal_payment/index'
  get 'paypal_payment/return_url'
  get 'paypal_payment/cancle_url'
  get 'paypal_payment/send_payment'
  post 'paypal_payment/send_payment'
  get 'paypal_payment/index'
  
  
  authenticated :user , lambda {|u| u.has_role? :admin} do
      root "admin#index", :as => "admin_root"
      get 'admin/index'
       resources :videos
      resources :teachers
      resources :students
      resources :courses
      resources :student_courses
  end
  authenticated :user, lambda {|u| u.has_role? :student} do
       root "welcome#welcome_student", :as => "student_root"
       get 'welcome/welcome_student'
       get "courses/available_courses", :as => "available_courses"
       get "/students/add_course"
       get 'videos/display_video'
       get 'videos/list_video'
       get 'student_front_page/pdf'
       get 'student_front_page/video'
       get 'student_front_page/certification'
       get 'student_front_page/write_exam'
       get 'student_front_page/schedule_exam'
       get 'student_front_page/view_report'
       get 'student_front_page/share_thoughts'
       get 'student_front_page/chat_rooms'
       get 'student_front_page/groups'
       get 'student_front_page/make_a_note'
       get 'student_front_page/upcomming_events'
       get 'student_front_page/university_syllabus'
       get 'student_front_page/help_desk'
       get 'student_front_page/settings'
       get 'student_front_page/projects'
       get 'student_front_page/assignments'
  end
  authenticated :user, lambda {|u| u.has_role? :teacher} do
       root "welcome#welcome_teacher", :as => "teacher_root"
       get 'welcome/welcome_teacher'
  end
  authenticated :user do
    root "welcome#index", :as => "welcome_root"
    post "students" => "students#create"
    post "teachers" => "teachers#create"
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  unauthenticated do
    root 'home_pages#index'
  end

  get '*path' => redirect('/')

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
