Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016138;
	b=D3T7SUtLt3uar8KRNgslQOcQ4RIP9LcApLOXR1HqP/TV/0a4UQSc7RsPl4mBldyN2Gkj
	 sbRjN6hg+9nR2nHSv5oBsTdQfONi3kTbct7qt4pIpESL41u8LPLY394NQYajjzfqk1daX
	 e0AP8MHOqIGaYRW1K/XAupSIM2vDJzIOkMtaqgsrXKTpB1OWIEHRfJHVtmyS8GBQC3sEU
	 IK6NK83aLOjH1FZ1NNtlRk0m233BMcjLXf8BmhTHQsjPwO29XsBubjPNY3CxJdk8cAnBz
	 2XZmWmDyTxYO8YQJthWornvInFspYO+8MlzpYvtHEo+aHWcqw8Y1z/me9FaC5keMdpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
	b=eqYZk95xC2adeayUoVMJCeeGRPeDzumQKDPH8J4q5OgLqFj7XxXyAnDjirKsHSFmlF2i
	 giePJDOHoBKeC1Fjp+ChR4OwH/f6S+wh9Y16+iMYHNJZTLppDIBM7/q74r/o9WIOylUtl
	 HnA9Z3QaaFF7uDFcmC9rDFqzZQZM79+bs4+ymTbVJs1P3iYoFHzUv64Y/vC9wXt+Gv3KT
	 1fasLi+SygA1U/ZcaPgbHvvSIpdYT4pa+D8+whynWQwjzd6s1VtMt794vXf4K6SG+AcX6
	 oNSX/X4kcJRMPluMaal4nou7eaUka7KQv8L9cz+tRDsvjI+OoLX6VdDW5TG84L4jmVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MTsFx2sg;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA0606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FA0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MTsFx2sg
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so678557f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795016136; x=1795620936; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
        b=MTsFx2sgMd0Z4WbUsoLOaDhO5xlXrQNfdC/3++xk6BwyI8gy2QdPz9iv0aFbS2bgtf
         6nRajQixwfLm+qI0DVqjHsRp9OKoV1JPX7zBkqpthR9yGJ5K2/jDdpNmL0sTGhUN+yCW
         oHpGEo9EO4uGdokbxY4C+3v1hCvcdUHCbIzLqrWc4rqiXQMAK3Hf0k/MDEUPR0UAO5RP
         gaKsFzGJxh/WFuJ5wVyFBVFJmGD8H/UXhIjwvcdiWY+GJkByarbgTSiMzHWl8SH3WVQT
         3EbbW7DU+hCB+bivyfRciVkkOCyoGcwslj3o6YTxesN2SP79gQ2t+ipFiFOMrIVs6I6O
         xKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016136; x=1795620936;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
        b=nU700sTsGvwAcRx65rdN+CuFzowuVsMhJKJemQrhDDj3+2n2hZIR/nrRfmscZpvliW
         QrvG6wzX+757L9ivUJPlj9Nsv2QZ1yUPOddBEP0u+zhORfQbXD0/wwyd/67qlG63MFuN
         /ZvUyGVX8v0r58B9BxZcFhj/s132UH2uiWT0xMnkyHmcmqTRrBWoBxvqdo0+GBJlYGhZ
         0F+2N3B6ca2huG/m1OhIlbamng0PZKQ0i8ze53ig4Pawmy5XCh00/sOpzMLEbQt1vh1R
         dWorZgmnNeKPBMFhmt0j/y4BYATsY+mAcG4+VWSqRZW4kdnoJ88sYXVdsyRiyili2biJ
         V5jA==
X-Forwarded-Encrypted: i=1; AL+hErH9Bgzt1O/TAd1xgGwV69Xdwl4Xd47//vffpgUnHbHTnJl0dp3HfqKxKmy+svFT0YknLAjAc7XERPem76E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uiT2dF8jhe/YpRrYvl6odAMxNOVJH0cgkega9KBrQbvlxEAx4
	GyzLbbW+/Ml8Mhdo1p0e1y7P2nztnuQM4vpAaX4Te0EiYQFWOXvoi/20p0K9Ncha6Ew=
X-Gm-Gg: AZFdTZe5QHY0y+Euu3PE/KLu8fXU3i+3hC34PDL+jGp+seY1EEeDaT8QZjHe03MOWxb
	y4xAzVpqTL9kj93dLU13IqQ6CL8iNIE12j78JQd6DS8Bwi4ZavssuRYffSMAkfDyV8qL4DhCeXV
	GEgxirIjHozAPjxCMY+YZh5wObKmLGqxcX9S/1d0YdS5br2wfZh4wYiB7kWhV4mYdk4/5/ULLx6
	oc91/4Sh7hi8a+QqSMTOwKKcMnaS6TMPhlPnuWP8MGRuszTzffx3CXyqFRV1oOssdg+rgTiTc/e
	u/4KQ4ffl/bB/BGnPz9VzSUydX494azBUe2z5TyKxrBwUpZNV8r7ZWh2tPDVMZtWLZ5ljfeswj2
	TYXW1biyjx8haFLeAtDLejGfxucWMRYR5Vp68cFOAQQ+QaboKBwzYLx63+1A7gFC+VGbS19zrF+
	0lnjtKDtbt2h9aHR6UjJ1cbwQyewp7KIc7EI/RsDCfin9ZKq97UiZWR2BQjUYmjoNSfbbavjBX/
	IJDPsxd5FGHGhagTe3hrttAhJynk/zn0aarYkwx5mWyaYA6RTdgR+GlyWYWbIPm8Dcuod18+HIW
	qEl7liIRzejWaASbn+Y=
X-Received: by 2002:a05:6000:144c:b0:4a6:bc53:246d with SMTP id ffacd0b85a97d-4a6bc6269b6mr5843166f8f.45.1795016136152;
        Wed, 18 Nov 2026 07:35:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11643sm5196571f8f.49.2026.11.18.07.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:35:35 -0800 (PST)
Date: Wed, 18 Nov 2026 18:35:32 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Ignore TLBI IPAS2E1 above the IPA limit
Message-ID: <av3FxJpUvpb_8qMC@stanley.mountain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In theory, an L1 hypervisor could issue a TLBI IPAS2E1 for an IPA
above the host's IPA limit.  The s2_mmu_unmap_ipa() function would
pass it to kvm_stage2_unmap_range(), the page table walk would fail
with -ERANGE, and that would trigger the WARN_ON() in
kvm_vm_stage2_unmap_range():

	WARN_ON(stage2_apply_range(mmu, start, start + size, fn, may_block));

The TLBI's IPA field goes up to 48 bits, so this needs a host whose IPA
limit (its PARange) is below 48 bits, and it would also need to support
nested virtualization.  There are very few CPUs which meet both these
requirements.

The fix for this is to return early.  Since there is nothing mapped above
the limit, there is nothing to do.  This matches how handle_ripas2e1is()
also ignores TLBIs that start outside the PA_bits range.

Fixes: 70109bcd701e ("KVM: arm64: nv: Handle TLBI IPAS2E1{,IS} operations")
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
This bug was identified as part of our formal analysis work at Pereq.  I
have not been able to reproduce it on real hardware.  The only CPU Claude
can think of where you might be able to trigger it is possibly the Apple
M2?  Not 100% sure about that.

 arch/arm64/kvm/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ef4554656ddf..19a914941aff 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4236,6 +4236,9 @@ static void s2_mmu_unmap_ipa(struct kvm_s2_mmu *mmu,
 	max_size = compute_tlb_inval_range(mmu, info->ipa.addr);
 	base_addr &= ~(max_size - 1);
 
+	if (base_addr >= kvm_phys_size(mmu))
+		return;
+
 	/*
 	 * See comment in s2_mmu_unmap_range() for why this is allowed to
 	 * reschedule.
-- 
2.53.0

