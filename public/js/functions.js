$('#transaction_date_contact').datepicker({ autoclose: true, format: datepicker_date_format });
function __calculate_amount(calculation_type, calculation_amount, amount) {
    var calculation_amount = parseFloat(calculation_amount);
    calculation_amount = isNaN(calculation_amount) ? 0 : calculation_amount;
    var amount = parseFloat(amount);
    amount = isNaN(amount) ? 0 : amount;
    switch (calculation_type) {
        case 'fixed':
            return parseFloat(calculation_amount);
        case 'percentage':
        case 'percent':
            return parseFloat((calculation_amount / 100) * amount);
        default:
            return 0;
    }
}
function __add_percent(amount, percentage = 0) {
    var amount = parseFloat(amount);
    var percentage = isNaN(percentage) ? 0 : parseFloat(percentage);
    return amount + (percentage / 100) * amount;
}
function __substract_percent(amount, percentage = 0) {
    var amount = parseFloat(amount);
    var percentage = isNaN(percentage) ? 0 : parseFloat(percentage);
    return amount - (percentage / 100) * amount;
}
function __get_principle(amount, percentage = 0, minus = false) {
    var amount = parseFloat(amount);
    var percentage = isNaN(percentage) ? 0 : parseFloat(percentage);
    if (minus) {
        return (100 * amount) / (100 - percentage);
    } else {
        return (100 * amount) / (100 + percentage);
    }
}
function __get_rate(principal, amount) {
    var principal = isNaN(principal) ? 0 : parseFloat(principal);
    var amount = isNaN(amount) ? 0 : parseFloat(amount);
    var interest = amount - principal;
    return (interest / principal) * 100;
}
function __tab_key_up(e) {
    if (e.keyCode == 9) {
        return true;
    }
}
function __currency_trans_from_en(
    input,
    show_symbol = true,
    use_page_currency = false,
    precision = __currency_precision,
    is_quantity = false
) {
    if (use_page_currency && __p_currency_symbol) {
        var s = __p_currency_symbol;
        var thousand = __p_currency_thousand_separator;
        var decimal = __p_currency_decimal_separator;
    } else {
        var s = __currency_symbol;
        var thousand = __currency_thousand_separator;
        var decimal = __currency_decimal_separator;
    }
    symbol = '';
    var format = '%s%v';
    if (show_symbol) {
        symbol = s;
        format = '%s %v';
        if (__currency_symbol_placement == 'after') {
            format = '%v %s';
        }
    }
    if (is_quantity) {
        precision = __quantity_precision;
    }
    return accounting.formatMoney(input, symbol, precision, thousand, decimal, format);
}
function __currency_convert_recursively(element, use_page_currency = false) {
    element.find('.display_currency').each(function () {
        var value = $(this).text();
        var show_symbol = $(this).data('currency_symbol');
        if (show_symbol == undefined || show_symbol != true) {
            show_symbol = false;
        }
        var highlight = $(this).data('highlight');
        if (highlight == true) {
            __highlight(value, $(this));
        }
        var is_quantity = $(this).data('is_quantity');
        if (is_quantity == undefined || is_quantity != true) {
            is_quantity = false;
        }
        if (is_quantity) {
            show_symbol = false;
        }
        $(this).text(
            __currency_trans_from_en(
                value,
                show_symbol,
                use_page_currency,
                __currency_precision,
                is_quantity
            )
        );
    });
}
function __translate(str, obj = []) {
    var trans = LANG[str];
    $.each(obj, function (key, value) {
        trans = trans.replace(':' + key, value);
    });
    if (trans) {
        return trans;
    } else {
        return str;
    }
}
function __highlight(value, obj) {
    obj.removeClass('text-success').removeClass('text-danger');
    if (value > 0) {
        obj.addClass('text-success');
    } else if (value < 0) {
        obj.addClass('text-danger');
    }
}
__currency_decimal_separator = $('input#__decimal').val();
function __number_uf(input, use_page_currency = false) {
    if (use_page_currency && __currency_decimal_separator) {
        var decimal = __p_currency_decimal_separator;
    } else {
        var decimal = __currency_decimal_separator;
    }
    return accounting.unformat(input, decimal);
}
function __number_f(
    input,
    show_symbol = false,
    use_page_currency = false,
    precision = __currency_precision
) {
    return __currency_trans_from_en(input, show_symbol, use_page_currency, precision);
}
function __read_number(input_element, use_page_currency = false) {
    return __number_uf(input_element.val(), use_page_currency);
}
function __write_number(
    input_element,
    value,
    use_page_currency = false,
    precision = __currency_precision
) {
    if (input_element.hasClass('input_quantity')) {
        precision = __quantity_precision;
    }
    input_element.val(__number_f(value, false, use_page_currency, precision));
}
function __write_number_without_decimal_format(
    input_element,
    value,
    use_page_currency = false,
    precision = __currency_precision
) {
    if (input_element.hasClass('input_quantity')) {
        precision = __quantity_precision;
    }
    input_element.val(value);
}
function __fa_awesome($class = 'fa-refresh fa-spin fa-fw ') {
    return '<i class="fa ' + $class + '"></i>';
}
function __show_date_diff_for_human(element) {
    element.find('.time-to-now').each(function () {
        var string = $(this).text();
        $(this).text(moment(string).toNow(true));
    });
    element.find('.time-from-now').each(function () {
        var string = $(this).text();
        $(this).text(moment(string).from(moment()));
    });
}
function round_to_iraqi_dinnar(value) {
    var remaining = value % 250;
    if (remaining >= 125) {
        value += 250 - remaining;
    } else {
        value -= remaining;
    }
    return value;
}
function __select2(selector) {
    if ($('html').attr('dir') == 'rtl') selector.select2({ dir: 'rtl' });
    else selector.select2();
}
function update_font_size() {
    var font_size = localStorage.getItem('upos_font_size');
    var font_size_array = [];
    font_size_array['s'] = ' - 3px';
    font_size_array['m'] = '';
    font_size_array['l'] = ' + 3px';
    font_size_array['xl'] = ' + 6px';
    if (typeof font_size !== 'undefined') {
        $('header').css('font-size', 'calc(100% ' + font_size_array[font_size] + ')');
        $('footer').css('font-size', 'calc(100% ' + font_size_array[font_size] + ')');
        $('section').each(function () {
            if (!$(this).hasClass('print_section')) {
                $(this).css('font-size', 'calc(100% ' + font_size_array[font_size] + ')');
            }
        });
        $('div.modal').css('font-size', 'calc(100% ' + font_size_array[font_size] + ')');
    }
}
function sum_table_col(table, class_name) {
    var sum = 0;
    table
        .find('tbody')
        .find('tr')
        .each(function () {
            if (
                parseFloat(
                    $(this)
                        .find('.' + class_name)
                        .data('orig-value')
                )
            ) {
                sum += parseFloat(
                    $(this)
                        .find('.' + class_name)
                        .data('orig-value')
                );
            }
        });
    return sum;
}
function __sum_status(table, class_name) {
    var statuses = [];
    var status_html = [];
    table
        .find('tbody')
        .find('tr')
        .each(function () {
            element = $(this).find('.' + class_name);
            if (element.data('orig-value')) {
                var status_name = element.data('orig-value');
                if (!(status_name in statuses)) {
                    statuses[status_name] = [];
                    statuses[status_name]['count'] = 1;
                    statuses[status_name]['display_name'] = element.data('status-name');
                } else {
                    statuses[status_name]['count'] += 1;
                }
            }
        });
    return statuses;
}
function __sum_status_html(table, class_name) {
    var statuses_sum = __sum_status(table, class_name);
    var status_html = '<p class="text-left"><small>';
    for (var key in statuses_sum) {
        status_html +=
            statuses_sum[key]['display_name'] + ' - ' + statuses_sum[key]['count'] + '</br>';
    }
    status_html += '</small></p>';
    return status_html;
}
function __sum_stock(table, class_name, label_direction = 'right') {
    var stocks = [];
    table
        .find('tbody')
        .find('tr')
        .each(function () {
            element = $(this).find('.' + class_name);
            if (element.data('orig-value')) {
                var unit_name = element.data('unit');
                if (!(unit_name in stocks)) {
                    stocks[unit_name] = parseFloat(element.data('orig-value'));
                } else {
                    stocks[unit_name] += parseFloat(element.data('orig-value'));
                }
            }
        });
    var stock_html = '<p class="text-left"><small>';
    for (var key in stocks) {
        if (label_direction == 'left') {
            stock_html +=
                key +
                ' : <span class="display_currency" data-is_quantity="true">' +
                stocks[key] +
                '</span> ' +
                '</br>';
        } else {
            stock_html +=
                '<span class="display_currency" data-is_quantity="true">' +
                stocks[key] +
                '</span> ' +
                key +
                '</br>';
        }
    }
    stock_html += '</small></p>';
    return stock_html;
}
function __print_receipt(section_id = null) {
    if (section_id) {
        var imgs = document.getElementById(section_id).getElementsByTagName('img');
    } else {
        var imgs = document.images;
    }
    img_len = imgs.length;
    if (img_len) {
        img_counter = 0;
        [].forEach.call(imgs, function (img) {
            img.addEventListener('load', incrementImageCounter, false);
        });
    } else {
        setTimeout(function () {
            window.print();
        }, 1000);
    }
}
function incrementImageCounter() {
    img_counter++;
    if (img_counter === img_len) {
        window.print();
    }
}
function __getUnitMultiplier(row) {
    multiplier = row.find('select.sub_unit').find(':selected').data('multiplier');
    if (multiplier == undefined) {
        return 1;
    } else {
        return parseFloat(multiplier);
    }
}

function __read_number_from_text(element){
    let val = $(element).text().replace(',','');

    return parseFloat(val);
}


function check_insufficient_balance_row(row_id){
    if (row_id >= 0) {
        paid = parseFloat($('#amount_' + row_id).val());

        var account_balance = parseFloat(
            $('#account_' + row_id + ' option:selected').data('account_balance')
        );
        if ($('#account_' + row_id + ' option:selected').data('check_insufficient_balance')) {
            if (paid > account_balance) {
                Insufficient_balance_swal();
            }
        }
    }
}

function _print_invoice(receipt) {
    if (receipt.html_content != '') {
        //If printer type browser then print content
        $('#receipt_section').html("");
        $('#receipt_section').html(receipt.html_content);
        __currency_convert_recursively($('#receipt_section'));
        var w = window.open('', '_self');
        var html = document.getElementById("receipt_section").innerHTML;
        $(w.document.body).html(html);
        setTimeout(function() {
            w.print();
            w.close();
            location.reload();
        }, 1000);
    }
}
