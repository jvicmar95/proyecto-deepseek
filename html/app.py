from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/send-message', methods=['POST'])
def send_message():
    name = request.form.get('name')
    email = request.form.get('email')
    message = request.form.get('message')

    # Aquí podrías enviar el mensaje a una base de datos o correo, por ejemplo.
    # Pero por ahora, solo devolveremos una respuesta JSON como ejemplo.
    
    if name and email and message:
        response = {"message": "¡Gracias por tu mensaje, " + name + "! Nos pondremos en contacto contigo pronto."}
        return jsonify(response)
    else:
        return jsonify({"message": "Hubo un error con el formulario. Intenta nuevamente."}), 400

if __name__ == "__main__":
    app.run(debug=True)
