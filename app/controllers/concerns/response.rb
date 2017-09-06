module Response
  def json_response(object, status = :ok)
    render json: JSON.pretty_generate(JSON.parse(object.to_json)), status: status
  end
end
