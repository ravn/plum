class ScannedResourceShowPresenter < CurationConcernsShowPresenter
  delegate :has?, :first, to: :solr_document
  def file_presenter_class
    ::FileSetPresenter
  end
end
