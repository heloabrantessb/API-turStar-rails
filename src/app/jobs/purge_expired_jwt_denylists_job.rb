# Remove da denylist os tokens que já expiraram, para a tabela não crescer
# indefinidamente. Agendado em config/recurring.yml (produção, Solid Queue).
class PurgeExpiredJwtDenylistsJob < ApplicationJob
  queue_as :default

  def perform
    JwtDenylist.purge_expired
  end
end
