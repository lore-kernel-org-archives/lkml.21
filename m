Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622309;
	b=Hq4vGJA9GGL0hpGw2BQmP3SxgG8oDo75qNkbAdGlJsaB+fydhkJjfldcf3MwJKRzN/l1
	 O6rAxMQhab1eMR64JlO1W/wmyi4KolivbLMXHOmFx2sOv784UaC3k/AvEHYnm4WK9k1fN
	 q4VJeqU4d94zbYGnDBAXA3a8/tfEvIOUWXyLD8P2Tlv9pU6ldfoPZ970DRAEjt02l3TLS
	 zW876CIjj7HWNm8Ci/w7hHPh2wEt4qGPmAEksCpSowgc4CZwOh7pIq/ULIOSS9BHtER5v
	 r3hbmsl+9kLQcQIyUU+WS4YwAXIfWY9/q4DZ7BuFV7Tvo3rQZ+n9ScuhJkT0h1F5TsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622309;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:Content-Type:MIME-Version:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=yD0gu8R4+vVDBYdkAawG2ViI1zHHMt4je2+PNBeDkw4=;
	b=F1pJmcyalpZiqya+l1fYiswVGuAWgG5Gn/t/+bGgXGpXMbX1Fa7jz5AbmEfoCSXXoRNT
	 iZFdiLQ/61MyVXELfaIJEsFPOLIamOg+WwqbPH2ZitTSt7aDtPLQJyOWkfiaR4c8p1XEt
	 gJPSfZ5hS6xGhIaRpph4+oxh3DU0GjX90by6i5/up3aT8S6EfC3Xp/q9pYpg3pjVFiZuj
	 0AotSEhkjbrVsNqbGnU/EnbmLrYBFH32Pu0k7NfV/ZZiBYUy6uHwTXMKxMttS/DgH/8I3
	 78oLVVyngXb5h2syYS68Svohk+13Go7QLHQQkW48P2quD0z2Ybu4pJE8Qyvsg4uipDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCIrRzto;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E1F606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E1F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XCIrRzto
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795622305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yD0gu8R4+vVDBYdkAawG2ViI1zHHMt4je2+PNBeDkw4=;
	b=XCIrRztoVLLYOUbwHpRFHhamW+t1C9I8AvZN/dQFEOUAj/orxA11tKnV+qTeYBvxyxR5us
	g680mjLosfyKwzgMc8x4wmkU5xWiBx9u09h0599UlpnEsupiMwCvcnYHFzlcn5D2G2zy9B
	Nts0h4XKRhErAvMDriObkOMHl4v16BE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534--TIcZJzVNICrQ0Ct3443AQ-1; Wed,
 25 Nov 2026 15:58:22 +0000
X-MC-Unique: -TIcZJzVNICrQ0Ct3443AQ-1
X-Mimecast-MFC-AGG-ID: -TIcZJzVNICrQ0Ct3443AQ_1795622300
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD3211956064;
	Wed, 25 Nov 2026 15:58:20 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBAF83001DB3;
	Wed, 25 Nov 2026 15:58:19 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v5 0/5] KVM: nVMX: fix nested APICv emulation for windows guests
Date: Wed, 25 Nov 2026 10:58:14 -0500
Message-ID: <20261125155819.408795-1-mlevitsk@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

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
V5: restore defered error handling on PID map failure.=0D
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

