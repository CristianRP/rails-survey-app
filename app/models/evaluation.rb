class Evaluation < Section
  after_initialize :set_default_kind, if: :new_record?

  default_scope { where(kind: :evaluation) }

private

  def set_default_kind
    self.kind = :evaluation
  end
end
