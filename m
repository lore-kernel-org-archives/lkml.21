Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589808;
	b=kgkozs95/LH1jsECD9wvKn+qBRaek0hThIEvqxty+fzykqplvShuf6m3rcF4EObw/TKa
	 HmR06kLBqhG5cEQoV85/g7bT27Q6ADY7U9XczOejptn7mbD8j6J263dbEohln6YzDYaOA
	 y/p8jFt5bLU7cSBVOSiTsCOkt7p6VEkN0ipASTvsbOLpyww/lie5ktuFtoc+eZ4DqMegb
	 qddljSG7Kv9wjkb8m80w3+FEqjgRAHY19rRq/9Rubl1HlQXIev+kOdiJHo5f6Yw4qHr16
	 ZrQK7PAZpEur7btONdUrPvRyJ6oMk4/VhqS76/jND0nftC1awVUisloDlO7kTU4xZ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
	b=LDlme2mWrgNk6Z1wLTo+FS712eR2ZATjj0cbEdwXbfR5VgjeejPz5hbBxkkWzxUkVxRu
	 rOdLzcQ3cA0IYDFo6dPRDz/VpJhzdLuS9QGIAYGOenZYkUzqbmHv8tZCepCKb7CK//lJ2
	 4Ea0CEqLSJYjMghCKR6JsRUyaIfGJtC5wUKuMKUJpL0Cep2kY831Cyr3EoXOh6W4t3yRK
	 /WUED3EU0F4FTa+oKD4bTwjSUG++eh1VYALrzrz8k/RCecelLPuW8jc8Fy6gyzHydRY+C
	 ljhS/b9bsnPNva57JxPBk7az7/gCp/Uqxc9XYHA5CcsCRuE6weAN0DARurfLN49zBiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=RlPZXaa7;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E774A606A6A7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E774A606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=RlPZXaa7
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5017160f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589806; x=1796194606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
        b=RlPZXaa7fe7EQZlpHI+2GAQlXvVlmpHFOev8m+dtEjaz87EYAL8kAQJNFvcebnJnCJ
         QayppHZcapAX1zGtIIZsMb3RlEGPDjqVmWDvVCnvzPYoTLjBV9ke6fhmRYjzuIaAP7jA
         uK7+gZzUDH1J8jBhKFSXooKzUaz9d+QZLs7K7nY9iph4N8+4JXQtNDxgs+EMim1wIgD6
         3tmYEVVTb6u68vD0HJXKScfYOusBlvBMoLIrGEGqC4lPbYcn7H4MFr1XSBLw1XgIUh2h
         xgqu/Fuyde2lH67JzlyZNxMTaIY04TI3Dwh75KA5/W7iI/mh+UWUbKewCi1k6FPdGR+x
         yANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589806; x=1796194606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FprakhUf8NJ7i/pJUhVF+s5uu9taLAIMe4T8Serof+A=;
        b=bvgyCdnfgm8PsEYcmLCO/RL9byrM7JUR4/zts3U8X1kfwGbnHdDN5c5UuiTByBvvXk
         c0bTJs5Pz4gMbE44gaQuPOBvI3Ni+c3QigW52b1ffM8CazoivC9JJrDM6PkcMz1d83KS
         SSv2Yij1/QfAyNmUKKm0PyVafErQD+SG/ilLizlNZdyxw0pP3qv45210VAXA4iUB9D2E
         LG0k/RewtJxmP0gRl9LWUqTN3AdjFl4GBwlx6yYVP5bJhWMmKVGutTDpBAXX87ypXyGi
         43Bbioj3XzDb6hAyHTEBlkkZJI3Me/JkFMukCeyc3l8Pnhuse9zgHJjeW+tY0a4eL2xo
         XCHg==
X-Forwarded-Encrypted: i=1; AL+hErHmp6Wk8Q2E4DySXtDuk+/DRo+Om4m8Qg1c/c+0g1aZHLwTpvkf/v3TxTusG6r8SgA42RMTM85QRWvjMm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dcUbPPFkxEip/skTkHCgaE6LPcRadB7iR76xq2/JpLVFG5GhW
	ndnxvEQ9a88KBxWhX/rOmWLV62j8jCU9vA6/tIL8yfUkcX0Rrk8rZvdMuv/CUXCSjtc=
X-Gm-Gg: AZFdTZcG4itpzBT+v1NdqSQeZUi44RasDW0Vc64Jya03b/jKM/ds30e3x0cxG78AIcA
	rb1hVJS+VKge69ORvCxjXyaGzCcDQJy4ZBPPKzGMpD9os0psbmuuCCpNWgpoZH4N42PZ8TQA0I0
	BwmL96ZvNLrhMy5VPyY+dJMydvENCjPW6ld/okCZ/83sQWequl1JKLpjbwkb7SFGfqLsDjR72XR
	6tgeACqwqQoUKP58KOUtqgTL9W9DGsRVPs2qdhmAmxmV1OfMjDsQ6du4PHtGssy8snOuWoSOCqz
	26zkQ4x5Jx1P8Z/ahwrFnVxqkg0TxM+zCeOi0vyjVdFPzNhrkft7q0qDFwcF+U/S4N2g3GzIlhC
	NVEw/ptuQlDJ7DW9GQtroa66QogA/0jaCWNm5LMa1S+tE2AA5M3wPT+ouYySnnYmEYOhObsOcxd
	A7+Ntlj29+Smf1+yH1FL6mZyLfBoAQUmwnOGJgegvIWwLa7DnkQ1hKiJBj7ZXdTylp7nY/35AeG
	w8mEc7UiTFEEkFwrMMRGOdK/uEtefiPNuNMMGzzkqMf3pnlc4vknpEJJ2GPCVGVaZeTW+eDgysX
	fBbNcVHWUPiILWM8/cs=
X-Received: by 2002:adf:e014:0:10b0:4a6:b87:d799 with SMTP id ffacd0b85a97d-4abb400bb42mr23914238f8f.17.1795589806244;
        Tue, 24 Nov 2026 22:56:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm29125406f8f.17.2026.11.24.22.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:45 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:19 +0300
Subject: [PATCH v2 4/8] KVM: arm64: nv: Discard nested SError in
 kvm_reset_vcpu()
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
Message-Id: <20261125-double_exception-v2-4-224689d8a764@pereq.eu>
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

Vanilla KVM stores a pending SError in ->hcr_el2 but nested KVM stores
it in the NESTED_SERROR_PENDING flag.  Clear the flag for nested
SErrors when we reset the vcpu.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: New patch.  I split it up like this to make backporting easier.
---
 arch/arm64/kvm/reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index a5d298d5ce61..d80b38b2ce6c 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -209,6 +209,7 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	/* Discard a pending SError */
 	vcpu->arch.hcr_el2 &= ~HCR_EL2_VSE;
+	vcpu_clear_flag(vcpu, NESTED_SERROR_PENDING);
 
 	/*
 	 * Additional reset state handling that PSCI may have imposed on us.

-- 
2.53.0

