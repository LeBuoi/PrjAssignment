package asg.shopping.controllers;

import asg.dtos.CartDTO;
import asg.dtos.ProductDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class UpdateCartController extends HttpServlet {

    public static final String ERROR = "viewproduct.jsp";
    public static final String SUCCESS = "viewcart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productQuantity = request.getParameter("productQuantity");          
                HttpSession session = request.getSession();
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                ProductDTO product = null;
                for(ProductDTO dto : cart.getCart().values()){
                    if(dto.getProductID().equals(productID)){
                        product = new ProductDTO(productID, dto.getProductName(), productQuantity, dto.getProductPrice(),dto.getCategoryID(), dto.getStatus());
                    }
                }
                cart.update(productID, product);
                session.setAttribute("CART", cart);
                url=SUCCESS;            
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
}
