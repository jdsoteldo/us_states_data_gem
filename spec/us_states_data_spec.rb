require_relative '../lib/us_states_data'

RSpec.describe UsStatesData do
  describe '.is_county_in_state?' do
    context 'when county exists in state' do
      it 'returns true' do
        result = UsStatesData.is_county_in_state?('Miami-Dade', 'Florida')
        expect(result[0]).to eq(true)
      end
    end

    context 'when county does not exist in state' do
      it 'returns false' do
        result = UsStatesData.is_county_in_state?('Harris', 'Florida')
        expect(result).to be_an_instance_of(Array)
        expect(result[0]).to eq(false)
      end
    end

    context 'when state does not exist' do
      it 'raises ArgumentError' do
        expect { UsStatesData.is_county_in_state?('Foo', 'Bar') }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.is_zip_code_in_state?' do
    context 'when zip code exists in state' do
      it 'returns true' do
        result = UsStatesData.is_zip_code_in_state?('90210', 'California')

        expect(result[0]).to eq(true)
      end
    end

    context 'when zip code does not exist in state' do
      it 'returns false' do
        result = UsStatesData.is_zip_code_in_state?('12345', 'Florida')
        expect(result[0]).to eq(false)
        expect(result[1]).to eq(404)
        expect(result[2]).to_not be_nil
      end
    end

    context 'when state does not exist' do
      it 'raises ArgumentError' do
        expect { UsStatesData.is_zip_code_in_state?('90210', 'Foo') }.to raise_error(ArgumentError)
      end
    end

    context 'when zip code format is invalid' do
      it 'raises ArgumentError' do
        expect { UsStatesData.is_zip_code_in_state?('foobar', 'California') }.to raise_error(ArgumentError)
      end
    end
  end
end
