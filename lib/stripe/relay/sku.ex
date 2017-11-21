defmodule Stripe.Sku do
  @moduledoc """
  Work with Stripe SKU objects.

  Stripe API reference: https://stripe.com/docs/api#sku_object
  """

  use Stripe.Entity
  import Stripe.Request

  @type t :: %__MODULE__{
          id: Stripe.id(),
          object: String.t(),
          active: boolean,
          attributes: %{
            optional(String.t()) => String.t()
          },
          created: Stripe.timestamp(),
          currency: String.t(),
          image: String.t(),
          inventory: %{
            quantity: nil | non_neg_integer,
            type: :finite | :bucket | :infinite,
            value: nil | :in_stock | :limited | :out_of_stock
          },
          livemode: boolean,
          metadata: %{
            optional(String.t()) => String.t()
          },
          package_dimensions:
            nil
            | %{
                height: float,
                length: float,
                weight: float,
                width: float
              },
          price: non_neg_integer,
          product: Stripe.id() | Stripe.Product.t(),
          updated: Stripe.timestamp()
        }

  defstruct [
    :id,
    :object,
    :active,
    :attributes,
    :created,
    :currency,
    :image,
    :inventory,
    :livemode,
    :metadata,
    :package_dimensions,
    :price,
    :product,
    :updated
  ]

  @plural_endpoint "skus"

  def list(params \\ %{}, opts \\ []) do
    new_request(opts)
    |> put_endpoint(@plural_endpoint)
    |> put_method(:get)
    |> put_params(params)
    |> make_request()
  end
end
