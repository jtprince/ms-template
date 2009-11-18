# This file can be updated from: 
# http://github.com/jtprince/ms-template/raw/master/website/lib/mspire.rb

module Mspire
  module_function

  # returns the user and the project absed on the reponse from `git config --get remote.origin.url`
  def user_and_project
    gitrepo = `git config --get remote.origin.url`
    (user, project) = gitrepo.split(':').last.split('/',2)
    project.sub!(/\.git$/,'')
    [user, project]
  end

  # returns a hash with navigation links.  These are all based on the return
  # value from 
  def package_global_navigation_links
    [
      ['Intro', website_base + "/"],
      ['Source', github_base],
      ['API', github_base + "/rdoc/"],
      ['Issues', github_base + "/issues/"],
      ['Wiki', wiki_base + "/"]
    ]
  end

  # http://wiki.github.com/<user>/<project>
  def wiki_base
    (user, project) = user_and_project
    "http://wiki.github.com/#{user}/#{project}"
  end

  # http://github.com/<user>/<project>
  def github_base
    (user, project) = user_and_project
    "http://github.com/#{user}/#{project}"
  end

  # http://<user>.github.com/<project>
  def website_base
    (user, project) = user_and_project
    "http://#{user}.github.com/#{project}"
  end

  def package_name
    user_and_project.last
  end

  def github_username
    gitrepo = `git config --get remote.origin.url`
    gitrepo.split(':').last.split('/',2).first
  end

  def other_links
    [ [ 'mspire', 'http://jtprince.github.com/mspire/'],
      [ 'tap', 'http://tap.rubyforge.org/']  ] 
  end

  def template_base_url
    'http://jtprince.github.com/ms-template'
  end

  def mspire_site
    'http://jtprince.github.com/mspire'
  end
end
