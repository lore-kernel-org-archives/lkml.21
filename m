Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948340;
	b=F0B1fuT3hAZYyanWu4yp/W21b7w31Q6BeEuzVfvxLcnL7goaMntAs/vJue2JIQAIRZxW
	 7b+UpW+3MQRum+aLFDnPjz1eA4CRwDKoGLrs2YcEUkJs9PKVIlXiVyrglhP3u/SKdA+nB
	 QXbKnxWoed1uR7xbwU3kIfCVf7B/rhaRWR1d/lqMkFOq4JwlcGXQ2GeUt2vE08Xpm4Wr4
	 aH6tZV9CX0PCiOfaWFOHS6UrHfi6Adwx37ISEE2ww/nDsVFq3eW5hPPYNs2SwQUCbeIpy
	 dSMoznywQMVhCqEM0mnJzmTaru6ksrU1n5nMjsRrMrSBU2TbtVzAbNb8x1zF9xx38nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=H5HOKL2EhRK71scz5F39xMdCNEmAUE6COZwQwhC/mXs=;
	b=bmg4fhN4KCVkeuLIpAmdAjXssYZcnyJmdhE/4Zx4GQ3pql0Lh5RbdGgXdPzliq3iqO+G
	 /qAoyjtxJtfrJRh7rQdjsry9+MHk7A2KqTEyaIFZWLkD74NN58BZmr0LIjXQerp3DPojS
	 tAJioEJqdGp7nWUaRLDNa8cfzm/VQPAR4aCdpGFLGItlNTuBBomiuct2qS3uACnnL5oX3
	 rJEd/TRtMZZrFQi2J8P56Zma3YMMl3FHnGmxJ5wLop6QmMw2w8ngeTkyYG0EmOuF4KRia
	 wpGysX4oQL1cLcUWo1lO4N+UMYYsK3jdjyUhUEsGvplCh65Wd8q3RRBPF6n6ERnXgLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIwGkQTM;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A24606A887
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A24606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TIwGkQTM
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so209406b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948339; x=1795553139; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5HOKL2EhRK71scz5F39xMdCNEmAUE6COZwQwhC/mXs=;
        b=TIwGkQTMtlYihyV/DkdX8kDo2dmzT7E52E/RZ1arFd0jsVKlRoCDkgw2Jm86Wm7kDP
         E3QrLEKpR+T1MRb8kknGNEisvOEjQSzG6pO6McK7D5R+265b/8+zNMvK/PNdYXmmmxjq
         uK/1X7Odj7XOhoFrqfoVlJ6WA0aw/K5wGjmRUCUbUD5K2qUH4NHY0kEs4jIpk/eMPiU9
         S9JpY6/ihBHu+E4bRSAYLahEtPnuDGk8eEv4m2cOlMRPtyJUmjFrWAczHEJaQ9axkNYZ
         KdsFXsp7lyPJeG4sWhE7BFUqFz/06UPnwCzqFI2nlF1uXhtEq6isHxy9eXWu0Z8KnS7b
         Gbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948339; x=1795553139;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5HOKL2EhRK71scz5F39xMdCNEmAUE6COZwQwhC/mXs=;
        b=RgcR1lkzwxBXrlZPbEgcSF4Sd6TG89mQK14DxVKJZmRVSp7u5ib+TjqL+/Sn8YrDw2
         8QyZ+f6EGIN3IER1uHnqQhueQcUX9/oR5l9xtm9DI5/7JA4pHlEcah/yDa8/QwxzcSOL
         m3V6pW/FNDoT9bFc7LlPX0h32AzttzKUjtb1rgazRGtwbY7oG2p2+tRNtNennc8gyN2m
         653CUHyNxVW4C61fMVnRx+tjihUuC2CttklHArCNGrHhjQjo+JIiCeY2foRRREZnp8At
         hwOrqyRKLDYt9n46qhBONTm495pYJKpHGxy1tDROQeFW5u7J8Zzq9un8Kk5ZmS9+9Zx/
         8B3w==
X-Forwarded-Encrypted: i=1; AL+hErEsV0CrEwaR/YjSscl1FbVrLxMJkCnWP/MiTY5vYAZ8Xa/vBxcn96UZhWKWjmJXurFIG1YRtYXMTUX2UWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pv8ctk5BvzH7jFyPFDPjVdd5T2OX1YYHnMpXSwT6eLCWfj2hP
	TBLQwUhwsgjzQ49myZQeCvUx1Nghginz7Wa78PBKUh+Ecljaeh36I8RmSpvNHEoh+dKk+uo/RKn
	uxLqUchSDoeokDoUxzNiyDMtvbg==
X-Received: from iobmp24-n1.prod.google.com ([2002:a05:6602:a2d8:10b0:9c7:7f8f:934f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3096:b0:4e5:a74e:d6c0 with SMTP id 5614622812f47-57743d4c1e9mr1010823b6e.64.1794948338500;
 Tue, 17 Nov 2026 12:45:38 -0800 (PST)
Date: Tue, 17 Nov 2026 20:45:35 +0000
In-Reply-To: <20261117204535.4036191-1-coltonlewis@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117204535.4036191-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204535.4036191-3-coltonlewis@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when
 E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

In a VHE-only EL2 guest (KVM_ARM_VCPU_HAS_EL2 without
KVM_ARM_VCPU_HAS_EL2_E2H0), KVM advertises ID_AA64MMFR4_EL1.E2H0 as
NI_NV1, making HCR_EL2.E2H RES1 and HCR_EL2.NV1 RES0.

Extend hello_el2 to attempt clearing HCR_EL2.E2H and setting HCR_EL2.NV1
from userspace via KVM_SET_ONE_REG, verifying that HCR_EL2.E2H remains
RES1 and HCR_EL2.NV1 is masked to RES0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/arm64/hello_el2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/hello_el2.c b/tools/testing/selftests/kvm/arm64/hello_el2.c
index bbe6862c6ab16..5910497f8fbe4 100644
--- a/tools/testing/selftests/kvm/arm64/hello_el2.c
+++ b/tools/testing/selftests/kvm/arm64/hello_el2.c
@@ -45,6 +45,7 @@ int main(void)
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
+	u64 hcr;
 
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
 
@@ -66,6 +67,13 @@ int main(void)
 		TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
 	}
 
+	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
+		     (hcr & ~HCR_EL2_E2H) | HCR_EL2_NV1);
+	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
+	TEST_ASSERT(hcr & HCR_EL2_E2H, "HCR_EL2.E2H should be RES1");
+	TEST_ASSERT(!(hcr & HCR_EL2_NV1), "HCR_EL2.NV1 should be RES0");
+
 	kvm_vm_free(vm);
 	return 0;
 }
-- 
2.56.1.750.gf70dc682cf-goog

