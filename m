Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955832;
	b=bApJNFlSZ2k8No0jWggPUBPCGTEMrqvGA5Xz+y6c7GZvnw/Bb6JCA7uLEyoWmCGxMR04
	 idLYMCYPHxLLFwqeMkf3W5My5GrZNmOMIKZWxKtY0GunHXHf+UW5LM05OmxXQQBX7WSpG
	 uC6rEit8C8SOGqGHuqk5xJvvWaVZwtXmCSgkQ2DnGDangb3u0B1goHCjA1Kau2AdALVyF
	 klKntNfSoUTH8aFYDaxzDxB05SAZQuJC+wl4ycB5Dv+4hBb+gC+P9qPEn11bgf+Lg2pWF
	 qV4O/pvynreAEJrzy3Cj1bNK5lQ+1aPSddwsXdj5HrSiC2eoe9/Q9owU4x8C0TMqVNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5LZprz+0la2YSbdDTFfgchlevOg7w1sc283MrLEFHQ=;
	b=QHhA82C++XAgEFuomVB5pkW2at872jIW9jy9VcdUIFCKCvQFAmARXS/9W1AQ/KiLApHy
	 X9dBkOl9q3ajFyCqXf2kyGuVOeOXHf0HNSQDSRYSSrdmOMdMjJItA0h0ks7KFMJHIL//Q
	 q7MFV69YABU8Sl70bTnpGlekW9qM1iOeZ15ZW8aAhklHF4zUB9F21re/FU88Lgzk85+Eo
	 CpKRunFQL59IY5VJueOioNkWuKg2JfGy6rLt/SUfXLMX8pLWLUtaAlDCHFPLsZuggGyLv
	 yc7w8ecU6liM0POa1tpnTdgZxtaG5bq6nFX9nqhOH/FPakVYhdFHyzRH5kKt3VbcqGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdfVn2u4;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776C606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B776C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WdfVn2u4
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380b40319bdso703778eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955831; x=1795560631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5LZprz+0la2YSbdDTFfgchlevOg7w1sc283MrLEFHQ=;
        b=WdfVn2u42i3Av2qTH269DHP7zpKExvU06VLNqsFEEqviGe9sXQ76Eh4dOyXZ4eGA4t
         PqKsufesmyweD/WXi684Ji3/ES1nIoL9OUJb42HGmSApFCq5t1adMRf73YlCybw/7S2p
         2LSR+rREHFK4K7L3ZyMOeWuOU/3VqL+j52Eyclx6OgI2RNM8XUrJe5M5E8NiJp0go6mM
         Y8QHkvrACn6M6rrEWQoNI5MoqHBWOyx8Va1Cbd76gstMjoxYZFE1ov3X3tt+TzkaVb8a
         CXrSyklHehkrZDj0pB7tWZI8kElbbc8tbvFJ81BdiYtV96aEhP4lZcoffKB7nREtIutX
         e8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955831; x=1795560631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5LZprz+0la2YSbdDTFfgchlevOg7w1sc283MrLEFHQ=;
        b=meMHxTAAmhSn2Aem8ouND10sp/aMG6qX9j3YmlewNWeks5ZdbWKaxlJ7l0k+VuQS8Q
         L8UB1Xenwc9ltRbe6aHubJt/mZvTMqyBbyuIBR4/qcQOIgn4nJiVp8J0alZ/rW1+NByR
         4JEnOQG6hUHTw5fY3xJ4z/5XfD5mdS0nh7lVvu5LOcP5sDbMfnO75mjXztsz16DbkR/k
         4dXpBdmp+nqj2x4RUJZfbUz+Wsg64b+0Wdi72g70YYHYqILR3er9rxb0snBY+5/gMd51
         C0APXdMWjCpjpejYLPTIAzR3MR81JbbIkwVY7WtpKXE9FkMBli80liA035eK+SMw7q3P
         2jsA==
X-Forwarded-Encrypted: i=1; AL+hErFZkmAQ15yZB67lEc5c/Q9hPtuyHYqvBbx+/MthHF5R2wDBVavLEGY7UtPxGB+5Xt7xsVWWvhf9oG14aAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z95LH6k7KhlNQm8X5VE3nRfGuecuO9e2rJ55RDfHTTbY8N/XMnd
	4lVNu+BBLQ1NwkLblSy+THOjOqxTGeTlvE4/iDHX9kfrxPIyswENid6o
X-Gm-Gg: AZFdTZfYqXyyDUq4FNle+xs/ressOjvtYIN7v7UkmYtgTY6/ZlF7vSkGy5QomT2Q62Q
	V5eUn28NUXEt2Vy5M3FnVQBWnqtrIAYRN2gO61cNaJ2kRirPHrsBUWdUU3efMPEfZm7BlHkWCJw
	RB+sv/3s0rT4AJccPPd6zLMd3S9ZbVAv8EUQ4ZNTmprlJ85KZVy6/ZOxU11OZEh+Nc4j2yZ/uEb
	KuUaDHupLM0qssvUOfmB7l1dT+LSMJYb1lvEK9k7Sm0lO+o0ISUlIOQcqBGbzkm6GX1OwUNPPId
	9WKyypZ+mIa9Ry8/VJ4lL/wS2v5FWz2+JtRICBs2617FdOlJqP7yQJdxQS7FQE2YrGQh0+b8XM0
	nEvspoKpXgi8pQATJpE2OleVmBzHilklztFzL5yJYuyHsh2VXkq+0PDzNzXPHOjbAtp6gjpmrlg
	dk5viksVfD4MfBpchocl08VrlQ66KP5mN0TqOW3YXEVqFEd6vGNPrQYxj7c8UjvxrlCN6OBRS5Z
	L8i4IQAnl/x4QE9ThJKLsljhgV2AwbK7Uv/zo9SNTleQOeGh7zw+IeyKMYLaP9QZPi/64uT066g
	n1ZIVHDEGspsy0vftK0fOMywHamMzl+OxcweaArT/+Q9NEIHZpo5MMLbHuHXqYfInwEsoGqSLSS
	CHMkXAA8Az+rAUxH8bmKF1puCpjeDKOS47Z9W+SqJmmpjV5suHJfQKoJYxf+uOWIqDbUTFTYFGC
	/oTxAr8HGlXFgfUtxoxZ6oX6YdjfaCJrXJBzz39vSHZYT3lroHruAMyC8+5keFpmx9kawOL0Mg9
	1UdU9Ue6hL3ag==
X-Received: by 2002:a05:7300:101:b0:375:388:a6d5 with SMTP id 5a478bee46e88-38281213cd5mr745964eec.32.1794955830577;
        Tue, 17 Nov 2026 14:50:30 -0800 (PST)
Received: from FT6N242TWK ([223.181.112.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm1299282eec.11.2026.11.17.14.50.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 14:50:29 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf] rqspinlock: Reset tail if no waiter queues behind the queue head
Date: Wed, 18 Nov 2026 04:20:23 +0530
Message-ID: <20261117225023.36660-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When the head of the wait queue claims the lock and its cmpxchg from
n,0,0 to 0,0,1 fails, it sets the locked bit and waits for node->next,
with no timeout. The comment, taken from qspinlock, says the cmpxchg
can only fail if somebody queued behind us, or if a waiter set PENDING,
which will then see our tail and queue behind us.

In rqspinlock that waiter does not always queue. After clear_pending()
it goes to queue:, and two paths return -EDEADLK there before
xchg_tail():

 - the trylock fallback for an NMI waiter whose per-CPU node is busy
   (in_nmi() && idx > 0), or when idx >= _Q_MAX_NODES;
 - check_deadlock_AA(), when this CPU already holds an entry for the
   lock.

For example, with the queue head H alone in the queue:

  CPU 0 (H, head)                    CPU 1 (NMI, idx 1 on another lock)
  reads lock->val == H,0,0
                                     queued_fetch_set_pending_acquire()
                                       sees tail H
  try_cmpxchg(H,0,0 -> 0,0,1) fails
  set_locked()          -> H,1,1
                                     clear_pending()   -> H,0,1
                                     in_nmi() && idx > 0, trylock fails
                                     return -EDEADLK
  waits for node->next ...

H now owns the lock and spins until another context queues on the same
lock. For a lock that is rarely taken, such as a hash map bucket lock,
that can be a long time, with interrupts disabled, so it shows up as an
RCU stall or a hard lockup. The same happens on v6.17 and v6.18 for any
NMI waiter, as the trylock fallback was used for all of them.

The AA path needs the interrupted context to have taken its entry for
the lock and not to try the lock again, so it is much narrower.

While waiting for the successor, reset the tail if it still points to
us, as the deadlock and timeout exits already do, and keep the lock. If
the tail has moved, a waiter has done xchg_tail() and will link into
our node, so keep waiting for it. try_cmpxchg_tail() reads the lock
word first, so the loop only adds a plain load while a successor
finishes linking.

Found with a TLA+ model of the slow path. A userspace port of the slow
path, driven through the interleaving above, hangs without this change
and completes with the lock word clean with it. I have not reproduced
the hang on a running kernel.

Fixes: 0d80e7f951be ("rqspinlock: Choose trylock fallback for NMI waiters")
Fixes: 087849cca31d ("rqspinlock: Precede non-head waiter queueing with AA check")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Based on mainline 63fdb511c27a. bpf and bpf-next have the same
rqspinlock.c. The TLA+ model and the userspace replay are not part of
the patch; I can post them if they help.

 kernel/bpf/rqspinlock.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 111ec80..c50afaf 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -635,17 +635,26 @@ waitq_timeout:
 	}
 
 	/*
-	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
-	 * which will then detect the remaining tail and queue behind us
-	 * ensuring we'll see a @next.
+	 * Either somebody is queued behind us or _Q_PENDING_VAL got set.
+	 * Unlike in qspinlock, the waiter that set _Q_PENDING_VAL may return
+	 * without queueing behind us (AA check, trylock fallback).
 	 */
 	set_locked(lock);
 
 	/*
 	 * contended path; wait for next if not observed yet, release.
+	 *
+	 * If we are still the tail, nobody has queued behind us and nobody
+	 * will link into our node, so reset the tail instead of waiting for
+	 * @next forever with the lock held.
+	 *
+	 * n,*,1 -> 0,*,1
 	 */
-	if (!next)
-		next = smp_cond_load_relaxed(&node->next, (VAL));
+	while (!next && !(next = READ_ONCE(node->next))) {
+		if (try_cmpxchg_tail(lock, tail, 0))
+			goto release;
+		cpu_relax();
+	}
 
 	arch_mcs_spin_unlock_contended(&next->locked);
 
-- 
2.54.0 (Apple Git-157)

