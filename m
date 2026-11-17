Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950956;
	b=TmPx3cb+3p6r5oPl8pZO2vnUhingy2hHg8vxPpwyh+cY/A2tpAQtfkIpH5cECulggQVE
	 b/HXYQ5wvIL6qlNX+AePo7tHuBvsHRp1fQHtEG/4cOEumf6sB2qHCRyr+CJvHrvc90WH0
	 GPQ+rZT5C2jGzJN5UXsSTys+vYhXULdSWlTVamXZK9eq1NfT2KDQmSEyDk3Tl5sBdGZLH
	 sBNN6rnOmapPZKruPMEAjcrzWUfd2sokb6hg2Rm3zE7U2Qr8rY6eAtBk3bLj4hTqLb/uK
	 jcZEgGl7hPe4MEjWALjkWXzNgfdpCtMGxmpPrPz+eWcMAx3LfpMs4YSmioMd6cDM6Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hTDVIba/W9W2yqeaBqk+u2F6+BZLE6k3DrmbJxOrlQ0=;
	b=VjOMfr9Q8biQ/hsMHHCbZ3xGCTrNsKLTFCNsy5KONsqHcsOAQEuSX4GJrc3NlPm9nk4w
	 IFzx3F/kT9whikURBPZ1UWRFtEU2/+goiSula5Xd++bYQUmupM3DOFobKmJtRZkpEqAGC
	 Fy1VPK5Nmnhx6AjyiVXeJYvD4yUDG3XDCukCstf2PijGl6tmYADBxKx7h1bXHevyZjMsv
	 wjK2ospFL5z+gcZ/rCzZnn59l+5TuJm51sATAPQS2HhizUdcGWLy5/s8AFehUS2noOhtK
	 LJ24y7ALNyrGygz/59XWrkEATteq+a8zcHeAdARxFIMFfKyjA6OaTQ6GUr6CDM+D3Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vy6AYHoW;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D266606A88A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D266606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vy6AYHoW
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so137413a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794950956; x=1795555756; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTDVIba/W9W2yqeaBqk+u2F6+BZLE6k3DrmbJxOrlQ0=;
        b=Vy6AYHoW8OSRtrJpzKzm92WDNcLprEMLKT7IHCulePdpqoqOlW502siXtPHVWZVuOl
         VeoIC4q9Y4hEulVNH9nLfml9XdKCaPE/F5pVmaGJnbVhANQ78tB9YEjOn4fsS7IQdzJX
         0CmEDII4VRKcsD84BkYuJLLJNJCZMh1Kdjhohbd4cF70yrlZDYURu1gxT2OMA9BHS9PY
         vPIT534RqoGoxqTwZ4/eyRdGKeKSi3IgyFjj/PeROghC9QSVyhlfP3rJUAQ6/mWP4EEW
         G6WgvaaXgvkMckdFzSrM86fTdsvV63yn/Tp6A0DbPHNtYcQDwv+RtaiFuk2xSfp2LcX2
         x0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950956; x=1795555756;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTDVIba/W9W2yqeaBqk+u2F6+BZLE6k3DrmbJxOrlQ0=;
        b=1Mb8iyx7EBA3dAxNKkrohiE7rdQnmCNJgWivsyNthXZRjaHW//6OmaInatRL2peyO/
         U+G/94f7uW9cy09+CChoN6uzxeo8t2uY3TazMo3Ihf6jKJXJ8eSCmypYCBbZaptctK1w
         ww/90OQEDfVqafqGpx5RNXWi1af9/QqqIAG78XImqH/NBi9QDGDu10fFWr7c6W5Yp14z
         QV8PGFnslzmmgxY5AuQYYmJYpS4IgTK6ytFqHfjK52hGYLnzUSPT/vEt6EO6xSy196ng
         mtN4t+ELUW+3iPmUSQL2ABcLuG7rA7UUUVAd8hi8lSNTa+SKyPU43fgpttfaxxTt+wzG
         6hNg==
X-Forwarded-Encrypted: i=1; AL+hErHqxMhayxnO049HTi+42Fg80QwrFtk+pT9WBStRFDiwsqdmtyFu2SK7fIsqx8D1UbUhMYtE7EEmGGla8hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zs+msmvWSIb7ZB1FAkTQCJui68+Byr94VBfibElA9gFv7PHeN
	JGhe40Hd+HzYuUyePUB37RIsAGnba0SxsZGXwrRC+Lw09qHERzibIGGm0LeRjcP0EDwinZExRiX
	v1COnHeDYt+2huMGkDe+2wg==
X-Received: from pjbgy20.prod.google.com ([2002:a17:90a:df54:b0:3ae:c401:753])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2784:b0:3b0:968f:fdef with SMTP id 98e67ed59e1d1-3b3d07d5277mr558897a91.49.1794950955763;
 Tue, 17 Nov 2026 13:29:15 -0800 (PST)
Date: Tue, 17 Nov 2026 21:29:11 +0000
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
Message-ID: <20261117212913.3634487-3-jthoughton@google.com>
Subject: [PATCH 2/4] KVM: Use smp_store_release() to mark dirty ring entries
 as dirtied
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+55eaa971f4924b62c9a5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Publish dirty ring entries to userspace with smp_store_release() in
kvm_dirty_gfn_set_dirtied(), instead of an smp_wmb() in
kvm_dirty_ring_push() followed by a plain store in the helper.

Setting the DIRTY flag is the first half of a handshake with userspace:
userspace load-acquires the DIRTY flag, harvests the entry, and
store-releases the RESET flag, which KVM then load-acquires in
kvm_dirty_gfn_harvested(). Commit 8929bc965964 ("KVM: Use acquire/release
semantics when accessing dirty ring GFN state") converted KVM's side of
the RESET flag to acquire/release, but left the DIRTY side split between
a barrier in the caller and a plain store in the helper. As a result, the
helper doesn't convey that its store must be ordered, and the store isn't
marked even though userspace can access the flags concurrently.

Now that kvm_dirty_ring_reset() relies on this handshake to observe an
up-to-date dirty_index, make the ordering explicit and self-contained in
the helper, so that all three flag accessors use matching acquire/release
semantics.

No functional change intended.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 virt/kvm/dirty_ring.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 8fab75dace76..d0693ef6e479 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -95,7 +95,7 @@ static inline void kvm_dirty_gfn_set_invalid(struct kvm_dirty_gfn *gfn)
 
 static inline void kvm_dirty_gfn_set_dirtied(struct kvm_dirty_gfn *gfn)
 {
-	gfn->flags = KVM_DIRTY_GFN_F_DIRTY;
+	smp_store_release(&gfn->flags, KVM_DIRTY_GFN_F_DIRTY);
 }
 
 static inline bool kvm_dirty_gfn_harvested(struct kvm_dirty_gfn *gfn)
@@ -245,7 +245,6 @@ void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 slot, u64 offset)
 	 * the entry to userspace.
 	 */
 	WRITE_ONCE(ring->dirty_index, ring->dirty_index + 1);
-	smp_wmb();
 	kvm_dirty_gfn_set_dirtied(entry);
 	trace_kvm_dirty_ring_push(ring, slot, offset);
 
-- 
2.56.1.708.g77570a6a1d-goog

