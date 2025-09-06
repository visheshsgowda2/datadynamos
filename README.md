# Smart Campus: AI Energy & Facility Optimization

A production-ready, mobile-responsive web application with ML services that optimizes campus energy and facilities using AI and GenAI. Features synthetic IoT data simulation for complete demo capabilities.

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- Node.js 18+ (for development)
- Python 3.9+ (for ML development)

### One-Command Demo Setup

\`\`\`bash
# Clone and start the entire system
git clone <repository-url>
cd smart-campus
cp .env.example .env
docker-compose up -d

# Wait for services to start (30-60 seconds)
# Seed the database with demo data
docker-compose exec api python scripts/seed_data.py

# Access the application
open http://localhost:3000
\`\`\`

### Demo Users

| Role | Email | Password | Capabilities |
|------|-------|----------|-------------|
| CEO | ceo@demo.local | Pass123! | Full system access, billing, reports |
| Facility Manager | fm@demo.local | Pass123! | Building controls, energy management |
| Building Admin | admin@demo.local | Pass123! | Floor/room management |
| Employee | emp@demo.local | Pass123! | Room booking, own-room controls |
| Auditor | auditor@demo.local | Pass123! | Read-only, compliance reports |

## 🏗️ Architecture

### Monorepo Structure

\`\`\`
/apps/web           # Next.js React app (SSR), Tailwind + shadcn/ui
/apps/api           # FastAPI REST+WebSocket, RBAC, OpenAPI docs
/apps/ml            # FastAPI ML services (forecast/anomaly/optimizer)
/apps/iot-sim       # Synthetic IoT publisher + device actuators
/packages/ui        # Shared UI components
/packages/lib       # Shared types, auth, RBAC, telemetry
/infra              # Docker, nginx, MQTT, seed SQL, Grafana
/design             # Figma exports, diagrams
/docs               # API docs, runbook, demo script
/tests              # Unit, integration, e2e tests
\`\`\`

### Services

- **Web App** (Port 3000): Next.js dashboard with real-time updates
- **API Server** (Port 8000): FastAPI with WebSocket support
- **ML Services** (Port 8001): AI/ML endpoints for forecasting and optimization
- **IoT Simulator**: Synthetic device telemetry and control
- **TimescaleDB** (Port 5432): Time-series data storage
- **Redis** (Port 6379): Caching and real-time data
- **MQTT Broker** (Port 1883): IoT device communication
- **Grafana** (Port 3001): System monitoring dashboards

## 🎯 Key Features

### Real-Time Energy Management
- Interactive campus heatmap with drill-down capability
- Live device control (lights, HVAC, projectors)
- 1-minute resolution telemetry with <2s command acknowledgment
- Auto-off rules based on occupancy and schedules

### AI-Powered Optimization
- 24-72h energy forecasting using Prophet/LSTM
- Anomaly detection with severity scoring
- Automated HVAC and lighting optimization
- GenAI explanations for energy changes

### Smart Room Booking
- Calendar-based room reservation system
- Auto-release for no-shows (configurable timeout)
- Energy-friendly "Smart Slots" recommendations
- QR/NFC check-in simulation

### Compliance & Reporting
- LEED/ISO 50001 proxy metrics
- Signed PDF reports with content hashing
- Comprehensive audit logging
- Sustainability dashboards with CO₂e tracking

### Role-Based Access Control
- Hierarchical permissions (campus → building → floor → room)
- Attribute-based access control (ABAC)
- JWT authentication with refresh tokens
- Comprehensive audit trail

## 🎮 Demo Script (10-15 minutes)

1. **Employee Experience**
   - Login as `emp@demo.local`
   - Book room RM-3F-101 for 2 minutes from now
   - Skip check-in → observe auto-release after timeout
   - See lights turn off and HVAC switch to Eco mode

2. **Facility Manager Workflow**
   - Switch to `fm@demo.local`
   - Use heatmap to drill down to floor plan
   - Identify anomaly alert → click "Explain"
   - Apply AI recommendation (scene/policy)

3. **Executive Dashboard**
   - Login as `ceo@demo.local`
   - View bill comparison (August vs September)
   - Click "What Changed?" for AI explanation
   - Review savings projections

4. **Compliance Audit**
   - Switch to `auditor@demo.local`
   - Download signed compliance report
   - Verify audit log entries for previous actions

## 🔧 Development

### Local Development Setup

\`\`\`bash
# Install dependencies
npm install

# Start individual services for development
cd apps/web && npm run dev          # Web app on :3000
cd apps/api && uvicorn main:app --reload --port 8000
cd apps/ml && uvicorn main:app --reload --port 8001
cd apps/iot-sim && python main.py

# Run tests
npm run test                        # All tests
npm run test:e2e                   # Playwright E2E tests
npm run test:load                  # k6 load tests
\`\`\`

### API Documentation

- **OpenAPI Docs**: http://localhost:8000/docs
- **Swagger UI**: http://localhost:8000/redoc
- **ML API Docs**: http://localhost:8001/docs

## 📊 Monitoring

- **Grafana Dashboards**: http://localhost:3001 (admin/admin)
- **System Metrics**: Prometheus metrics at `/metrics` endpoints
- **Application Logs**: Structured JSON logs with OpenTelemetry tracing

## 🧪 Testing

\`\`\`bash
# Unit tests
npm run test:unit

# Integration tests
npm run test:integration

# E2E tests (requires running services)
npm run test:e2e

# Load testing
npm run test:load

# ML model validation
cd apps/ml && python -m pytest tests/
\`\`\`

## 🚀 Deployment

### Production Deployment

\`\`\`bash
# Build production images
docker-compose -f docker-compose.prod.yml build

# Deploy with production configuration
docker-compose -f docker-compose.prod.yml up -d

# Run database migrations
docker-compose exec api alembic upgrade head
\`\`\`

### Environment Variables

See `.env.example` for all configuration options. Key variables:

- `GENAI_API_KEY`: Optional OpenAI key for AI features
- `JWT_SECRET`: Change in production
- `DATABASE_URL`: Production database connection
- `LOG_LEVEL`: Set to `warning` or `error` in production

## 📈 Performance Targets

- Command acknowledgment: <2 seconds end-to-end
- Heatmap rendering: 1-minute resolution for 10k+ rooms
- 99.9% uptime target with graceful degradation
- WebSocket real-time updates with <100ms latency

## 🔒 Security

- TLS encryption for all external communications
- JWT tokens with short TTL + refresh token rotation
- RBAC/ABAC enforcement on all endpoints
- Rate limiting and CSRF protection
- Content Security Policy (CSP) headers
- Comprehensive audit logging

## 📋 Compliance

- WCAG AA accessibility compliance
- LEED/ISO 50001 proxy metrics
- Audit trail for all control actions
- Signed reports with SHA256 verification
- Data retention policies for telemetry

## 🎨 Design System

- Futuristic, clean aesthetic with glassmorphism hints
- Light/dark theme support with system preference detection
- Mobile-first responsive design
- Micro-animations for state changes
- 3D campus visualization with Three.js

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Run tests and linting
4. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details
