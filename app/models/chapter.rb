class Chapter < Section
  after_initialize :set_default_kind, if: :new_record?

  default_scope { where(kind: :chapter) }

private

  def set_default_kind
    self.kind = :chapter
  end
end
