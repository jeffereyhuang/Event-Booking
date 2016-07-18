def create_order(intent, session):
    """ Sets the color in the session and prepares the speech to reply to the
    user.
    """

    card_title = intent['name']
    session_attributes = {}
    should_end_session = False

    if 'Quantity' in intent['slots'] && 'Product' in intent['slots'] &&
    'Type' in intent['slots']:

        quantity = intent['slots']['Quantity']
        product = intent['slots']['Product']
        product_type = intent['slots']['Type']

        order = quantity + product + product_type

        session_attributes = create_order_attributes(order)

        speech_output = "Your order is  " + \
                        order + \
                        ". Confirm the order by saying 'purchase the order'" \
        reprompt_text = "Confirm the order by saying 'purchase the order'"
    else:
        speech_output = "Have you added anything to your cart? " \
                        "Try creating an order again."
        reprompt_text = "Have you added anything to your cart? " \
                        "Try creating an order again."

    return build_response(session_attributes, build_speechlet_response(
        card_title, speech_output, reprompt_text, should_end_session))


def create_order_attributes(order):
    return {"Order": order}


def purchase_order(intent, session):
    session_attributes = {}
    reprompt_text = None

    if session.get('attributes', {}) and "Order" in session.get('attributes', {}):
        Order = session['attributes']['Order']
        speech_output = "Your order for " + Order + \
                        "has been placed. Thanks."
        should_end_session = True
    else:
        speech_output = "Have you added anything to your cart? " \
                        "Try creating an order again."
        should_end_session = False

    # Setting reprompt_text to None signifies that we do not want to reprompt
    # the user. If the user does not respond or says something that is not
    # understood, the session will end.
    return build_response(session_attributes, build_speechlet_response(
        intent['name'], speech_output, reprompt_text, should_end_session))
