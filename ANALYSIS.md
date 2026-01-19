# 📊 ANALYSIS.md - Week 6 N-Tier Architecture Analysis
## การวิเคราะห์และเปรียบเทียบ 4 Architectures (Week 3-6)

**ชื่อ-นามสกุล:**  พชร จันทร์ยวง
**รหัสนักศึกษา:** 67543210039-3
**วันที่ส่ง:** 

---

# 📊 ANALYSIS.md - Week 6 N-Tier Architecture Analysis
**การวิเคราะห์และเปรียบเทียบ 4 Architectures (Week 3-6)**  
**ชื่อ-นามสกุล:** _______________________  
**รหัสนักศึกษา:** _______________________  
**วันที่ส่ง:** _______________________  

---

## คำถาม 1: เปรียบเทียบ 4 Architectures (15 คะแนน)

| ด้าน | Week 3 (Monolithic) | Week 4 (Layered) | Week 5 (Client-Server) | Week 6 (N-Tier) |
|-------|--------------------|-----------------|-----------------------|----------------|
| Database | SQLite | SQLite | SQLite | PostgreSQL |
| Web Server | None | None | Node.js built-in | Nginx (Reverse Proxy) |
| Protocol | Local function calls | Local function calls | HTTP | HTTP/HTTPS |
| Separation Type | None | Logical layers | Client/Server | Multiple tiers (Web, App, DB) |
| Number of Processes | 1 | 1 | 2 | 3+ |
| Network Required | No | No | Yes | Yes |
| Scalability | Low | Low | Medium | High |
| Security Level | Low | Low | Medium | High |
| Complexity | Low | Medium | Medium | High |
| Deploy Difficulty | Easy | Easy | Medium | Medium-Hard |
| Development Speed | Fast | Medium | Medium | Medium |
| Production Ready | No | Limited | Yes | Yes |

**อธิบายเพิ่มเติม:**  

- **Week 3 (Monolithic):**  
  - ข้อดีหลัก: พัฒนาเร็ว, เรียนรู้ง่าย  
  - ข้อเสียหลัก: ขยายระบบยาก, ทดสอบยาก  
  - เหมาะกับ: โปรเจกต์เล็ก, ทีมเล็ก, MVP  

- **Week 4 (Layered):**  
  - ข้อดีหลัก: โค้ดมีโครงสร้าง, แบ่ง responsibility ชัดเจน  
  - ข้อเสียหลัก: ยังคง deploy เป็นโปรแกรมเดียว, scalability ยังจำกัด  
  - เหมาะกับ: ระบบขนาดกลาง, ต้องการ maintainability  

- **Week 5 (Client-Server):**  
  - ข้อดีหลัก: แยก client/server, ใช้ network communication  
  - ข้อเสียหลัก: ต้องดูแล network และ protocol, อาจซับซ้อน  
  - เหมาะกับ: ระบบที่มีผู้ใช้หลาย client, เริ่มต้องรองรับ traffic  

- **Week 6 (N-Tier):**  
  - ข้อดีหลัก: Scalability สูง, Security ดี, Maintainable  
  - ข้อเสียหลัก: ตั้งค่าและ deploy ซับซ้อน, ต้องจัดการหลาย VM / process  
  - เหมาะกับ: Production ระบบใหญ่, Enterprise Application  

---

## คำถาม 2: Quality Attributes Radar Chart (10 คะแนน)

| Quality Attribute | Week 3 | Week 4 | Week 5 | Week 6 | หมายเหตุ |
|------------------|--------|--------|--------|--------|-----------|
| Performance | 4 | 4 | 4 | 5 | N-Tier ใช้ caching, DB connection pooling |
| Scalability | 1 | 2 | 3 | 5 | สามารถเพิ่ม Web/App/DB Tier ได้ |
| Security | 1 | 2 | 3 | 5 | HTTPS + DB credentials management |
| Maintainability | 2 | 3 | 4 | 5 | Separation of concerns ชัดเจน |
| Testability | 2 | 3 | 4 | 5 | Testable แต่ละ tier แยกกันได้ |
| Deployability | 5 | 4 | 3 | 4 | ต้อง config หลาย VM แต่มีสคริปต์ช่วย |
| Availability | 2 | 2 | 3 | 5 | สามารถทำ load balancing / replication |
| Modifiability | 2 | 3 | 4 | 5 | สามารถปรับ upgrade tier ได้ง่าย |
| **รวม** | 19/40 | 21/40 | 25/40 | 34/40 | |

**ตัวอย่างคำอธิบายการให้คะแนน:**  

- **Performance:** Week 6 ใช้ PostgreSQL + connection pool + Nginx → เร็วที่สุด  
- **Scalability:** Week 3 Monolithic ไม่สามารถ scale ได้, N-Tier scale ได้ง่าย  
- **Security:** Week 6 มี HTTPS, DB credentials, firewall, separation tier  
- **Maintainability:** โค้ดแยกเป็น controllers/services/repositories  
- **Testability:** Test แต่ละ tier แยกได้, ใช้ Postman/curl  

---

## คำถาม 3: สถานการณ์การใช้งาน (10 คะแนน)

**สถานการณ์ A: Startup MVP**  
- Architecture ที่เลือก: [x] Week 3 / [ ] Week 4 / [ ] Week 5 / [ ] Week 6  
- เหตุผล: ต้องการพัฒนาเร็ว, ทีมเล็ก, budget ต่ำ, feedback เร็ว  

**สถานการณ์ B: E-commerce Platform**  
- Architecture ที่เลือก: [ ] Week 3 / [ ] Week 4 / [ ] Week 5 / [x] Week 6  
- เหตุผล: รองรับผู้ใช้จำนวนมาก, ต้องการ scalability, security, HTTPS  

**สถานการณ์ C: Internal Company Tool**  
- Architecture ที่เลือก: [ ] Week 3 / [ ] Week 4 / [x] Week 5 / [ ] Week 6  
- เหตุผล: ใช้งานภายใน, ทีมขนาดเล็ก, ต้องการ basic client-server separation  

**สถานการณ์ D: Banking Application**  
- Architecture ที่เลือก: [ ] Week 3 / [ ] Week 4 / [ ] Week 5 / [x] Week 6  
- เหตุผล: Security-critical, compliance, audit logs, high availability  

---

## คำถาม 4: ประสบการณ์จากการทำ Lab (5 คะแนน)

**ก. ปัญหาที่พบในการทำ Week 6**

| # | ปัญหา | สาเหตุ | วิธีแก้ไข |
|---|--------|--------|------------|
| 1 | Database connection fail | Password mismatch | Reset user password (`ALTER USER taskboard WITH PASSWORD 'taskboard123';`)เลยเปลี่ยนเป็นของตัวเอง |
| 2 | Node.js API ไม่ตอบ | PM2 script path ผิด | ตรวจสอบ `server.js` path และ restart PM2 |
| 3 | HTTPS warning | Self-signed certificate | Accept warning หรือใช้ certificate จาก CA |

**ข. เวลาที่ใช้ในแต่ละส่วน**

| ส่วนงาน | เวลาที่คาด | เวลาจริง | หมายเหตุ |
|----------|------------|-----------|-----------|
| ติดตั้ง PostgreSQL | 10 min | 15 min | ตรวจสอบ service/port |
| ติดตั้ง Nginx | 5 min | 10 min | ตั้งค่า config + restart |
| สร้าง SSL Certificate | 5 min | 10 min | Self-signed |
| Migrate Database | 10 min | 15 min | สร้าง table, seed data |
| ตั้งค่า Nginx Config | 10 min | 15 min | proxy_pass + HTTPS |
| Testing | 20 min | 25 min | PM2 + curl + Browser |
| **รวม** | 60 min | 90 min | |

**ค. สิ่งที่ได้เรียนรู้ใหม่:**  
1. การใช้ PM2 จัดการ Node.js processes  
2. การตั้งค่า Nginx เป็น reverse proxy  
3. การสร้าง self-signed SSL certificate  
4. การ debug PostgreSQL authentication  
5. การแยก architecture เป็นหลาย tier เพื่อ scalability  

---

## คำถาม 5: Evolution Path (5 คะแนน)

**จาก Monolithic → Layered:**  
- Trigger: โค้ดใหญ่, ต้องการ testability, maintainability  

**จาก Layered → Client-Server:**  
- Trigger: มีหลาย client, ต้องการ remote access, scalability  

**จาก Client-Server → N-Tier:**  
- Trigger: ระบบ production, security-critical, high traffic  

**จาก N-Tier → Microservices:**  
- Trigger: ต้องการ deploy/scale แต่ละ service แยก, ทีมใหญ่  


### Decision Flowchart:

```
  เริ่มโปรเจกต์ใหม่
        │
        ▼
  ทีมมีประสบการณ์น้อย? & งบประมาณต่ำ?
        │
   ┌────┴────┐
   │         │
  Yes        No
   │         │
   ▼         ▼
Monolithic  ระบบต้องขยายได้ / traffic สูง / security สูง?
              │
         ┌────┴────┐
         │         │
        Yes        No
         │         │
         ▼         ▼
      N-Tier   Layered / Client-Server
         │
         ▼
  ต้องการแยกบริการ / scale แต่ละ service แยกได้?
         │
   ┌─────┴─────┐
   │           │
  Yes          No
   │           │
   ▼           ▼
Microservices  คงไว้ N-Tier

```
คำอธิบายการไหล:
ถ้าเป็น ทีมเล็ก / งบจำกัด / Timeline สั้น → Monolithic เหมาะสำหรับ MVP
ถ้า ระบบซับซ้อนขึ้น ต้องการ maintainability และ scalability → Layered หรือ Client-Server
ถ้า ต้องการ production-ready, security และรองรับผู้ใช้จำนวนมาก → N-Tier
ถ้า ต้องการแยกบริการเป็นอิสระ และ scale แต่ละ service ได้เอง → Microservices
---

---

## คำถาม 6: บทเรียนสำคัญ (5 คะแนน)

**Top 3 บทเรียน:**  

**บทเรียน 1:**  
- หัวข้อ: การตั้งค่า N-Tier Architecture  
- รายละเอียด: เข้าใจการแยก Web/App/DB tier, PM2, Nginx reverse proxy  
- จะนำไปใช้อย่างไร: ใช้ในโปรเจกต์ production เพื่อ scalability  

**บทเรียน 2:**  
- หัวข้อ: Database Security & Connection  
- รายละเอียด: PostgreSQL authentication, connection pooling  
- จะนำไปใช้อย่างไร: ป้องกัน DB leak, เพิ่ม performance  

**บทเรียน 3:**  
- หัวข้อ: HTTPS / SSL  
- รายละเอียด: Self-signed certificate, browser trust  
- จะนำไปใช้อย่างไร: ใช้ HTTPS development + production  

**ถ้าเริ่มทำใหม่ตั้งแต่ Week 3 จะทำอะไรต่างไป:**  
1. วางแผน architecture ตั้งแต่แรก  
2. แยก source code ตาม tier ตั้งแต่ Week 4  
3. ใช้ environment variables สำหรับ credentials ตั้งแต่แรก  

**ทักษะที่ได้พัฒนามากที่สุด**

| ทักษะ                 | ระดับก่อนทำ (1-5) | ระดับหลังทำ (1-5) | หมายเหตุ                                                               |
| --------------------- | ----------------- | ----------------- | ---------------------------------------------------------------------- |
| Linux/Ubuntu          | 3                 | 4                 | ทำ VM, ใช้ terminal, ตั้งค่า hosts, sudo, service                      |
| Database (SQL)        | 2                 | 4                 | เปลี่ยนจาก SQLite → PostgreSQL, เขียน query, ใช้ psql, connection pool |
| Web Server (Nginx)    | 1                 | 3                 | ตั้งค่า reverse proxy, HTTPS, config, logs                             |
| Node.js/Express       | 3                 | 4                 | สร้าง API, routes, controllers, services, middleware                   |
| REST API              | 3                 | 4                 | CRUD operations, health check, JSON responses                          |
| Git/Version Control   | 3                 | 4                 | commit, push, branch, merge, project structure management              |
| Networking            | 2                 | 3                 | proxy_pass, firewall, localhost vs VM IP, multi-tier setup             |
| Security (SSL/HTTPS)  | 1                 | 3                 | self-signed certificate, HTTPS setup, .env secrets                     |
| Architecture Thinking | 2                 | 4                 | วิเคราะห์ Monolithic → Layered → Client-Server → N-Tier                |


**สิ่งที่ยังสับสนหรืออยากเรียนรู้เพิ่ม:**  
1. Load Balancer + Horizontal Scaling  ***
2. Database replication / clustering  
3. Production-ready HTTPS certificate  

---

## 📸 Screenshots

1. Services Status (PostgreSQL, Nginx, PM2)  

2. HTTPS in Browser (https://taskboard.local)  

3. API Response (`curl -k https://taskboard.local/api/tasks`)  

4. Task Board UI Working  

5. Create/Edit Task  

---

**🔗 Links**  
- GitHub Repository: _______________________  
- VM IP Address: _______________________  
- API Endpoint: https://taskboard.local/api  

✅ Self-Check: ตารางครบ, Quality Attributes ครบ, สถานการณ์ครบ, ปัญหา/วิธีแก้ชัดเจน, Evolution path, Screenshots 5 รูป, Push GitHub

*ENGSE207 - Software Architecture - Week 6*  
*มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา*