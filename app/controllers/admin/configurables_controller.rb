class Admin::ConfigurablesController < Admin::AdminController
  include ConfigurableEngine::ConfigurablesController

  def index
    @configurables = Configurable.keys
  end
end
