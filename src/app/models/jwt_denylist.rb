# Lista de tokens JWT revogados (logout).
#
# Cada token emitido tem um identificador único no claim "jti". No logout,
# esse jti é gravado aqui e, a partir daí, o token é recusado mesmo que
# ainda não tenha expirado.
class JwtDenylist < ApplicationRecord
  validates :jti, presence: true, uniqueness: true
  validates :exp, presence: true

  # Tokens cuja data de expiração já passou não precisam mais ficar na lista,
  # porque o próprio JWT.decode já os recusa (JWT::ExpiredSignature).
  scope :expired, -> { where(exp: ...Time.current) }

  def self.revoked?(jti)
    exists?(jti: jti)
  end

  # Grava o token como revogado. Usa find_or_create_by! para que um logout
  # repetido com o mesmo token não gere erro de unicidade.
  def self.revoke!(jti:, exp:)
    find_or_create_by!(jti: jti) do |entry|
      entry.exp = Time.zone.at(exp)
    end
  end

  def self.purge_expired
    expired.delete_all
  end
end
