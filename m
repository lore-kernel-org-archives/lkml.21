Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589812;
	b=STweAUfke/KolzDyUbTSUdXulcwZR1ceJhQ14MiFZgsZGQYK6KdpSmDQ/DtzpC/kmlvr
	 2ptdyKZORzKoRPhQHgyW4JdXWcm96mlfihNiiILM41VmORCK+7tkjhNpxjp3hSFPv4kom
	 0fdVKQ6MrSqYAMgnEJkUbDLt6uJbOErEVIHuqJ66/dsH8mpzsQUko+4z41IvEPa+wiC9N
	 QzlFVGQDw3OobW+FiOHvob1B9Fwshp24f4u7x18XRHxmhzTxm1+TNqSd6U42Jzxh0RFgo
	 AmYJ5M159EDUcUFlB7pJ+E9A8C6Pd9x5Zsh8n2GbDaKF4u178uk5O4+jbN+9FsAnA6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
	b=CI38TBRUcHq12XF5naeM9tq3GVz4UWIRur8XXBw4kLC61pa0WmqCl4Y7WuSxyJm31IjK
	 rH+AqSb6O77r/cus27LE+/pCk4QQaQh5rMvHO9n1/s5hNt3VmAt1fegt9uAm4iym8qI6k
	 8gI3np3iVpLU0OI6zJUbWl9HnldAX6Swj+NvhhSN1oTIj85JRm+KffFtB8+alTqQyKs2E
	 1EBU9qV+WpCfSFHSk8JFTnhE9Fepb0w0QJKxsYGppcGWIAsEs9NZvSEhF91mDCwQDSCo8
	 pFFNc6v7Yn5uV1FdDqKAiIbuOyC3MZj/hboxBbNRpyJ6o0r88p8xN4ZK4Os7yOsHLqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=hKxqrr3g;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942F606A6B7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D942F606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=hKxqrr3g
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so41148395e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589809; x=1796194609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
        b=hKxqrr3gaqvIXon62dT+8//wIIjdDSIWRBzPd8QV1IYK3M82N3s8pT7KviOlpbceqB
         POL3tFPjnmgCXRvXs3bG0ihWnNUvLHBMDRWNVHVqTa9drm/i04+WX0EQ1JcraNK1UO2D
         rGTIdvjMeawaDNP+KUP6Wbru6HqOcnsPWNvQE3Ez2fsMxktWXBxkVX+oh987pvDJ/j3S
         qcccSF5b3xeERxNLxxFyr0QA0EYp1sBTBh1+GVlAtpj2u+tCsNbl0bOJC03qVUYLvdM0
         aZG+ezaxM97dC6sWPnDmWRletcm4pAZmkSg8dK2uH50d5PedPpEzp7HoGXwBaO/5Zeoe
         13xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589809; x=1796194609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
        b=lnpDPBrL1i04vukHNUd7sAqYoplY7sPVtoTZrBJZ7uQosZNXs/cduxvx682tmkDSIa
         bzGW0Xx6YAIqsWx7v0+qLWeiNmGB5cNpXmG3MwLbDC5D2kAtD19+LfqS/FLtb5tzCMdA
         qWPebYmFiYBpHSFAbyLiC6LxyvQcYkkx10MZMmkO35y8GMZrsYrOiNU4g5fnLLCEjaYH
         bx7TageCBIYE97wUyDJLOjOIk0xifxetTlgDZhpryGP+XsAUDpw0E1iwEBspzvM/3YPy
         3YbXXXmOrfqnAkt1BJmuTGyyL4BSdXQ8E4KaeZmghA2mzQY/76DKNijdVHCa0o96IZbZ
         sptA==
X-Forwarded-Encrypted: i=1; AL+hErE2/jyBonpdnikDMKG1DNhubdmic1w42Cyq4VfjSXoJyB6A/MVbi7ZYKPWgV1fFTujfdmD7pBsGa6T0DH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z81yb54+bo6Nx4QMoE/KKC7w4aMmAvb53WJTXNd+AtZ7C0E0XMV
	3+3FRM9Hzh6BoDJpH/QAUWnGQ1KdssnTxX5v51SRhflB+f1iIspnV8fIBUJMRsGxuBo=
X-Gm-Gg: AZFdTZcK8dgOI2aVe1zXdF9pr5kvNSNGsdpf+kuFu/6fyZWGm3g4EZ5d6A/IxEBR0+Z
	k6EmkIUNzzkHpqxkNUgPsapCSRN5+MxrTLKCo+5Ymw8As+UnxvOSCQeGDFORr8w5dACpGPr1FZo
	9SfPTQwQ6gshZEaHBXLHNx6n/R4qw+tKscupXuaDKHumkbHJ+St2pDh3+BfHfuV51iuwRPlGhmn
	hAVAyjQs1/9FCjC/hc17zgU9hA25A46PmLggouh/bYvTtoFF9OLGpNdikP+o9aZJ2ASwya9PJN9
	bThnvy7xMYMKVRffc8OBcEDflsVQNCDsMib1HkprcL/ew07q7e6e0mHA0+QpJxTovteKFs5sKrV
	rH1c9oEmLxve1nkTUgIpSsjpnyQpOiqL9+U2LlSxPcsdzXYEgdVgA0Y2V8zDo1OLn5dtjASCyf6
	N8terhoMrDsXRrHdy972MnOhMcvpX6JHBnk53H2+MDs9Uk2rOCoRwVoPca7R0sUBe3591Fih1nK
	b3+4pWGICmMleWh478pVhutPpe5W4R4IjUk3qUNzItkR3wmHLRAAZ/sHr3N8bWKOScEtL+k8W7F
	CrzR6YdCqXvXm5V3lqI=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr352660555e9.27.1795589809163;
        Tue, 24 Nov 2026 22:56:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm414574595e9.9.2026.11.24.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:48 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:20 +0300
Subject: [PATCH v2 5/8] KVM: arm64: nv: Replace a pending SError when
 injecting a new one
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
Message-Id: <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
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

The kvm_inject_serror_esr() function injects SErrors as the name
implies.  The bug is that it doesn't handle already pending errors
correctly in nested virtualization.

In vanilla KVM the kvm_inject_serror_esr() function always sets
the SError to pending.  However with nested KVM, it might set it
to pending or it might deliver the SError directly.  We can only
have one pending error at a time.  Imagine we enter the function
with an SError pending already.  In the current code if we decide
to pend the new error that's fine, everything works.  However if
we decide to deliver it directly then the pend flags should be
cleared but they are not.  So we deliver the SError directly and
then the SError that was pending on the next exit or entry.

Clear the pend flags unconditionally at the start of the function.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-229065@kernel.org/
Fixes: ce66109cec86 ("KVM: arm64: nv: Take "masked" aborts to EL2 when HCRX_EL2.TMEA is set")
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: New patch
---
 arch/arm64/kvm/inject_fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index aa2011cc0d5a..0f6a89b65074 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -361,6 +361,10 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 {
 	lockdep_assert_held(&vcpu->mutex);
 
+	/* A new SError replaces any that is already pending. */
+	vcpu_clear_flag(vcpu, NESTED_SERROR_PENDING);
+	*vcpu_hcr(vcpu) &= ~HCR_EL2_VSE;
+
 	if (is_nested_ctxt(vcpu) && kvm_serror_target_is_el2(vcpu))
 		return kvm_inject_nested_serror(vcpu, esr);
 

-- 
2.53.0

