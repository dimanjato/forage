<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Devis</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #202124;
            background: #f6f7f9;
        }

        main {
            max-width: 980px;
            margin: 36px auto;
            padding: 0 18px;
        }

        h1 {
            margin: 0 0 22px;
            font-size: 26px;
        }

        h2 {
            margin: 28px 0 14px;
            font-size: 20px;
        }

        .panel {
            background: #fff;
            border: 1px solid #dfe3e8;
            border-radius: 8px;
            padding: 24px;
            margin-bottom: 20px;
        }

        .message {
            margin-bottom: 18px;
            padding: 12px 14px;
            border-radius: 6px;
            color: #0f5132;
            background: #d1e7dd;
            border: 1px solid #badbcc;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: 700;
        }

        input,
        select {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 12px;
            border: 1px solid #cfd6dd;
            border-radius: 6px;
            font: inherit;
            background: #fff;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #1a73e8;
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.14);
        }

        .select-row {
            display: grid;
            grid-template-columns: minmax(0, 1fr) auto;
            gap: 12px;
            align-items: end;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 10px 8px;
            border-bottom: 1px solid #edf0f2;
            text-align: left;
            vertical-align: top;
        }

        th {
            font-size: 13px;
            color: #5f6368;
        }

        .designation {
            min-width: 220px;
        }

        .number {
            max-width: 130px;
        }

        .actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 22px;
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

        .empty {
            color: #5f6368;
        }
    </style>
</head>
<body>
    <main>
        <h1>Devis</h1>

        <c:if test="${not empty success}">
            <div class="message">${success}</div>
        </c:if>

        <section class="panel">
            <form action="${pageContext.request.contextPath}/devis/form" method="get">
                <label for="idDemande">Demande</label>
                <div class="select-row">
                    <select id="idDemande" name="idDemande" required>
                        <option value="">Choisir une demande par reference</option>
                        <c:forEach var="demande" items="${demandes}">
                            <option value="${demande.id}" ${idDemande == demande.id ? 'selected' : ''}>
                                ${demande.reference} - ${demande.lieux}
                            </option>
                        </c:forEach>
                    </select>
                    <button type="submit">Selectionner</button>
                </div>
            </form>
        </section>

        <c:if test="${not empty demandeSelectionnee}"> <%-- Ce bloc est affiché une fois qu'une demande est sélectionnée --%>
            <section class="panel">
                <h2>${demandeSelectionnee.reference}</h2>

                <form action="${pageContext.request.contextPath}/devis/save" method="post">
                    <input type="hidden" name="idDemande" value="${demandeSelectionnee.id}">

                    <table>
                        <thead>
                            <tr>
                                <th colspan="4">Informations du Devis</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">
                                    <label for="idDevis">Devis existant</label>
                                    <select id="idDevis" name="idDevis" onchange="this.form.submit()"> <%-- Soumet le formulaire au changement pour charger les détails --%>
                                        <option value="0" ${idDevis == null || idDevis == 0 ? 'selected' : ''}>-- Nouveau Devis --</option> <%-- Option pour créer un nouvel en-tête de devis --%>
                                        <c:forEach var="devisHeader" items="${devisHeaders}">
                                            <option value="${devisHeader.id}" ${idDevis == devisHeader.id ? 'selected' : ''}>
                                                Devis #${devisHeader.id} - <fmt:formatDate value="${devisHeader.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><label for="observation">Observation</label><input type="text" id="observation" name="observation" value="${devisSelectionne.observation}" placeholder="Observation du devis"></td>
                                <td colspan="2"><label for="typeDevis">Type de Devis</label><input type="text" id="typeDevis" name="typeDevis" value="${devisSelectionne.typeDevis}" placeholder="Ex: Forage, Réparation"></td>
                            </tr>
                        </tbody>
                        <thead>
                            <tr>
                                <th>Designation</th>
                                <th>Unite</th>
                                <th>Quantite</th>
                                <th>Prix unitaire</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="designations" value="Tuyau,Camion,Carburant,Corde,Clou,Marteau,Pelle,Ciment" />
                            <c:set var="unites" value="m,unité,L,m,unité,unité,unité,Kg" /> <%-- Correction de la faute de frappe "unite" en "unité" pour un meilleur français --%>
                            <c:set var="unitesParLigne" value="${fn:split(unites, ',')}" />

                            <c:forTokens var="designation" items="${designations}" delims="," varStatus="status">
                                <tr>
                                    <td>
                                        <input class="designation" type="text" name="designation" value="${designation}" readonly> <%-- Rend les désignations prédéfinies en lecture seule --%>
                                    </td>
                                    <td>
                                        <input type="text" name="unite" value="${unitesParLigne[status.index]}" readonly> <%-- Rend les unités prédéfinies en lecture seule --%>
                                    </td>
                                    <td>
                                        <%-- Pré-remplit avec les détails existants si disponibles --%>
                                        <input class="number" type="number" name="quantite" min="0" step="0.01" value="${devisDetails[status.index].quantite}">
                                    </td>
                                    <td>
                                        <input class="number" type="number" name="prixUnitaire" min="0" step="0.01">
                                    </td>
                                </tr>
                            </c:forTokens>

                            <tr>
                                <td><input class="designation" type="text" name="designation" placeholder="Autre designation"></td>
                                <td><input type="text" name="unite" placeholder="unite"></td>
                                <td><input class="number" type="number" name="quantite" min="0" step="0.01"></td>
                                <td><input class="number" type="number" name="prixUnitaire" min="0" step="0.01"></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="actions">
                        <a href="${pageContext.request.contextPath}/">Annuler</a>
                        <button type="submit">Enregistrer le devis</button>
                    </div>
                </form>
            </section>

            <section class="panel">
                <h2>Devis deja saisis</h2>

                <c:choose> <%-- Affiche les détails pour l'en-tête de devis sélectionné --%>
                    <c:when test="${empty devisDetails}">
                        <p class="empty">Aucune ligne de devis pour cette demande.</p>
                    </c:when>
                    <c:otherwise> <%-- Changé de 'devis' à 'devisDetails' --%>
                        <table>
                            <thead>
                                <tr>
                                    <th>Designation</th>
                                    <th>Unite</th>
                                    <th>Quantite</th>
                                    <th>Prix unitaire</th>
                                    <th>Montant</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ligne" items="${devisDetails}">
                                    <tr>
                                        <td>${ligne.libelle}</td>
                                        <td>${ligne.unite}</td>
                                        <td><fmt:formatNumber value="${ligne.quantite}" minFractionDigits="2" /></td>
                                        <td><fmt:formatNumber value="${ligne.prixUnitaire}" minFractionDigits="2" /></td>
                                        <td><fmt:formatNumber value="${ligne.montant}" minFractionDigits="2" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </section>
        </c:if>
    </main>
</body>
</html>
