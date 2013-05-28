require_relative '../../app/mtghub/array_diff'

describe ArrayDiff do
  let(:array_diff) { ArrayDiff.new [1, 2, 2, 3], [2, 3, 3, 4] }

  describe '#deletions' do
    it 'adds deletions' do
      expect(array_diff.deletions).to eq [1, 2]
    end
  end

  describe '#additions' do
    it 'adds additions' do
      expect(array_diff.additions).to eq [3, 4]
    end
  end
end
