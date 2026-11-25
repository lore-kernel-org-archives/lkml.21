Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621249;
	b=Yo7yIQdVUwyzoICG3Qep209gx02l2ahJBTTRi+EMudJ6CpnVmW87pOiz3TKBHcuZuxfH
	 vJIRnDoczlZ0gB55zE8BMT4sgAgzl5oDZ8YJ1TgQ5gqSsmkEYgstcOPde9PLN+1bUXRWO
	 +1BZNYNLjzYmy2ccx7Un4JV8AqqP4y9GjyqrcorCWmUxbnFcBQQavnyr421BByFMh8iKT
	 r09B9hO1WoKOBHcMZMCtFu3Yi3E4xc7HzcPjecdpGTrhfwmm13rl62vfWIz5mz0CDFd+v
	 vRbQ23NrwpsbfriLOtUpkt5+sIo9ZxalulSJrHcxvVOjppS4fZYVLx/31RmIBOlTMGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621249;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oJyjfOujmSBUsGvM1/SgdU/YJl1D0UryFNbGYP9HTmI=;
	b=fThI+kuuqo60DhXnt75FLrSvui/2uL/k/S4xFKZHV9V6/u+YJddCP13ntvR6aJ6S0kbb
	 XTBPRW0eKq98XRuJ52gdCOziEGybMUuaVg8KDNHrj8SO0vpppsfTkRM7FekM9ZHlfkhSU
	 VMonCKW3LOfxUVPBylByLs5IpD8+zABYCHBI3oM+TRzDbliQiwPIFskpGp+JomGtglBH4
	 D4gW5gZdjsjPsTwapj64VURtk1AoxcZ+90gUoJwtIbd5u1AOpHOVTjCnTLteVepaqXlV0
	 jdPhCueuuFGk53buyMREw2JdAOogGiD58gqaLqTHAIgvFa/J5xLY+m9g1fYn3qCz0Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dA4yyyra;
	arc=none smtp.remote-ip=95.215.58.195
Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB6606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CB6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dA4yyyra
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j1+9jq4DNPjKmn/CiJVqGm6EPhi92kwiCRK4Zpjn4qM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621247; v=1; x=1796226047;
 b=dA4yyyraWlRd0mTERY4HDESFKEKwlMYEgCWvtQd0esCUToGTOgUTYXacZEg3doebLyMusUQ5
 jSEesaJMPAE077rK/7fumTfK9ICsejd85CAcnafagjiqJhNgIWlOzYPhUbEfmKds/FHpJdRYHUc
 nNdiMw46LrULcAmuN0JDRUcc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6dde43742fe7882;
	Wed, 25 Nov 2026 15:40:45 +0000
X-Mizu-Trace-ID: c6dde43742fe7882
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
Subject: [PATCH v2 15/20] KVM: arm64: Advertise HBC, CLRBHB, RPRFM, CSSC and LUT to protected VMs
Date: Wed, 25 Nov 2026 15:39:06 +0000
Message-ID: <20261125153911.106793-16-fuad.tabba@linux.dev>
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

Advertise FEAT_HBC, FEAT_CLRBHB, FEAT_RPRFM, FEAT_CSSC and FEAT_LUT to
protected VMs, with CSSC up to CMPBR and LUT up to LUT6, as for a
non-protected VM.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 4ba947bd3d125..2c22317a76a5e 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -213,6 +213,11 @@ static const struct pvm_ftr_bits pvmid_aa64isar2[] = {
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, vm_has_ptrauth),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, vm_has_ptrauth),
 	MAX_FEAT(ID_AA64ISAR2_EL1, MOPS, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, BC, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, CLRBHB, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, RPRFM, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, CSSC, CMPBR),
+	MAX_FEAT(ID_AA64ISAR2_EL1, LUT, LUT6),
 	MAX_FEAT(ID_AA64ISAR2_EL1, ATS1A, IMP),
 	FEAT_END
 };
-- 
2.47.3

