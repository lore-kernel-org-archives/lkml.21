Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132628;
	b=H90Mi4eCCTgIVNfvN+M1J/qaTxGKlo+Ex0rYozUItWk8ENKX2gIgI81KALs9Ffk38W75
	 tNQn3thq9JMeeqdhopX97/oM+yWpjPCcXMe7vAoVOdrMhlZaTk6fkN8TSb5+7KCif/i+g
	 JnpZii5ntusXQfQjlkhvRVJd+aYY4OnrE18BIgwcqNmUNDBRNUygfZbx7vEqKQHtP4byR
	 0Vv4HbolUENAB1kZ4deFc/ajWoUY2BmJ5EugzsZIXmrFW9SODwTgNDc33+70Ok3OcqPXp
	 n64dv729V66/lTsqK1yZksijMI55fU3Acg6Co3ybdFjRxqmQYlw+fLIPObCeB9rsWzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=KJ7L7t2XkwXbN55oUV9T341zq8HWLMHHi697Po38iFc=;
	b=Z0wgl1gfq2+nuxEQTo9rkUNsNdSKyevUJIjl62KN+NyoPSefaA7OexA2wxJmGKwNq81i
	 /Ghmto9JDX7bVZZVSpGgh15s7xMManwkoPjD++fVNd4or1n9trv5oUQ+YXCjSMxCQ0WA9
	 O9iLYh65bsr4Y3RVokgDX2mZsJj9G/6imSrDUZDiKP3FpOJt2Gld/m3In189EkEduxzQd
	 VlNVHC+Qw2af19ONv9Ksyd+h6Cz6hkxvsvcVGhIxNBvA5qk/GxqkdfIgKDqALpJvPPbnC
	 LXUNPfWVJR3DrxqnW5XVjeaJn1UiIL4gteW9UGWLylC+QOjTBIL5YCAOyFI2Qqr90yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgsNRIRQ;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CA60A2626
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1CA60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgsNRIRQ
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso454666b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795132628; x=1795737428; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KJ7L7t2XkwXbN55oUV9T341zq8HWLMHHi697Po38iFc=;
        b=LgsNRIRQ2lW6CRcKZV7zZ49mGDzz9VVKYvaXF8FR3mf2repJai0r0Tro41POpigvgA
         Br7hKU4KNzd2nlfUWRjjxsHca25sbsAmyg8Rl5X3SRvjzVcYQuIx2UnCgcEKdrxUn2RM
         CVOuBN3e8T3cbm8zU/EcVXCejUn+9c1sm4mGW9//6/TxLtVVXXWN/RGT7wzvd0PLNV/V
         XtaRulgN28OrXqPlMFA5U286RTUf/i/50EcTvBBrJZS0+0rNmaj80YUjFeP6H5WboJyD
         Ggowuafoz6a4eoSXl/g0TEo6TYvgQ+oah/TEBf4xgXUVf2GxTQJrIkiEc9adQfB8ewa/
         Pxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132628; x=1795737428;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJ7L7t2XkwXbN55oUV9T341zq8HWLMHHi697Po38iFc=;
        b=dZMv7QfCpVeRUVS+ktZwFoEySUu11kMjwLFkzx9RsvQthmDaRCnnLePeDhluiKQQXK
         +WoaLQXzFlhX0NFt9ajZHu8W+LOjeWVS96w3a+6b2pe2QSqQU9NL/LkUWW22NZ/KoJGx
         tpSgocFDaypFWp+gMgdi6iW/QN0K3xen8xWC6gdbmj55DCgzJS7YOzEHpG0aQWdKwYBb
         +V0Zu2K2BZpKwT4NSIOrQbM9arQWwT/6jmkCAh0FyZt7JgmpOsl67PhikDbY/TOWmnDw
         IOb3482BG7Eb6t4x8Q3l0y6YyGbxk9Ko75gnk0CSNX8aRCtypS/3zpIpk9FADG3W72M1
         yZ1w==
X-Forwarded-Encrypted: i=1; AL+hErEA9EKDrqhyfHdhMUH6hoOM3OPRON62tC+GdLEqbWhzLSng1imS5312CNWXqgaoEg/NwIEYzp091nvQ7sM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IzZg4evMUrOLOR3kXd+9ElWHuvbu0p+KbpLMS0jcMy48xEAAq
	7tor3Dg2MYouhovSea2jwyTQMt9/kxjSugA5itVfRhEcEr/XVflHKvlAlH9l4CuCalyybFfJCDc
	bblCMMw==
X-Received: from pghq11.prod.google.com ([2002:a63:e20b:0:b0:cca:d82:9104])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:117:b0:3fa:8c02:b425
 with SMTP id adf61e73a8af0-4014e063382mr1285522637.71.1795132627605; Thu, 19
 Nov 2026 15:57:07 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 19 Nov 2026 15:56:54 -0800
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
Message-ID: <20261119235656.70315-5-seanjc@google.com>
Subject: [PATCH v2 4/6] KVM: Don't kick offline CPUs when making a multi-vCPU request
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Satish Kharat <satishkh@cisco.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Don't send IPIs to offline CPUs when sending a request to multiple vCPUs,
as it's obviously unnecessary and sending a reschedule IPI (spoiler alert)
to an offline CPU will trigger a WARN in x86's native_smp_send_reschedule().

Note, as explained in commit 85b640450ddc ("KVM: Clean up benign vcpu->cpu
data races when kicking vCPUs"), checking for an online CPU is inherently
racy, but losing the race is functionally a-ok.  I.e. the goal is purely to
avoid tripping x86's WARN.

Suggested-by: Satish Kharat <satishkh@cisco.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d2a858d4b8e9..07cc0dd10b71 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -265,7 +265,7 @@ static void kvm_make_vcpu_request(struct kvm_vcpu *vcpu,
 	 */
 	if (kvm_request_needs_ipi(vcpu, kick->req)) {
 		cpu = READ_ONCE(vcpu->cpu);
-		if (cpu != -1 && cpu != kick->me) {
+		if (cpu != -1 && cpu != kick->me && cpu_online(cpu)) {
 			kick->need_kick = true;
 			__cpumask_set_cpu(cpu, kick->cpus);
 		}
-- 
2.56.1.708.g77570a6a1d-goog

