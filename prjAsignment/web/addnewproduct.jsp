
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='CSS/viewStyle.css' rel='stylesheet' type="text/css"/>
        <title>Add product</title>
    </head>
    <body>
        <h1>Add a new product</h1>       
        <form action="MainController">
            <label for="category">Category</label>
            <select name="categoryID" id="category">
                <option value="FL">Flower</option>
                <option value="PE">Perfume</option>
                <option value="AC">Accessories</option>
            </select></br>
            <label for="ID">Product ID</label>
            <input type="text" name="productID" id="ID" placeholder="Category-XXX"
                   pattern="(FL|PE|AC)-[0-9]{3}" title="Category-XXX"/></br>
            <div>${requestScope.PRODUCT_ERROR.productIDError}</div>
            <label for="name">Name</label>
            <input type="text" name="productName" id="name" maxlength="40"/></br>
            <label for="quantity">Quantity</label>
            <input type="number" name="productQuantity" id="quantity" min="0"/></br>
            <label for="price">Price($)</label>
            <input type="number" step="0.01" name="productPrice" id="price" min="0" title="US Dollars"/></br>                        
            <input type="submit" class="action" name="action" value="Add"/>
            <input type="reset" value="Reset"/>
        </form>
            <button onclick="JavaScript:window.location='fullcontrol.jsp'">Go back</button>
        
    </body>
</html>
