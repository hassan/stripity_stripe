defmodule Stripe.SkuTest do
  use Stripe.StripeCase, async: true
  require IEx

  test "is listable" do
    assert {:ok, %Stripe.List{data: skus}} = Stripe.Sku.list()
    assert_stripe_requested(:get, "/v1/skus")
    assert is_list(skus)
    assert %Stripe.Sku{} = hd(skus)
  end
end
