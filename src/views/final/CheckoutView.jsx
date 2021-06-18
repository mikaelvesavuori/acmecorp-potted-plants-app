import React from 'react';
import PropTypes from 'prop-types';

import { Header, Footer, CheckoutItem, CheckoutForm } from '@mikaelvesavuori/acmecorp-potted-plants-components';

export const CheckoutView = ({ addItemToCart, removeItemFromCart, products }) => {
  const checkoutItems = products ? Object.entries(products).map(product => {
    const [productName, productCount] = product;
    return <CheckoutItem
      name={productName}
      count={productCount}
      addItemToCart={addItemToCart}
      removeItemFromCart={removeItemFromCart}
      key={productName} />;
  }) : null;

  return (
    <main>
      <Header>Checkout</Header>

      <div><a href="/products">Go back to products</a></div>

      <div>{checkoutItems}</div>

      <CheckoutForm />

      <Footer>The ACME Corp. Potted Plants store</Footer>
    </main>
  )
};

CheckoutView.propTypes = {
	addItemToCart: PropTypes.func.isRequired,
  removeItemFromCart: PropTypes.func.isRequired,
  products: PropTypes.object.isRequired
};