class WelcomeController < ApplicationController
  def index
    @curation_concerns = CurationConcerns::ClassifyConcern.new.all_curation_concern_classes
  end
end
