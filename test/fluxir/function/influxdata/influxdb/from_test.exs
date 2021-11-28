defmodule Fluxir.Function.Influxdata.Influxdb.FromTest do
  use ExUnit.Case, async: true
  alias Fluxir.Function.Influxdata.Influxdb.From

  setup do
    params = [
      bucket: "bucket",
      bucket_id: "bucket_id",
      host: "host",
      org: "org",
      org_id: "org_id",
      token: "token"
    ]

    %{params: params}
  end

  test "new/1", %{params: params} do
    assert %From{} = from = From.new(params)

    assert params[:bucket] == from.bucket
    assert params[:bucket_id] == from.bucket_id
    assert params[:host] == from.host
    assert params[:org] == from.org
    assert params[:org_id] == from.org_id
    assert params[:token] == from.token
  end

  test "to_flux/1", %{params: params} do
    from = From.new(params)

    assert ~s/from(bucket: "bucket", bucketId: "bucket_id", host: "host", org: "org", orgId: "org_id", token: "token")/ ==
             From.to_flux(from)
  end
end
