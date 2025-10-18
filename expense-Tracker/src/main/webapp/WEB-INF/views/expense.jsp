<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Add Expense</title>
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
      .card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border: none;
        border-radius: 10px;
      }
      .form-control:focus {
        border-color: #86b7fe;
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
      }
      .btn-submit {
        background-color: #0d6efd;
        border: none;
      }
      .btn-submit:hover {
        background-color: #0b5ed7;
      }
      .btn-delete {
        background-color: #dc3545;
        border: none;
      }
      .btn-delete:hover {
        background-color: #bb2d3b;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
          <div class="card">
            <div class="card-header bg-primary text-white">
              <h4 class="mb-0">
                <i class="fas fa-file-invoice-dollar me-2"></i>
                ${expense.id == null ? 'Add' : 'Edit'} Expense
              </h4>
            </div>
            <div class="card-body">
              <form:form
                action="${contextRoot}/expense"
                method="post"
                modelAttribute="expense"
              >
                <form:hidden path="id" />

                <div class="mb-3">
                  <label for="expenseName" class="form-label"
                    >Expense Name</label
                  >
                  <form:input
                    path="expenseName"
                    class="form-control"
                    placeholder="Enter expense name"
                    id="expenseName"
                  />
                  <form:errors path="expenseName" class="text-danger" />
                </div>

                <div class="mb-3">
                  <label for="amount" class="form-label">Amount</label>
                  <div class="input-group">
                    <span class="input-group-text">$</span>
                    <form:input
                      path="amount"
                      class="form-control"
                      placeholder="Enter amount"
                      id="amount"
                    />
                  </div>
                  <form:errors path="amount" class="text-danger" />
                </div>

                <div class="mb-4">
                  <label for="note" class="form-label">Notes (Optional)</label>
                  <form:textarea
                    path="note"
                    class="form-control"
                    placeholder="Enter any additional notes"
                    id="note"
                    rows="3"
                  />
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <button
                    type="submit"
                    class="btn btn-primary btn-submit me-md-2"
                  >
                    <i class="fas fa-save me-1"></i>
                    ${expense.id == null ? 'Add Expense' : 'Update Expense'}
                  </button>

                  <c:if test="${expense.id != null}">
                    <a
                      href="${contextRoot}/expense/${expense.id}/delete"
                      class="btn btn-danger btn-delete"
                    >
                      <i class="fas fa-trash-alt me-1"></i>
                      Delete
                    </a>
                  </c:if>
                </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
