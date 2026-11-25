Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589814;
	b=09t++V5NMVpxSErr7MGavoNtfsUR6tansoKELq39jhYCf1fuu5R/+pcvj764PpgrfNWa
	 HaFz4GOX9y63Vp/28cMLmM3gu7Aj6Lo0RsOJslkdeYPcuUq/10u2bzYnK1RIhznohC9lb
	 0KjSkHHnJp3VPnfiys2WFD1zSpqa2OW+OFPAksYbp8x5+XMwHoRgtc4fyakNmOs/QEAoe
	 rMLYV/yuT3DtpXHNvmcCtScoX6t796uwsDM+bI/Z3VlwWpZ73iKT8wzx6dU1A2emv+jMm
	 Okb2s9zFE89U7STOccFwyBAHL5v/OrKsdYSHgnW0QCmXgs77ObWVFz5LOQuimF2KBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TsvjkV1z3SJCt8rGDNCxfVDi6AQK70itPPBCytlT4MM=;
	b=qZXyrmI1g0s0LateZq2kNRnLflnytuVu1fuAhzXsqje3eQruETMueDAZoIt5/GEVAQzU
	 fQYmCHRhCiir3KLAHoD94PBlS212oPiewwgtMuZy5lHTERLoJ1W+IvgKjhxD1Pyhwq+6c
	 OVp9HLHpuug8Vzg0jHvT6eJ1qxaa0Q2DL4i8KT3KyWLwaoUYMF8m7DGoo8Hxpo85Tvk4+
	 DzeiGtHdH63NP3/y5ZxEuiSVyBpJeSpymMIcSRVcFx2dG3fVxg96AatPXElwPi7bK9WcP
	 04CuhZGF7InW94jGItYnF/1WuoSFSCh6cWzvxUTfbKj/MxfrOUjSu6OHUPTWw4J+vHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=S7yuMIsz;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94F1606A68C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94F1606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=S7yuMIsz
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2902919f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589812; x=1796194612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsvjkV1z3SJCt8rGDNCxfVDi6AQK70itPPBCytlT4MM=;
        b=S7yuMIszNcBv7SSTb7fTEcmDGwK/GwmqZFtTOMlrZMM6qLUBXrFmqH/DpXQOJL2GWL
         8TD0OmOwdlhgqliTwH97sEZfqUmz7G+jsPO3IqGyNirQuluZcnt48lqjtQDf0cu2+fue
         hhG4TF14yU3Vl3shwCD3j/78j/FMY2Q4K5KKswUei71oP50ORfLSfRkXYEjwH9CBpUH/
         9uVRe/LnmcvWcmK3YvWhGVbJnrRN8MdHHMqnZzOVUt7guK88G44v08y1w6U+2UCSqeQE
         /RLnbwdRfEuUf7sKql/WROxZ+hnYXeJZfINQiWx3M+/hKjqY8uojpCiS83nYIa3MU65w
         QP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589812; x=1796194612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsvjkV1z3SJCt8rGDNCxfVDi6AQK70itPPBCytlT4MM=;
        b=zxaRYR5+pvwCk6CQJO5fhqlLQ/HLYR2wvlD4YlVMIMt0OhFzSCGxNzV0jcvZ1DG9bF
         LlYWtwie9qvtMfDOjVxK8n8T/kgEfnNfD2CqNWT2dZ3bRBtmwp1UIqE5u57QY83ZtSvO
         V1vuhsbfxlGiAh37ZRltVscE9v7d+xENh6sLlYX92ftlUZ5p4FNR0Soi1Y0p8QqwrDIf
         On3/AFS/BouukTi7Dj7xZ+WaWIGypHe3i+riZPd8MWRcTYhxQU1Yz5dg3f4fShqmGniD
         qPI7RHaMB3UsooR9EL4+aqq8x/Qnqu/eAvexkKG8aXIWyGMmKenRhUJhC2Pl2HHjk/FN
         sjLw==
X-Forwarded-Encrypted: i=1; AL+hErGDtWt0mjSDX2Tt3WeK+h9DkEWdtwTwhNoA5cCa4gXqsgKUZpcAIGZjg3grGKkaomb+bhZq6bHY/j1oRsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z87pcEHP9Eixkh6jVykZteQUxB6l/SsZSl5VWCKiUGmTlaRVKB8
	yoQ5gTs0x5yRAnYI+sfDP2Tlurb/pPFIn4DX24S7IBVAm7wTrWa+LKh5moRK7xqwJ8M=
X-Gm-Gg: AZFdTZfboPKYMfaxvprUPPUnMKkOSeYqA/8aHqtfaBTus0duglAqhCkmnD9+aDAU/6l
	A1tSqheoO9llryr/D27eQjEjGB9gOrCvxeTJ8lD0viP3j/QVDo2g916bXWHjKajGLPVW4y5iKid
	ozm5EqKJhlhbB83abRRqqg8ulq12kqetfOScQhlb283SyAoClMgpm0Yi8H8sTh75EggExJb1XGi
	pqep8p6JrmZ5HL6NJsqbC6e/Pt6rwtFqlL9WIsIzG/lRRVuNVVo9/LmMMPuWUao6bI/VR2B2RKZ
	IE9hQb5w+1KIOwSvV/KKJi+hVkR+2EfTVBQx04/crluUJWrLHCZx4ET0HVb+lBZjCHqtSAVcpaG
	BzgrvQCBafilY+xIeScfZSo0b9gIboa4KZ84rv6RULKyfrsb8dbk4TsLcJov5RrbvOfkoHRYMRO
	g2Tw4+AT/FJlzKY9pVYUS11w/UdUnfgyEKXR9AWNP05LSBN6B7NAy6xPwaLFdu4SVyEnD5DDM9L
	gGWNeAe/CCT532uGlvFvOcQrO+fmlvgonuDCivfIjaXwKdh0JWi/nIimqs1P36lOgvLIdSFCz7G
	DBYK0Rhq6fSVrRJ54Xs=
X-Received: by 2002:a05:6000:461a:b0:491:1e3f:a427 with SMTP id ffacd0b85a97d-4abb4b84d2cmr32386732f8f.42.1795589812021;
        Tue, 24 Nov 2026 22:56:52 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm32520868f8f.5.2026.11.24.22.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:51 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:21 +0300
Subject: [PATCH v2 6/8] KVM: arm64: nv: Don't deliver a pending SError to
 the wrong guest
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
Message-Id: <20261125-double_exception-v2-6-224689d8a764@pereq.eu>
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
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.16.0

With nested virtualization, when we inject an SError that the guest
has masked, we set the VSE bit in ->hcr_el2 and the CPU delivers it once
the guest unmasks SErrors.  The problem is that the bit stays set when
we switch between L1 and L2, so an SError meant for L2 can be delivered
to L1, and the other way around.

When we switch, clear the VSE bit and set NESTED_SERROR_PENDING instead.

This matches what kvm_nested_sync_hwstate() does after every guest exit.
Then kvm_nested_flush_hwstate() injects the SError again and decides
where it should go in the new context.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-229065@kernel.org/
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/emulate-nested.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 39136a89d74b..cccaf02610e8 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2792,6 +2792,18 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 	return spsr;
 }
 
+/*
+ * HCR_EL2.VSE was set for the context we are leaving.  Store the SError
+ * instead, so that kvm_nested_flush_hwstate() routes it in the new context.
+ */
+static void kvm_nested_stash_serror(struct kvm_vcpu *vcpu)
+{
+	if (*vcpu_hcr(vcpu) & HCR_EL2_VSE) {
+		*vcpu_hcr(vcpu) &= ~HCR_EL2_VSE;
+		vcpu_set_flag(vcpu, NESTED_SERROR_PENDING);
+	}
+}
+
 void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 {
 	u64 spsr, elr, esr;
@@ -2823,6 +2835,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	preempt_disable();
 	vcpu_set_flag(vcpu, IN_NESTED_ERET);
 	kvm_arch_vcpu_put(vcpu);
+	kvm_nested_stash_serror(vcpu);
 
 	if (!esr_iss_is_eretax(esr))
 		elr = __vcpu_sys_reg(vcpu, ELR_EL2);
@@ -2909,6 +2922,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	__kvm_adjust_pc(vcpu);
 
 	kvm_arch_vcpu_put(vcpu);
+	kvm_nested_stash_serror(vcpu);
 
 	kvm_inject_el2_exception(vcpu, esr_el2, type);
 

-- 
2.53.0

