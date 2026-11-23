Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476411;
	b=2QD5JeSMx4tJt2/KTzU3VbEZekAQwZ8PFHOHo6jNf1SXVLwD8pXxyzUEkbkaCOK7bcgJ
	 nuQTKH7e27mFBbnMYWWCLGkAGiNTrDDTiwqXxVet0yKthcE4IdOVGs6PfwkApQSRYlJxH
	 hxc4uGeF6FUqzyNEykXVePtCgPhfaZzs4lBmZt4dq27rq2eHyau/F+QO8P9/QXzFy5co6
	 uYP7YeO+8eAAlVDR7gEtt7l9N9gcAVNs8x+i694tSBhm+OUZ9UOmR+fmlRrmpThXw4j7P
	 QnV9SUpCRroFLybYwreq8mLlO4XcBdGykebZWEvP7V49TXxxMj3g2T73200JPvCgusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WJVCNKr0SmGP9iVV1suMI71pk9j/vqJGLO6NxitJm1w=;
	b=0fQmlnk+tyxQObnsP8rLV+NkKfGEBOAcqifCEvEr1KIKGPoHoFKwybLvfk3xl4mj2DSC
	 gRvGYhl6F3kguBqPRNODHHf/Mfgyy0lU+LRpmRXWUMOgqqWr5FvWdX78qRGcJd/MV7ZnH
	 7beIkcZcIxt5xsJTDU2w4N1vVJlm1bxKRkdJ+YpDhGvO0B08ahq9j4+8zvkrVEeTsX2ig
	 yo1caesag2I+s7FRVhp18swIHPFfPxV3VomQ3bcXSR7ul2ifypgaR4NOFfWCVK8m6OVRp
	 VsHiYnlk53iSzpbj8YJBIcb0+vfR3s8k6y9l8qkj8KQeJL4G2YjcqQZsv0E1qBYB2BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mL7u1xxj;
	arc=none smtp.remote-ip=209.85.161.70
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F78606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F78606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mL7u1xxj
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-71b689a4226so868249eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795476410; x=1796081210; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJVCNKr0SmGP9iVV1suMI71pk9j/vqJGLO6NxitJm1w=;
        b=mL7u1xxjS/naCmzkGxkyCocm2ufAKG5Fnw9ZYCSwPP4xqxmzaDjuS993Tgmrstx4/Z
         KxoxFjiviw4QwAWLK2JL70pUKFAxhOmS97cUixyXiGaeFodr0kZmRvZ7QqJXVR178pl4
         zxC6JeMwpkgi/a3a3pUYvPJTxoJaJMGwMdoFD7psMdW1SH0M7UnGaIPj7BJg1phl1Yky
         c58ZJNVECUn4Wg5gEAX2+Exr0RCVX6gYe4Yb9zDU9k5IaMFwLdsqfCOX1K7Z5MTmfOej
         WCz89uxVm1w6eBD4X1zTyVNkpDOPv7a4ohBb1f9CJdeGMmIKyTC/74oPJ4DMxf5JhbrE
         XwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476410; x=1796081210;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJVCNKr0SmGP9iVV1suMI71pk9j/vqJGLO6NxitJm1w=;
        b=NnWUXDUKW9RbxZTLJqRkiFC01xrypgC3TQmfrHramnFpbMZYGJNBDsc7LHAybX0hUO
         CdSdotuRaGNcNLH3BNe7ibsLLGlCLojlGkAorlEsFP9kDebJLzCCxeNdDaQsnWMtLr16
         IwrX6PnTfWnTWqq5KrcAe1ZbG+W9lwB92DjHVgmY/T4F+m80OV82P6Rtiri8ukPZae/M
         6ImJAd40K7UH/YNGCRynjSXLQddP4uXPEsPM8KP2GM7FAJSI2aVeRQo8nUhxM9k0c/MZ
         u7ks9UGhYyJIIW40ys88y6rG2luc2HEjTH93jbYG1OU+DINet9I7D1sT3GvWGslgydu+
         a7gg==
X-Forwarded-Encrypted: i=1; AL+hErFbVHW2NCN3NCDnFsF16ArLdIA0SOiiG8aDpT8+9PkoZqnBhryRtoLPpbPmAseP9OmCWpv/xSCverPu2WY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BHqck1lOk7DbYW7s0RmEgEe0cvdlEnNlM0IMvZoAuY5eIC7bT
	HPrciuGC4meXY/8Bnbz1yKQEAqkaqFdiLay7ByC8lgmh4ozKmkXWofArrz6lIQYZVH9AZRM3ND1
	obIa5SlRGOeKzX08u1TEAG3ywGQ==
X-Received: from iohk21-n1.prod.google.com ([2002:a05:6602:a615:10b0:9e8:de6c:a5a3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1645:b0:567:c9d6:b2b2 with SMTP id 5614622812f47-57a0c3aa32emr13284763b6e.47.1795476409974;
 Mon, 23 Nov 2026 15:26:49 -0800 (PST)
Date: Mon, 23 Nov 2026 23:26:47 +0000
In-Reply-To: <20261123232647.3733149-1-coltonlewis@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123232647.3733149-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261123232647.3733149-3-coltonlewis@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: nv: Avoid duplicate guest stage-2 mapping entries
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

kvm_record_guest_s2_mapping() unconditionally inserts a new entry into
both guest_s2_mappings interval trees. Parallel stage-2 faults on the
same IPA or retries after -EAGAIN can therefore insert identical
entries for the same nested and canonical IPA range.

Check mmu->guest_s2_mappings under guest_s2_tracking_lock before
inserting, and free the new entry if an identical one is already
present.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/nested.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index d3a19b1db2144..18868e0d701c0 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -930,6 +930,30 @@ static unsigned long s2_mapping_to_nested_start(struct kvm_guest_s2_mapping *map
 	return mapping->nested.start & ~S2_MMU_IDX_MASK;
 }
 
+static bool guest_s2_mapping_exists(struct kvm_s2_mmu *mmu,
+				    struct kvm_guest_s2_mapping *mapping)
+{
+	struct interval_tree_node *node;
+
+	for (node = interval_tree_iter_first(&mmu->guest_s2_mappings,
+					     mapping->nested.start,
+					     mapping->nested.last);
+	     node;
+	     node = interval_tree_iter_next(node, mapping->nested.start,
+					    mapping->nested.last)) {
+		struct kvm_guest_s2_mapping *curr;
+
+		curr = container_of(node, struct kvm_guest_s2_mapping, nested);
+		if (curr->nested.start == mapping->nested.start &&
+		    curr->nested.last == mapping->nested.last &&
+		    curr->canonical.start == mapping->canonical.start &&
+		    curr->canonical.last == mapping->canonical.last)
+			return true;
+	}
+
+	return false;
+}
+
 void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 				 gpa_t nested_ipa, size_t map_size,
 				 struct kvm_guest_s2_mapping *mapping)
@@ -950,6 +974,11 @@ void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 	tag_s2_mapping_mmu(mapping, mmu);
 
 	guard(spinlock)(&kvm->arch.guest_s2_tracking_lock);
+	if (guest_s2_mapping_exists(mmu, mapping)) {
+		kfree(mapping);
+		return;
+	}
+
 	interval_tree_insert(&mapping->nested, &mmu->guest_s2_mappings);
 	interval_tree_insert(&mapping->canonical, &kvm->arch.mmu.guest_s2_mappings);
 }
-- 
2.56.1.839.g22a8290db9-goog

