# Treino SaaS (Flutter + Supabase + Stripe)

Base inicial de aplicativo mobile multiplataforma (Android/iOS) para personal trainers e alunos, com foco em UX simples, performance e escalabilidade.

## Stack

- Flutter (UI nativa e performática)
- Supabase (auth + PostgreSQL + edge functions)
- Stripe (assinatura recorrente R$19,90/mês)
- Arquitetura limpa e modular

## Estrutura de pastas

```text
lib/
  core/          # Configurações globais, erros, utils, roteamento, contratos de use cases
  features/      # Módulos por domínio (auth, personal, student)
  services/      # Integrações externas (Supabase, Stripe)
  models/        # Modelos de dados da aplicação
  controllers/   # Estado global/session management
  theme/         # Design system (tema branco + dourado)
  components/    # Componentes reutilizáveis
supabase/
  schema.sql     # Banco e índices para performance
  stripe_webhook.ts # Função de webhook para ativar/desativar assinatura

docs/
  setup.md       # Setup completo de ambiente, Supabase, Stripe e publicação
```

## Funcionalidades base implementadas

- Login com email/senha + recuperação de senha
- Roteamento por perfil (personal/aluno)
- Área Personal com:
  - Card de status de assinatura
  - Ações principais (criar treino, gerenciar alunos, assinatura)
- Área Aluno estilo catálogo de treinos com cards e botão iniciar
- Tema visual premium minimalista (branco + dourado)

## Como rodar

> Pré-requisito: Flutter SDK instalado localmente.

```bash
flutter pub get
flutter run \
  --dart-define=SUPABASE_URL=... \
  --dart-define=SUPABASE_ANON_KEY=... \
  --dart-define=STRIPE_PUBLISHABLE_KEY=... \
  --dart-define=STRIPE_PRICE_ID=...
```

Veja instruções completas em `docs/setup.md`.
