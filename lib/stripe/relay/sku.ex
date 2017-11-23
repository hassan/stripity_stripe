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
            quantity: non_neg_integer | nil,
            type: String.t(),
            value: String.t() | nil
          },
          livemode: boolean,
          metadata: Stripe.Types.metadata(),
          package_dimensions:
            %{
              height: float,
              length: float,
              weight: float,
              width: float
            }
            | nil,
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
