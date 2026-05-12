<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion de Forage - Accueil</title>
    <style>
        body { font-family: sans-serif; padding: 50px; line-height: 1.6; }
        nav ul { list-style: none; padding: 0; }
        nav li { margin-bottom: 15px; }
        .button { 
            display: inline-block; 
            padding: 10px 20px; 
            background-color: #1a73e8; 
            color: white; 
            text-decoration: none; 
            border-radius: 5px; 
        }
        .button:hover { background-color: #1558b0; }
    </style>
</head>
<body>
    <h1>Système de Gestion de Forage</h1>
    <p>Bienvenue dans l'application. Choisissez une action :</p>
    
    <nav>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/demande/form" class="button">
                    📝 Gérer les Demandes
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/devis/form" class="button">
                    💰 Créer un Devis
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/commune/form" class="button">
                    🏘️ Configurer les Communes
                </a>
            </li>
        </ul>
    </nav>
</body>
</html>