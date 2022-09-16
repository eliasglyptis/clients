module ClientsHelper
  def client_full_name(client)
    [client.first_name, client.last_name].join(' ')
  end
end
