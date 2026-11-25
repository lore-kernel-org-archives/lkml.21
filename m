Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589801;
	b=zvnqYEuc/2YFnyIdhAgflmtLo9uBDh8zRJEyQi8QSh42hgh32jrxPySC7NE1xIfycwdz
	 zwE7iWXlaQUGKonV8A4v/EMCkOSnCTfLwn+B2VHEFwCm3SQJb6JTTZy79/nnlem2Kz9fo
	 CknPOkkTybsLh+YsV0viZ4n23rsM2YuSNoZQGoIQmSO7ydgFX/oZmI0OtNZiSEdH+vKq3
	 NQ7cxVPPphIcf1A+NAdQIH3CHfuzFsrSa8BQTKUsK/AXLsSL1nv1CuV++jTPw1mqXlSBo
	 KfPtMaPZ2hRdx2Ol2lCS1eSg0ZH/NciMEsSm4iBMbnQr1VVT1+qKsrnJIXxKoLpoZOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
	b=3WrqeCeSgG+RKCdnA6ODMQvbtGzY4+1WeFUxriykzV0AIIOKX2rrrPW0GqZRDJzU4V27
	 T3LBwNrAyhr8A7Mv+rkyE04/8QkEmtkSXPoO6r8NJ7vhcjDa2GLoptfC1J+fGcIWk7c25
	 qJmHyZlnZfFBzd2+A0ntkg3USxQNcGjLNcB7F/OwusF36v1Kj/XbnB6eGr2/C3ZvtK9kh
	 qTD/ZFJ8a69Qaghd6rnJ756mErZ4Ol5+ZgcXC21ez1Oyg4rfhLmxCi17rq9R/dkVhtGPG
	 TvUHZM8dDbZfDT+Kf3w2gnM76lcPxjAPDKWWeIoNz0OF8n7GwFdUqNTxfNkUMxhpbYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="W5U/UJS+";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4A606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F4A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=W5U/UJS+
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2789191f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589800; x=1796194600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
        b=W5U/UJS+7cfwYVajRpOi1u5K/6enm8FRZrPwbeutwCW4xLqgOknI08L1TNMXxVbepI
         NbhoW10qnRAA/6YxRG/xf6WHlyq7lrXl4tlqcWW0vl9JbeyAU2F3GWUmBIkHyfAcr10H
         NiOhpglsfS50EIaUgLY5CoBeg1lqXcUUYcunr3nxmU049foJ0lSaknlm87DL8j1jE5b3
         2JPHzJSOzbE2aOUFuJXAtR6mCyIxkqZoZ8ub7iJ4GUNATeuKGpJQLio5moQvND/BkYL+
         uaZjEirGchKB3KaH91m02dg/WQmcrzfDBlVIBBWz7JVCKI6AkOhDFcWe2HjWBUSP+4nQ
         E2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589800; x=1796194600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO0vZwWHnFlrPlO9I1IjS868FeGKeBrErc/5Mvm8QC0=;
        b=JAVpTMRiQhmeTEM3DSXDoXZEhyQ9ajMmBn8z2FouZG2l+01NUn+6DrPfxPrxK0rCCp
         oU7kg2dBLmHDesTspgj3LsvsqDj2NyI/48VCGiKcPwYAltup7x5dsNCQxE1dsf4m6++F
         AiJvphlWuRH1X3ut5Zqwo/wj0eHiu/FEChpjDkzJiZjr3nhiDW4tIgxDouV+4Dx1YEiy
         TJYf5FA8F9L84HtjeWu8RdMKD7hvl8OlyJNodUA2e1lslt+apoOp1IV/a2xjClyGAa5S
         slEq8SyywaC4NOhpYQoAkpfIGR9eyfG7T++JR1V2DV59vRAWAFYSBih8melPwJrBqg+1
         xxmA==
X-Forwarded-Encrypted: i=1; AL+hErH5yfs9oYyB0peDGBYAdSugDWiHVKPFlFpVRtk3p40xtnBLZO9vwpsjTh4Oxc9AhayJ6JIMf28qXEowjfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/K2u3FsFhsU4aDFIeoTZoFgULLJV9PpX4O54t15ndH4MtAIah
	DuyqjHzzrjBRAtGQ2BTfSYsQD6lsG4MphR/SNMCN4k6L7nTuEcCp+d08FYBJd+zsc2I=
X-Gm-Gg: AZFdTZfODCgsZ+bSqGMkN2W6kWoMe4f5R1Sn4SAA3PCW870MAS5Rthi9bcKX4YrmP8O
	TjVtxCfBl9Uzr6i9kiDDfrICPYrXm6ihXwz5Yw4d9P8Nz4bXjalFPpv9RKGjanIk8zFO+uAcjwJ
	v5rB3+Tj9X3F/9HnGXGFprFpaKAxUY669JqDEKgB27gvII/rhpItomWCx8z6rdM/YEVvAYKyzUS
	RiEBcKin0ID4sRi9xX35qg5oIggAJ1Cdx5uLqgNhc6NZeqk19qgSWw/rOd2Mynuw4TtM+vdYD/1
	mJKwXZIhO4hAbEvXNuX6SjHncjqZQbr5UadB5rShM6rhpN6s6sfIySh0Aqv97AwI7pBIm1aN0bw
	+ZH1g2n24kBbnIppXud7QGQHgw/9WHXMRujjJAlKbTTxLKT50fN8OlMby3f7Kzs3J7wnWu5tqY2
	TrHmCL3xZOcMR3rlXfa9oGYwUHX9EIHZvxB4pKif2bZafsiN+ofB3DdrVM2VZu+YtaHB33YQ7l0
	GXo/U7+zwkRbLZmWb/apTAkZ8Kvs0L1xcNJ3HoA5bbI/978eIqVD+SkTHmeEZ7Mj7fLF+/DtBgi
	dKP/TYVKy6TG7k4uEtw=
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr27351070f8f.40.1795589799898;
        Tue, 24 Nov 2026 22:56:39 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm32730554f8f.28.2026.11.24.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:39 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:17 +0300
Subject: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1 when
 resetting a vcpu
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0

Resetting a vcpu keeps the old values of SP_EL1, ELR_EL1 and SPSR_EL1.
Commit e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
changed the reset to only clear the general purpose registers, SP, PC
and PSTATE, and later commits moved these three registers to the system
register array without a reset value.  Commit 85d703746154 ("KVM: arm64:
Fully zero the vcpu state on reset") fixed the FP registers and the
32-bit SPSRs the same commit missed, but not these three.

The impact is that the guest that boots next can read the previous
kernel's stack pointer and exception return address.  KVM_GET_ONE_REG
also returns the old values to userspace, and a rebooted VM doesn't
start in the same state as a new one.

Zero them in kvm_reset_vcpu().

Fixes: e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 26081d273408..9c1b42890c96 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -199,6 +199,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset core registers */
 	kvm_reset_vcpu_core(vcpu);
+	__vcpu_assign_sys_reg(vcpu, SP_EL1, 0);
+	__vcpu_assign_sys_reg(vcpu, ELR_EL1, 0);
+	__vcpu_assign_sys_reg(vcpu, SPSR_EL1, 0);
 	vcpu->mmio_needed = false;
 
 	/* Reset system registers */

-- 
2.53.0

