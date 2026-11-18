Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998887;
	b=QPy+dKNp7hUNbqb0J84c7l+OM6k9Hel7ZncywwgzN5HgOIOCDGs8oIxSGYegLOAMtu8v
	 kb66p6tr27sjgJfXv+R06r/K2buFcvbpuJokFEi51PLsVaEdjNfrwkK3/64EnuQGWbGc2
	 P5M5wyzQl0VLO5bmuao/T+LMX9qj3F226d2/oWcKAV+PqOwuw+jAcCunQDNb1MB/FHuGZ
	 2/qLtQaAzcpe2vjBp/A/OFsoVNVKdkOp6xgl2VqoifiqvgsyfVIF+CF8wzWGwRb4fVxJv
	 g8d4+0P13mW16b1KJAoQZRiYlrVwpIjXCkcFbeHHOklBg59zmWrUo5isSt9z8AL+0WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T3M9PHT8VcodX9FFubZKxlabIlXO6c08/++71eKYdKI=;
	b=M29cjSLS6qP9eYrcCXtzyTePpNO+Kkbiz99HXjSNtDjAA66YMJQeeJnhBnExH72ACLtk
	 kxXe8EAzmspjDbvnFpzkAkYEXeL6OlvVht5iK6lNHBxRkHBSKKLsWefKlfWotyQ60F0ny
	 aBXy8Dn++BPMi7KomHinSuw6AOKlWljlbcKf0pDNpcKOT1IW68ddcgWQrAV8R/2R1/7M3
	 xJExqyywaOqWTYuiIjZORyB0NKVC71+zuiH7ZEeq2kKMmieXMu5n6+CAw3Hci2kexnLCN
	 nM1Mbq4tPVffgMSypSRyFvczlJ9wHAOJHAMmsenpfbA6VBZCEf5mjBG+s7zX8QXqSXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RS/JFt8K";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C9960A2606
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C9960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RS/JFt8K
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-381d542bc29so1607979eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998886; x=1795603686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3M9PHT8VcodX9FFubZKxlabIlXO6c08/++71eKYdKI=;
        b=RS/JFt8K59/zOdN6NCR0mfGRxKEH9aljpQYrzR2KEv3M9T2bdKrslF/LfKfU8DRxYd
         Vugaxahjv9Y5ixoyo83phJy0ihiWqKsI7LhyQXpBqz8v9PD3/BJBWkN9mDdIPgU6wfgS
         E/VEKocHxWGGfZCh0oL112cGtWZ6p7/LIL/WpIFjlwuYBTOlT+WaHxYskXuSrAyJGugt
         655GPZK7bCXU/tn9YyCypyUxnUWQmsF2wxaoIXz/H2/MlNUt1XxJwX4N0MB4E4MaVTLb
         5s5ZG9XACra3xfZvpaQwLMrJiwktT2np3tywRw22atOLU/P54+lTvZna3KviuXxKn33D
         u5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998886; x=1795603686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3M9PHT8VcodX9FFubZKxlabIlXO6c08/++71eKYdKI=;
        b=v12QcyGkpDO5NEuskeNNQSfx7rAFx97j9hk1yjo9DOa/TXMIlUqw2YO3XOcz1kDgYF
         rRcpIPulO1qf+Nbcklqa/abOyjP1elmqKtAY34DqTWJW8lvRTQZNwyL5jgoQGihqxsxU
         XbUNMbEZ/LAp84Tjwu/xi2JZlTfpucI2jnCXWlPYeL/Od6xUzetGsiWo5Pd/C+4TgkGW
         fGaY1SFi5oxmRt/tPbr+/1Kk2dYafvriSj0QdB23jSQh/U5qe6ulgrxJsiHwPAbgXp4x
         M/O1WvoPz/kj7hiN1gc+NZYYW06fWh4FSey2JgJHq8vGNZBwpoWHJhKzlarSHSP4CWns
         Z6xw==
X-Forwarded-Encrypted: i=1; AL+hErHCm7AzBD+OjsQk8x61OCZPmxEHMNPVc3uNeloQ8PSx6lwIow0j9mZtMxMEc5JOjnAyZmV517wRBCtZZbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WjXIdSV94W/dv5iidhV1VTCFQbdoLNxYULzWZRyK9814ztOE4
	LepyX9a8NN4PEc62/reJeg0PHh3LV0aRkg+uPHlBIAbmGY9u+Yq7PMvg
X-Gm-Gg: AZFdTZdSVVA5yQrkx0g0vzGbsi98PoQDmlixi3FENGJIJ725jbJm76cwOmh0D37PAh6
	ir0JXiyOMvXqY6Sf8JW8Rpu9NxSextDsaMh6aIjWCO2NO+5AjHdj+s2CCLYjcv/gOxjuQFVgkn2
	prYytYZJiSAfmmUWtyRvzvnX5iNdBcTevtalLKryoI0jO+9wY4+3BF2zTaatmLB2lvLPQFuyEBv
	U3eo6EkAMA4Yz7DMwr2ivH9fU7m9Uoch93iAShaJe+75nrqXh9PrDrJUwe5XyjmVNqd2HEP4S5B
	35KuaVlMKKlVD8mwsOoMi8zLn0JYQ2Bfhv31qoz4zObz3ufKPGTecEL6DaZPgXYVOOoM2DVlLiL
	B3VHRbm+fBHrHlH2l6nUgRWd+FNjucQbNslwcLz6kqnSxQjnE1mYfiRnzQXi3V97uGB+mZEnTK7
	VSiyZ3WsoibHKSLDwwu6CIVZ1XzcaDkk6fuFLDhmcQ4mW1u0AETb3N2FPneMMYM51oQ+Lk1lu3l
	bqTHK8bUqWPF9CVvvbjFsMGsL2HNP0/OBSQzjFcMDARbvKQN+0ja8UHAhodUXB6ukd7j2cb+WoQ
	1S++BJc6oG/3oUyBw7dOeQLxo2So2tQ3Bcoe27lnod7MIhF2xhc+HzC2kR5y06RK/eIl1TdV+dW
	UfGzlIx196ym7hiIyRn/ZUuPSt5GQPeWJlTbGu1hyO9tVlGEkeioXVdd5kFYmPbW9hB0lrGcD36
	mW+PmLp0EqReFHibRe8z9j+3ukRpWT+/3ipvpCepYlvoOSjR39Tx2IZ4uG2XqEC9bO6ymED3oBU
	YDRQ5I=
X-Received: by 2002:a05:7301:430c:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-38280f1effemr2183532eec.23.1794998885835;
        Wed, 18 Nov 2026 02:48:05 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800366sm6783131eec.12.2026.11.18.02.48.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 02:48:05 -0800 (PST)
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
Subject: [PATCH bpf-next v2] rqspinlock: Keep claiming the lock while the queue head is still the tail
Date: Wed, 18 Nov 2026 16:17:58 +0530
Message-ID: <20261118104758.98620-1-jain.sm@gmail.com>
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
that can be a long time, with interrupts disabled. The same happens on
v6.17 and v6.18 for any NMI waiter, as the trylock fallback was used
for all of them. The AA path needs the interrupted context to have
taken its entry for the lock and not to try the lock again, so it is
much narrower.

Only a different tail shows that a waiter did xchg_tail() and will
link into our node. So while the tail is still ours, retry the claim
and keep the PENDING bit of a waiter that may still be backing out,
and set the locked bit and wait for node->next only once the tail has
moved. The loop that waits for node->next is unchanged.

Found with a TLA+ model of the slow path. With this change the model
has no violation in the configurations where the head hangs without
it (an NMI waiter using the trylock fallback, and the AA bail-out). A
userspace port of the slow path, driven through the interleaving
above, hangs without this change and completes with the lock word
clean with it. I have not reproduced the hang on a running kernel.

Fixes: 0d80e7f951be ("rqspinlock: Choose trylock fallback for NMI waiters")
Fixes: 087849cca31d ("rqspinlock: Precede non-head waiter queueing with AA check")
Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Changes in v2:
- Use Kumar's approach: retry the claim while the tail is still ours,
  keeping PENDING, instead of resetting the tail in the loop that waits
  for node->next, so that loop is not slowed down for this rare case.
  The diff is Kumar's from the v1 review.
- Target bpf-next and drop Cc: stable (Kumar).
- Checked the new approach in the TLA+ model (no violation in the NMI
  trylock and AA configurations that hang without a fix) and in the
  userspace replay of the interleaving (completes, lock word clean).

v1: https://lore.kernel.org/all/20261117225023.36660-1-jain.sm@gmail.com/

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

Based on bpf-next 32b66b94c86f.

 kernel/bpf/rqspinlock.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
index 111ec80..f6a938e 100644
--- a/kernel/bpf/rqspinlock.c
+++ b/kernel/bpf/rqspinlock.c
@@ -624,20 +624,23 @@ waitq_timeout:
 	 * Otherwise, we only need to grab the lock.
 	 */
 
-	/*
-	 * Note: at this point: (val & _Q_PENDING_MASK) == 0, because of the
-	 *       above wait condition, therefore any concurrent setting of
-	 *       PENDING will make the uncontended transition fail.
-	 */
 	if ((val & _Q_TAIL_MASK) == tail) {
-		if (atomic_try_cmpxchg_relaxed(&lock->val, &val, _Q_LOCKED_VAL))
-			goto release; /* No contention */
+		u32 new = _Q_LOCKED_VAL;
+
+		for (;;) {
+			if (atomic_try_cmpxchg_relaxed(&lock->val, &val, new))
+				goto release; /* No queued successor */
+			if ((val & _Q_TAIL_MASK) != tail)
+				break;
+			/* A pending claimant can abandon before publishing a tail. */
+			new = _Q_LOCKED_VAL | (val & _Q_PENDING_MASK);
+		}
 	}
 
 	/*
-	 * Either somebody is queued behind us or _Q_PENDING_VAL got set
-	 * which will then detect the remaining tail and queue behind us
-	 * ensuring we'll see a @next.
+	 * A different tail proves that a successor will publish node->next.
+	 * Preserve pending while installing ownership; a racing claimant may
+	 * still be undoing its speculative reservation against this queue.
 	 */
 	set_locked(lock);
 

base-commit: 32b66b94c86f009b49668de7340f2ed65aad2dc5
-- 
2.54.0 (Apple Git-157)

