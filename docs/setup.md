# Setup completo (Supabase + Stripe + Build Android/iOS)

## 1) Flutter

1. Instale Flutter SDK.
2. Rode:
   ```bash
   flutter doctor
   flutter pub get
   ```

## 2) Supabase

1. Crie projeto no Supabase.
2. Execute `supabase/schema.sql` no SQL Editor.
3. Configure auth por email/senha.
4. Ative RLS e crie políticas por usuário:
   - personal só enxerga seus alunos/treinos
   - aluno só enxerga seus próprios treinos/progresso
5. Configure variáveis para o app:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`

## 3) Stripe (R$19,90/mês)

1. Crie produto + preço recorrente mensal (R$19,90).
2. Salve o `price_id` e passe no app como `STRIPE_PRICE_ID`.
3. Crie endpoint para criar Checkout Session.
4. Publique função `supabase/stripe_webhook.ts`.
5. No dashboard Stripe, configure webhook apontando para a função publicada.
6. Eventos obrigatórios:
   - `customer.subscription.updated`
   - `customer.subscription.deleted`

## 4) Rodar app localmente

```bash
flutter run \
  --dart-define=SUPABASE_URL=... \
  --dart-define=SUPABASE_ANON_KEY=... \
  --dart-define=STRIPE_PUBLISHABLE_KEY=... \
  --dart-define=STRIPE_PRICE_ID=...
```

## 5) Gerar APK

```bash
flutter build apk --release \
  --dart-define=SUPABASE_URL=... \
  --dart-define=SUPABASE_ANON_KEY=... \
  --dart-define=STRIPE_PUBLISHABLE_KEY=... \
  --dart-define=STRIPE_PRICE_ID=...
```

Saída padrão: `build/app/outputs/flutter-apk/app-release.apk`

## 6) Publicar

### Android (Play Store)
1. Crie app no Google Play Console.
2. Gere `aab` com `flutter build appbundle --release`.
3. Envie versão, screenshots e política de privacidade.
4. Publique na trilha interna antes da produção.

### iOS (App Store)
1. Configure certificados no Xcode.
2. Gere build com `flutter build ipa --release`.
3. Envie via Transporter/TestFlight.
4. Preencha privacidade e submissão na App Store Connect.

## 7) Próximas etapas (iteração recomendada)

1. CRUD completo de treino/exercício no Supabase.
2. Upload de vídeo otimizado + fallback YouTube embed.
3. Histórico de progresso e métricas.
4. Bloqueio real de acesso com base em assinatura.
5. Notificações push e ranking (escalabilidade futura).
