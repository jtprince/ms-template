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
    'Intro' => '/',
    'Source' => github_base,
    'API' => github_base + "/rdoc/",
    'issues' => github_base + "/issues/",
    'WIKI' => "http://wiki.github.com/#{user}/#{project}"
  }
end

def other_links
  { 'mspire' => 'http://jtprince.github.com/mspire/',
    'tap' => 'http://tap.rubyforge.org/' }
end



