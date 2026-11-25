Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584108;
	b=3tPKn3HLlEEtcU+DAd/83Iqgw4jIPrcrcONrAyqfB5LUpLc8qjoQcb8fe3cfnukYwLwo
	 fgOIbCe1BC8gxPtS2+0tJLEZWutZe+TmiuO6VRWLbqIhdKG0bHwZFJYof1e23YstYk4Qk
	 RChuU8LE7r2Z93Glll9vMoSpxlINC1UulrvmOdiOI7BhRsBRWxLGhge6MTGbBjiYxt3Uq
	 GZWIjyrs0PTV7MZZ3E2ItdgqooH36YeSa7I+EU5xUd9NMApT10PvgnAIvze8hrktHFQOn
	 uOhUnACMyTsOnVQMntIx6VhZs2QE6f/ApSCz4Rx180hRdz39vd1ZIus95M0u21CnL5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584108;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ZuFdpd/9bFTvhmX4/6tvbnSZs7CHjbof44sJaDsyJ2k=;
	b=u5AJVOb7FI7vx673wtQ8s2Rl9bNBt9bn3g7Ej+NQtLTcPjHO9V/hqOqtyieO1GIPNWy2
	 8h3YoXcY36sEDIz3y2v0mUM4M2lBt+wXdtPWqphDw+8Ld0Py0qIpHYla+7d36Pasyc+uE
	 JSGWTKZSSOPGeJswxGEQhRR09C2hM/j+64umbH5tPuN67jnxoIEQRoWzNBP9rvbapZSIA
	 huDL2s8zU75A8Z7aKlA+MOPktEDpoCvEYwa7qk4DhuGne/+iy6JonrunSpWkOQEr+KNZe
	 1qb0zso63a5Zk3El7a1LGK9I4QDMzbjwUFTLYMK+w0QSPZfWg0SoVX0PYxzozbCJBeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FZSrcwPE;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F010C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F010C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FZSrcwPE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795584106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuFdpd/9bFTvhmX4/6tvbnSZs7CHjbof44sJaDsyJ2k=;
	b=FZSrcwPEL7HBN4YJBU0sAnM97/0rD6/GteFawYxvNF3BrWjOx4fHOyucF0JIN/h498LeK2
	vDWOVVOrY3DovaKZ72QRe4i8Ag6LFRg6NxYBE2Ljvv77dRfRtm3XdDlkRKCxMR2dy4Doic
	vmBNBTTxSkX+58+aAjY9MwWR4hvnaXQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-RoKtLYLxMe2WxsHnceJEYw-1; Wed,
 25 Nov 2026 05:21:44 +0000
X-MC-Unique: RoKtLYLxMe2WxsHnceJEYw-1
X-Mimecast-MFC-AGG-ID: RoKtLYLxMe2WxsHnceJEYw_1795584103
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4F77195D002;
	Wed, 25 Nov 2026 05:21:42 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D55241956088;
	Wed, 25 Nov 2026 05:21:41 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	x86@kernel.org,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v4 1/5] KVM: nVMX: don't check PID.ON when processing nested posted interrupts
Date: Wed, 25 Nov 2026 00:21:35 -0500
Message-ID: <20261125052139.362046-2-mlevitsk@redhat.com>
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

Despite the suggestion to test and set the PID.ON and avoid sending
a posted interrupt if it is already set, there is no requirement
for this bit to be set for posted interrupt processing to happen
when the target CPU receives the posted notification vector.

See section 30.6 POSTED-INTERRUPT PROCESSING:

   "The processor clears the outstanding-notification bit in
    the posted-interrupt descriptor. This is done atomically so as to leave
    the remainder of the descriptor unmodified
    (e.g., with a locked AND operation)."

Apparently Windows' implementation of APICv does exactly this:
it sets bits in PIR, without bothering to also set the PID.ON.

Fixes: 705699a13994 ("KVM: nVMX: Enable nested posted interrupt processing")

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/vmx/nested.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 151873407abd..bff719dce07d 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4041,8 +4041,16 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
 
 	vmx->nested.pi_pending = false;
 
-	if (!pi_test_and_clear_on(vmx->nested.pi_desc))
-		return 0;
+	/*
+	 * Don't test the value of PID.ON.
+	 * It is valid to trigger a posted interrupt without setting this bit
+	 */
+	pi_clear_on(vmx->nested.pi_desc);
+
+	/* Ensure that guest sees the change to PID.ON before KVM harvest
+	 * the PIR
+	 */
+	smp_mb__after_atomic();
 
 	max_irr = pi_find_highest_vector(vmx->nested.pi_desc);
 	if (max_irr > 0) {
@@ -4209,8 +4217,7 @@ static bool vmx_has_nested_events(struct kvm_vcpu *vcpu, bool for_injection)
 	if ((max_irr & 0xf0) > (vppr & 0xf0))
 		return true;
 
-	if (vmx->nested.pi_pending && vmx->nested.pi_desc &&
-	    pi_test_on(vmx->nested.pi_desc)) {
+	if (vmx->nested.pi_pending && vmx->nested.pi_desc) {
 		max_irr = pi_find_highest_vector(vmx->nested.pi_desc);
 		if (max_irr > 0 && (max_irr & 0xf0) > (vppr & 0xf0))
 			return true;
-- 
2.56.1

