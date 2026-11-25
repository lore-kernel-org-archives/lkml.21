Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621232;
	b=wmCuZ9IN1ce0ju5Ets49k/hxRQYmsFBcUQe77Xy170EZngfzva4Jl29PLsae/skztlu7
	 vGKvn5T4ca6wk2WJ3hrgYmvz9Ema08SlNime6C0sE3gEy7VoaOLEjH7d1KT1WvLPzwAiU
	 E8aBIPYtOBZcABYsuPqRFZItO1xcf6sz1y/ici4PgYO4DlU+a0wdXwTRg46T7TrUSmcbA
	 fgSsS1kfGuRC+nOjhoQ0iyTzIwy6MN6sIAfgN39mcikcWvBuRrgNdKfQN5tHaAuLtdHF+
	 1zOFDRvW073Gn7YMMpCl0hSxjp9bhnnOQBkq7qg2TTr8O+VTQuWtp5ktxKuybB7eOeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621232;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4KD70GwKCbIo3iYnYiAxROa7nQMR8jUs46uCrYPzsEc=;
	b=O/+msT7wAuUVTuecEfS+PECOcyALfZ0s98He5BD7ZgpqWbJYVb18zjeJ/qcIPZ1BAI8I
	 nurssKFkrFvGwGRgL74pIJuaXdzaY0c35nDxyQB/IdAfUPUKAWeKxztSJNc5xDF0bF4+V
	 gZuaNWrP0sWvppJHxBWHyBgjr7vzvtkzoJudcgrhfpxyD/b/oZC4orLfWJnkuvpvS2iP2
	 Jc/KTEOZaVHHJAw+AJHe0ejpfe6rol5krPMI6gmJNxJHzk6l893ppzz1hIbEH2nwa9T8/
	 LtXjcLybWCtqBiBpbjhSDDBshcbE2fdDuGsXP6jyFtSs4/rW8c+Klk9h7szQaNFsUMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mDZNwb8V;
	arc=none smtp.remote-ip=95.215.58.175
Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mDZNwb8V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ru4wsoPUBX8BwclDhrROzB4V6cI3IIahsVXty7NCsP0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621229; v=1; x=1796226029;
 b=mDZNwb8VclVrVre5uQS0oHAnYkUXhOVmjhGBhHtZfEoCHpbJHBWeghRd6RNfuNM0D1+7rqFz
 J1ub0FuiJc4JdPynMZpd0sweuVXSn0cEvnsM7U+OVHQM6QajRv60tAn++ePK/UO6AP2sYrtpkAr
 stvMlp+UksHjc0pynfuNdU9s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 16cf6cf1af7bb7dd;
	Wed, 25 Nov 2026 15:40:26 +0000
X-Mizu-Trace-ID: 16cf6cf1af7bb7dd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/20] KVM: arm64: Advertise FPMR to protected VMs
Date: Wed, 25 Nov 2026 15:39:05 +0000
Message-ID: <20261125153911.106793-15-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Advertise FEAT_FPMR to protected VMs, and reset FPMR to 0 as KVM does
for a non-protected vCPU. With the field set, vcpu_set_hcrx() sets
HCRX_EL2.EnFPM for them, and FPMR is switched with the rest of the FP
state.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index acba7489809f3..4ba947bd3d125 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -127,6 +127,7 @@ static const struct pvm_ftr_bits pvmid_aa64pfr1[] = {
 
 static const struct pvm_ftr_bits pvmid_aa64pfr2[] = {
 	MAX_FEAT(ID_AA64PFR2_EL1, GCIE, NI),
+	MAX_FEAT(ID_AA64PFR2_EL1, FPMR, IMP),
 	FEAT_END
 };
 
@@ -828,6 +829,7 @@ static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
 	RESET_UNKNOWN(TTBR1_EL1),
 	RESET_UNKNOWN(FAR_EL1),
 	RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
+	RESET_ZERO(FPMR),
 };
 
 void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
-- 
2.47.3

