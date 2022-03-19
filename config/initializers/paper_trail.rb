# frozen_string_literal: true

PaperTrail.config.has_paper_trail_defaults = {
  skip: %i[encrypted_password reset_password_token reset_password_sent_at]
}
