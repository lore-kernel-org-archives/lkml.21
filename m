Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941973;
	b=v+AINtrX70nnMQDTQTkMxV2x6olthp9LhBVB1AFswi2prEBI/xikX2g7v3b2L+hYgpOp
	 2SXv55lBzERUWYep3kkzcCr1DjfORkkTQaVb2KmP/WIQWK4YpNhzwJ4lYaRlPadtZa1j3
	 MSYqgmyCDBZdJ6fTBXc+wIf9FzED7SZzIqbZaL1c2y8pUSAgud0Gr0LtCP+JPv64MQuDV
	 nb8ckIbqvawv8a0UMYzRdE6XHUDrJhIbnDFyPKan1020fH+tRPWUaM2WSO/9CD5KXOdQb
	 ERZ14LbIdJl9KkYKNVB7C1kvha92gjpbKCwamDD424Dqf8i0ao1tfOvJUdVIjGBctGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941973;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=kUIRrOyVQBuEg1TQbMeXEdWhbbHNohGKlJQkYvjkyFc=;
	b=pczXXQU7OPjvSdEnUg4AzLWMWkStWykRovggmI2xzRlXXj7/tRKxyhmYTd9zby24juQl
	 Tk4Qh3ESljafyRDKMR851/AljsnL7YOnV+SD92pNuFU+q9pD1GtS/pQPQ9EXfJtfTnh9Z
	 L5CZXr0pPIP3gNhSLkiDMUqYye8eYho7H6cr4Qm4V3siO5lhYphh7wGvxWT0RQvPiAgB+
	 qChPz5spOwZyC5knAlDVidbunqh2+pNalA33EBpFVClrLIDSRPX81nJFNKyfOi3pS+hZ8
	 XqgWDTFE03Dtg/m07RKIiF0hy4VAmoeExQggu5FD8D2Xa1XLsTLNveezH1iT02CN1xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="P9u/J/iO";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E86606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E86606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P9u/J/iO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794941971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kUIRrOyVQBuEg1TQbMeXEdWhbbHNohGKlJQkYvjkyFc=;
	b=P9u/J/iOrCYgt6slWJ6w+tJP8jAuUcPkR52gTaZmEcpU4xTvvEsUfiPUVP0BD3lgvKLb9q
	ymJnKRlcLXNkPM7ziK5htq9nz7HMupT5wv4uUOn6ZDgI4gBlkktAgqYNmanrD+auhaQUn5
	4Oda1BczQ+rYLfXaMC7Uy+bGaGQp8EE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-ZxyyJxPwOGm3PRZUR8-wzw-1; Tue,
 17 Nov 2026 13:59:26 -0500
X-MC-Unique: ZxyyJxPwOGm3PRZUR8-wzw-1
X-Mimecast-MFC-AGG-ID: ZxyyJxPwOGm3PRZUR8-wzw_1794941965
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E05C195604C;
	Tue, 17 Nov 2026 18:59:25 +0000 (UTC)
Received: from pbonzini-thinkpadx1carbon6th.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6DA6589;
	Tue, 17 Nov 2026 18:59:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] KVM: SEV: never retry after #NPF on paging structures
Date: Tue, 17 Nov 2026 19:59:22 +0100
Message-ID: <20261117185922.466255-1-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

KVM cannot walk the encrypted page tables of SEV guests, so there is
no point in emulating the instruction if the #NPF fault was caused by
either data or code.  In the latter case the instruction buffer is going
to be empty, so emulation was avoided by resuming the guest, but in the
data case KVM attempted emulation which is pointless.

Apply the existing check for PFERR_GUEST_PAGE_MASK even if the instruction
buffer was filled.

Reported-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/svm/svm.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index af0deb198a84..4f42da3642b6 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5513,19 +5513,29 @@ static int svm_check_emulate_instruction(struct kvm_vcpu *vcpu, int emul_type,
 	}
 
 	/*
-	 * Emulate for SEV guests if the insn buffer is not empty.  The buffer
-	 * will be empty if the DecodeAssist microcode cannot fetch bytes for
-	 * the faulting instruction because the code fetch itself faulted, e.g.
-	 * the guest attempted to fetch from emulated MMIO or a guest page
-	 * table used to translate CS:RIP resides in emulated MMIO.
+	 * Under SEV, page tables are encrypted and cannot be read by the
+	 * hypervisor, so there is no way to resolve a fault on page tables.
 	 */
+	error_code = svm->vmcb->control.exit_info_1;
+	if (error_code & PFERR_GUEST_PAGE_MASK)
+		goto resume_guest;
+
 	if (likely(insn_len))
 		return X86EMUL_CONTINUE;
 
 	/*
-	 * Detect and workaround Errata 1096 Fam_17h_00_0Fh.
+	 * The insn buffer was empty; the DecodeAssist microcode could not fetch
+	 * bytes for the faulting instruction because the code fetch itself faulted,
+	 * e.g. the guest attempted to fetch from emulated MMIO or a guest page
+	 * table used to translate CS:RIP resides in emulated MMIO.
 	 *
-	 * Errata:
+	 * A data fault instead could be Errata 1096 Fam_17h_00_0Fh, so only
+	 * retry for a fetch fault and otherwise try to workaround it.
+	 */
+	if (error_code & PFERR_FETCH_MASK)
+		goto resume_guest;
+
+	/*
 	 * When CPU raises #NPF on guest data access and vCPU CR4.SMAP=1, it is
 	 * possible that CPU microcode implementing DecodeAssist will fail to
 	 * read guest memory at CS:RIP and vmcb.GuestIntrBytes will incorrectly
@@ -5552,12 +5562,8 @@ static int svm_check_emulate_instruction(struct kvm_vcpu *vcpu, int emul_type,
 	 *       retrieve the instruction bytes is legitimate (see abvoe).
 	 *
 	 * In addition, don't apply the erratum workaround if the #NPF occurred
-	 * while translating guest page tables (see below).
+	 * while translating guest page tables (see above).
 	 */
-	error_code = svm->vmcb->control.exit_info_1;
-	if (error_code & (PFERR_GUEST_PAGE_MASK | PFERR_FETCH_MASK))
-		goto resume_guest;
-
 	smep = kvm_is_cr4_bit_set(vcpu, X86_CR4_SMEP);
 	smap = kvm_is_cr4_bit_set(vcpu, X86_CR4_SMAP);
 	is_user = svm_get_cpl(vcpu) == 3;
-- 
2.56.0

