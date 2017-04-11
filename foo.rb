require 'pry'
# Foo
# Protected vs Private
# rubocop:disable all
class Foo
  def test
    p self.protected_method # OK
    p private_method        # OK
    p self.private_method   # NoMethodError
  end

  protected

  def protected_method
    'protected'
  end

  private

  def private_method
    'privated'
  end
end
