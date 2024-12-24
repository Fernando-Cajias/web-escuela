from flask import Flask, request, jsonify
import psycopg


app = Flask(__name__)


def get_db_connection():
    return psycopg.connect("postgresql://postgres:sql@localhost:5432/escuela")


@app.route("/")
def home():
    return jsonify({"message": "Bienvenido a crud de estudiantes de escuela"})

# ruta para obtener todos los estudiantes
@app.route("/estudiantes", methods=["GET"])
def get_estudiantes():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id, nombre, edad, activo FROM estudiante;")
    rows = cursor.fetchall()
    conn.close()
    return jsonify([{"id": row[0], "nombre": row[1], "edad": row[2], "activo": row[3]} for row in rows])

# ruta para agregar un estudiante
@app.route("/estudiantes", methods=["POST"])
def add_estudiante():
    data = request.get_json()
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO estudiante (nombre, edad, activo) VALUES (%s, %s, %s)",
        (data["nombre"], data["edad"], data.get("activo", True))
    )
    conn.commit()
    conn.close()
    return jsonify({"message": "Estudiante agregado correctamente"}), 201

# ruta para eliminar un estudiante 
@app.route("/estudiantes/<int:id>", methods=["DELETE"])
def delete_estudiante(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM estudiante WHERE id = %s", (id,))
    conn.commit()
    conn.close()
    return jsonify({"message": "Estudiante eliminado correctamente"})

# ruta para actualizar un estudiante
@app.route("/estudiantes/<int:id>", methods=["PUT"])
def update_estudiante(id):
    data = request.get_json()
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE estudiante SET nombre = %s, edad = %s, activo = %s WHERE id = %s",
        (data["nombre"], data["edad"], data["activo"], id)
    )
    conn.commit()
    conn.close()
    return jsonify({"message": "Estudiante actualizado correctamente"})

if __name__ == "__main__":
    app.run(debug=True)
