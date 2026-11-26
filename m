Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660543;
	b=vMSV1bsAiKP4o8aIcvK2Crh46W5utCX+RL5CbsR8HE23amcB8+wwQrVqGk73/6R0LT8P
	 mVEi0xory5cv7Yx/qYGYK87/wQdt4PZOMT6sXY4sVnT9+YCo6SQrUXpIs3ZrbWMBjgzK4
	 9Y30e050S2OsDW1gVgzQ2CN6rA2YrfIV5a+f0Vokq0JtoBE6KuYfgqjqYOwZ44iBFAuLp
	 kDCZPLRD/LoRQwojcwiOZevp/Lca1LV8567uPboqAE1sNBX5JqyK2tA3KXkt5gxp459rq
	 ofMZYfknvf/zDKHkZjcqQejzVb6ytW0pbL9pwmSkIO/x+529e2uBbQR9ouM/VRSyRQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xW7AvfhFcFYopKni/tVCPH4XMjCd0Jls1yycPXUNA7A=;
	b=mgBd7bg7VCP9KL3haNUtxXZOoEAeJLsP5UVmbsZQnsfrzAwPw+BBsgMgskoandpbrtjV
	 kSvgBXWVaDppfhus9zisU9kKitfVq0qedXNP4DncYizumkkZb4p794h9TWPD9U8t9/W1j
	 EWiyYUFo+yxPsDcfgwA9S2WbOD0gc6vsycrFrXyBTgGhZ4SYYFzRiI24MyQYPxAs+NosW
	 hFiNFx7P+xXSRL8WYXvrpoUOvnRYtEUu0jp0HDEdwukr7PJTusWdrdHLdL528KBorb5+R
	 gJdF9llOGIZf3QAY14KcExmqBMev+GgWFoGOycCAx+/HmPnAAiDFy/LyviHbAQCCopw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zhenwenliang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nMWPt+IJ;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2238606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2238606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zhenwenliang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nMWPt+IJ
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-847e2926d94so12077253a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795660542; x=1796265342; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xW7AvfhFcFYopKni/tVCPH4XMjCd0Jls1yycPXUNA7A=;
        b=nMWPt+IJpIzLdwVxv4oUb0r6lwonO9LRtGPUqCl/0ttiSC36WliVkf+MwPtOzZtVWD
         lW+ObiP6G49b+1ZWegmc1pINIt9G+IKbkIlJU0Z/E5CDk7d1VOlyzikQ5ufFrYp95Wno
         SDq2N9AlbbQ8Zt11gS4qQavCJr/RKzpwMYhGGfPnmCetexnDOOXZswEpf1IPagLAsiz9
         mYgY3cvb+ThEJOWmgly2/Lj/Dl8/O8ogtJwbx/kEbnRWqzEjjx/hk0jofyn4iiipVuSs
         Dky8MI+5N5uhg2pUkeCRARi4+XIWoNgVgC7EQ0EvVG78heSZgpvf/G2Wb1I+uZS8YhnO
         sgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660542; x=1796265342;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xW7AvfhFcFYopKni/tVCPH4XMjCd0Jls1yycPXUNA7A=;
        b=cudPpeR3eu+tyyCbzVYn+Y0r1tbgxkjshsFixVgk/UfK407bxJeVycE48bG9S9p+cU
         hNLYysvsjzp6Z/8yK3FU8xo5rTXk9sJ9PzJ6Gz7OQyDBtGMIOLU7QPo9OSyWvmrRHP/n
         znuVMC9EO+iyqatKvfnSbHIFsbWKk1H/RCva5D+8WVhXvJJmmOomHSpoKpY+bIrx/aMZ
         pNepWS2ugd/ve0Zf4LEqWOlGiMDnQpNcAw4RJ+Jn/ca7Rkawad4O6wpc9hUodKEOtPtb
         gmKtWmt1pZnQNgNpA5s1ZdNWjchNvxI0eH6RoQHrNb+JN9vdw3HvHddUWDCv4wx1bfZj
         P1qA==
X-Forwarded-Encrypted: i=1; AL+hErG8S2zD/cM9BML+reQirZDu9UHNs+p3qE6aDgk3gJm6p7hnDJeMJxBHSTcTMbdpfs5WPpWF82Y6l3SdE9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JAHLOxbpd/XwhbhqM1gbm8mUiODGqTSlfoiqFe5wQb5qLPCw9
	KuWe1zq7Lealh9LUlD+2i9Wfj2zkPeUj9LZLo1rd0uTk9Gv34j/WrCKzbbvWhqAFGKjd2KDnxz1
	FcNv3g5/kj1xrn3XGSZf0QEtFX1JroA==
X-Received: from iobdq9.prod.google.com ([2002:a05:6602:1b89:b0:9c3:dedd:2a97])
 (user=zhenwenliang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2209:b0:579:f8c2:6b01 with SMTP id 5614622812f47-57a0c7d477fmr24163146b6e.53.1795660541674;
 Wed, 25 Nov 2026 18:35:41 -0800 (PST)
Date: Thu, 26 Nov 2026 02:35:40 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126023540.4161546-1-zhenwenliang@google.com>
Subject: futex: clone(CLONE_VM) can fail with -EBUSY while PR_FUTEX_HASH
 switches to the global hash
From: Zhenwen Liang <zhenwenliang@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

A thread-creating clone() can fail with -EBUSY when it races with
prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 0) in the same process.
Line numbers are kernel/futex/core.c on mainline ebb7a8dc1e74.

copy_process() calls futex_hash_allocate_default() for CLONE_VM and
aborts the clone on any non-zero return (kernel/fork.c:2450-2453). For a
process that still has a small default private hash,
futex_hash_allocate_default() asks for a bigger one with
futex_hash_allocate(buckets, 0) (core.c:2016).

futex_hash_allocate() first checks, under RCU, whether the global hash
is already in use, and returns 0 for a non-custom request in that case
(core.c:1861-1868). It then allocates the new hash and takes
mm->futex.phash.lock. If the mm has switched to the global hash in
between, the check under the lock returns -EBUSY regardless of FH_CUSTOM
(core.c:1939-1947):

    if (cur && !cur->hash_mask) {
            /*
             * If two threads simultaneously request the global
             * hash then the first one performs the switch,
             * the second one returns here.
             */
            free = fph;
            mm->futex.phash.hash_new = new;
            return -EBUSY;
    }

The comment covers two global-hash (custom) requests. It does not cover
a non-custom default resize from clone(), which gets 0 if it arrives a
little later (core.c:1863-1867), but -EBUSY if it arrives in this
window.

Sequence (one process, >= 5 threads, >= 5 online CPUs, default 16-slot
hash):
  T1: pthread_create() -> clone(CLONE_VM)
      -> futex_hash_allocate_default()
      -> futex_hash_allocate(32, 0): passes the RCU check, allocates
  T2: prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, 0, 0)
      -> futex_hash_allocate(0, FH_CUSTOM): drops the old hash,
         waits for the pivot, installs the global hash
         (hash_mask == 0)
  T1: takes phash.lock, sees cur->hash_mask == 0 -> -EBUSY
      -> pthread_create() fails with EAGAIN/EBUSY.

The window is the allocation in T1 plus the RCU grace periods of T2's
pivot, so it is narrow but needs no privilege. A possible fix is to
return 0 at that point when the request is not FH_CUSTOM, as the
lockless check already does.

Affected: the check under the lock comes from 69a14d146f3b ("futex:
Verify under the lock if hash can be replaced", 2025-06); unchanged in
mainline ebb7a8dc1e74 and next-20261125. Impact: a spurious
thread-creation failure (functional; no memory-safety effect).

Found by a formal analysis tool we are developing that uses AI
assistance; I have reviewed the analysis and this report. The tool runs
verbatim copies of the kernel functions with stubs for the rest of the
kernel; it found the interleaving above, and the interleaving was
replayed natively on that harness under the tool's schedule. Functions
involved: futex_hash_allocate_default(), futex_hash_allocate(),
futex_hash_prctl(), __futex_pivot_hash() (RCU, wait_var_event and the
futex reference transition stubbed). It has not been reproduced on a
booted kernel.

Thanks,
Zhenwen Liang
