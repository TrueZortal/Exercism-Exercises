// @ts-check

// import { map } from "core-js/core/array";

/**
 * Calculates the sum of the two input arrays.
 *
 * @param {number[]} array1
 * @param {number[]} array2
 * @returns {number} sum of the two arrays
 */
export function twoSum(array1, array2) {
  return Number(array1.join("")) + Number(array2.join(""))
}

/**
 * Checks whether a number is a palindrome.
 *
 * @param {number} value
 * @returns {boolean}  whether the number is a palindrome or not
 */
export function luckyNumber(value) {
  var array_of_value = Array.from(String(value),Number)
  return value === Number(array_of_value.reverse().join(""))
}

/**
 * Determines the error message that should be shown to the user
 * for the given input value.
 *
 * @param {string|null|undefined} input
 * @returns {string} error message
 */
export function errorMessage(input) {
  if (!input) {
    return "Required field"
  } else if (!Number(input)) {
    return 'Must be a number besides 0'
  } else {
    return ""
  }
}
