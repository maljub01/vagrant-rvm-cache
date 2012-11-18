module RvmCache
  class ShareRvmArchives
    PATH_ON_GUEST  = "/usr/local/rvm/archives"
    TMP_RVMRC_PATH = "/tmp/rvmrc"

    def initialize(app, env, options = {})
      @app = app
      @vm  = env[:vm]
    end

    def call(env)
      @vm.config.vm.share_folder("v-rvm-archives", PATH_ON_GUEST, path_on_host)

      @app.call(env)

      unless @vm.channel.test("[ -f /etc/rvmrc ]")
        @vm.channel.upload(File.expand_path('../../../files/rvmrc', __FILE__), TMP_RVMRC_PATH)
        @vm.channel.sudo("mv #{TMP_RVMRC_PATH} /etc/rvmrc")
      end
    end

    def path_on_host
      home_path = File.expand_path(@vm.env.home_path)
      archives_path = File.join(home_path, 'cache', @vm.box.name, 'rvm', 'archives')
      FileUtils.mkdir_p(archives_path) unless File.exists?(archives_path)
      archives_path
    end
  end
end
