
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "indieweb/post_types/identifier/scrobble/version"

Gem::Specification.new do |spec|
  spec.name          = "indieweb-post_types-identifier-scrobble"
  spec.version       = Indieweb::PostTypes::Identifier::Scrobble::VERSION
  spec.authors       = ["Stephen Rushe"]
  spec.email         = ["posttypes-scrobble@deeden.co.uk"]

  spec.summary       = %q{Identify IndieWeb Microformats 2 posts as scrobbles.}
  spec.description   = %q{IndieWeb Scrobble Post Type Discovery for Microformats 2 JSON.}
  spec.homepage      = "https://github.com/srushe/indieweb-post_types-identifier-scrobble"
  spec.license       = "MIT"

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/srushe/indieweb-post_types-identifier-scrobble/issues',
    'changelog_uri'   => 'https://github.com/srushe/indieweb-post_types-identifier-scrobble/blob/master/CHANGELOG.md',
    'homepage_uri'    => 'https://github.com/srushe/indieweb-post_types-identifier-scrobble/'
  }

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
