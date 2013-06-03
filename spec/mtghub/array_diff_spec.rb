require_relative '../../app/mtghub/array_diff'

describe ArrayDiff do
  let(:array_diff) { ArrayDiff.new [1, 2, 2, 3, 6, 6, 7, 7, 7],
                                   [2, 3, 3, 4, 8, 9] }

  describe '#deletions' do
    it 'adds deletions' do
      expect(array_diff.deletions).to eq [1, 2, 6, 6, 7, 7, 7]
    end
  end

  describe '#additions' do
    it 'adds additions' do
      expect(array_diff.additions).to eq [3, 4, 8, 9]
    end
  end
end
