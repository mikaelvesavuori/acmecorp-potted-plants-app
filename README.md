# ACME Corp. Potted Plants - Example app to use a component library with

An example application meant to use a React component library generated partially with Figmagic. Made for [The newline Guide to React Component Design Systems with Figmagic](https://www.newline.co/courses/newline-guide-to-react-component-design-systems-with-figmagic/creating-organisms).

This project uses a fairly basic React setup, with a bit of "classic state management" (i.e. "prop passing") and `.jsx` files.

The idea is that you will actually have to do very, very minimal work on these files.

There are two views: ProductsView and CheckoutView. There is a "complete" or final set of these, and an initial set of both. You would use the final set to see what the intended result is, and the initial ones as you begin working on your own components. You can do this by editing the following section in `src/app.jsx`:

```jsx
import { ProductsView } from './views/final/ProductsView'; // Use './views/ProductsView' for the "initial" raw version to begin working with
import { CheckoutView } from './views/final/CheckoutView'; // Use './views/CheckoutView' for the "initial" raw version to begin working with
```

## Component library usage

This is rigged to use my package, `@mikaelvesavuori/acmecorp-potted-plants-components`, but you should absolutely install and re-point to your own library.

## Technology

- React 17
- Webpack 5
- ESLint
- Prettier
- Babel

## Instructions

- Install with `npm install`
- Run dev server with `npm start`

## Structure

- `/src`: Source code
- `/src/app.jsx`: Main application, this is also where state is going to reside
- `/src/index.jsx`: Root for React
- `/src/index.html`: HTML page to mount React inside
- `/src/utils.js`: Basic JavaScript utility functions
- `/src/data.json`: Product data
- `/src/views`: Views with initial state
- `/src/views/final`: Views with "final" code to use complete components from our component library