/**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

import noUiSlider, {target, API} from 'nouislider';
import wNumb from 'wnumb';
import initFacets from './update';
import filterHandler from './filter-handler';

const initSliders = () => {
  const {Theme} = window;

  // Get all slider configurations found in the DOM
  document.querySelectorAll(Theme.selectors.facetedsearch.filterSlider).forEach((filter: HTMLElement) => {
    const container = <target>filter.querySelector(Theme.selectors.facetedsearch.rangeContainer);

    // Init basic slider data
    let unitPosition = 'suffix';
    let unitSymbol = container.dataset.sliderUnit;
    let decimalCount = 2;
    let decimalSeparator = '.';
    let thousandsSeparator = '';

    // Specify further if there are more options, currently used for price slider,
    // which is the only one providing price specifications.
    const options = JSON.parse(<string>container.dataset.sliderSpecifications);

    if (options !== null) {
      // Sign position
      if (options.positivePattern !== undefined && options.positivePattern.indexOf('¤') === 0) {
        unitPosition = 'prefix';
      }

      // Unit
      if (options.currencySymbol !== undefined) {
        unitSymbol = options.currencySymbol;
      }

      // Separators
      if (options.numberSymbols !== undefined) {
        decimalSeparator = options.numberSymbols[0];
        thousandsSeparator = options.numberSymbols[1];
      }

      // Decimals
      if (options.minFractionDigits !== undefined) {
        decimalCount = options.minFractionDigits;
      }
    }

    // Minimum and maximum values
    const min = parseInt(<string>container.dataset.sliderMin, 10);
    const max = parseInt(<string>container.dataset.sliderMax, 10);

    // const sliderType = container.dataset.sliderSpecifications ? 'price' : 'weight';
    const sliderDirection = container.dataset.sliderDirection === '1' ? 'rtl' : 'ltr';

    // let format;
    let initiatedSlider: API;

    // Initialize tooltip format
    const tooltipsFormat = wNumb({
      mark: decimalSeparator,
      thousand: thousandsSeparator,
      decimals: decimalCount,
      [unitPosition]: unitPosition === 'prefix' ? unitSymbol : ` ${unitSymbol}`,
    });

    const sliderValues = JSON.parse(<string>container.dataset.sliderValues);

    if (!container.noUiSlider) {
      initiatedSlider = noUiSlider.create(container, {
        start: sliderValues ?? [min, max],
        tooltips: [tooltipsFormat, tooltipsFormat],
        direction: sliderDirection,
        connect: [false, true, false],
        range: {
          min,
          max,
        },
      });

      initiatedSlider.on('set', (values, handle, unencoded, tap, positions, instance) => {
        filterHandler(values, instance);
      });
    } else {
      container.noUiSlider.updateOptions({
        start: sliderValues ?? [min, max],
        tooltips: [tooltipsFormat, tooltipsFormat],
        range: {
          min,
          max,
        },
      }, true);

      container.noUiSlider.on('set', (values, handle, unencoded, tap, positions, instance) => {
        filterHandler(values, instance);
      });
    }
  });
};

const toggleLoader = (toggle: boolean) => {
  const {Theme} = window;
  const loader = document.querySelector(Theme.selectors.pageLoader);

  if (loader) {
    loader.classList.toggle('d-none', toggle);
  }
};

document.addEventListener('DOMContentLoaded', () => {
  const {prestashop, Theme: {events}} = window;
  initFacets();
  prestashop.on(events.updateProductList, () => {
    toggleLoader(true);
    initSliders();
  });

  initSliders();

  prestashop.on(events.updateFacets, () => {
    toggleLoader(false);
  });
});
