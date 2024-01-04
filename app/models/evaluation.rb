class Evaluation < Section
  after_initialize :set_default_kind, if: :new_record?

private

  def set_default_kind
    self.kind = :evaluation
  end
end
