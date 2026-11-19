Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132624;
	b=2ciouozX3JRS/DlfPpxgmzK8BYgUX14ttt6VmkU7lQmTMqvNvrpYy7poPHUTQ09v+aR0
	 CWwFpdBsrPg09/7+4TzM2U0RRjErYZAT14pvWz22Vcu/tC6pNPidos89V6B17KyP44LPM
	 vgyxGn1YZNNkhnJH3QSBpOv4VzRzPbh7ot5Nz7wDa06vOKTdWMp6+VvtDUl7oyKaVB8CZ
	 i0g5HVdhsIIWXQM3mBRz6N69aPEA5S6U61urlAs+wKthEeahPv9Ix81zg/sOoiuIuZg2g
	 C8Aq+BHFJWfKW8kBV7IfY3q2uivgVsTPYxZarVu9mIUQPm8dkK8rg7XaCYHyf/54RPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=L/9YEgi/3sLjfpLI8+sqz7+JmJz5Um7hXKDEJ0PhXdM=;
	b=FL4jK7Qq9wmABrUH+SOeu+LBp9ZUCerSlIg2KQ0llKn/7Bsrpe3QXJgxdgoIQunHikNn
	 Q45C6V+oGko8b+e6JhDOtRlel8wNygGM2GrjydnIEvmhVyH4juXRcfbLjY6e2Gmds+TfR
	 EZ5xSlMs264VN2sETpIwTlM+tL8fI632mQPyjXOKgn6ExCpNkyhbMRvaoLBLT6wMdR2rO
	 7CGp3A1P/9QlyEHhPC6GO2v/g5dbXV/greDoEx6RQesdKuIjEgPQq/7ICCLS6bUCFcKfQ
	 n73ssMgTKXB/0uSOwSP3Xxnrko871Kf+ZlPnwWDg9fzo+S04MwGb46nG7tBweRwsy6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="PAry62/4";
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3EB606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C3EB606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PAry62/4
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f03a137f6aso2481685ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795132623; x=1795737423; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L/9YEgi/3sLjfpLI8+sqz7+JmJz5Um7hXKDEJ0PhXdM=;
        b=PAry62/4oxVzFZteaU1fyEqCyJ4HTfY8Y3WDPQyXP8vJAuk6zhwziep7jga5ANXCmT
         ezsg5LxIGRW2xKgElL510fHB5GyGDKcdo74HKDovUNxs+WVVlJjRRxqzi2tSRt8nqF36
         xByfXdevU/I+rnYrWtCyDh5yD50DdfKgG2HfbhIecj39qwjyM6M8KUDROkjcTnjq2vyg
         fnuIjb7VMC8xjKR+8ma2Dw3/gBP0H14BcTizlVCaKLTplk8Yz49QzOEucmAaAPnpZSDa
         YtCXYSgtYWkZHYgOu7h2RZTdJyJcDJk9+sAfw+6zzV+bzJqtq9tZdCb3unNLoVI9jPBV
         xT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132623; x=1795737423;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/9YEgi/3sLjfpLI8+sqz7+JmJz5Um7hXKDEJ0PhXdM=;
        b=yl6Lg9f1YJcyMIfUghPedko4xO5f/F+6yN/F6q92p1HE34AQcth0/WvCL+sNdbqtNP
         ec5jMAxNynY6aCkyp1SxmCD6Q3H8oYBj5UJ0TSCnOYObkU8ojVl+Jh/sUMUeLJSeYQVC
         yYo/YfN1fvHn0Zq4WBPxj8L579y2hnT/qWqZDv+RkMGGDY1RZaAl6FU/YN8Y2TURPS7z
         mRPghSYBlKYNXlb2hUzP349i627Gi6EEuHeeH4L8XBihyxt95ZHYr8SfAC75Qc5FiXkK
         RE5xi7wmowIHHGMGLjJuF36FUZzkZyC9pWO7wVirL2oC2qJt7sk+1Mo+NRWZHqv4cpvh
         8ZIQ==
X-Forwarded-Encrypted: i=1; AL+hErHqZgVuK/rBcwgtgUfN9yQK/81APmik+jnGPW0XHjTf1JRUWqiISzsZQzm5jD7bLiWBZvgTPpKaGEjnFwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gBgYFcUvQ9JD0O/iBhyZc+ZFq2yrupH1AvVgG5lFHE20qaC3Q
	KxfoI6Z8S7/pFs9Ao5fgQXKY9txp2ujnzBZsJrJqNyUjsiOHapg4OKrnvxvlf15UY8WdVSPWJYm
	VxCnZCw==
X-Received: from plgy16.prod.google.com ([2002:a17:903:22d0:b0:2ef:d980:1df7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c410:b0:2e9:87a2:b4f8
 with SMTP id d9443c01a7336-2f03f17003cmr14915865ad.29.1795132623137; Thu, 19
 Nov 2026 15:57:03 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 19 Nov 2026 15:56:51 -0800
In-Reply-To: <20261119235656.70315-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119235656.70315-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119235656.70315-2-seanjc@google.com>
Subject: [PATCH v2 1/6] s390/smp: Export arch_smp_send_reschedule() for KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Satish Kharat <satishkh@cisco.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Export arch_smp_send_reschedule() so that KVM can use smp_send_reschedule()
in common "kick vCPU" code without running afoul of build issues on s390.
KVM currently uses smp_call_function_many() when kicking multiple vCPUs,
but several KVM architectures (at least arm64 and x86) kick vCPUs with IRQs
disabled.  Using SMP function calls with IRQs disabled is unsafe as it can
lead to two CPUs waiting for each other to respond to the function call,
i.e. KVM needs to use smp_send_reschedule() to avoid potential deadlock on
other architectures.

Alternatively, KVM could go out of its way to avoid smp_send_reschedule()
on s390, as KVM does when kicking a single vCPU, but given that all modules
can reach smp_send_reschedule() via kick_process(), forcing KVM to dance
around s390 adds no practical value and would add non-trivial complexity to
KVM.

Note, thanks to s390 now building kvm.ko and kvm-arm64.ko, using
EXPORT_SYMBOL_FOR_KVM doesn't Just Work.  Exporting the symbol just for KVM
would also complicate backporting the upcoming fixes to older kernels.  For
now, keep it simple.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kernel/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
index 32499cad86f0..39318aa7ab7f 100644
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@ -531,6 +531,7 @@ void arch_smp_send_reschedule(int cpu)
 {
 	pcpu_ec_call(per_cpu_ptr(&pcpu_devices, cpu), ec_schedule);
 }
+EXPORT_SYMBOL_GPL(arch_smp_send_reschedule);
 
 #ifdef CONFIG_IRQ_WORK
 void arch_irq_work_raise(void)
-- 
2.56.1.708.g77570a6a1d-goog

