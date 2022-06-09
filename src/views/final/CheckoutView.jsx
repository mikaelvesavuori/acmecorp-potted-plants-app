import React from 'react';
import PropTypes from 'prop-types';

import { Header, Description, Footer, CheckoutItem, CheckoutForm } from '@mikaelvesavuori/acmecorp-potted-plants-components';

export const CheckoutViewFinal = ({ addItemToCart, removeItemFromCart, products }) => {
  const checkoutItems = products ? Object.entries(products).map(product => {
    const [productName, productData] = product;
    const { name, count, price } = productData;
    return <CheckoutItem
      name={name}
      count={count}
      price={parseInt(price)}
      addItemToCart={addItemToCart}
      removeItemFromCart={removeItemFromCart}
      key={productName} />;
  }) : null;

  return (
    <>
      <a href="/checkout">Switch to starter</a>

      <main id="checkout">
        <Header>Checkout</Header>

        <Description><a href="/final/products">Go back to products</a></Description>

        <div>{checkoutItems}</div>

        <CheckoutForm />
      </main>
      <Footer>The ACME Corp. Potted Plants store</Footer>
    </>
  )
};

CheckoutViewFinal.propTypes = {
	addItemToCart: PropTypes.func.isRequired,
  removeItemFromCart: PropTypes.func.isRequired,
  products: PropTypes.object.isRequired
};