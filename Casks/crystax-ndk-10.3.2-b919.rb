cask 'crystax-ndk-10.3.2-b919' do
  version '10.3.2-b919'
  sha256 'abbc7109eff96c9a44933297ed4a90b52e8b07b1e392d51f35a013058a0a5fd0'

  url "https://dl.crystax.net/builds/919/darwin/crystax-ndk-10.3.2-b919-darwin-x86_64.tar.xz"
  name 'Crystax NDK'
  homepage 'https://www.crystax.net/android/ndk'

  preflight do
    FileUtils.ln_sf("#{staged_path}/crystax-ndk-10.3.2", "#{HOMEBREW_PREFIX}/share/crystax-ndk")
  end

  uninstall_postflight do
    FileUtils.rm("#{HOMEBREW_PREFIX}/share/crystax-ndk")
  end

  caveats <<-EOS.undent
   You may want to add to your profile:
      'export ANDROID_NDK_HOME="#{HOMEBREW_PREFIX}/share/crystax-ndk"'
  EOS
end
