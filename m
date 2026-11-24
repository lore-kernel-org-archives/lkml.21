Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497629;
	b=XJ+VULRG83vgq0NB18PQkYbDjjTpDVjThb+hMCE6KcwAVf6Vi3MjJKkq765SIxw+CVuL
	 LUkUQ0iQjDqtqX7LpCUk3FsQgVNd5lB0Fq1JmPYzTjWckczkZllwzlpYGXJjtRa9y11KW
	 AZSVALvYLHat6v/KG3LgieL0TBC10AmfaBiU5CyFHvGqdxYy3TNcH4VEkbT7I3bfrDdCn
	 GGMP20ItjsLiI8qLpSRFMXc5vg7lZAVkDYMxNeHqg+AmJShcwJGfay+H47anmZIWldmvo
	 LMBSv/X3W7aUfs9n/zLAJ9rQbX8TmEi1MfNGHOimpqpuDPIX272IdHiGGF2597MYxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mVtjzQmPQKIEc4dGp9Zs/tHMBCi6CBGBAodRqCIBW78=;
	b=ohL0kji6gM3w6WBA6cJ20FXDBkP0FMiHvdHY7WvdHP+DFBjfy87vKOeqFUm8nRXf87pW
	 aQbsmFxAeCgYoeSgvzrUUzLYnotXy5hC7TajVnQwEpE54NgzM4eJpPM6eCyR0AwWuBZ4a
	 uCXINZf0OOqJn9bo1lvbb8EYn8QYGQMo4oi9iETkABDPakach9tjl1dOJXUYhdB7qfiHS
	 I+rNi7ThUP7eyIScd6BQWtgUaJkdvkjbgXzO7puXzRBrGbqZHRVFZ+ohdj08b1yo7KKEh
	 mRekhcGoac/hftfeCOk1E0sSL1UPNY+r2UAJgrCdNfpjuxxVXKJiMQ5yPDBrfnsNyDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUdhtoTo;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50926606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50926606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUdhtoTo
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04244c3d0so33877675ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795497627; x=1796102427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVtjzQmPQKIEc4dGp9Zs/tHMBCi6CBGBAodRqCIBW78=;
        b=dUdhtoTodP04LDlKygoQBNZjzBBCpCBROX9Ei+GIJwwEKJUXGVxd/k0FzMWlWHZVgc
         uC7k2VmwdqoE1VGIC9okJn+R18CsoB3ULWhSNzpOrvH1Ay3YchTYG7VtPnDr2lo30rXz
         O9lEOJoKYiPzVE0TtET/kyVjf80C2rWNbaFdcAKWMmRGE7Ki9CyKs/c5d/Fr1X97vgq7
         d88HUUEmUOFs2ySjUFdB5BT4t1Ke/VGDKOUsFDtj0GHlFUqh5+BzUvfPGVzDdpkgaWnR
         k+5lAiYVWk9r259Ee9aHhcKXOK+xpCs9B78mrDLlz6t3wQA65ALhvVMdeaepK+sG37Qr
         bLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497627; x=1796102427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVtjzQmPQKIEc4dGp9Zs/tHMBCi6CBGBAodRqCIBW78=;
        b=wAsQIoNtUP9QLyXyxb8YR7/wDgnGDyzrD2S1GsV1QViG3KcrwPZf8LzBROpV/zO2qB
         UDi9eMoD/a/pdoKkabKeOV4apGFWHd8xZg8T17U1QpEWS1s6Oy4644WnkCImsm9SdjjN
         4h/P8QYTWaYJ1xNcmblQlHEb3NhMoYtltXWSYo2TLIC7hqtYX0k2OWuMUaL0HldCDOgD
         8LTXHIkGJNMygrOpcx24jgn6UcfXrCpd9127D2i34XDcucSI0N3cRXzXS4V6L3eExht3
         eLs19xmaEgyRmIqdn1dAREjv/c940BQdzdoE+/38LkmE4dovBf8cUaJ8IgSkB32Jsqfb
         ccaw==
X-Forwarded-Encrypted: i=1; AL+hErFi7nWR13uqUK5p5ggG3EBEgp6v72ZTWpfvttJQvZnkMIuNN2E5qbPeem+meopVd3/BvYVZ2poqmdwefJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JUZEgZEOSGScE+AJEn3EGetiQCCmetbANXxhoDE6uEqr9YZWI
	jcyD5YKl16vP6c/oA0SSVinhwEp9pHj2jqW07pY/LG8JXYvBdwy+VKyX
X-Gm-Gg: AZFdTZcDYB6ZQq33tFBPE9w1T9C4XHs41YXxXWoSK2bad1fw5wBy5DheI3ArLc+v2kl
	+puaEpS/18BIT7YfGcU0JaQ2DLdqYSg0fxCQuCtTA2ywGAQ0qSo35PZUmYrvxg+JyRbyFliq7N5
	rOaKYbfVuOebVrXgXN5PrgiK8/U7jfr2J6hd19H6tWDxu8n7vp8+3971IZhMSnwAi24vsaWEoM4
	JfAXNY4VQRpQ18MRTFXAv+/bnLXGLCalS89Qz5Qg9iYUJxHQlEmRYKqJ2oxWuSJ++Y6Eb+fUPry
	dllckz/xk4WOawQhnh1myEDdbPy7ekhHPR330nt5Gbmc5CaANcFlX2Khb+VEiHHhHhUtqJsHdZ1
	35sg1Q+gLdKIjauvbXFM4elGXxol4WT2O9AsFLduknIjY+cbveGZPpd7FKf1c+sRq3Y2ItIT7lm
	8ZVSoEwW7kvIIwVTtR68LOxJ0FmwEYTxN7bEBEVOhWtStjyZeCT8acOpM7yzoigfJKfk4s8vUX9
	AkIGAb4HarD1V8fBYBsz78p7rk1/3KYscPhgx1utfhLVfwiF0D5ln4si/J73VHm+GF/ntPrLYNw
	nOx9lybfxbRNN3VcxjDpzr1xtKLcWHgk
X-Received: by 2002:a17:903:19cb:b0:2f0:3d60:9165 with SMTP id d9443c01a7336-2f03f0fcd4dmr130546855ad.11.1795497627540;
        Mon, 23 Nov 2026 21:20:27 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:e88::247:18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm65038495ad.12.2026.11.23.21.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:20:27 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org
Cc: Ming Lei <ming.lei@redhat.com>,
	linux-kernel@vger.kernel.org,
	syzbot+48ca80a8587c1d97c433@syzkaller.appspotmail.com
Subject: [PATCH] block: release freeze lockdep map under mq_freeze_lock
Date: Tue, 24 Nov 2026 12:20:23 +0700
Message-ID: <20261124052023.63506-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The outermost freezer records the lockdep state of the queue in
q->mq_freeze_disk_dead and q->mq_freeze_queue_dying, and the unfreeze
path checks them again to decide which lockdep maps to release.  That
check runs in blk_mq_unfreeze_queue_nomemrestore() after
__blk_mq_unfreeze_queue() has dropped mq_freeze_lock.  At that point
mq_freeze_depth may already be zero, so another task can start a new
freeze and overwrite both flags before the old owner reads them.

syzbot hits this with device-mapper: DM_TABLE_LOAD calls add_disk() and
freezes the queue in elevator_change() while the queue is still alive,
so q_lockdep_map is acquired.  A concurrent DM_DEV_REMOVE calls
blk_mark_disk_dead(), which sets QUEUE_FLAG_DYING and starts a new
freeze right after the elevator unfreeze drops mq_freeze_lock.  The new
freeze sets mq_freeze_queue_dying, the old owner skips
rwsem_release(), and lockdep reports:

  WARNING: lock held when returning to user space!
  #0: (&q->q_usage_counter(queue)#22){+.+.}-{0:0}, at: elevator_change+0x194/0x480

Release the lockdep maps in __blk_mq_unfreeze_queue() while
mq_freeze_lock is still held, so a new freezer cannot change the flags
first.  __del_gendisk() now relies on that release in its unfreeze
branch.  In its GD_OWNS_QUEUE branch the queue stays frozen, so it
still releases the maps directly.

Fixes: f6661b1d0525 ("block: track queue dying state automatically for modeling queue freeze lockdep")
Reported-by: syzbot+48ca80a8587c1d97c433@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48ca80a8587c1d97c433
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (x86_64, 4 vCPUs, PROVE_LOCKING) with a C reproducer that
races DM_TABLE_LOAD of a request-based multipath table against
DM_DEV_REMOVE.  With a debug-only msleep(5) right after mutex_unlock() in
__blk_mq_unfreeze_queue() to widen the window:

  base: 3/3 runs hit "lock held when returning to user space" within 1s
  fix:  5/5 runs clean for 120s (~7.5k load/remove collisions each)

Without the delay, the fixed kernel ran 2x120s clean (~5k collisions
each) with debug_locks still 1.

 block/blk-mq.c | 16 ++++++++--------
 block/blk.h    |  2 +-
 block/genhd.c  | 14 ++++++++------
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 54ccfc43c27c2..11abb296c3bb4 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -208,10 +208,8 @@ void blk_mq_freeze_queue_nomemsave(struct request_queue *q)
 }
 EXPORT_SYMBOL_GPL(blk_mq_freeze_queue_nomemsave);
 
-bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic)
+void __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic)
 {
-	bool unfreeze;
-
 	mutex_lock(&q->mq_freeze_lock);
 	if (force_atomic)
 		q->q_usage_counter.data->force_atomic = true;
@@ -221,16 +219,18 @@ bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic)
 		percpu_ref_resurrect(&q->q_usage_counter);
 		wake_up_all(&q->mq_freeze_wq);
 	}
-	unfreeze = blk_unfreeze_check_owner(q);
+	/*
+	 * Release under mq_freeze_lock: once it is dropped, a new freezer may
+	 * overwrite the mq_freeze_{disk_dead,queue_dying} flags it checks.
+	 */
+	if (blk_unfreeze_check_owner(q))
+		blk_unfreeze_release_lock(q);
 	mutex_unlock(&q->mq_freeze_lock);
-
-	return unfreeze;
 }
 
 void blk_mq_unfreeze_queue_nomemrestore(struct request_queue *q)
 {
-	if (__blk_mq_unfreeze_queue(q, false))
-		blk_unfreeze_release_lock(q);
+	__blk_mq_unfreeze_queue(q, false);
 }
 EXPORT_SYMBOL_GPL(blk_mq_unfreeze_queue_nomemrestore);
 
diff --git a/block/blk.h b/block/blk.h
index 105fff157bfbd..13648d3483930 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -55,7 +55,7 @@ const char *blk_status_to_tag(blk_status_t status);
 bool tag_to_blk_status(const char *tag, blk_status_t *status);
 enum req_op str_to_blk_op(const char *op);
 
-bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic);
+void __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic);
 bool blk_queue_start_drain(struct request_queue *q);
 bool __blk_freeze_queue_start(struct request_queue *q,
 			      struct task_struct *owner);
diff --git a/block/genhd.c b/block/genhd.c
index 69204d44adae1..2f478f320aa48 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -772,13 +772,15 @@ static void __del_gendisk(struct gendisk *disk)
 	 * If the disk does not own the queue, allow using passthrough requests
 	 * again.  Else leave the queue frozen to fail all I/O.
 	 */
-	if (!test_bit(GD_OWNS_QUEUE, &disk->state))
+	if (!test_bit(GD_OWNS_QUEUE, &disk->state)) {
 		__blk_mq_unfreeze_queue(q, true);
-	else if (queue_is_mq(q))
-		blk_mq_exit_queue(q);
-
-	if (start_drain)
-		blk_unfreeze_release_lock(q);
+	} else {
+		if (queue_is_mq(q))
+			blk_mq_exit_queue(q);
+		/* still frozen, so the freeze flags are stable */
+		if (start_drain)
+			blk_unfreeze_release_lock(q);
+	}
 }
 
 static void disable_elv_switch(struct request_queue *q)
-- 
2.43.0

