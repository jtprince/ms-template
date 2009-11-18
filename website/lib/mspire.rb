# This file can be updated from: 
# http://github.com/jtprince/ms-template/raw/master/website/lib/mspire.rb

# returns a hash with navigation links.  These are all based on the return
# value from `git config --get remote.origin.url`
def package_global_navigation_links
  gitrepo = `git config --get remote.origin.url`
  (user, project) = gitrepo.split(':').last.split('/',2)
  project.sub!(/\.git$/,'')
  github_base = "http://github.com/#{user}/#{project}"
  {
    'Intro' => "/#{project}/",
    'Source' => github_base,
    'API' => github_base + "/rdoc/",
    'Issues' => github_base + "/issues/",
    'Wiki' => "http://wiki.github.com/#{user}/#{project}"
  }
end

def package_name
  gitrepo = `git config --get remote.origin.url`
  gitrepo.split(':').last.split('/',2).last.sub(/\.git$/, '')
end

def github_username
  gitrepo = `git config --get remote.origin.url`
  gitrepo.split(':').last.split('/',2).first
end

def other_links
  { 'mspire' => 'http://jtprince.github.com/mspire/',
    'tap' => 'http://tap.rubyforge.org/' }
end



