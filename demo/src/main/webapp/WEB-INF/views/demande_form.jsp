<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouvelle demande</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #202124;
            background: #f6f7f9;
        }

        main {
            max-width: 720px;
            margin: 40px auto;
            padding: 0 18px;
        }

        form {
            background: #fff;
            border: 1px solid #dfe3e8;
            border-radius: 8px;
            padding: 28px;
        }

        h1 {
            margin: 0 0 24px;
            font-size: 26px;
        }

        .message {
            margin-bottom: 18px;
            padding: 12px 14px;
            border-radius: 6px;
            color: #0f5132;
            background: #d1e7dd;
            border: 1px solid #badbcc;
        }

        .field {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: 700;
        }

        input,
        select,
        textarea {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 12px;
            border: 1px solid #cfd6dd;
            border-radius: 6px;
            font: inherit;
            background: #fff;
        }

        textarea {
            min-height: 96px;
            resize: vertical;
        }

        input:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #1a73e8;
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.14);
        }

        .actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 24px;
        }

        a,
        button {
            min-height: 42px;
            padding: 0 18px;
            border-radius: 6px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
        }

        a {
            display: inline-flex;
            align-items: center;
            color: #1a73e8;
            background: #fff;
            border: 1px solid #cfd6dd;
        }

        button {
            color: #fff;
            background: #1a73e8;
            border: 1px solid #1a73e8;
        }

        button:hover {
            background: #1558b0;
            border-color: #1558b0;
        }
    </style>
</head>
<body>
    <main>
        <form action="${pageContext.request.contextPath}/demande/save" method="post">
            <h1>Nouvelle demande</h1>

            <c:if test="${not empty success}">
                <div class="message">${success}</div>
            </c:if>

            <div class="field">
                <label for="idClient">Client</label>
                <select id="idClient" name="idClient" required>
                    <option value="">Choisir un client</option>
                    <c:forEach var="client" items="${clients}">
                        <option value="${client.id}">
                            ${client.nom} ${client.prenom} - ${client.adresse}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="field">
                <label for="commune">Commune</label>
                <select id="commune" name="commune" required>
                    <option value="">Choisir une commune</option>
                    <c:forEach var="commune" items="${communes}">
                        <option value="${commune.id}">${commune.nom}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="field">
                <label for="lieux">Lieu de la demande</label>
                <textarea id="lieux" name="lieux" required placeholder="Ex: Forage eau potable école primaire"></textarea>
            </div>

            <div class="field">
                <label for="reference">Reference</label>
                <input type="text" id="reference" name="reference" required placeholder="Ex: DEM-2026-006">
            </div>

            <div class="field">
                <label for="idStatus">Status initial</label>
                <select id="idStatus" name="idStatus" required>
                    <option value="">Choisir un status</option>
                    <c:forEach var="status" items="${statuses}">
                        <option value="${status.id}">${status.status}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="field">
                <label for="dateDebut">Date du status</label>
                <input type="date" id="dateDebut" name="dateDebut" required>
            </div>

            <div class="actions">
                <a href="${pageContext.request.contextPath}/">Annuler</a>
                <button type="submit">Enregistrer</button>
            </div>
        </form>
    </main>
</body>
</html>
