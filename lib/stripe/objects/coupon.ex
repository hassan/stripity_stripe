defmodule Stripe.Coupon do
  @moduledoc """
  Work with Stripe coupon objects.

  You can:

  - Create a coupon
  - Retrieve a coupon
  - Update a coupon
  - Delete a coupon
  - list all coupons

  Stripe API reference: https://stripe.com/docs/api#coupons
  """

  @type t :: %__MODULE__{}

  defstruct [
    :id, :object, :amount_off, :created, :currency, :duration, :duration_in_months,
    :livemode, :max_redemptions, :metadata, :percent_off, :redeem_by, :times_redeemed
  ]

  @plural_endpoint "coupons"

  @doc """
  Create a coupon.
  """
  @spec create(map, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def create(changes, opts \\ []) do
    Stripe.Request.create(@plural_endpoint, changes, opts)
  end

  @doc """
  Retrieve a coupon.
  """
  @spec retrieve(binary, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def retrieve(id, opts \\ []) do
    endpoint = @plural_endpoint <> "/" <> id
    Stripe.Request.retrieve(endpoint, opts)
  end

  @doc """
  Update a coupon.

  Takes the `id` and a map of changes.
  """
  @spec update(binary, map, list) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def update(id, changes, opts \\ []) do
    endpoint = @plural_endpoint <> "/" <> id
    Stripe.Request.update(endpoint, changes, opts)
  end

  @doc """
  Delete a coupon.
  """
  @spec delete(binary, list) :: :ok | {:error, Stripe.api_error_struct}
  def delete(id, opts \\ []) do
    endpoint = @plural_endpoint <> "/" <> id
    Stripe.Request.delete(endpoint, %{}, opts)
  end

  @doc """
  List all coupons.
  """
  @spec list(map, Keyword.t) :: {:ok, Stripe.List.t} | {:error, Stripe.api_error_struct}
  def list(params \\ %{}, opts \\ []) do
    endpoint = @plural_endpoint
    Stripe.Request.retrieve(params, endpoint, opts)
  end
end
