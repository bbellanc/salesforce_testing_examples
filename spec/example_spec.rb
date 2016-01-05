require 'spec_helper'

describe 'Standard Candidate Layout' do

  let(:restforce_client) {RestForceClient.create_connection}
  let(:edit_candidate_layout) { Candidate.describe_layouts.editLayoutSections }

  context 'information section' do
    let(:information_section) { edit_candidate_layout.find { |section| section.heading == 'Information' } }

    context 'Email' do

      let(:email_field) do
        information_section.layoutRows.map do |row|
          row.layoutItems.find { |field| field.label == 'Email' }
        end.compact.first
      end

      let(:email_field_details) { email_field.layoutComponents.first.details }

      #Verifies that field on layout is required
      it '' do
        expect(email_field).to be_required
      end

      #Verifies that field is correct Saleforce object field type
      it '' do
        expect(email_field_details.type).to eq 'email'
      end

    end
  end

  context 'Additional Information' do

    subject {Candidate.picklist_values('Education__c').map(&:value)}

    #Verifies that the picklist has an intended value
      it {is_expected.to include 'HS Diploma' }
    end
end


