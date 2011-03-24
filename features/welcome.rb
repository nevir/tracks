remove_file 'public/index.html'

after_bundle do
  generate 'controller welcome home'
  route "root :to => 'welcome#home'"
end
