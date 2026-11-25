Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589799;
	b=BQbfA5kFxIlyoalR9JiJsfp+0tQhiTn+NmrzBj0gTvHYgSSlVyAExqP7NeOB+RlgLrba
	 lJO0NiI/YkbQZvAtFsWUrXucHWvLNOH3d53XxDbPOoMqvXMjF5zIBB25qV0c1nzaiKYW+
	 /N8hi/j5ExCnSo4PaBrZ7L1GEGOslpZVu8XJIWHO4QtU1aU8L9HK5kd0zblpixHjwdqT3
	 5dcI34FjX3NDLd60YO67yf+b/SD/7B3ZLyC3WMBvA+t4eiY5pemQ9ZlTzZuyYRgqyb1qy
	 d16YgRLcHUdSa4+n6WEPddg8tiR6/XB5k4rZIQw9TtuNmywP6fsCmjsUFCRINlNZ69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
	b=ML3w1rLd0D/pW/O/urj/hEWgElWpe/hfrYEY/bqOcWvt02p3dWC8GNkfm0XVeYE2UTSl
	 vJUfxjJP/4iOgD5fj9gsPyBpctXAvRmktjuisMj1BC9uw42EqZRXdSM8cSshJNRJmNxnI
	 S+tZX80LkzPGVfsZTr9nlNX8s+DeqvVnkI80VG2EwjLotX5ItyIFHxMA/WDyuT6c2NGLC
	 Bzj9cI32JtUMshnbDCPrCf1mpaVRDZQI0P12bOjq4D9M4gXsjZxQlZQX4QEZ4DUAE3mYY
	 UZUynM4a/vG0Z6Iz9fuvqdj/g3VgW3EVHVxr4+ejJ13UTTXKThkecgrZSSC8oamH/Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="XBUlah9/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A5D606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A5D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=XBUlah9/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so4674572f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589797; x=1796194597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
        b=XBUlah9/GQf7hrF7Fc0I5v9Mld1l9uEgPBgSa5e60UnZPTMgSRfXCaR0GlgV8QtsEW
         1l0+3I4zvi7ugP9docqB6bogu8Gcz+3Anw3I1KziFN/T4+OhQcLzpOcC81HZwvgt9xBs
         LDr9jUk3cEoqQp7xe+AX5X8HwkkU4Zdh9NNYJIhlYeA4H7NYoc1BWGCT8QlfWStrsSk0
         1KW71nEYkMXf/XZcyuNB+X6qqw6vtzX9DhNm0kca1awI9gioFCYhsw+fJWlOY24Y5ZPf
         hr8GNgaiWxmZtStudQtaUeDZkWOWNpxD2oUuH01qEMF9GH9qzlW0HWGQyLgAbUPMG086
         Gqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589797; x=1796194597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BneDH3BrmldgDuSfaRvWpkmdpUNgHqyqEERpyedMrs=;
        b=OKLd+tdgJ3Vfhnn2NFsK3Y94ksSBDg5rkYmSfuHLs3B6CQ+eaHaGqDsAtwIg2kNLje
         XTguhbvDpIFMHhaQHb3Ji9Gb34DKXxlJVnwgKfT0yA71p9OZbYOdfGI1QqkkNsUblfVS
         VHV2eFLH/dKdvXFM3d09yc6c8IiG5ILrFlK+OviCPPZFmW6gUo4KvOf4tCtDSw2U1btR
         bq5zu5JNPpzb3LjiA9Gv6RNuerJttfNH9+/SvK6LS3dAn9WEX7Ti9JBThtVXzbHiSQcB
         mn+C4gybSyZdY/hj8LjW+0VQqSADRmOKggWsveAD7BIK4MaA4Kga1UVoYBBekur7C17c
         2eKQ==
X-Forwarded-Encrypted: i=1; AL+hErFPLAYSnJZm5CTa5HepVXacou4dbPizPLoeI30qwdT04UD0rUlZnDflS8uKE/KBl0/7eRDkZUknU5rROd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pxS/oEFg67jCbY/TvHgXvQDxXwX+A1u1UC5lAYDaxM5CXAY3j
	RvJhF8H8Heg8FgKwndvTEYnSVXd6Q6wOqs3JWq4aMFg60HWVxZIbcvyxUOaw0OqpIBM=
X-Gm-Gg: AZFdTZf9Af5NIYxhUnxy6Uq75cpUdDH1hNUZaNaMad5PiwnDyCJXmh5Y9CuKGEUky64
	tLWAAmXrVo3lbADf+bnXNf+7z9U61ACxiDFd7JTmMCRfGl9LhMJsmC+u2QyUn5D6JKozJ1ySEx9
	zwPF3dPYkqxKDwnbYPkUHM9d08GHKBZUP5gZTC4qQPkSilVWtwGGuBGknrw489O0cW0IDj7mzY4
	JgnT03hYiO0thskSh3x0IGKQKtONpFQJbDpTstYOQ8hRnI+TNeqVvaCQWARHhXcr+S59txydHqu
	XbLbwkmfcVGTpKofDZMCq5fwG3BDLa0gUOlLjo5m3db5Soo65CUt23GP0DaFP7MpkGVRReVEquX
	1iNa9pf7XdsoP1OY8YhR3bnjJUtP5sSnU/2n25eZFX69lgkgBLm/f9YgHthaclrViQIzcroB0YS
	+bIQls9Z/VYYEezeXoVyJOFcHUyAjeCXpMmR3MJTzQl0DypRtjI+8Mk/mpotfMqwcf+g1UCMvc3
	u3DFD0PsNM8L+mljqccmACW6niOBupJ/P08MybvwQABh83ISDGFXi1lzlUhnObkH3da3FiRfrIp
	IOwC9o6y411OXz5nFAM=
X-Received: by 2002:adf:ee47:0:b0:4aa:5396:a792 with SMTP id ffacd0b85a97d-4abb514608bmr25076345f8f.23.1795589796866;
        Tue, 24 Nov 2026 22:56:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm36981016f8f.24.2026.11.24.22.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:36 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:16 +0300
Subject: [PATCH v2 1/8] KVM: arm64: Drop an incomplete MMIO access when
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
Message-Id: <20261125-double_exception-v2-1-224689d8a764@pereq.eu>
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

When a vcpu exits to userspace for an MMIO access, the next KVM_RUN
completes it.  So for a read, the next run increments the PC counter
and copies data from userspace to the destination vcpu register.

A reset should cancel the MMIO read/write access.  Otherwise the next
run will copy memory from userspace to the vcpu and increment the PC
which skips the first instruction.

Clear vcpu->mmio_needed in kvm_reset_vcpu().

Fixes: 45e96ea6b369 ("KVM: ARM: Handle I/O aborts")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e..26081d273408 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -199,6 +199,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Reset core registers */
 	kvm_reset_vcpu_core(vcpu);
+	vcpu->mmio_needed = false;
 
 	/* Reset system registers */
 	kvm_reset_sys_regs(vcpu);

-- 
2.53.0

