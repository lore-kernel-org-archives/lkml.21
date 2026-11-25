Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622310;
	b=qwyMdhd3fLe1py/jZ5P43Q6CBgVLqwo1xRQfrnHIPCHE51NbOPybvilMKUC7ke4gfIzN
	 573KItnYlzdNJQz4tnX/FITK0yLkeBEi18gYY80WRxQvuQVLIJqolsqEPqTPu2KXCyK9o
	 wqVHoa3NGkpTssVTkVuP0QvdPaMtVUWyzi4DJZfEiCiAk7dvUd6K7dDEAVUSBgocI90mi
	 M64oJBnw3DVJsHQN6YmsUTjvODu6TBmH7Ci+FU+50MQnPxWUiscs6AKVqGON/yjElLtCY
	 Dc1cU47mBXEU7uMSCYesclIF729ViUd3zN+ruyX2zmUWl8YI3/+qlmdXwIpZ3J27weQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622310;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ZuFdpd/9bFTvhmX4/6tvbnSZs7CHjbof44sJaDsyJ2k=;
	b=tJ0kPRykWHVzGtWsT77tL8CWuzAGDgvHdc5fVzRMdYlKa0hrqeixQK6RV1NzOLV3oZNJ
	 aBh0HSkPaWCGrqv8ZhgTZqX2tXfZye0t9se8Qe8JLHRLT61kiDQ9+sQcKRU42N/HAaWEi
	 F3WP9tHexk0F/xKBA2s+4TaYj6/Yle8+H0Ad3AYo3dgaV0ESU+wj6tGzKpwnxmHpr/anr
	 0atqmm27KInvKh/Gwh3z7nBc+Z08AdSOqRddTV2VxvJLbiK7TS/cZtp0y9IeqsD8vXYen
	 LXSn332Fe76BWg/BzsHR3fnAv85z2WCeZPUEiLijEVXwWHJg9YEg28XYMfTTSt/6Q5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UrykbZ3E;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7A606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B7A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UrykbZ3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795622308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuFdpd/9bFTvhmX4/6tvbnSZs7CHjbof44sJaDsyJ2k=;
	b=UrykbZ3ECOi9prJdb6yyMzg/9b0l+eBP9DraUCYwB2iRWLtftygYxRX8VbNpgheBPKdTRc
	fr1n3eRtOPBHkLOevhxOs444UxzburTaQAcIUQjkhaP8DuC4P0R3xGeFAJRgMS4WcjnfPS
	nCRBOKU41kWKadHp/20+d47sK6ibpuQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-_WCABvs_Od6etVJqPdVOTg-1; Wed,
 25 Nov 2026 15:58:23 +0000
X-MC-Unique: _WCABvs_Od6etVJqPdVOTg-1
X-Mimecast-MFC-AGG-ID: _WCABvs_Od6etVJqPdVOTg_1795622302
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 07F791800618;
	Wed, 25 Nov 2026 15:58:22 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0CA753001DB3;
	Wed, 25 Nov 2026 15:58:20 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v5 1/5] KVM: nVMX: don't check PID.ON when processing nested posted interrupts
Date: Wed, 25 Nov 2026 10:58:15 -0500
Message-ID: <20261125155819.408795-2-mlevitsk@redhat.com>
In-Reply-To: <20261125155819.408795-1-mlevitsk@redhat.com>
References: <20261125155819.408795-1-mlevitsk@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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

