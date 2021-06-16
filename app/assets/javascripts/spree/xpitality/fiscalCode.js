const handleFiscalCode = () => {
    const form = document.getElementById('checkout_form_address');
    if (form) {
        const countrySelected = document.getElementById('order_bill_address_attributes_country_id');
        const inputHolders = document.querySelectorAll('.input-holder');
        inputHolders.forEach(input => {
            const fiscalCode = input.querySelector('#order_fiscal_code');
            if (fiscalCode) {
                if (countrySelected) {
                    countrySelected.addEventListener('change', () => {
                        if (countrySelected.options[countrySelected.selectedIndex].text === 'Italia') {
                            fiscalCode.required = true;
                            input.style.display = 'flex';
                        } else {
                            fiscalCode.required = false;
                            input.style.display = 'none';
                        }
                    })
                }
            }
        })

    }
}