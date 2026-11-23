Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456522;
	b=0W6Bg9gJZXkx1N17WA7zaVSDZi5b11Q1znI9sKYAHhpg4R621pUGyqdo5VnTdlQGzqfO
	 WMEzqXyYcAUuHF8YWvwl+9ZgvDxcLzJgLRiSBMFg+UrD6DcZadHlvlnGf7Xo4PO6Q1mna
	 +RbaBwRPHvJokqi0GvunrQUw98q9VAZ6Cu/VEIsylO0GbOQIcuo3a82G5m9/VdD5yPhl2
	 rT5zy+jTz7R1Cpd/fFKH4sUYjQeQxI4NojqKOMmcGeFAq1mvBbQmlaZ9qnXuDCOfp61D3
	 FOc9rOJiKp6zh6Zh5K3MatUbtotk+i0SO0h9DAdhpFhgwYc1qemcsZIrxffTvDjRAQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456522;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:Content-Type:MIME-Version:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=vLgFOuW+3fpp+Z/KRz7RQ6CiaNcfXmAoTsd+2oIgOoA=;
	b=Ms88yJgsIsM+pr7yyLiauFc0UyW9nvhGfsKQsmjULCs1n3eUtG9G/kyn1H5dNH9CJnGW
	 4Pt45yoayavuo/mRFERfmZK4j4UQXAWiF80Gw5MF3Dusl+cqDO/yd3rn7ZneboQjgiP+T
	 PV7r1WxLI8NFLFqv+xKd6Z6Xr1QFroQsMIndVRUds9vvrDqLCRLs/+3C0eba1qFAIvL/+
	 //aZLOoAps6/cjEn56T0aGBh6jQ5hQzAR6jZnEimCV3m2olpZGvHcbEHVjqTY020pAiNQ
	 eyMg6Q66dsCVnp9MlwdRXVF4bIMzk2bNooUsxjfes7krKEKj+Axhjjq/h3bD182HcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjUIFXlP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14137606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14137606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gjUIFXlP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795456520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vLgFOuW+3fpp+Z/KRz7RQ6CiaNcfXmAoTsd+2oIgOoA=;
	b=gjUIFXlPCPwpARTu2jgKIt29QAO1eCN3r0iyqErV5GqKipsBXxI+nsfw2gOG6i5rttcryJ
	Y8ul4lzXL1x0D5iGqC2oOZ6c+gzups71ehWCIwWfniniSHXIZrDMpql2T/Wsx3iIL7rkQl
	/M9kP75mnA4ezNNWN46xzwXh74kvkcE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-xbNwopUmMeuJFdqwl0y8Tw-1; Mon,
 23 Nov 2026 17:55:15 +0000
X-MC-Unique: xbNwopUmMeuJFdqwl0y8Tw-1
X-Mimecast-MFC-AGG-ID: xbNwopUmMeuJFdqwl0y8Tw_1795456514
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EE1618004F5;
	Mon, 23 Nov 2026 17:55:14 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92BC8421;
	Mon, 23 Nov 2026 17:55:13 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v3 0/5] KVM: nVMX: fix nested APICv emulation for windows guests
Date: Mon, 23 Nov 2026 12:55:07 -0500
Message-ID: <20261123175512.80438-1-mlevitsk@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

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
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (5):=0D
  KVM: nVMX: don't check PIR.ON when processing nested posted interrupts=0D
  KVM: x86: split vcpu->arch.hflags into nested_guest_mode and smm_mode=0D
  KVM: x86: convert nested_guest_state into an atomic variable=0D
  KVM: x86: nVMX: move nested APICv state to nested_guest_state=0D
  KVM: x86: nVMX: fix races in delivery of nested posted interrupts=0D
=0D
 arch/x86/include/asm/kvm_host.h | 22 +++++++----=0D
 arch/x86/kvm/regs.h             |  9 +++--=0D
 arch/x86/kvm/smm.c              |  8 ++--=0D
 arch/x86/kvm/smm.h              |  2 +-=0D
 arch/x86/kvm/vmx/nested.c       | 67 ++++++++++++++++++++++-----------=0D
 arch/x86/kvm/vmx/vmx.c          | 61 +++++++++++++++---------------=0D
 arch/x86/kvm/vmx/vmx.h          |  2 -=0D
 arch/x86/kvm/x86.c              | 11 +++---=0D
 8 files changed, 107 insertions(+), 75 deletions(-)=0D
=0D
-- =0D
2.56.1=0D
=0D

