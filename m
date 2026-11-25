Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621227;
	b=qsNHnkmf+obfczNTMl+/mT8uAHQ+opXUEfXTB4r7RuoqRIl3RLZyMvv4Kp9eItQQFTbu
	 MgRfbmTdW0yyEadWI6jJ45is++3R4ki7AmygsrIv2GIVRVlEUcyvf91R9fA7zhwIsvO2b
	 OltwBXxgebjG3liXPRkStYO44Ds91cXjD3VatjRsBODfLf1VStUU04LjXBc/IvZCZFzDp
	 9LFxB5W2q0aZWcxGY281G9fuMl/1xpUPT0KnYqy5Et2Q95+DiIO6vglL+BzykFgPOys78
	 PJynbkUu+PMru1185MnyQQTGwv8s7NqKmQiUbK4RM88nSZqLOS99Xe3NpiRaNnxHTrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621227;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=drJVa0QgayGuhGYi4NP8p1Ez5UctzVZvNREYNVMNp/Q=;
	b=IZ3L9UmTT30DSXqaH/RQT2Zng+ePyVyNrIz+/3ciawlQEJHLvBgurFy9LOkDgy4HC+po
	 qcGCLsz963y0zhqjyoz4HeqXQ3iL3JzpyJfV2aO6MaqUh4rTmYZCdY7ESDZ6aLc10e8uA
	 KgzZ9OUbIlGPdN3qhfR4V1zJkvWa8W0P3SIoY1JRXG+cPhRvZiTS7ijwHWNil+6dAXj6R
	 ORx3Uiu6dzoBe3DxmeDsXTW0tYmTzFIGCqvCpkr/einmEIRYxxN83v9zu+JFpcnBwci6W
	 NCi9/RFLJmMFqIFm+KTfuwizUQNzutdJfKiTfPNgRMFVKjLNtwr13OdMLxO0P2NsD8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dH2L1Q+M;
	arc=none smtp.remote-ip=95.215.58.164
Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B0607DEB3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6B0607DEB3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dH2L1Q+M
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zMg8PTnJrl2Cv/LZHpJ8HIY5Hb3RY/8jdSaxT7wXvrY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621225; v=1; x=1796226025;
 b=dH2L1Q+Mo/6YJfDmOq46/218WKKHSQSrjiZVu7JIR8hTKfvO7QxGHFef0w5B37QzKk+dRAtB
 ZzgJp1lod6ZctV5E2GH7SYu2yiRMZDyYEo8jNi+TuUVQ+tYuGBnt4TQUxbFjTWJ8/bQMpfP24HK
 oDdjQOlE/9574yGhsoZ6IliU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e60406e83a0946bc;
	Wed, 25 Nov 2026 15:40:23 +0000
X-Mizu-Trace-ID: e60406e83a0946bc
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
Subject: [PATCH v2 13/20] KVM: arm64: Advertise MOPS to protected VMs
Date: Wed, 25 Nov 2026 15:39:04 +0000
Message-ID: <20261125153911.106793-14-fuad.tabba@linux.dev>
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

Advertise FEAT_MOPS to protected VMs. With the field set,
vcpu_set_hcrx() sets HCRX_EL2.{MSCEn,MCE2} for them, and
kvm_hyp_handle_mops() already handles their MOPS exceptions.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 4f13b100007fa..acba7489809f3 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -211,6 +211,7 @@ static const struct pvm_ftr_bits pvmid_aa64isar1[] = {
 static const struct pvm_ftr_bits pvmid_aa64isar2[] = {
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, vm_has_ptrauth),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, vm_has_ptrauth),
+	MAX_FEAT(ID_AA64ISAR2_EL1, MOPS, IMP),
 	MAX_FEAT(ID_AA64ISAR2_EL1, ATS1A, IMP),
 	FEAT_END
 };
-- 
2.47.3

