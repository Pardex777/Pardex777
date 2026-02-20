-- Extensões
create extension if not exists "uuid-ossp";

-- Perfis de usuário
create table if not exists public.users (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null unique,
  role text not null check (role in ('personal', 'aluno')),
  subscription_active boolean not null default false,
  created_at timestamptz not null default now()
);

-- Relação personal -> aluno
create table if not exists public.personal_students (
  id uuid primary key default uuid_generate_v4(),
  personal_id uuid not null references public.users(id) on delete cascade,
  student_id uuid not null references public.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (personal_id, student_id)
);

create table if not exists public.treinos (
  id uuid primary key default uuid_generate_v4(),
  personal_id uuid not null references public.users(id) on delete cascade,
  student_id uuid not null references public.users(id) on delete cascade,
  name text not null,
  notes text,
  video_url text,
  created_at timestamptz not null default now()
);

create table if not exists public.exercicios (
  id uuid primary key default uuid_generate_v4(),
  treino_id uuid not null references public.treinos(id) on delete cascade,
  name text not null,
  series int not null,
  repeticoes int not null,
  observacoes text,
  ordem int not null default 0
);

create table if not exists public.progresso (
  id uuid primary key default uuid_generate_v4(),
  treino_id uuid not null references public.treinos(id) on delete cascade,
  student_id uuid not null references public.users(id) on delete cascade,
  concluido_em timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists public.assinaturas (
  id uuid primary key default uuid_generate_v4(),
  personal_id uuid not null references public.users(id) on delete cascade,
  stripe_customer_id text,
  stripe_subscription_id text,
  status text not null,
  current_period_end timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists idx_users_role on public.users(role);
create index if not exists idx_treinos_personal_student on public.treinos(personal_id, student_id);
create index if not exists idx_exercicios_treino_ordem on public.exercicios(treino_id, ordem);
create index if not exists idx_progresso_student_created on public.progresso(student_id, created_at desc);
create index if not exists idx_assinaturas_personal_status on public.assinaturas(personal_id, status);
