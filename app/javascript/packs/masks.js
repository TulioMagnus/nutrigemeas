const Masks = {
  decimalPlacesMoney: 2,
  decimalPlacesPercent: 1,
  fixMoneyInputValues($, selector, decimalPlaces) {
    $(selector).each((n, el) => {
      const value = el.value;
      if (value) $(el).val(parseFloat(value).toFixed(decimalPlaces));
    });
  },

  fixDateInputValues($) {
    $('.input--date').each((n, el) => {
      const date = el.value;
      if (date) {
        const [year, month, day] = date.split('-');
        $(el).val(`${day}/${month}/${year}`);
      }
    });
  },
  applyMaskOnMoneyInputs($) {
    $('.input--brl-money').each((n, el) => {
      const value = el.value.replace(',','.').replace('.',',');
      if(value == ""){
        return;
      }
      if (value) {
        let integer = value.split(',')[0].replace(/\./g, '').replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.');
        let decimal = value.split(',')[1];
        $(el).val(`${integer},${decimal}`);
      }
    });
  },
  phoneMask: val => (val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009'),
  barcodeMask: (val) => {
    const formattedVal = val.replace(/\D/g, '');

    if (formattedVal[0] === '8') {
      return '00000000000-0 00000000000-0 00000000000-0 00000000000-0';
    }
    return '00000.00000 00000.000000 00000.000000 0 00000000000000';
  },
  documentNumberMask: (val) => {
    const formattedValLength = val.replace(/\D/g, '').length;
    return formattedValLength > 11 || !formattedValLength ? '00.000.000/0000-00' : '000.000.000-009';
  },
  onKeyPress: f => ({ onKeyPress: (val, e, field, options) => field.mask(f(val), options) }),

  applyAll($) {
    const m = Masks;
    m.fixMoneyInputValues($, '.input--money', m.decimalPlacesMoney);
    m.fixMoneyInputValues($, '.input--percent', m.decimalPlacesPercent);
    m.fixDateInputValues($);
    m.applyMaskOnMoneyInputs($);

    $('.input--number').val(parseFloat($('.input--number').val()).toFixed(0))
    $('input[type=text].document_number').mask(m.documentNumberMask, m.onKeyPress(m.documentNumberMask));
    $('.phone').mask(m.phoneMask, m.onKeyPress(m.phoneMask));

    $('.input--barcode').bind('paste', function (e) {
      e.preventDefault();

      let pastedText;

      const originalEvent = e.originalEvent;

      if (originalEvent.clipboardData && originalEvent.clipboardData.getData) {
        pastedText = originalEvent.clipboardData.getData('text/plain');
      } else if (window.clipboardData && window.clipboardData.getData) {
        pastedText = window.clipboardData.getData('Text');
      }

      const newValue = pastedText.replace(/\D/g, '');

      $(this).unmask();
      $(this).val(newValue);
      $(this).mask(m.barcodeMask, m.onKeyPress(m.barcodeMask));
      $(this).val($(this).masked(newValue));
    });

    $('.input--brl-money').val

    $('.input--time').mask('00:00');
    $('.input--barcode').mask(m.barcodeMask, m.onKeyPress(m.barcodeMask));
    $('.input--cpf').mask('000.000.000-00', { reverse: true });
    $('.input--cnpj').mask('00.000.000/0000-00', { reverse: true });
    $('.input--money').mask('##0.00', { reverse: true, placeholder: 'R$ 0.00' });
    $('.input--percent').mask('##0.0', { reverse: true, placeholder: 'Ex: 11.5' });
    $('.input--long-percent').mask('##0.00', { reverse: true, placeholder: 'Ex: 11.35' });
    $('.input--cep').mask('00000-000');
    $('.input--bank-account').mask('##0-0', { reverse: true, placeholder: 'Ex: 1234-5' });
    $('.input--bank-agency').mask('##0', { reverse: true, placeholder: 'Ex: 1234' });
    $('.input--brl-money-private').keyup(function (event) {
      let value = removeSpecialCharactersAndLetters(event.target.value);
      let hasDecimal = value.substring(0, value.length - 1).includes(',');
      if (hasDecimal && event.key == ',') {
        event.target.value = value.substring(0, value.length - 1);
        return;
      } else if (value == ",") {
        event.target.value = "";
        return;
      }
      let integer = hasDecimal ? value.split(',')[0] : value;
      let decimal = hasDecimal ? value.split(',')[1] : null;
      let newValue = `${formatNumber(integer)}`
      if (decimal) {
        newValue += limitDecimal(decimal, 8)
      }
      event.target.value = newValue;
    });
    $('.input--brl-money-public').keyup(function (event) {
      let value = removeSpecialCharactersAndLetters(event.target.value);
      let hasDecimal = value.substring(0, value.length - 1).includes(',');
      if (hasDecimal && event.key == ',') {
        event.target.value = value.substring(0, value.length - 1);
        return;
      } else if (value == ",") {
        event.target.value = "";
        return;
      }
      let integer = hasDecimal ? value.split(',')[0] : value;
      let decimal = hasDecimal ? value.split(',')[1] : null;
      let newValue = `${formatNumber(integer)}`
      if (decimal) {
        newValue += limitDecimal(decimal, 6)
      }
      event.target.value = newValue;
    })
    $('.input--number').keyup(function (event) {
      let value = removeSpecialCharactersAndLetters(event.target.value);
      event.target.value = parseFloat(value).toFixed(0);
    })

    function formatNumber(str) {
      return str.toString().replace(/\./g, '').replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.')
    }

    function removeSpecialCharactersAndLetters(str) {
      return str.toString().replace(/[^0-9,]/g, '');
    }

    function limitDecimal(str, limit){
     return str.length > limit ? `,${str.substring(0, str.length - 1)}` : `,${str}`
    }
  },
};

onLoad(Masks.applyAll);
