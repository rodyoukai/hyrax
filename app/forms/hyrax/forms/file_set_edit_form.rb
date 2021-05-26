# frozen_string_literal: true
module Hyrax::Forms
  class FileSetEditForm
    include HydraEditor::Form
    include HydraEditor::Form::Permissions

    delegate :depositor, :id, :permissions, to: :model

    self.required_fields = [:title, :creator, :license]

    self.model_class = ::FileSet

    self.terms = [:resource_type, :title, :creator, :contributor, :description,
                  :keyword, :license, :publisher, :date_created, :subject, :language,
                  :identifier, :based_near, :related_url,
                  :visibility_during_embargo, :visibility_after_embargo, :embargo_release_date,
                  :visibility_during_lease, :visibility_after_lease, :lease_expiration_date,
                  :visibility]

    def parent
      model.in_objects.first
    end

    ##
    # @note for compatibility with Valkyrie::ChangeSet
    def prepopulate!
      self
    end

    def versions
      @versions ||= Hyrax::VersionListPresenter.for(file_set: model)
    end
  end
end
