import React from 'react';
import PropTypes from 'prop-types';

export const CheckoutView = ({ products }) => {
  const checkoutItems = products ? Object.entries(products).map(product => {
    const [productName, productCount] = product;
    return <div key={productName}>{productName}, {productCount}</div>;
  }) : null;

  return (
    <main>
      <h1>Checkout</h1>

      <div><a href="/products">Go back to products</a></div>

      <div>{checkoutItems}</div>

      <form>Form</form>

      <footer>The ACME Corp. Potted Plants store</footer>
    </main>
  )
};

CheckoutView.propTypes = {
	addItemToCart: PropTypes.func.isRequired,
  removeItemFromCart: PropTypes.func.isRequired,
  products: PropTypes.object.isRequired
};