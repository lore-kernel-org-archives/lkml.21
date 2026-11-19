Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055600;
	b=aEDtGRlrDsNHkeKF+/Ve31mOP+occkpAFF2r6rSJGpcJVuNFLucUgndTdktFuDyUjxIl
	 ZQgnMQurCeieujBu/3/SbAv7+XBLcwCUrNps1VvKM+MugJLrPLZEi4vhhQ3iNf6OyOVFg
	 7Qhs/zI/EjAhtqBCqIQGsCe1RiQJOybHbcrj5OHE8Pe2aIrQGzscteaR5e19xfLB5GWk2
	 5zTRrMo8PspA9CKhYutzTQWdqzIx519gJ75thtAx1eqBrAYX9txN8zJMuVMaUgd/VvZoJ
	 ZJAzV1zJSvZyuneQ3o1v1cuy3zqB7MpF19Km2I2f7RMZvRkn1fi+fSaAsWfJPvRiH+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eSTQlcfr7aWNzCzMGv98ZXpMo4wDZ/dh6OvhB6AdnV8=;
	b=F1zGIIKDFMbx8P6W+5f/Nsez2JPn+NQ643iLe6aZKHej6efLLP8lYubY1h+iX70+jIja
	 gnCEbtvECWwFyclATmQ4EV0Nk1jc5gapANa3VyKeZ04d2SNUKAM8jp2rXLvHme9EzVDsa
	 fKJyEJJAuObvPYZ8CJQbeak6fKZ6uwv/vxaRvi9vu/k9Vw/1eiM7zIkZBlSq5mX+jQqDZ
	 YgkObGcRd18G5GaM0/TJ6ONQVzl13YbhJLFdNmSdN7jlW/0NgjtlCmtOrARbTnjObHt0f
	 qKcbxuSnGTCRLk19Ak9p/cG9XA0xrXQjH/gKDmvfct3v1X0Pb2Mwtr0S837P1rYmlww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CLB0O+sz;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9AB60A2608
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9AB60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CLB0O+sz
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so2445929c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055596; x=1795660396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSTQlcfr7aWNzCzMGv98ZXpMo4wDZ/dh6OvhB6AdnV8=;
        b=CLB0O+szDPkso7maJprAP7ev252n/nLU/zhtaiCLqSUlcfPgkeu+iK6RpQ3nDtG1bv
         SybxS4LFZBlhQVBD1Y2hVskqA/84SebLzWneh57V0vKkb7pkALV9GyCRBnm8afbEBrfG
         gcopIjampdhgrlPL3pnXrW+AVOiNPOFrkjUlgAfFQz2mSCIfXtwekITaJNLTX4HfwEJd
         rJrPy8fMHaEDg/MuxA3gm6YI+B5Bgg2mNcGbUDMATfC5fjlPAubTGs2Uq8cOzBnwTDQg
         dgPa0kfXpGRrM1I9IYST/6a66cslZVCqQKK05O+tRKTEwpgf7EpPY0lLXnW1cNYQ36sF
         JTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055596; x=1795660396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSTQlcfr7aWNzCzMGv98ZXpMo4wDZ/dh6OvhB6AdnV8=;
        b=zUrATjZ0ovVhETr7x6hJc6kT6JMqYRTiO96I1FsVbEeOJ+knRLXEBnLsLNQuTFhevD
         BN1IAmI7bzzZkWl0HNOr9ab7Kpr6s/RVvsY+DzlFu8RkD650lsPdGwnVHu7kiYsj6idD
         zkg8DzUKuhqIxuiNanMFsR1HjMWsC8C63Xlk0iT69qLbQ7/a7KwhG/OxLPmar2t+hjfi
         thOyCONFR6gRvtvfB0hQKUH0bAGaqJgDm9XgEohmx1qVac6562YKhEeM7sU57b/FNrs9
         VzBPZAVbnIXffG/fqbh1bwOo+MEhWIzc5iQvaS2qeSaXptIW0C+kNeDzEo58+uGV+iAs
         MYdA==
X-Forwarded-Encrypted: i=1; AL+hErF6nhlafEaFrU7EblmpAH84TCFVCgG8d5ZMbDIk/dQtdz0G5H7MXWE2UpGJotvhBKd539U5RTJBNlVmjuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tD1RwUSXfrt6NHxhLTkR5sFz2gF8V/uXqPYPjHeCDXhrVGvzf
	2n6pFJFXOAxM39BoUdI+Kz3u7seSGgNTDyplsYH2mHW9kzJKHxBxgAaf
X-Gm-Gg: AZFdTZdE/1UIo6HgOtu4BhAn7PjUS1JRo0rKouKwu9gb7jAMaY+MgTdbWJE0Pe1GyBT
	9xInD9ZJg1vBGqi7+i3FaAg8zKBKXOVZp3X/BVfW0HXMrHtMh3JHLOekTNyoWv4PTtck5PvJrfa
	666mxuuFVq/ruwSCP1Ec2Lkuh9yl3Kn2uo1DQI7Sc6FJwrvP3Tr6CstZibIvFKjyBx40gQkU5eC
	0I4CbP03rxU+1B2qzXCGkSqfIoABlSUz6qNdLjm8CLQmTnY7Ti2eh1HA8VJ6dRL1AepzuhPdqMg
	acWxPOwifPvQmAbjRTFIB65H+PPfpQQ/TEDQovR77hF9et9IYh70ETzMu9/eoiXtGuZZH4UlPlx
	CyFy22i6PrRCMvSZmZ2fPOeLnIaWVInmtCbUo3ZQWbUAyQhwLBfANAcMBakKjfEnai33TiQ1bIh
	06j2wNVwygsO45uzbDu1ayg1PmydBdyLHs+ZxNV8TB027tBWEZkhG2Gb23yucfRHVh+hWTHv2Xr
	SXyeCk7wUxMr+rjdv2SRsLSnGP8IWDqc6VDdNi91Gbq16SrbGaRzhDRs92GUvFJ/8ruUnJmp33G
	vbgT8bq6W4+rft84dpgwCOWJnMpgnPD2L+K9pl32L3GRUs1SqvI9isUOeWgq+HPfo6Jo9Yvc/fO
	0Mt093Mez7aGZt4IvO8G3cpHKex8/BzDX59YuYJMYau/XcjZXlXhKKWV/WWWXY0EhSCajoD7Xxr
	p/XiFvt+YOecUP0eLvyOl2OrXGVlyC49L2rWjZZNUyE/X2blLhJZ1FwLXME3FXC2hYvr740ejyV
	YBz9uYFByq8
X-Received: by 2002:a05:693c:804c:b0:378:2e89:3958 with SMTP id 5a478bee46e88-38280f22793mr3994461eec.19.1795055595568;
        Wed, 18 Nov 2026 18:33:15 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm13110627eec.14.2026.11.18.18.33.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 18:33:15 -0800 (PST)
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
Subject: [PATCH bpf-next v3] rqspinlock: Keep claiming the lock while the queue head is still the tail
Date: Thu, 19 Nov 2026 08:03:07 +0530
Message-ID: <20261119023307.65178-1-jain.sm@gmail.com>
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

From: Kumar Kartikeya Dwivedi <memxor@gmail.com>

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
that can be a long time, with interrupts disabled. The same happens on
v6.17 and v6.18 for any NMI waiter, as the trylock fallback was used
for all of them. The AA path needs the interrupted context to have
taken its entry for the lock and not to try the lock again, so it is
much narrower.

Only a different tail shows that a waiter did xchg_tail() and will
link into our node. So retry the claim as long as the tail is ours,
and keep PENDING, which belongs to the waiter. That waiter either
clears the bit, or on x86, where queued_fetch_set_pending_acquire() is
a lock btsl followed by a separate load, it no longer sees our tail and
becomes the pending waiter behind the new owner. Update the comments
that described the old claim.

Found with a TLA+ model of the slow path. With this change the model
has no violation in the configurations where the head hangs without
it (an NMI waiter using the trylock fallback, and the AA bail-out),
also with the btsl and the load of queued_fetch_set_pending_acquire()
modelled as two steps on x86; the model reaches the case above where
the waiter no longer sees the tail. A userspace port of the slow path,
driven through the interleaving above, hangs without this change and
completes with the lock word clean with it. I have not reproduced the
hang on a running kernel.

Fixes: 0d80e7f951be ("rqspinlock: Choose trylock fallback for NMI waiters")
Fixes: 087849cca31d ("rqspinlock: Precede non-head waiter queueing with AA check")
Reported-by: Shashank Mohan Jain <jain.sm@gmail.com>
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Changes in v3:
- Kumar's patch with his authorship and Signed-off-by (Alexei).
  Kumar, please tell me if you would rather send it yourself.
- Use Alexei's simpler loop (PENDING is 0 on the first pass, so no
  separate 'new' and no second tail check) and his comment updates,
  which also cover the two stale comments (Alexei, BPF CI).
- Checked the x86 case Alexei raised: the model now has the lock btsl
  and the load of queued_fetch_set_pending_acquire() as two steps. It
  reaches the window where the head clears the tail between them and the
  waiter becomes the pending waiter, with no violation; without the fix
  the head still hangs.

Changes in v2:
- Kumar's approach instead of resetting the tail in the wait for next.
- Target bpf-next, drop Cc: stable (Kumar).

v2: https://lore.kernel.org/all/20261118104758.98620-1-jain.sm@gmail.com/
v1: https://lore.kernel.org/all/20261117225023.36660-1-jain.sm@gmail.com/

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 kernel/bpf/rqspinlock.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 111ec80..14d3798 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -378,9 +378,7 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
 	/*
 	 * If we observe contention, there is a concurrent locker.
 	 *
-	 * Undo and queue; our setting of PENDING might have made the
-	 * n,0,0 -> 0,0,0 transition fail and it will now be waiting
-	 * on @next to become !NULL.
+	 * Undo and queue.
 	 */
 	if (unlikely(val & ~_Q_LOCKED_MASK)) {
 
@@ -616,29 +614,24 @@ waitq_timeout:
 	/*
 	 * claim the lock:
 	 *
-	 * n,0,0 -> 0,0,1 : lock, uncontended
+	 * n,*,0 -> 0,*,1 : lock, uncontended
 	 * *,*,0 -> *,*,1 : lock, contended
 	 *
-	 * If the queue head is the only one in the queue (lock value == tail)
-	 * and nobody is pending, clear the tail code and grab the lock.
-	 * Otherwise, we only need to grab the lock.
-	 */
-
-	/*
-	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
-	 *       above wait condition, therefore any concurrent setting of
-	 *       PENDING will make the uncontended transition fail.
+	 * If the queue head is the only one in the queue, clear the tail code
+	 * and grab the lock. Otherwise, we only need to grab the lock.
+	 *
+	 * A waiter that sets PENDING now may leave with -EDEADLK and never
+	 * queue behind us, so retry as long as the tail is ours. PENDING
+	 * belongs to that waiter, keep it. It either clears the bit or, on
+	 * x86, no longer sees our tail and becomes the pending waiter.
 	 */
-	if ((val & _Q_TAIL_MASK) == tail) {
-		if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
-			goto release; /* No contention */
+	while ((val & _Q_TAIL_MASK) == tail) {
+		if (atomic_try_cmpxchg_relaxed(&lock->val, &val,
+					       (val & _Q_PENDING_MASK) | _Q_LOCKED_VAL))
+			goto release;
 	}
 
-	/*
-	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
-	 * which will then detect the remaining tail and queue behind us
-	 * ensuring we'll see a @next.
-	 */
+	/* Somebody is queued behind us, ensuring we'll see a @next. */
 	set_locked(lock);
 
 	/*
-- 
2.54.0 (Apple Git-157)

base-commit: 32b66b94c86f009b49668de7340f2ed65aad2dc5
