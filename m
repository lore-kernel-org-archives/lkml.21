Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621159;
	b=aGRJxZoXdNFc0xmyDItNU1vohhL3lTIHL8AVG0i3OU5l+1hJJfF/lHbsMoWeddIpCevx
	 phCB54JlRrmZ5wj+yQpmhvdRSBdL1DqgDeU5/LGRFFNvdL+3vJ1JkKng56NqbDS/gkAVv
	 14Agxse70mb0m0LJCnrZqah6X2ELOjJaFGSzsODEH3itdCi0rrLY4V73fHqLOqMYzd3Ha
	 52AyNV+9Ha56rzhGRguL5iECCU+/XHlXtpRsvETp8cqhHdz4qLQopqLis6/hqMcOzpDbf
	 7o5XQewaSFJh8TU3NxS6B8dV7jdMnmd52nzRXK8cIDjsaK7vPuFLSGXYgG2PSTbTsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621159;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LCnVdHirYtBKX2t/3K8ljhm+P9aiBrtU685db8fTm+U=;
	b=xVIXW+H+Srk7rNeXVRe9hT1JfripSAsKWNyxW8I5jkDWyseKgVDAD2UoNGPAq4KbAJ+T
	 qu1cYUd0Tim+CoP0BxGM3yHiiUb8NVOzQRb0EVp3qasMPNxP1kOF9Ok5YJVvmMd2lfRU7
	 plybH0QnxqZrBa68hhSjC7SjDx9g1L+oFNi7VEgxq7gAN9wX3AyvFT2rS4jvCrSTrx+Py
	 hDKE44w14kJjhiAokC/uvZnkpxf2mjyENBCTky8SnhOs7Mn8B6BEJjdkxprAq02OI8xgH
	 Q/vaANMmPp5MDvDgAOK6NLzfixYO9+6GfTHEXKJHAUwtcfjSd4LsS94ABNsHAL/6KRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wALhDrPH;
	arc=none smtp.remote-ip=91.218.175.99
Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A86606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A86606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wALhDrPH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o/SZfwEeYhSxZ5cZ93jBl6fDIchTpBEO/6emnlOmEC8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621156; v=1; x=1796225956;
 b=wALhDrPHUWRg+PnqBIVx+mxcK8l9B5eVX7yhtcbiSL6rCAaOfbBky+29ZklmAUKpVE6l/uSW
 44X01pscOJFIM/bi3O9KlVHJPxOgE9E/lsPcaqvCb5h1OVtHFPy9Izhflf13+0gKlEKWyZPwl7y
 ep/OCYkzSH14QmG7cg87eAIQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3ce0fa6c33041ea;
	Wed, 25 Nov 2026 15:39:16 +0000
X-Mizu-Trace-ID: b3ce0fa6c33041ea
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
Subject: [PATCH v2 02/20] KVM: arm64: Don't advertise the host's MTE_frac to protected VMs
Date: Wed, 25 Nov 2026 15:38:53 +0000
Message-ID: <20261125153911.106793-3-fuad.tabba@linux.dev>
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

Protected VMs don't support MTE, so MTE_frac in their ID_AA64PFR1_EL1
doesn't apply and is RES0, as it is for a non-protected VM without MTE.

Commit 3d7ff00700d1a ("KVM: arm64: Rework specifying restricted
features for protected VMs") caps the field at NI in the pVM
restriction table. However, NI is 0xF and the clamp is unsigned, so the
cap does nothing and a protected guest sees the host's value. On a CPU
with MTE2 but without FEAT_MTE_ASYNC, that value is 0xF.

Drop the entry so that the field reads as 0 again. It was the only
entry capping an unsigned field at an NI other than 0.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 32e82653ebf7e..e1749138f7507 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -105,7 +105,6 @@ static const struct pvm_ftr_bits pvmid_aa64pfr0[] = {
 static const struct pvm_ftr_bits pvmid_aa64pfr1[] = {
 	MAX_FEAT(ID_AA64PFR1_EL1, BT, IMP),
 	MAX_FEAT(ID_AA64PFR1_EL1, SSBS, SSBS2),
-	MAX_FEAT_ENUM(ID_AA64PFR1_EL1, MTE_frac, NI),
 	FEAT_END
 };
 
-- 
2.47.3

