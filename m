Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584110;
	b=o1EqLWEB8a3hZ8elPl3AcZDgrQGpywqqm1w56jUCtWRzRAYznTRGF/O1rqTpnJB0w4ED
	 SOhhSbYEtQnCmp60JqSLepWwG7MzBgPDozgg9ZLDYNzQgOmLeZ2CmAzqN3aJ02thzJC1t
	 OJHO+wq7Ezd/qhBNMY5M8XBACFe9//6uHwOreWcCNZ/6WUCICV7IXYSNZTUl1sq408TAc
	 3wrWiaN2YslvB2ezxIGAh+zp93d2QOvy8wWtad8qpSePAQSjf+QWvO23hPLWCmfcF8cny
	 icjDHqNsrRcKGzRhH0hguK/Okt/H57U3U7Djz+ZdMoOyF6LrTJF4d517skypQSUNukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584110;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:Content-Type:MIME-Version:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=3TMTiM4NpnbsQQ/yUXTAeoD0HMT0I+KEeRosmIFH5Go=;
	b=ZxOMyj43UCzZHKvmds88NuM91DueUsajj+RNHgrZ66FGf/9keyGGWBgP3uG8h/idmpsf
	 aVWS0FfSEeoStLu9j9s+oNALkArKQVBxr4JyrbVU7YChijxbItUz66FuQ2nYPQQ7s2qaD
	 bIEp48s9t/9+LOVNBxF/SV2fjKOri89e34KL+scK/T1JE6ntA81bXI992ewf78hITnZYW
	 CjfQk0ONfE1FRqzp1zOIqzTxK8szKXqRkYUygnwyGPfnlUU1jA7H1D0Smr5o1mqIvPErw
	 A9Hetv5Yx8f23Zh0jYstUJocImX153QsrTmxKa59cuSiOi6ErrrM+V3VekRAsrqMklQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RAr8BiUo;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED4A606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED4A606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RAr8BiUo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795584109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3TMTiM4NpnbsQQ/yUXTAeoD0HMT0I+KEeRosmIFH5Go=;
	b=RAr8BiUo0Dw99PBc7A4KoKO+221PCdY+IaYV9dTIIXxh5ullP16IYO40w7kBn1kZDAQ76h
	XEBf/5wNud7icUXSAbwYqXPc0D1ujcEqil0KW4ldhFkSLjxXU+EqRDZDn+W2Jxx7KE1ngE
	+edIlRrMXuaMndHdKcY4r4gOcxEeWpg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581--FaJcU6JOeC6jfE_aePHRw-1; Wed,
 25 Nov 2026 05:21:42 +0000
X-MC-Unique: -FaJcU6JOeC6jfE_aePHRw-1
X-Mimecast-MFC-AGG-ID: -FaJcU6JOeC6jfE_aePHRw_1795584101
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9ACF5197758B;
	Wed, 25 Nov 2026 05:21:41 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74C1E1956088;
	Wed, 25 Nov 2026 05:21:40 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	x86@kernel.org,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v4 0/5] KVM: nVMX: fix nested APICv emulation for windows guests
Date: Wed, 25 Nov 2026 00:21:34 -0500
Message-ID: <20261125052139.362046-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Fix two problems that were recently discovered that cause nested APICv=0D
to malfunction on windows with hyperv enabled.=0D
=0D
The first problem is that unlike KVM, windows doesn't set PIR.ON when=0D
sending posted interrupts. X86 spec actually allows this.=0D
=0D
The second problem is that unlilke KVM, which mostly ignores them,=0D
windows depends on accurate delivery of the posted notification=0D
interrupts, and currently it is possible for a posted notification=0D
to get lost it it arrives at the same time as the nested VM exit.=0D
=0D
V2: to avoid spurious notification in L1, process the posted=0D
notification in L2, just before VM exit.=0D
=0D
V3: rework the patch series following the pseudocode that Paolo suggested=0D
(Thanks!!)=0D
=0D
V4: random fixes, including sashiko feedback.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (5):=0D
  KVM: nVMX: don't check PID.ON when processing nested posted interrupts=0D
  KVM: x86: split vcpu->arch.hflags into nested_guest_state and smm_mode=0D
  KVM: x86: convert nested_guest_state into an atomic variable=0D
  KVM: x86: nVMX: move nested APICv state to nested_guest_state=0D
  KVM: x86: nVMX: fix races in delivery of nested posted interrupts=0D
=0D
 arch/x86/include/asm/kvm_host.h | 21 +++++---=0D
 arch/x86/kvm/regs.h             | 10 ++--=0D
 arch/x86/kvm/smm.c              |  8 +--=0D
 arch/x86/kvm/smm.h              |  2 +-=0D
 arch/x86/kvm/vmx/nested.c       | 93 +++++++++++++++++++++++----------=0D
 arch/x86/kvm/vmx/vmx.c          | 61 +++++++++++----------=0D
 arch/x86/kvm/vmx/vmx.h          |  2 -=0D
 arch/x86/kvm/x86.c              | 13 +++--=0D
 8 files changed, 127 insertions(+), 83 deletions(-)=0D
=0D
-- =0D
2.56.1=0D
=0D

