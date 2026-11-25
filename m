Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584113;
	b=zXyfdpIjDsUyn2zE7O02NRInbcA66knNt2sIdWzH5ueex16WxSjVpqtiqILj16hIB/RJ
	 WWejprFcuKPgDyG0taaDODNPGxEo9Nsa9EMOxipTiLhYd+RTOptpqiVcGzi0jjKfrMWZN
	 QsSEUeuWWPrkDqtujhjuxEWtkGWMP1qRf1qGd8H7RJO24Yx958SyYD6d6TmBegBKRBpL6
	 rVIwSfk6VW/RZXoyTIuypbsc1eSI38ZfvxlYcx5UbumMw6SIqgPM+wxMVWtGxvQ/YcvYX
	 ZR446s6dv2nMMKy8Wr9H8jWrYOYM6ubq4/wQv6Btti557GR0faY0E8WlXo6rWa8QOcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584113;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=6RRPwyRDY3ZFd/1JP6q/vLcVe+jZU+U/2khQJLP8SlI=;
	b=tMw+Gp1OH3aRRarHX3CmUMrQvrh/kQ8xQx7xHoShSvdMA7hq63+k2MVRPEK2v+Q7hiGI
	 0kuBliDp6rGnrTgqtPOSqShqQMs3ySZsvbj91kt07k7FLfCTraTEgkBQ0U5JLaxeMLlbf
	 A7UP4ji5zuydSdyLpuMFsWCENlvHRfSqBPW1Z2PaIDTq4SDRyimSEbQBossUzjbpOm+LM
	 svq6Omxgv3Jplf9/Aw/eZrRQRJbi5wmU4CuOyYvuZz48OJSW46K49lpN9G2vG7xF/DXEC
	 drv7yLEOtk8+1P43qBd2wgX/FCQWsfqGJMWuY/HjKwigQfkh80bzxFJMgLTS3prm12g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EtQXrsMC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161A606A6A6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4161A606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EtQXrsMC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795584112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6RRPwyRDY3ZFd/1JP6q/vLcVe+jZU+U/2khQJLP8SlI=;
	b=EtQXrsMCsJlIqW97JNd2ySddObMf0cvWegmHShiy1jiLyV862gXIcVqdsoZNdOlpv8lir4
	JxlqY5JY1qMHp1PCDfAFFnikN5oqBMvwMPcu69AaPHUMEo/N7VDErVKyfWfizVkoi44KuA
	xsgWTeKXZ+zdLXiLjWUJ9ANNM6JrUWQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-xNV5kFW7NcuIU7zRyWCaiQ-1; Wed,
 25 Nov 2026 05:21:46 +0000
X-MC-Unique: xNV5kFW7NcuIU7zRyWCaiQ-1
X-Mimecast-MFC-AGG-ID: xNV5kFW7NcuIU7zRyWCaiQ_1795584105
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 429CE19560B4;
	Wed, 25 Nov 2026 05:21:45 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 499FE1956088;
	Wed, 25 Nov 2026 05:21:44 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	x86@kernel.org,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v4 3/5] KVM: x86: convert nested_guest_state into an atomic variable
Date: Wed, 25 Nov 2026 00:21:37 -0500
Message-ID: <20261125052139.362046-4-mlevitsk@redhat.com>
In-Reply-To: <20261125052139.362046-1-mlevitsk@redhat.com>
References: <20261125052139.362046-1-mlevitsk@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Convert nested_guest_state into an atomic variable, to prepare
to fix nested APICv delivery races.

No functional change expected.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/regs.h             | 7 ++++---
 arch/x86/kvm/x86.c              | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 226091feb44a..78fcc7fcece7 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -759,7 +759,7 @@ struct kvm_vcpu_arch {
 
 #define KVM_NESTED_IN_GUEST	BIT(8)
 	/* Non zero when the guest is executing a nested guest */
-	u16 nested_guest_state;
+	atomic_t nested_guest_state;
 
 #ifdef CONFIG_KVM_SMM
 #define SMM_MASK		BIT(0)
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index ec9d4a8fbe15..b36254db1b8f 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -457,13 +457,13 @@ static inline unsigned long kvm_get_effective_dr7(struct kvm_vcpu *vcpu)
 
 static inline void enter_guest_mode(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.nested_guest_state = KVM_NESTED_IN_GUEST;
+	atomic_set(&vcpu->arch.nested_guest_state, KVM_NESTED_IN_GUEST);
 	vcpu->stat.guest_mode = 1;
 }
 
 static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.nested_guest_state = 0;
+	atomic_set(&vcpu->arch.nested_guest_state, 0);
 
 	if (vcpu->arch.load_eoi_exitmap_pending) {
 		vcpu->arch.load_eoi_exitmap_pending = false;
@@ -475,7 +475,8 @@ static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
 
 static inline bool is_guest_mode(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.nested_guest_state & KVM_NESTED_IN_GUEST;
+	return atomic_read(&vcpu->arch.nested_guest_state) &
+			   KVM_NESTED_IN_GUEST;
 }
 
 static inline unsigned long kvm_get_segment_base(struct kvm_vcpu *vcpu, int seg)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0d8854bcbc4f..74c372906ac7 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9557,7 +9557,7 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 #ifdef CONFIG_KVM_SMM
 	vcpu->arch.smm_mode = 0;
 #endif
-	vcpu->arch.nested_guest_state = 0;
+	atomic_set(&vcpu->arch.nested_guest_state, 0);
 
 	vcpu->arch.smi_pending = 0;
 	vcpu->arch.smi_count = 0;
-- 
2.56.1

