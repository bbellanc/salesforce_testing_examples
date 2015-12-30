require 'spec_helper'

describe 'Standard Candidate Layout' do

  let(:standard_candidate_layout) { ActiveForce.sfdc_client.describe_layouts('Candidate__c').layouts.first }


  context 'information section' do
    let(:information_section) { standard_candidate_layout.editLayoutSections.find { |section| section.heading == 'Information' } }

    context 'Email' do

      let(:email_field) do
        information_section.layoutRows.map do |row|
          row.layoutItems.find { |field| field.label == 'Email' }
        end.compact.first
      end

      let(:email_field_details) { email_field.layoutComponents.first.details }

      #Verifies that field on layout is required
      it { expect(email_field).to be_required }

      #Verifies that field is correct Saleforce object field type
      it { expect(email_field_details.type).to eq 'email' }

    end
  end

  context 'Additional Information' do
    let(:additional_details_section) { standard_candidate_layout.editLayoutSections.find { |section| section.heading == 'Additional Details' } }

    context 'Education' do
      let(:education_field) do
        additional_details_section.layoutRows.map do |row|
          row.layoutItems.find { |field| field.label == 'Education' }
        end.compact.first
      end

      let(:education_field_details) { education_field.layoutComponents.first.details }

      #Verifies that the picklist has an intended value
      it { expect(education_field_details.picklistValues.map(&:value)).to include 'HS Diploma' }
    end
  end
end


