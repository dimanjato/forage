<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire Demande</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="text"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
        }
        .button-container {
            text-align: center;
            margin-top: 30px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 12px 40px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Formulaire Demande</h1>
        
        <form action="${pageContext.request.contextPath}/demande/save" method="POST">
            <div class="form-group">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="jourDemande" required>
            </div>
            
            <div class="form-group">
                <label for="endroit">Endroit:</label>
                <input type="text" id="endroit" name="lieux" required>
            </div>
            
            <div class="form-group">
                <label for="reference">Référence:</label>
                <input type="text" id="reference" name="reference" required>
            </div>

            <div class="form-group">
                <label for="commune">Numéro de la commune:</label>
                <input type="number" id="commune" name="commune" required>
            </div>
            
            <div class="button-container">
                <button type="submit">Demander</button>
            </div>
        </form>
    </div>
</body>
</html>
