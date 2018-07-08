ActiveAdmin.setup do |config|
  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      # menu.add label: proc { menu_label('Analytics', icon: 'dashboard-29') },
      #          id: 'analytics',
      #          priority: 1

      menu.add label: proc { menu_label('Inbox', icon: 'file-download-89') },
               id: 'inbox',
               priority: 40
    end

    admin.build_menu :utility_navigation do |menu|
      menu.add  label: proc { menu_label(current_admin_user.email, icon: 'circle-08') },
                id: 'current_admin_user',
                priority: 99

      menu.add  label: proc { menu_label('Site Settings', icon: 'settings-gear-65') },
                id: 'settings',
                priority: 98

      menu.add  label: proc { menu_label('Admin Users') },
                id: 'admin_users',
                url: proc { admin_admin_users_path },
                priority: 98,
                parent: 'settings'

      menu.add  label: proc { menu_label('Profile') },
                id: 'profile',
                url: proc { edit_admin_admin_user_path(current_admin_user) },
                priority: 1,
                parent: 'current_admin_user'

      menu.add  label: proc { menu_label('Log Out') },
                id: 'logout',
                url: proc { destroy_admin_user_session_path },
                priority: 2,
                parent: 'current_admin_user'
    end
  end
end
