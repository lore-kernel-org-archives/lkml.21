Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034189;
	b=q+ejuks1RnxZGuME04nhip4nNhzznyWVGQrrnW9bJavERka+ozvY2MOrxP7Hkh5Pqd+l
	 h0dHmHybUq1k1RNXFzjPUISzRMFewX7yHYF6dp3+dTb8LCwAvvZP5QKfrMj3iRlXU6jSH
	 MqoLaIhDMjevUDxXqEycvDhRf1IZgN4xQ/IVX9Um4XxikUS7DqBNZL4qNfciCGU3+yzOU
	 oeXVf7a4LJhNWb0iNGwNDJi+wD9s89KOOb+zYEudvnxbKeep+ig7/D6DZBRiDEFTQP5Bp
	 0lRkn03wNiS7dwP+FVt2kfg6cMHX90iqiT6oWtKMgs+shpbomQFX0mywz/sKTp8ir2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lv45tREYCt7GqWPtl8xyiubGXsrPN8dnOBdjmKX9gXA=;
	b=rg/VkpM07kGZ+FeDTywjwS6HvzfcN/umoqi6qIZxSdfijKfi8zOo5hjLxEvjuJuIz9je
	 larox8MIRephP7fpbne8vxhzOfAIqblkpLgS2PqehH4Za8vKEGdeuf85G7f5yuf9wsN0Q
	 Qn/xONZzmWfksiFlCfuhOT5brz/yQtTNDLOSoUwjzfMqzsV2z0u6sZ1XHGfK0UDF5NYIW
	 qK3Q8pb+akRymO2W3DiQ8Fx6gWv44lVJIgm3tGVVoVnDahz1WolCG8jMa4UoH4rQPCuLw
	 TTPm/OpoQ8jqRseUKhkAibjmNjgeZC3IeTL7rCWRSclSdOqQMllaFiHEDaRdk8+juWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FYbddi6Y;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE56260A263A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE56260A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FYbddi6Y
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso1377254fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034188; x=1795638988; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lv45tREYCt7GqWPtl8xyiubGXsrPN8dnOBdjmKX9gXA=;
        b=FYbddi6YV90/uod/Pr7WEfiEWdsdPsB2OGckVrsrUJvCcVD47FPftzcHkAz/tOYvqK
         7/TCudxMEbJEJhlMknuWZ/xy0fjvDf3zBaTs+cqHTHf0k7heaHkzts9DyAd6TY3nk9RS
         v+9+yGsVX7EG0pHOm2sX545OjjnXkgudL0trIl+Ya/X5+389pZeOb7ym8+pUiBxNJxNB
         kHRsiHfUa0xrNgN2Uovlq0Pg8UwKvVTN8oxa04MCHbwOjQiu201M2v+g28/+ewJkE9b3
         WndZQ9bgVcXqL9pSV5ApVXzcjcwKmXuygzKLdGE2ZBPisW1/zGPhKW3ZM0f6hao06jGr
         NyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034188; x=1795638988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lv45tREYCt7GqWPtl8xyiubGXsrPN8dnOBdjmKX9gXA=;
        b=kv5/zQ+oMPQAVGwOWMQM/M+KToUaKJaJ12N1XfnIDElC/I/DxcnZ4KbXRYUhn2iYWT
         L6vunab2KXl23qbK8ah/t9lplUIuqxiSNNcsQfWiD9ASVpnzufS67qqvz8IK0egnX1Jo
         WoQT3OC2E3k2jhRueg27BYj4WVQYmT45ApQhNQeBAFeq/FEE7BDoahZ1DdN8/newMcBN
         JWCgoHWF4bJue1aY0t6pG//z2xgPYHMITbg9KlIWqnB+vMrVkfDNZ1FKnWYL9igP6nFS
         QVIf2r6uvANBPYBe3ovjqAMFS4JWSFQmzHiQWdreAsDuqEVWi1MQpmIEz/2VvgHcMxKC
         1poA==
X-Forwarded-Encrypted: i=1; AL+hErG9yS/Vp82IDLNv//ZGduKPCG7fkf8uIqXHLdLMPFzNgBSLJLdjSJsnHx1tuz0uIEJbctT63rJfPwfAwc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4FN8/YBIr9cUvU5XUUjdux5uVNHMVFArhaS8F+WUthmt1g2Ho
	28kzX87rO2/xB0N94zsU3Xso0juHVPY+RvZ3vjdkw9B5FPiSLHYE1Nr5H0pmiiM7Sxpk/MvZDKN
	An4+hQmpv5sUViZqaksNlAeSZyg==
X-Received: from ilrb6.prod.google.com ([2002:a92:dcc6:0:b0:547:9c99:d6d5])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:f13:b0:573:399d:d487 with SMTP id 5614622812f47-57742f41c5emr4038906b6e.65.1795034187562;
 Wed, 18 Nov 2026 12:36:27 -0800 (PST)
Date: Wed, 18 Nov 2026 20:36:24 +0000
In-Reply-To: <20261118203625.743428-1-coltonlewis@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118203625.743428-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203625.743428-2-coltonlewis@google.com>
Subject: [PATCH v3 1/2] KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where:
  - 0b0000 (IMP, 0): FEAT_E2H0 is implemented.
  - 0b1111 (NI, -1): FEAT_E2H0 is not implemented, except HCR_EL2.NV1
    is implemented.
  - 0b1110 (NI_NV1, -2): Neither HCR_EL2.E2H == 0 nor HCR_EL2.NV1 is
    implemented, and HCR_EL2.NV1 is RES0.

When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
fixed-value bits") converted HCR_EL2 to hcr_feat_map[], feat_nv2_e2h0_ni()
was written as !kvm_has_feat(kvm, FEAT_E2H0), where FEAT_E2H0 checks
E2H0 >= IMP (0). This inverted the condition: feat_nv2_e2h0_ni() evaluates
to true when E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1 writable
instead of RES0 for VHE-only nested guests where KVM advertises
ID_AA64MMFR4_EL1.E2H0 = NI_NV1.

In practice, KVM cannot handle HCR_EL2.NV1 being non-RES0 in any
configuration: limit_nv_id_reg() exposes either VHE-only EL2 with
ID_AA64MMFR4_EL1.E2H0 = NI_NV1 (and E2H0 is not userspace-writable), or
FEAT_E2H0 without FEAT_VHE or FEAT_NV. Checking E2H0 in a feature helper
is therefore unnecessary.

Drop feat_nv2_e2h0_ni() and mark HCR_EL2_NV1 as an unconditional RES0 bit
using NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx) in hcr_feat_map[] (shared
by HCR_EL2 and NVHCR_EL2). Because HCR_EL2_NV1 is not part of the
architectural HCR_EL2_RES0 mask, check_feat_map() accounts for it as an
implementation-defined FORCE_RESx bit.

Fixes: b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index adaf26ab93b85..2e81f45dc9921 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -256,11 +256,6 @@ static bool feat_nv2(struct kvm *kvm)
 		kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2));
 }
 
-static bool feat_nv2_e2h0_ni(struct kvm *kvm)
-{
-	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
-}
-
 static bool feat_rasv1p1(struct kvm *kvm)
 {
 	return (kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1) ||
@@ -1034,7 +1029,7 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 		   HCR_EL2_NV2		|
 		   HCR_EL2_NV,
 		   feat_nv2),
-	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_e2h0_ni), /* Missing from JSON */
+	NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx), /* Missing from JSON, RES0 as an IMPDEF choice */
 	NEEDS_FEAT(HCR_EL2_API		|
 		   HCR_EL2_APK,
 		   feat_pauth),
-- 
2.56.1.750.gf70dc682cf-goog

