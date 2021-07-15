# frozen_string_literal: true

module Hyrax
  ##
  # Indexes Hyrax::AdministrativeSet objects
  class ValkyrieAdministrativeSetIndexer < Hyrax::ValkyrieIndexer
    def to_solr # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
      super.tap do |solr_doc|
        solr_doc['generic_type_si'] = 'Admin Set'
        solr_doc['alternative_title_tesim'] = resource.alternative_title
        solr_doc['creator_ssim']            = resource.creator
        solr_doc['description_tesim']       = resource.description
        solr_doc['title_tesim']             = resource.title
        solr_doc['title_sim']               = resource.title
      end
    end
  end
end
