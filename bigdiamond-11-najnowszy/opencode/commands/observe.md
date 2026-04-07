---
name: /observe
description: Obserwacja po release - monitoring, error tracking, performance monitoring
agent: chief-operator
subtask: true
when: Po release, przez 24-48h po wdrożeniu
prerequisites:
  - Dostęp do monitoring tools
  - Dostęp do error logs
---

# Observe

## Cel

Obserwacja po release przez 24-48h:
- Error monitoring
- Performance monitoring
- User behavior
- Business metrics
- Issue detection

## Monitoring Targets

### Technical Metrics
- PHP errors / warnings
- JS errors
- 404/500 responses
- Page load times
- Server response time
- Database query times

### Business Metrics
- Conversion rate
- Cart abandonment
- Checkout completion
- Add-to-cart rate
- Session duration

### User-Facing Issues
- Slow page loads
- Broken functionality
- Missing content
- Design issues

## Procedura

### 1. Immediate (0-1h after release)

#### Error Log Check
```bash
# PHP errors
tail -100 app/public/wp-content/debug.log 2>/dev/null

# Nginx errors
tail -50 logs/nginx/error.log 2>/dev/null

# PHP-FPM errors
tail -50 logs/php/error.log 2>/dev/null
```

#### Smoke Test Re-run
```bash
# Szybki smoke test
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/
curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/koszyk/
```

### 2. Short-Term (1-24h after release)

#### Performance Monitoring
- Sprawdź Lighthouse scores
- Monitor Core Web Vitals
- Sprawdź page load times

#### Error Tracking
- Sprawdź WordPress error log
- Sprawdź WooCommerce logs
- Sprawdź server logs

#### User Reports
- Monitor support channels
- Check for user complaints

### 3. Medium-Term (24-48h after release)

#### Business Metrics
Jeśli available:
- Google Analytics / Matomo
- WooCommerce reports
- Conversion tracking

#### Comparative Analysis
- Porównaj z period przed release
- Szukaj anomalies
- Sprawdź trending

### 4. Issue Response

Jeśli issues found:

1. **Assess severity**
   - Critical: natychmiast action
   - High: w ciągu godziny
   - Medium: w ciągu 24h
   - Low: w ciągu tygodnia

2. **Decision**
   - Fix: napraw i redeploy
   - Rollback: uruchom `/rollback`
   - Monitor: obserwuj czy problem się pogłębia

3. **Communication**
   - Informuj stakeholders
   - Document issue

## Generate Report

```markdown
## Observe Report - YYYY-MM-DD

### Release Info
- Release date: YYYY-MM-DD HH:MM
- Release scope: [changes]
- Release version: X.Y.Z

### Monitoring Period
- Start: YYYY-MM-DD HH:MM
- End: YYYY-MM-DD HH:MM
- Duration: 48 hours

### Technical Status
| Metric | Baseline | Current | Status |
|--------|----------|---------|--------|
| PHP Errors | 0/day | 0/day | OK |
| 404 Rate | 0.1% | 0.1% | OK |
| Avg Load Time | 1.8s | 1.9s | OK |
| LCP | 2.1s | 2.2s | OK |

### Business Metrics (if available)
| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Conversion Rate | 2.1% | 2.3% | +9.5% |
| Cart Abandonment | 65% | 63% | -3% |
| Avg Session | 3:20 | 3:45 | +12% |

### Issues Found
- None

### User Feedback
- No complaints received

### Status: HEALTHY / WARNING / CRITICAL

### Recommendations
- Continue monitoring for next 24h
- Schedule follow-up review in 1 week

### Next Scheduled Check
- YYYY-MM-DD HH:MM
```

## Zasady

- **First 48h are critical** - największe ryzyko zaraz po release
- **Baseline comparison** - zawsze porównuj z before-release
- **Document anomalies** - dokumentuj wszystko co jest dziwne
- **Quick response** - jeśli problem, działaj szybko

## Alert Thresholds

Kiedy ALARM (natychmiast action):
- PHP Fatal Error
- 500 errors > 1% of requests
- LCP > 5s
- Checkout broken
- Data exposure

Kiedy WARNING (monitoruj bliżej):
- LCP > 3s
- Error rate increased 50%
- 404 rate increased
- Performance degraded 20%

## Powiązane

- `/release` - release procedure
- `/smoke` - initial verification
- `/rollback` - jeśli issues found
- `/perf` - detailed performance analysis
