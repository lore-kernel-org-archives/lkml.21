Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950957;
	b=3k70aI97XMY9BJGidxUO2ZnDQ61Po81W1Dil8vZCx74tAbJ/LbPprxUmnQbYz2YMuWRQ
	 uKf+URRLVGUM08yXiSUhLFnL0Xtn7mB2b33DgWlpJzZFKujAusH8UEqg3UWzee1p9gzrs
	 pRzf3ey7ErW/9PT1pyckSPV5f4kzABRRDCOg+ja6WPUigVck8uBQVoSBEowCjhdlvbhFu
	 lxHmxXdIxfiR90DbuioVomYtLeEvL45hMOR9yxEuFA68BZoQp7ZG21o1i2+d45NJBZVPr
	 xuGKpyqHYRCGpC87UksszPsYWydm7SmIP2SkU6bWiYCiHIfFkXE6A2+3/DywlHJdjnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zWlQqUwi5cRUhimzfNf8t4SG6tEbfWvm0hnj+kSTHoM=;
	b=Gk/99BWHJBNpb+xDGtMZJNg2KiTPsGLkIMcVKl1Fja4hi0CL9xV3UTPrinXy5rgFaFYU
	 RMX8WYvhvCehfDldJ3JIkMKH0IDNs9hze1oGGAQ/4W/eWIkojYeee0BhHJJNfID4pX7XJ
	 iiWXCY7NcBNYvneYkZlWHdL+ndz1yucPxQhqLKILwBI7NEMK0/ujGnUE5i5hw6yMB3NMY
	 cydvwtNe/DP5xczBWETo5WL7xOQkU1JVSo5umheKXykHCXR2PrtVOcSok0KQkH9iqpwF9
	 RvSipwLGsnY68hjZuy2gn3a+TxI7+z0BEKfUYiOJSil45UsqzaSGxnbu6HNMxaUH54A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HUCU3INR;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E8D606A89C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E8D606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HUCU3INR
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso180185a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794950957; x=1795555757; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWlQqUwi5cRUhimzfNf8t4SG6tEbfWvm0hnj+kSTHoM=;
        b=HUCU3INRxIAI+4WUx3TTwhnKFu5FpEfXccmNSVz/MqR3VAc+7aaG0q7nPHxFIyQNI9
         qAmxJ3BO82+/70j7DltLfOF2cfbCWyzXjT/PoLXJo1+TkiFpRx5uQsd0OYQ0B5ax4n4t
         EANqISDc9+42zM52/KYQdcGMJKHyPHIuHSv1kAMiTf5tAqbEUxv2Xu/yDp/myOWlQ6/m
         cVa32K0NG3DruooAXdjUV1JB3lIOyjdQoDWUMEChp+kpflnp8kcmtVIKCJ+eWijj+qPh
         BGoSji9qXdX+zNdHbMnfDgX5K3fx+iiMbVuCRQ8wHEujdjjtu3CzpkxDeLweSo97P80Y
         uy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950957; x=1795555757;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWlQqUwi5cRUhimzfNf8t4SG6tEbfWvm0hnj+kSTHoM=;
        b=yuMWrIXxLWII/W/LMhJX5KcYlH6ok9mxf3I7br8iTLW+oZDIYPTM8Emsdezgit3gux
         61x8KETLUx9gslDkJhQc9XkHZr4wOsCmm0+iXozeaKlYJdttHnf9kGA95Uzso9wg+JSJ
         ELPtDDtLhTbg62r1Px3J0AyIz17qxKdSJQLbXmPWtkWNLsqNUsNxGAALXaAJ5TyQtkZ/
         MuQf62mD2ZCv+mULQVfWwgSCHs6YpGpAvjFeEYb74iWEZgW4yRGYcT/sWk0/KlRWGWDU
         yBYagBDs/9rYjPV2pntDYgd8NLghUCt+U9tvc8uUbK6LbGW666GxKrOq4lEdUdUHH7Al
         Xg3A==
X-Forwarded-Encrypted: i=1; AL+hErFLB7+PxGlnVc/RX1o0UK/9O688q+/gfLZlYyMpdxWOOw9f05fXZM0dbuKTzElMOUQBUXpyEuRfm0aX30M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PGIz3EFJLKSeXu/6tWZJQ0SDxNEgLPiB7uD96bdVK9EsvgXdC
	qWhc80z5GLRRq04K7hT7xvhvaZq0bZ/LetR5dVvQPA4HfvwlYF5ZJ6kKUOIjhJg0/23GfLphs0E
	XGCjvHYRhQ0NByF2TJBOqsA==
X-Received: from pgjg20.prod.google.com ([2002:a05:6a02:8154:b0:cc7:52da:b682])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3e81:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b3d07631c8mr575388a91.16.1794950956600;
 Tue, 17 Nov 2026 13:29:16 -0800 (PST)
Date: Tue, 17 Nov 2026 21:29:12 +0000
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
Message-ID: <20261117212913.3634487-4-jthoughton@google.com>
Subject: [PATCH 3/4] KVM: Annotate concurrent accesses to dirty ring indices
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+55eaa971f4924b62c9a5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

A vCPU's dirty ring indices are accessed concurrently by two tasks: the
vCPU pushes entries and updates dirty_index, while KVM_RESET_DIRTY_RINGS
updates reset_index, and can run at any time (VMMs commonly reap the ring
from a separate thread while the vCPU is running).

Use WRITE_ONCE() to update reset_index, which the vCPU reads with
READ_ONCE() in kvm_dirty_ring_used(). KCSAN doesn't assume that a plain
read-modify-write is atomic, so it can report the increment as a data
race.

Use READ_ONCE() to read the other task's index in the kvm_dirty_ring_push
and kvm_dirty_ring_reset tracepoints, so that the compiler can't tear or
refetch the loads. The values are only used for tracing, but the
indices are part of the ring's concurrency design, so mark the reads the
same way as kvm_dirty_ring_used().

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/trace/events/kvm.h | 4 ++--
 virt/kvm/dirty_ring.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 07013f88e655..477a9d3705ed 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -316,7 +316,7 @@ TRACE_EVENT(kvm_dirty_ring_push,
 	TP_fast_assign(
 		__entry->index          = ring->index;
 		__entry->dirty_index    = ring->dirty_index;
-		__entry->reset_index    = ring->reset_index;
+		__entry->reset_index    = READ_ONCE(ring->reset_index);
 		__entry->slot           = slot;
 		__entry->offset         = offset;
 	),
@@ -340,7 +340,7 @@ TRACE_EVENT(kvm_dirty_ring_reset,
 
 	TP_fast_assign(
 		__entry->index          = ring->index;
-		__entry->dirty_index    = ring->dirty_index;
+		__entry->dirty_index    = READ_ONCE(ring->dirty_index);
 		__entry->reset_index    = ring->reset_index;
 	),
 
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index d0693ef6e479..cd52f136fdf8 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -156,7 +156,7 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 		/* Update the flags to reflect that this GFN is reset */
 		kvm_dirty_gfn_set_invalid(entry);
 
-		ring->reset_index++;
+		WRITE_ONCE(ring->reset_index, ring->reset_index + 1);
 		(*nr_entries_reset)++;
 
 		if (mask) {
-- 
2.56.1.708.g77570a6a1d-goog

