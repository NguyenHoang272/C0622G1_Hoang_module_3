package controller;

import model.facility.Facility;
import service.IFacilityService;
import service.impl.FacilityService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add-villa":
                addVilla(request, response);
                break;
            case "add-house":
                addHouse(request, response);
                break;
            case "add-room":
                addRoom(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            default:
                listService(request, response);
                break;
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double price = Double.parseDouble(request.getParameter("price"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentType = Integer.parseInt(request.getParameter("rent_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        double poolArea = Double.parseDouble(request.getParameter("pool_area"));
        int floors = Integer.parseInt(request.getParameter("number_of_floors"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String facilityFree = request.getParameter("facility_free");
        Facility newfacility = new Facility(id,name, area, price, maxPeople, rentType, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, floors, facilityFree);
        facilityService.edit(newfacility);
        if (newfacility.getFacilityType() == 1) {
            try {
                request.getRequestDispatcher("view/edit_villa.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (newfacility.getFacilityType() == 2) {
            try {
                request.getRequestDispatcher("view/edit_house.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (newfacility.getFacilityType() == 3) {
            try {
                request.getRequestDispatcher("view/edit_room.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void addRoom(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double price = Double.parseDouble(request.getParameter("price"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentType = Integer.parseInt(request.getParameter("rent_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        double poolArea = Double.parseDouble(request.getParameter("pool_area"));
        int floors = Integer.parseInt(request.getParameter("number_of_floors"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String facilityFree = request.getParameter("facility_free");
        Facility newfacility = new Facility(name, area, price, maxPeople, rentType, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, floors, facilityFree);
        facilityService.addFacility(newfacility);
        try {
            request.getRequestDispatcher("view/facilityroom.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addHouse(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double price = Double.parseDouble(request.getParameter("price"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentType = Integer.parseInt(request.getParameter("rent_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        double poolArea = Double.parseDouble(request.getParameter("pool_area"));
        int floors = Integer.parseInt(request.getParameter("number_of_floors"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String facilityFree = request.getParameter("facility_free");
        Facility newfacility = new Facility(name, area, price, maxPeople, rentType, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, floors, facilityFree);
        facilityService.addFacility(newfacility);
        try {
            request.getRequestDispatcher("view/facilityhouse.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addVilla(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double price = Double.parseDouble(request.getParameter("price"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentType = Integer.parseInt(request.getParameter("rent_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        double poolArea = Double.parseDouble(request.getParameter("pool_area"));
        int floors = Integer.parseInt(request.getParameter("number_of_floors"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String facilityFree = request.getParameter("facility_free");
        Facility newfacility = new Facility(name, area, price, maxPeople, rentType, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, floors, facilityFree);
        facilityService.addFacility(newfacility);
        try {
            request.getRequestDispatcher("view/facilityvilla.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add-villa":
                showFormVilla(request, response);
                break;
            case "add-house":
                showFormHouse(request, response);
                break;
            case "add-room":
                showFormRoom(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            case "find":
                findFacility(request, response);
                break;
            default:
                listService(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.selectFacility(id);
        request.setAttribute("facility", facility);
        if (facility.getFacilityType() == 1) {
            try {
                request.getRequestDispatcher("view/edit_villa.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (facility.getFacilityType() == 2) {
            try {
                request.getRequestDispatcher("view/edit_house.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (facility.getFacilityType() == 3) {
            try {
                request.getRequestDispatcher("view/edit_room.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showFormRoom(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.getRequestDispatcher("view/facilityroom.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormHouse(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/facilityhouse.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormVilla(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/facilityvilla.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findFacility(HttpServletRequest request, HttpServletResponse response) {
        int type = Integer.parseInt(request.getParameter("facility_type"));
        String search = request.getParameter("search");
        if (type==0){

            List<Facility> facilityList = facilityService.findByName(search);
            request.setAttribute("facilityList", facilityList);
            try {
                request.getRequestDispatcher("view/facility.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            List<Facility> facilityList = facilityService.find(search,type);
            request.setAttribute("facilityList", facilityList);
            try {
                request.getRequestDispatcher("view/facility.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        facilityService.deleteFacility(id);
        listService(request, response);
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.getListService();
        request.setAttribute("facilityList", facilityList);
        try {
            request.getRequestDispatcher("view/facility.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
