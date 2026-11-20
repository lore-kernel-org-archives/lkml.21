Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181660;
	b=fnhdYkK73LdJEcO0kQ6qgOLayH50KaL54Ve/LVE+T0QIcZ9oIrHEDNFbs/OY6cCSKwyX
	 J49Kb9bxc1Z1S7RTOf0vYyLDD2Leu4MJQwQZV3hQwl+q5rsJumr1Gu2G7bGgciOVM6TCv
	 fZ4OpHxD/O84O5eB/7r6wH2eZu8Jg3NafsoKS7UlldGcb+vRiWPQ6GhzCtqMLuEAolLS6
	 b0dj9vEImxJJCwZOyc0or+he265TR5h9WJRXm3I80QM0eP4YDtAbq7u8SSuB5iROkxmXU
	 Hw9P46xi1pXdp5x9cAlGlUnALxDNfPdvj0kQEk9ZfWUn+x9Fpl9ioPd9/Tyv4coLZPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181660;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=zA6NzYJgjQLA40YOpIFdm9mYKUOMSfZ7Wlt9Ruo4O3M=;
	b=5oh2jsqwM04jFzaS6AQX7lLp7OrO03cgx5KMWGPoBiLVbei18c5OWDMPRbmaOnSev7Y1
	 CYkpVNyKqNzuDIm0qKDR3hNNyha/KC27+sIucCg4l33Ep2PtYcX/Fn2uXOhAobDezSmz/
	 Xpkdmfzn52C/dkloVEmJooaZTGd6AYMXeTB48WistBDFGsz/HEZLdcNDOzvENziM//tiw
	 h5XHiKL+5UguEaCPBJqOftMozB7DfhUdnogKgGsih4PsKLwCmqBIyEWEUMCa4DaiGYj2j
	 iX0qVHcSPJhrppjxJwbWR45h1WP0ucUcTQWVWH6WaS0NpX5OdWqIaeGLxbLpz41A8SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BbsOnjUd;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB62606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB62606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BbsOnjUd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795181658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zA6NzYJgjQLA40YOpIFdm9mYKUOMSfZ7Wlt9Ruo4O3M=;
	b=BbsOnjUd0qpfRwV5PQMeprDEX7dRAXGKW2RnprmcMquzcun673qhzFBxEPq02tn2FTUFZD
	L/P8c/1JVYMHxqj3SvCmb5R1EM7nLPOlc3gNw7jRfeAsw+sKmmuTMUv7uIpr0iytlT4GHS
	FJt1Ca+wP+/dIzOJx6mJVdgjzoGaWLg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-xjiZjUFhMKu9MFfS94h-Jw-1; Fri,
 20 Nov 2026 13:34:17 +0000
X-MC-Unique: xjiZjUFhMKu9MFfS94h-Jw-1
X-Mimecast-MFC-AGG-ID: xjiZjUFhMKu9MFfS94h-Jw_1795181656
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E10A18002CC;
	Fri, 20 Nov 2026 13:34:16 +0000 (UTC)
Received: from pbonzini-thinkpadx1carbon6th.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4DBAB1956062;
	Fri, 20 Nov 2026 13:34:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH] KVM: PPC: remove unnecessary #ifdef
Date: Fri, 20 Nov 2026 14:34:13 +0100
Message-ID: <20261120133413.475489-1-pbonzini@redhat.com>
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

booke.o is only built as part of kvm-e500-objs (which is conditional
on $(CONFIG_KVM_E500V2)) or kvm-e500mc-objs (likewise conditional
on $(CONFIG_KVM_E500MC)).  Thus, the #ifdef in kvmppc_core_check_requests
is always true.  Remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/booke.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index fd7f24a68b31..ba762ac1fb56 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -738,10 +738,8 @@ int kvmppc_core_check_requests(struct kvm_vcpu *vcpu)
 
 	if (kvm_check_request(KVM_REQ_PENDING_TIMER, vcpu))
 		update_timer_ints(vcpu);
-#if defined(CONFIG_KVM_E500V2) || defined(CONFIG_KVM_E500MC)
 	if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
 		kvmppc_core_flush_tlb(vcpu);
-#endif
 
 	if (kvm_check_request(KVM_REQ_WATCHDOG, vcpu)) {
 		vcpu->run->exit_reason = KVM_EXIT_WATCHDOG;
-- 
2.56.0

