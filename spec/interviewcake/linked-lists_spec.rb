require 'awesome_print'
require './interviewcake/linked-lists'

RSpec.describe LinkedListNode do

  before do
    @a = LinkedListNode.new(5)
    @b = LinkedListNode.new(75)
    @c = LinkedListNode.new(123)
  end

  context 'node a.next' do

    it 'should return b value' do
      @a.next = @b
      @b.previous = @a
      expect(@a.next.value).to eq @b.value
    end

  end

end
