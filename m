Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948338;
	b=e62Y/y516ad5uigO7MdBBErZeigcEKlWicHnPcQKupzpAGWiNmjNRAMLkAidMu6+Ddc/
	 KNgkMZve9APBu46se7jdQE4+e/5bNMpXXB3CxtbS6jEq14tX+EP5xjWNUt84HSngmxf6H
	 EzMUVVusvRTD6VIb4B2Y2aLo7gH1d2jEfgZyWguQj+aFQ1apzjdIza+LY0C/eT8iIPLpG
	 Jux+bAmiuzy2vgeB/zvLvAchsiPXsU2IGoG0ly24oXv+8bM8Xe9Y07kqiWTZqN64z5bjC
	 MgcSYmQxcpjRLLjGuUF9d2g9sBFKPEdh3B8zjvO/UHAniTb1LLeWeLCXdDOupVojFzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=b6mleucbMdhj8MjjlIVwGs8yhAGAA7tst/tBmXQB1UY=;
	b=zqUEB6gNpQ7KBAkfcGhXoAWwe6oDK6tojHXmq8exq5ecomKIWoiqUeX4W8jSb2kGLOHJ
	 bNSm74qVItlmkb1Evp0fC6jE6WEvHfAFNHf8XAPJkg2YpVW7RyZuAiAUETQoJpJG5ZdoO
	 eqhjLJUeSxC7HJ2NXA07WwSX9wTxfW3bSCjnaJWfEYx82G1s3xb3rriTPApZGdEInUDwZ
	 Lj3v+ugkJxQxKX+gsCvGzcc/hCYkQm/xx/1X4+iGLx41l2O82DdxITj8yRQrzO1AHH8O7
	 TWoFY6OSResU8n64kn+xWBSTaQYNHvalLk4a0q0aOgWEBBK6YakolorQlstvvQ7iqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aPeV3cXj;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D087F606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D087F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aPeV3cXj
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4f652f9bso131834b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948337; x=1795553137; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6mleucbMdhj8MjjlIVwGs8yhAGAA7tst/tBmXQB1UY=;
        b=aPeV3cXjFGitT+FOJiUVFoAoNlXls/aeflQhDC0JgOwjtiDak8NO0WeizwzFkjQz3O
         bspwRDJySpsRIY0dG4SR9EO/7jEWdVHpH5GXBigT5l+nvyvDg8tVgQW8Eu+pRLxDRqdi
         1bwNKZziQdfySYBTIH83/C2ocBAzeP1Mc86oXeUge5uiX24EtGqzz1BRUjAoWhZMMpik
         pW53kLksvVjKF6d35pL1vMwzg4r3q77xAjWdJuqGqw6QER+Fc8YBswMyifnxkwgmE6JT
         EmXn/PVIQISb0+FXsf36ltXqbcyzNPUDRr35lX7XN83SnvnHKyAI2LjlW7iKDnEqnuTo
         a/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948337; x=1795553137;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6mleucbMdhj8MjjlIVwGs8yhAGAA7tst/tBmXQB1UY=;
        b=a8BbEvMCU6AdKwqw8u3qvdKy+LoJkUvU9oPQFPrbxiOwKdaSSUJVRxSY5i27m5qtTz
         k169BnudUiV3GFUU82Ts7BElpVPEGi/zoKrHp4id5axkMggJSJw2+45295wykPKzVtc+
         e8fU99bONXIfby+dxoDJCnCdE/MKuxXP3mygFYgEibUGmDPk9dkSl+zFp3+Vok8eIBiq
         eGqpp+RZ78V7D3rBZ83jA1IEpo2id6/SXIhZYJ+w4Z84NNSv7D7GYVvkmMLFyRos8Ebx
         yzG2dbL8l27XR/+2GgnI3PiSc4sMoXUE6kgOc7ZVJfcwxxaUp2HzPONj21dcqvvhUeFa
         sXfA==
X-Forwarded-Encrypted: i=1; AL+hErFRWTg0yvevI8nw6NCvZ/jTlmF7RiLfDVe0lZGZA+u/VL8k3cVbhri7nImgwDNBveEXjG7UR17wqAGX6HM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ulEnsXWZrRTPzERBEg8JyLen1rfRELrVdByR7M8QzjcaB8jok
	1sH0PnYPTszwySbH4ahmKd88kgUE/C/OGmkT4EwK4IrjXWfhRU/SSamuwSP3ctLbeIIIWSbqJ3V
	SuRfQ6l5t2R7CXX9A6JVSX5YKwQ==
X-Received: from jajg7.prod.google.com ([2002:a02:c547:0:b0:61f:ecf1:1cac])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1387:b0:4c3:e93e:e331 with SMTP id 5614622812f47-5774113234amr977571b6e.30.1794948336458;
 Tue, 17 Nov 2026 12:45:36 -0800 (PST)
Date: Tue, 17 Nov 2026 20:45:33 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204535.4036191-1-coltonlewis@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
fixed-value bits") migrated HCR_EL2 fixed-bit masking to hcr_feat_map,
feat_nv2_e2h0_ni() was written as !kvm_has_feat(kvm, FEAT_E2H0). Because
ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where IMP is 0, NI is -1,
and NI_NV1 is -2, !kvm_has_feat(kvm, FEAT_E2H0) tests E2H0 < 0 and
returns true for NI_NV1 (-2), leaving HCR_EL2.NV1 writable instead of
RES0 for VHE-only nested guests (and conversely treating HCR_EL2.NV1 as
RES0 when E2H0 is IMP).

Patch 1 restores the check to kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0,
NI) (E2H0 >= -1) so that HCR_EL2.NV1 is implemented for IMP and NI and
forced to RES0 for NI_NV1, and renames the helper from
feat_nv2_e2h0_ni() to feat_nv2_nv1_not_res0().
Patch 2 extends the arm64 hello_el2 selftest to verify via
KVM_SET_ONE_REG and KVM_GET_ONE_REG that HCR_EL2.E2H remains RES1 and
HCR_EL2.NV1 remains RES0 when E2H0 is NI_NV1.

Changes in v2:
- Rename feat_nv2_e2h0_ni() to feat_nv2_nv1_not_res0() to match the
  condition it checks (Leonardo).
- Drop the guest EL2 MSR/MRS HCR_EL2 check in hello_el2, as RESx
  read-back from the guest is not architecturally guaranteed to return
  the effective value and ID_AA64MMFR4_EL1 reads do not necessarily
  trap without FEAT_FGT (Marc).
- Link to v1: https://lore.kernel.org/r/20261116200418.3535619-1-coltonlewis@google.com

Colton Lewis (2):
  KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
  KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1

 arch/arm64/kvm/config.c                       | 7 ++++---
 tools/testing/selftests/kvm/arm64/hello_el2.c | 8 ++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.750.gf70dc682cf-goog

