Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538718;
	b=nzy2rd4vsTOxHiKW+wWyoJeJ7moLPtyPKx3hipwMT642E1uQ+PqQEJiPEldTrsH/41xm
	 3Vq7DUBoS1qpx3dHqfQlUNKxXjsDY5lIKPadkMpX1LBGqT7fhPFPZgtUcV+sorTt1TIlj
	 2ea3O4TnUa+MoCYOpcUEuuRo9nAee4bd/grKxKyFCyOxmgOJT3fEsWUBO6RHF9Ppee5oK
	 isknMssW4g+wu09u2H3vrirAIIYKXciooFiFnHGxq69oNPhKn+t6T0RseSiN/qtx8USxO
	 rZvUVsfwwT6qLnBJ4cXn4cfR3deAmapKuqMpKc9U4u4mQ+lSPb0wh35DFeDOK/n/FMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=by0iiR0FmpORjCFtMsoAirkpYQWXRnrV8zvJq/f2IKQ=;
	b=w1DcSeI7hsr55dGQJn6ct1pP7eCvP0yxhAx7sSSktwkkeUjFsM8+rsLCVwCYC/mcGwSc
	 Z4d1Jcmt3pwjyCKuOT/dpcmwx74H2f/DZmngqFdD8ji4pcUYUOfzh6tv9t/b7PLcW0/ZC
	 bmCg3CbeSXgRxIJBPKwipVPjldHm9qF0j6c0jIAJRMrLg/oJR0bNFO+nvTmKL9s9XMn/2
	 7ZTf6EKnxGOhxXoKWDNaKkrJc31li0KMUrKznvrCIR0bRDD1ckcC+Rt9E+yKWS4EAofqx
	 C4gweaqpSWOXMQbk/UAstikVA8Pm7HBneeZbx2rDHYNp/eV+xoMRK7uoEkfpsHoTYow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AstgbQEg;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA729606A682
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA729606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AstgbQEg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a9be7586ccso2431986f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538716; x=1796143516; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=by0iiR0FmpORjCFtMsoAirkpYQWXRnrV8zvJq/f2IKQ=;
        b=AstgbQEgkgLFZmT5E4GnR2Ref2G0RkUaXmgwQZeG8sLSInYBW2IFwYVhv3aK/scFlr
         MbcKGDjZoTyxeTW2RC3FgJNjbnve5cbCDd3UiMXE65gFjk6epP9rH2vaS9TY6ndK3q4d
         VtmNfQj6uIt2a1e9HiFfYH3wrocby/uht6FBK/3Kd2g/ihdUh356m4WSDTcB1VWI2iJQ
         C8I+0AyaMgCPe+6vrohAJhdS9J9JHnO8Iv8zGD4UlffjBmoHRZc9Lkse9EnuqSAQhLbm
         OcNmkrmApWEcWJfRgD7DUMB+O5kjuA3GhAxFxFtQ72OPTVvOBBnWXx2a+BegwpEq1Dml
         J5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538716; x=1796143516;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=by0iiR0FmpORjCFtMsoAirkpYQWXRnrV8zvJq/f2IKQ=;
        b=ygvZUidnLaSTwC1hqA08QvoUWyA+2GCDKzwEMhedlrkVJbkLVjEkWUxTeD1CXMHR3Q
         epBtQmecyGCWlQXTObX3IfJzOGJO/EWjDtuJmc0JJGjXCAXAuFw8EiG5yIeG1/XgM9dN
         Z9st/p80m/yCgDXnRgidILICOIzee3s+AiITimAGpkcRteeKkInxF6QuG+lAVLat1vKy
         xTbKL2TXdu2y0RuVLSYKGtOitbkJv2Nxd8aEtTserSF68TZMI3xl+NHkcp5KaniHjq7n
         MsXANFnI/SMBrFRSF2RvZrlkDRonU+SdwhYXN2l242AIRVcBOO/wYoFcSKbIp1SlKE70
         wpUA==
X-Forwarded-Encrypted: i=1; AL+hErFVUcLYeD7gg3JH8wyOxyN0b60l+RdtKe8dtGaFs60cJSMOZnWlI/xDy3qQHYV9uwCCjhTA72B2NhJg9Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HYX0A6SX2AGGQhfaxe6wfkmZ6rFdSMH5Y3ewJ24Av3ILaC8y/
	qYXjLd+4d2CNeHLp8lp1jw6nCA7ehCYIu3+GIq7wHelSBidid0e2DbRvEZY+A5tLsIRQZgRCt9K
	ZEi+8+exNYJcZG9Jdq2aFoA==
X-Received: from wrty9.prod.google.com ([2002:a5d:6149:0:b0:48d:ee00:f39d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr42491230f8f.26.1795538713310;
 Tue, 24 Nov 2026 08:45:13 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:44 +0000
In-Reply-To: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124164446.2371939-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-4-vdonnefort@google.com>
Subject: [PATCH v2 3/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MEM_SHARE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Fuad Tabba <fuad.tabba@linux.dev>

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow the encryption/decryption
callbacks to work with the hypervisor granule increment instead of
PAGE_SIZE.

Reject requests which are not aligned with the granule.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Co-developed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index fbcb57c31186..98b1026cf68b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -20,35 +20,19 @@
 static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
-static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
+static int arm_smccc_do_range(u32 func_id, phys_addr_t phys, size_t size)
 {
-	phys_addr_t end = phys + PAGE_SIZE;
+	phys_addr_t end = phys + size;
 
-	while (phys < end) {
+	if (!IS_ALIGNED(phys | size, pkvm_granule))
+		return -EINVAL;
+
+	for (; phys < end; phys += pkvm_granule) {
 		struct arm_smccc_res res;
 
 		arm_smccc_1_1_invoke(func_id, phys, 0, 0, &res);
 		if (res.a0 != SMCCC_RET_SUCCESS)
 			return -EPERM;
-
-		phys += pkvm_granule;
-	}
-
-	return 0;
-}
-
-static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
-{
-	void *addr = (void *)start, *end = addr + numpages * PAGE_SIZE;
-
-	while (addr < end) {
-		int err;
-
-		err = arm_smccc_do_one_page(func_id, virt_to_phys(addr));
-		if (err)
-			return err;
-
-		addr += PAGE_SIZE;
 	}
 
 	return 0;
@@ -56,14 +40,16 @@ static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
 
 static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static const struct arm64_mem_crypt_ops pkvm_crypt_ops = {
@@ -90,7 +76,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	while (phys < end) {
 		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
 
-		WARN_ON_ONCE(arm_smccc_do_one_page(func_id, phys));
+		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
 		phys += PAGE_SIZE;
 	}
 
@@ -118,6 +104,8 @@ void __init pkvm_init_hyp_services(void)
 		return;
 
 	pkvm_granule = res.a0;
+	if (pkvm_granule > PAGE_SIZE)
+		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
 	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
-- 
2.56.1.809.ga0b61035b5-goog

