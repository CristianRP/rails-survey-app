# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@fortawesome/fontawesome-free', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.5.1/js/fontawesome.js'
pin '@fortawesome/fontawesome-svg-core', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.5.1/index.mjs'
pin '@fortawesome/free-brands-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.5.1/index.mjs'
pin '@fortawesome/free-regular-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-regular-svg-icons@6.5.1/index.mjs'
pin '@fortawesome/free-solid-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-solid-svg-icons@6.5.1/index.mjs'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.esm.js'
