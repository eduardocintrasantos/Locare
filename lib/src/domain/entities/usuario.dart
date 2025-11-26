// src/domain/entities/usuario.dart
// Entidade Usuario para gestão de usuários do sistema.

class Usuario {
  String id = ''; // UUID do Supabase Auth

  late String nome;
  late String email;
  String? telefone;

  // Trial de 7 dias gratuitos
  late DateTime trialEndsAt;
  bool isPremium = false;
  DateTime? premiumExpiresAt;

  late DateTime createdAt;
  DateTime? updatedAt;

  // Verifica se o trial ainda está ativo
  bool get isTrialActive => !isPremium && DateTime.now().isBefore(trialEndsAt);

  // Verifica se o usuário tem acesso (trial ativo OU premium ativo)
  bool get hasAccess {
    if (isPremium) {
      return premiumExpiresAt == null ||
          DateTime.now().isBefore(premiumExpiresAt!);
    }
    return isTrialActive;
  }

  // Dias restantes do trial
  int get trialDaysRemaining {
    if (isPremium) return 0;
    final remaining = trialEndsAt.difference(DateTime.now()).inDays;
    return remaining > 0 ? remaining : 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'trial_ends_at': trialEndsAt.toIso8601String(),
      'is_premium': isPremium,
      'premium_expires_at': premiumExpiresAt?.toIso8601String(),
    };
  }
}
