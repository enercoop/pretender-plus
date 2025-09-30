class ClientsController < ApplicationController
  def index
    head :ok
  end

  def impersonate
    client = Client.find(params[:id])
    impersonate_client(client)
    head :ok
  end

  def stop_impersonating
    stop_impersonating_client
    head :ok
  end
end
