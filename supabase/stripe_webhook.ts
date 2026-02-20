// Supabase Edge Function (Deno)
import Stripe from 'https://esm.sh/stripe@16.2.0?target=denonext';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY') ?? '', {
  apiVersion: '2024-06-20',
});

Deno.serve(async (request: Request) => {
  const signature = request.headers.get('stripe-signature');
  const body = await request.text();

  if (!signature) {
    return new Response('missing signature', { status: 400 });
  }

  const event = await stripe.webhooks.constructEventAsync(
    body,
    signature,
    Deno.env.get('STRIPE_WEBHOOK_SECRET') ?? '',
  );

  const supabase = createClient(
    Deno.env.get('SUPABASE_URL') ?? '',
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
  );

  if (
    event.type === 'customer.subscription.updated' ||
    event.type === 'customer.subscription.deleted'
  ) {
    const subscription = event.data.object as Stripe.Subscription;
    const active = ['active', 'trialing'].includes(subscription.status);

    await supabase
      .from('assinaturas')
      .update({
        status: subscription.status,
        current_period_end: new Date(subscription.current_period_end * 1000),
      })
      .eq('stripe_subscription_id', subscription.id);

    const userId = subscription.metadata.user_id;
    if (userId) {
      await supabase
        .from('users')
        .update({ subscription_active: active })
        .eq('id', userId);
    }
  }

  return new Response('ok', { status: 200 });
});
