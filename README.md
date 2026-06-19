# Robot Framework POM — Quản Lý Kho Vật Liệu

Dự án automation test UI dùng **Robot Framework** + **SeleniumLibrary** theo **Page Object Model (POM)**.

## Cấu trúc

```
robot-pom-template/
├── config/                          # Cấu hình đa môi trường
│   ├── dev.yml                      #   Localhost
│   ├── staging.yml                  #   Staging
│   └── prod.yml                     #   Production
│
├── resources/                       # Core framework
│   ├── locators/                    #   Selectors (Python, không logic)
│   │   ├── LoginPageLocators.py
│   │   ├── HomePageLocators.py
│   │   ├── ProductPageLocators.py
│   │   ├── OrderPageLocators.py
│   │   ├── ImportPageLocators.py
│   │   ├── ExportPageLocators.py
│   │   ├── StockPageLocators.py
│   │   └── InventoryPageLocators.py
│   │
│   ├── page_objects/                #   Keywords per page
│   │   ├── LoginPage.resource
│   │   ├── HomePage.resource
│   │   ├── ProductPage.resource
│   │   ├── OrderPage.resource
│   │   ├── ImportPage.resource
│   │   ├── ExportPage.resource
│   │   ├── StockPage.resource
│   │   └── InventoryPage.resource
│   │
│   ├── base_keywords.resource       #   Keywords dùng lại (click, type, wait)
│   └── common_keywords.resource     #   Setup/teardown, login
│
├── tests/                           # Test cases (thuần behavior)
│   ├── __init__.robot               #   Suite setup/teardown
│   ├── 01-LoginTests.robot          #   4 tests
│   ├── 02-ProductTests.robot        #   3 tests
│   ├── 03-NavigationTests.robot     #   4 tests
│   ├── 04-OrderTests.robot          #   3 tests
│   ├── 05-WarehouseTests.robot      #   4 tests
│   ├── 06-StockTests.robot          #   2 tests
│   ├── 07-InventoryTests.robot      #   3 tests
│   ├── 08-ReportTests.robot         #   1 test
│   └── 09-UserProfileTests.robot    #   1 test
│
├── results/                         # Kết quả chạy (log, report)
├── run.py                           # Runner script
├── run.bat                          # Runner (Windows)
├── requirements.txt
├── .gitignore
└── README.md
```

## Yêu cầu

- Python 3.9+
- Microsoft Edge (hoặc Chrome/Firefox)
- msedgedriver.exe (đặt trong thư mục này hoặc trong PATH)


## Cài đặt

```bash
pip install -r requirements.txt
```

## Chạy test

### Chạy tất cả (mặc định staging)

```bash
python run.py
```
<!-- 
### Chạy với môi trường khác

```bash
python run.py -c config/dev.yml
python run.py -c config/prod.yml
``` -->

### Chạy từng file test

```bash 
python run.py -- tests/01-LoginTests.robot
python run.py -- tests/02-ProductTests.robot
python run.py -- tests/03-NavigationTests.robot
python run.py -- tests/04-OrderTests.robot
python run.py -- tests/05-WarehouseTests.robot
python run.py -- tests/06-StockTests.robot
python run.py -- tests/07-InventoryTests.robot
python run.py -- tests/08-ReportTests.robot
python run.py -- tests/09-UserProfileTests.robot
```

### Chạy không cần UI

```bash
python run.py --headless
```
### Chạy không cần UI cho từng file test
```bash
python run.py --headless tests/01-LoginTests.robot
python run.py --headless tests/02-ProductTests.robot
python run.py --headless tests/03-NavigationTests.robot
python run.py --headless tests/04-OrderTests.robot
python run.py --headless tests/05-WarehouseTests.robot
python run.py --headless tests/06-StockTests.robot
python run.py --headless tests/07-InventoryTests.robot
python run.py --headless tests/08-ReportTests.robot
python run.py --headless tests/09-UserProfileTests.robot
```

### Xem kết quả

Mở `results/report.html` hoặc `results/log.html` trong trình duyệt.

## Danh sách test

1. Đăng nhập thành công
2. Đăng nhập sai username
3. Đăng nhập sai mật khẩu
4. Đăng xuất
5. Xem danh sách sản phẩm
6. Tìm kiếm sản phẩm
7. Mở modal tạo sản phẩm
8. Dashboard
9. Danh mục
10. Đơn vị & Quy đổi
11. Tài khoản
12. Đơn hàng bán - Danh sách
13. Đơn hàng bán - Lọc
14. Đơn hàng bán - Báo cáo
15. Nhập kho - Danh sách
16. Nhập kho - Lọc/Tìm
17. Xuất kho - Danh sách
18. Xuất kho - Lọc
19. Tồn kho - Danh sách
20. Tồn kho - Tìm kiếm
21. Kiểm kê
22. Hao hụt
23. Chênh lệch kho
24. Báo cáo tồn kho
25. Profile popup
