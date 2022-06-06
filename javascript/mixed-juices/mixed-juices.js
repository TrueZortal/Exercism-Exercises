// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  switch (name) {
    case 'Pure Strawberry Joy':
      return 0.5;
    case 'Green Garden':
      return 1.5;
    case 'Energizer':
      return 1.5;
    case 'Tropical Island':
      return 3;
    case 'All or Nothing':
      return 5;
    default:
      return 2.5;
  }

  // `'Pure Strawberry Joy'` takes 0.5 minutes, `'Energizer'` and `'Green Garden'` take 1.5 minutes each, `'Tropical Island'` takes 3 minutes and `'All or Nothing'` takes 5 minutes.
  // For all other drinks (e.g., special offers) you can assume a preparation time of 2.5 minutes.;
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
function limedentifier(lime) {
  switch (lime) {
    case 'small':
      return 6
    case 'medium':
      return 8
    case 'large':
      return 10
  }
}

export function limesToCut(wedgesNeeded, limes) {
  let current_wedges = 0
  let counter = 0
  while (current_wedges < wedgesNeeded && current_wedges !== wedgesNeeded) {
    if (limes.length !== 0) {
      current_wedges += limedentifier(limes.shift());
      counter += 1;
    } else {
      break;
    }
  }
  return counter;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  let time_to_prepare = 0;
  do {
    time_to_prepare += timeToMixJuice(orders.shift());
  } while (timeLeft > time_to_prepare);
  return orders;
}
