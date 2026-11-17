Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950959;
	b=AOjkzkMzOXZvbnzvp3mHBG3Gi/1976PR32TSo9faS/CVS0zud+aANy3fc3OJyaKYgjki
	 retkoPYWQH9tQzQ2GvE0Uqi9/nrUTJuxVxvXwCmKxjoeDvgsifevAuGJB09LaC9OWCSn/
	 Hpz3s1MkXbT0jcw1n9Gxx5DD1r8Y7NvOglVke06c4Ytyduq1d3zml7X66bRVedRkFT5Ym
	 +8wmNFFZHbT49+tR3f2Xl3LD/UntfosAzVoIfQpSSDdTHn0pOrlUnGvcz83HNYEkW6XXA
	 1vGsyb3h7I15DppFhalOADiP9CYO2eOQypC0WHReiB7XEBnbBtcq7J7mo9D9KtxalFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WphzloPQaUB2SK64BZ8Vq9XA7Y4dmee73grGXDhb+2Y=;
	b=wbij9kVN3KUzZy4OuVZijdpFpGSCqVIJVh3tOpmHWwuNXSXEvGJUlwME2aaFJv1zN3ux
	 6Pxc8zL6xtbC2zL0sY4/ZYDcxVeMsSk/4SqS69fO+nFAvGbS/SaiTXUbkPCg65uJWKeZq
	 ohFAFe+Xp00LU318WItAgo9MvBFXPTajBiqD++VWNXHx9WtAA5tTU8IWGvljMJefMkSfv
	 48EgAwN3PMaA+9UdmRim8X1WxY5HgmP22Qu1k+8gWnJMtyaOtJBauRhrrZsYspVNLUMAU
	 8hwp3ImkrmWlnHhkjja5jfoqjs6odFeTuFIOpmuh2CUR0/SfKzz6MrTbh27S2Wu7nHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=niP99IO3;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4005E60A2607
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4005E60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=niP99IO3
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so2467565ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794950958; x=1795555758; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WphzloPQaUB2SK64BZ8Vq9XA7Y4dmee73grGXDhb+2Y=;
        b=niP99IO3V9pa3YBQ51sNf2lmdb5ZTqQyst4/bUd4Sjdm2QKHzUkenwz/3Csp6NuMTg
         Jb5isjYckJ6HYFGE6DQ3p+rB75C1mN2yQ4Cz/uO7EPV66bw4R3/ctJEt12J3to0572IS
         dlZyGi6HsnInKD4KNSSJ6KueEUpkkxImuhscYnJcYgyDU2EQZRPiV2I3URXONnjpVd4I
         eFTnBoRX7WZ6rz2vHJqSO1KZRBLBBqMrCywQFdl5KoFSy18j8cPNLPYoCC3vdxTrGZ4D
         Q21kH4vlh4fvuXmi1g4Be0zHnyBsRaoThHlQTVMM6QjaB2OONICookXyKmWjxKOwct3O
         t6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950958; x=1795555758;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WphzloPQaUB2SK64BZ8Vq9XA7Y4dmee73grGXDhb+2Y=;
        b=dTANuHLeRZ4808VB6zfgboYpQAP2zX1JBYc6l09rTFNIHFOwELZ0FSZ3XwaW2AutIy
         rCpGT6zM12G4m6YVLTuxx0MiqrmpbX0yYWR9J/NeykY/hXkjyVilUiKrOwNEa0f0tVKF
         7ya+jHfhW/qNWtZMwypDbZP67/BXTR6JjjX0js+uKgHfnsaGlBHpNzFAS9WVaxC3yAR5
         dIEfq9CPNPs9mnPDvw+6XFLYAK/6KD8vdi5D4NrQoJ7PSDUJS+8ph7CUE6uHIAap7Udt
         KVVDGy6gMcclcNPSJHAQn7M1lw7cU/shBNMb3VPOTweT7QE4mm41pIO7De5oUgAf3bRk
         FfSQ==
X-Forwarded-Encrypted: i=1; AL+hErEfP4ykaKmAiC19tr63upb4gwV0Xa2CE841EB+FJI7cxVLhGL2s0i7TD7E83+x7bw1I0v40h8CJIiK08tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oIv1582RI3bPrwvWlH1E4+cCGuNHErr3h0RE2G5oEVDSyuhJf
	4CdnsGt3sYXxtdbqgpHz2JyawzzpWGa9ILTf207UvS8+y5doLwE3RUZimUgcNRxaHqJ31ukvKg9
	Et9mBa5tsE86oj4QqYkdCLg==
X-Received: from plhe14.prod.google.com ([2002:a17:903:1ce:b0:2ed:de1d:fc13])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf4c:b0:2ef:effd:4606 with SMTP id d9443c01a7336-2eff70fcedamr5695715ad.2.1794950957476;
 Tue, 17 Nov 2026 13:29:17 -0800 (PST)
Date: Tue, 17 Nov 2026 21:29:13 +0000
In-Reply-To: <20261117212913.3634487-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117212913.3634487-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117212913.3634487-5-jthoughton@google.com>
Subject: [PATCH 4/4] KVM: selftests: Verify KVM doesn't reset unused dirty
 ring entries
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+55eaa971f4924b62c9a5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Before running the vCPU in the dirty ring test, mark the first two
(unused) entries of the ring as harvested and verify that
KVM_RESET_DIRTY_RINGS doesn't reset any entries, i.e. that KVM doesn't
advance reset_index beyond dirty_index.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/dirty_log_test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index 8189eaac713c..96a40488eccb 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -375,6 +375,21 @@ static void dirty_ring_collect_dirty_pages(struct kvm_vcpu *vcpu, int slot,
 		    "with collected (%u)", cleared, count);
 }
 
+static void dirty_ring_reset_unused_entries(struct kvm_vcpu *vcpu)
+{
+	struct kvm_dirty_gfn *dirty_gfns = vcpu_map_dirty_ring(vcpu);
+
+	/*
+	 * Mark unused entries as harvested, and verify KVM doesn't reset any
+	 * entries, as KVM hasn't pushed anything to the ring. KVM will
+	 * overwrite the flags when it pushes to the entries.
+	 */
+	dirty_gfn_set_collected(&dirty_gfns[0]);
+	dirty_gfn_set_collected(&dirty_gfns[1]);
+
+	TEST_ASSERT_EQ(kvm_vm_reset_dirty_ring(vcpu->vm), 0);
+}
+
 static void dirty_ring_after_vcpu_run(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
@@ -687,6 +702,9 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 
 	TEST_ASSERT_EQ(vcpu_stop, false);
 
+	if (host_log_mode == LOG_MODE_DIRTY_RING)
+		dirty_ring_reset_unused_entries(vcpu);
+
 	kvm_pthread_create(&vcpu_thread, NULL, vcpu_worker, vcpu);
 
 	for (iteration = 1; iteration <= p->iterations; iteration++) {
-- 
2.56.1.708.g77570a6a1d-goog

