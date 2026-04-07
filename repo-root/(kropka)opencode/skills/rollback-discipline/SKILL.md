---
name: rollback-discipline
description: Rollback discipline - kiedy i jak robić rollback
---

# Rollback Discipline

## Zasady

1. Rollback to ostatnia opcja - najpierw spróbuj naprawić
2. Backup before rollback
3. Speed over completeness
4. Document everything

## Kiedy rollback

| Sytuacja | Akcja |
|----------|-------|
| Strona nie ładuje się (500) | NATYCHMIAST rollback |
| E-commerce broken | NATYCHMIAST rollback |
| Bezpieczeństwo compromised | NATYCHMIAST rollback |
| Dane exposed | NATYCHMIAST rollback |
| Mass 404 errors | Szybki assessment |
| Performance degraded 50% | Szybki assessment |

## Scenariusze

### A: Mała zmiana (CSS/JS)

- Rollback files only
- Bez impact na DB

### B: Średnia zmiana (PHP)

- Rollback files
- Rollback DB jeśli trzeba

### C: Krytyczny

- Full rollback
- Chief-operator approval
- Full incident report

## Procedura

1. **Assessment** - szybka ocena sytuacji
2. **Decision** - czy rollback jest potrzebny i jaki scope
3. **Approval** - chief-operator dla scenario C
4. **Backup** - backup obecnego stanu przed rollback
5. **Execute** - użyj project-specific backup/restore workflow
6. **Verify** - uruchom `/smoke`
7. **Document** - incident report

Szczegółowa procedura backup/restore: patrz runbook w `docs/runbooks/emergency-rollback.md` lub workflow w `AGENTS.md`.

## Po rollback

1. Verify - `/smoke`
2. Monitor - `/observe`
3. Document - incident report
4. Communicate - poinformuj stakeholders
