
name 'git_ppa'

default_source :supermarket

run_list "git_ppa::default"
cookbook 'git_ppa', path: '.'
