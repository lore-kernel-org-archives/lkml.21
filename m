Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589805;
	b=euDESfzMg0dWQ2y7gM8cwd5Qf43oWdyWxRG+C/1fqoqWuxL2E2kSYxmiYa5kpeomHgHu
	 jpMzWZECbRsnZaIog6ZfTJVx1l2MLzddfCvPICo1TSmTqgHaCvj9x9UJX7gOlPXeH3Aju
	 7WXa6a2H0VtoVDrDHq+EYFm9WiGmZ9kRzlC4s9qR7OcYPlsnTXCSIlN7h1QifD9Gfq7XQ
	 PqdHqKmgogmo4MBWtRXvEIvwX/3EQHttNwBvcIWoDbKWf996BiM6J6eh+/tSQg7/Brvo3
	 /Ys4oI5rcKQ6dURzOP8QmfUNhJiihywXu9gXxmVNQN70+K8YoI80aBcjkcgK02wrlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
	b=2qeAil3PoM1dviyjLY4Ms9sNdOaE2DbpZ7IErlqzHbIhelLkwM+INQzHMSY/M68bYtGH
	 /NFT/aVT7sKlsSQ5t+n0TBxEoeDKjqgTn4B1nPLNF+CYS8GJ6pgnRf9q/rc5vqIND5GF1
	 OrfG5LuHckdjt88kPTO7WWFqKoG7GicOU6d5zz1bKmWiHnxVbv9vVdMaL+Y373oFFuNhA
	 wflELFM+/MCcUR63KqC3jEE32ps7Azad8fi1O+eOCOoP5/aO039ovrDwdN2BeY8nuds56
	 MBtiDtbB31ZPLRLaRdxA9gkHYvBIlJfdpsNe6cdULzEXrZP8y7fNrPnnFz7XO3M8f7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Qwu4TVHn;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DB606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6DB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Qwu4TVHn
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4aa5833c263so5149671f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589803; x=1796194603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
        b=Qwu4TVHnW5keU4MSRtovHL3kWNCRibVMHT5yd6sFTANGcYG2F4QtvKQtJk58u0+Yw+
         GIxNJ0WrtEkkB8C0DhGkPNDoddvnXaWkhAEyfpLWjA6Lu5seBZJZ9woFcCEFD9Dhrpz1
         2+8yQVao6dgIYPABEpcwn8VFa6A7M2iE96PhtMuKDKuUgyDcM+0g4tpr20TLFQU6CE+Y
         VL1h7ONRvNATfpbYeEWlgEL7xWF0d4O0km2XkfSdLjFevIBYdSfORFIIilnHhPyVCake
         iPNrytXSRzPAzRZLHcHvzauBwBEu5RXzAWCxasQm8qpGi0yysz4fgLPuKbj04m/Dm62n
         +zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589803; x=1796194603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoytpwQW2+7nMQ4LJ/J4mzx2IC+d/7ZRY8SoLyVie08=;
        b=J05sWpTiosOH1/tldSqexh8BhvHtGTiGHJFBPj4hIZRBgWtpyPWRHTPKppgevNgIGW
         THBwjL+45Jz+DRub3/BIwF4Ju2gich85Bv0VsDKDj6L5BIJuuIQCknIpOIWJvSoY4aK5
         AC4DKibCmNYvGaSXsR+uI7uPJdST0g01aZUVuyVMeyatoDkgB5qD4fcxcxvyPWUxU7al
         c9Z4koa/nViDSgHIq4O3i9IhR6JyEmRNrSCUF08FyjoTFzkZQRJUTD6iNvTf2jEHdnsm
         VMOO1xczt0vJc9YV+Xv/4nvgduufXHhOsOsNF+D4a2OXKsX4W72XCRdeEf9ZssrU+Uxi
         4qDA==
X-Forwarded-Encrypted: i=1; AL+hErHR4v+BGMTQ2B+adr6BZhmkx4f28TcbNWkpuI5x9m5ofa4szwPuz0AH56kFdAshnzarXpQjGccjyhehjfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gYZEzKEJ8Zb1BEsa8QzZBPVYT5a+ZDrpdKfhI6YURlnex7AC6
	QLq3TYDOS5ZA+IbRk8Etj6TJLFfCCdqu4snSdu1E7/jzUMH6G91ciCJWS/IwnuNv5pA=
X-Gm-Gg: AZFdTZcgjP8nvl4ZmnqTEEMLAS9zmGDiyz2hhWq5BaLNhbsBL8uch4cfiRuTIHNT8BM
	3ljLvJbW6EBQRpsrmlLS6hM9f12ZhQFgfBBotBLR52OJpridWRVsJUibMGtQQVoPcyUhBFHndKC
	8LP0P/WNtsGtf8tsQdargEYgebXOtfqnK5VU+IO6wO1utp9lSJKimuVz6OdwCWgLEkBStNY7+nA
	t46v0e3C2d4jxrjt2nduejMfbpkZgrTNmWdASOOY7YP/mv6crZcRa2RseEWsXPJsb8kE4AmDULE
	cGs5pjMk/MKLyh4oF2f0Cav2M3VRZf45pIhJ2kjfuhhYYYbGYvv/702yBFiIbawPT3cmZSpoSqR
	PC1cXeg9XGRTcbaXBdRDtJ1GAJBxT0hW4O1CuUDCSPxBWj3IOz6yLyj4sU1HLr0PmZXzoYlomqt
	AhR9o/7o6ZBtkLrel7UjREU7B6Spnxkid+SVSmdceC2/6MzZFmHBLmGQFBaKFto46C6wuTAqOcz
	nLoKdpPbxmUORiGws/5fjA0HydqBxDQ+FUfXfskBimfF5Vy9h2bv0RPW1kbf/KXkHPglPN0IT2a
	Qqp0DQxImlVqtInIA2Da8pKLa4FCPk6JUr1SAz1R
X-Received: by 2002:adf:e00a:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4abb3a4d2camr23594315f8f.36.1795589803330;
        Tue, 24 Nov 2026 22:56:43 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm31864281f8f.10.2026.11.24.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:42 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:18 +0300
Subject: [PATCH v2 3/8] KVM: arm64: Discard a pending SError when resetting
 a vcpu
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
Message-Id: <20261125-double_exception-v2-3-224689d8a764@pereq.eu>
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

Resetting a vcpu with the KVM_ARM_VCPU_INIT ioctl keeps a pending
SError.  We used to rely on vcpu_reset_hcr() to clear the SError but
commit f1ff3fc5209a ("KVM: arm64: unify code to prepare traps") changed
it to only reset HCR_EL2 before the vcpu's very first KVM_RUN.

If we reboot a guest while there is a pending SError then KVM delivers
it to the freshly booted guest.

Clear HCR_EL2.VSE in kvm_reset_vcpu().

Fixes: f1ff3fc5209a ("KVM: arm64: unify code to prepare traps")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: new patch
---
 arch/arm64/kvm/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 9c1b42890c96..a5d298d5ce61 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -207,6 +207,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	/* Reset system registers */
 	kvm_reset_sys_regs(vcpu);
 
+	/* Discard a pending SError */
+	vcpu->arch.hcr_el2 &= ~HCR_EL2_VSE;
+
 	/*
 	 * Additional reset state handling that PSCI may have imposed on us.
 	 * Must be done after all the sys_reg reset.

-- 
2.53.0

