<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Expense Tracker</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome for icons -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <style>
      body {
        background-color: #f8f9fa;
        padding-top: 2rem;
      }
      .header {
        background-color: #0d6efd;
        color: white;
        padding: 2rem 0;
        margin-bottom: 2rem;
        border-radius: 0 0 10px 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .expense-card {
        transition: transform 0.2s;
        border-left: 4px solid #0d6efd;
        margin-bottom: 1rem;
      }
      .expense-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
      }
      .amount {
        font-weight: bold;
        color: #dc3545;
      }
      .btn-add {
        background-color: #0d6efd;
        border: none;
        padding: 0.5rem 1.5rem;
      }
      .btn-add:hover {
        background-color: #0b5ed7;
      }
      .alert-message {
        animation: fadeIn 0.5s;
      }
      @keyframes fadeIn {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }
    </style>
  </head>
  <body>
    <div class="header">
      <div class="container text-center">
        <h1><i class="fas fa-wallet me-2"></i>Expense Tracker</h1>
        <c:if test="${not empty message}">
          <div
            class="alert alert-success alert-message alert-dismissible fade show mt-3"
            role="alert"
          >
            ${message}
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="alert"
              aria-label="Close"
            ></button>
          </div>
        </c:if>
      </div>
    </div>

    <div class="container">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h3><i class="fas fa-list me-2"></i>Your Expenses</h3>
        <a href="${contextRoot}/expense" class="btn btn-primary btn-add">
          <i class="fas fa-plus me-1"></i>Add Expense
        </a>
      </div>

      <c:choose>
        <c:when test="${empty expenses}">
          <div class="card">
            <div class="card-body text-center py-5">
              <i class="fas fa-receipt fa-3x text-muted mb-3"></i>
              <h4 class="text-muted">No expenses found</h4>
              <p class="text-muted">Start by adding your first expense</p>
              <a href="${contextRoot}/expense" class="btn btn-primary">
                <i class="fas fa-plus me-1"></i>Add Expense
              </a>
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <div class="row">
            <c:forEach var="expense" items="${expenses}">
              <div class="col-md-6 col-lg-4 mb-3">
                <div class="card expense-card h-100">
                  <div class="card-body">
                    <div
                      class="d-flex justify-content-between align-items-start"
                    >
                      <h5 class="card-title">${expense.expenseName}</h5>
                      <span class="amount">₹${expense.amount}</span>
                    </div>
                    <c:if test="${not empty expense.note}">
                      <p class="card-text text-muted mt-2">
                        <small
                          ><i class="fas fa-sticky-note me-1"></i
                          >${expense.note}</small
                        >
                      </p>
                    </c:if>
                  </div>
                  <div class="card-footer bg-transparent">
                    <a
                      href="${contextRoot}/expense/${expense.id}"
                      class="btn btn-sm btn-outline-primary"
                    >
                      <i class="fas fa-edit me-1"></i>Edit
                    </a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
