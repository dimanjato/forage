<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire Commune</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 40px 16px;
        }
        .card {
            max-width: 520px;
            margin: 0 auto;
            background: #fff;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }
        h1 {
            margin-top: 0;
            text-align: center;
            color: #1f2937;
        }
        .field {
            margin-bottom: 18px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 700;
            color: #374151;
        }
        input {
            width: 100%;
            box-sizing: border-box;
            padding: 11px 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 15px;
        }
        input:focus {
            outline: none;
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }
        .actions {
            text-align: center;
            margin-top: 28px;
        }
        button {
            padding: 12px 28px;
            border: none;
            border-radius: 8px;
            background: #2563eb;
            color: white;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
        }
        button:hover {
            background: #1d4ed8;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Formulaire Commune</h1>
        <form action="${pageContext.request.contextPath}/commune/save" method="post">
            <div class="field">
                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="field">
                <label for="numero">Numéro</label>
                <input type="number" id="numero" name="numero" required>
            </div>
            <div class="field">
                <label for="idDistricte">ID District</label>
                <input type="number" id="idDistricte" name="idDistricte" required>
            </div>
            <div class="actions">
                <button type="submit">Enregistrer</button>
            </div>
        </form>
    </div>
</body>
</html>
