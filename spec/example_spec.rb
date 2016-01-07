require 'spec_helper'

describe 'Standard Candidate Layout' do

  #Injecting :restforce_client as the client connection
  let(:restforce_client) { RestForceClient.establish_connection_to_rest_api }

  #Gathering the `edit` layout metadata for the Candidate Object
  let(:edit_candidate_layout) { Candidate.describe_layouts.editLayoutSections }

  context 'information section' do

    #Collection the metadata for the `Information` section of the layout
    let(:information_section) { edit_candidate_layout.find { |section| section.heading == 'Information' } }

    context 'Email Field' do

      #Grabing the `Email` field metadata from the `Information` section
      let(:email_field) do
        information_section.layoutRows.map do |row|
          row.layoutItems.find { |field| field.label == 'Email' }
        end.compact.first
      end

      #Getting Layout Details for the email field
      let(:email_field_details) { email_field.layoutComponents.first.details }

      #Verifies that field on layout is required
      it 'is required' do
        expect(email_field).to be_required
      end

      #Verifies that field is correct Saleforce object field type
      it 'is of type email' do
        expect(email_field_details.type).to eq 'email'
      end

    end
  end

  context 'Additional Information' do

    context 'Education Field' do
      subject { Candidate.picklist_values('Education__c').map(&:value) }

      #Verifies that the picklist has an intended value
      it { is_expected.to include 'HS Diploma' }
    end
  end
end


