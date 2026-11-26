Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661118;
	b=YdT/M7dvw7zPNnP8XaSHg9RhM+jzHS2EVpJGp44jkOGPpaa0IWsxbkHw2Q0Ossatq0xh
	 KnEJI+JrLASAobBT91J2qm2bdTebK5e2QyeznKiNbswycZoz1iByOxR9Adq2rsGa39gg+
	 nohIABW2JGaD+dUUt9Ql6f9z0ZPYfWPhDXw9PLQjCbfx/4PqIv63RQ2rx9leCwIeA9qhu
	 MOtnFt/IZn81LGN3gRpkVogxLcYC5RmS9OaQAYFoUa73KdwOlE5eBb/jjLsQ9qVMlaYWy
	 0ubIvx55nGUBqqEZDOW1Y/2lonG55ntWYzamCiEGb7htgYqHprCqYunGArC2YXAKeAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=GGVu2LAHkDf3iJCcJXqnrLKgzUFBeUsFgEKNp1vIP10=;
	b=03Y6vqR7jbAxeE7amk3vbjhlrusK4pLZ/sfDBQB21iQefMY5ktVKyKyXbh9JIvKYT0RS
	 Ol30oRB33aB6C9LdncMcmissAzYQ+KAck0gj5AvKba4gMItTqfSe76Fu4mqmc4GmJyImA
	 j44hbqFqHbPLqfVJ7GUIWwoKs/2YMq/KM2I0MQUUF/wzRt3FxWZGKS6OAhIAJ+ywTXsKm
	 VMaIMUhJRsQsaQkS3M/TZr/Y5rykbL1AFQe1XiZD7fvrBT8Dmhg6KMmywe9+UtOEWs7pn
	 klaOppE/4jNBr6mDqq4idX0eZJ0p6AKiIh13J3oMcmbyJz9PMBQJWUjl4YC0zS9H50g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=Huo9dShm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5BC606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD5BC606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=Huo9dShm
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da69e7c31so7145582d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661117; cv=none;
        d=google.com; s=arc-20260327;
        b=AGFSyWx1Q4Zz0lUL3Z3K0FVFq/SxYK9agPd5i1EG4O0+N1TXiI3RTG/ANBDtUsqK7/
         JTudsbMf3Th85Bset/I0bQQFxNm9ObxjLFy9NCDdHs4N5x209LD6+CEVx8mMJRQKO8YO
         30tzS4FSkzdmIAVrTVkmwWfLfbZwzAY9d8lB1OT+infrOcjhqtPYz43+Rr9LST+V2wCn
         0bfjHhGDZtV4t4csUVtb/A/2JO54IBz9eY5j6wt5jgmOOScXuN7SJz8WwLlT6pvAyIHg
         ZYMVJJCjG5LU0wcEOhA1VRlx7PDgaQE8Z6a9NrjBl7fd+cMwc926DytfETPlRfCulTRE
         HXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GGVu2LAHkDf3iJCcJXqnrLKgzUFBeUsFgEKNp1vIP10=;
        fh=LNBiNYab/t2wSIBPJ/kO6Pk7gSuwCCMnW+FuGxIrxsA=;
        b=rBrd8baIAvQqXcwVzWq050TRjetjsxfDpH9girExJy7IOuSMpiUTV5Yzr3dCr27T5h
         h0ILCQ307X6FSQ0RHJeY1wmXO9ZnrnzJhvSgNmpIFp34RgY3Chjz+uuo4swBSPXqgni6
         PK2PBKTRgX9q71r3F8gLxHzNY0XoLdo4uiZcT/NZGsBNkfxKddOPZFSzyPInPWcOw8TR
         FfQiSh/yzx8JXtBYM1r1dG2AdJ9Vdu3HGl7Io8LvRpo3gxZ3WCeMb7RS4K+uwQibIrWl
         JijxivRTzoRL+kV94EbJFYJD6Wpshp0coxkmSzFicnOf751v3Lbi8M6cEuaYtfSaiKTN
         LDEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795661117; x=1796265917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGVu2LAHkDf3iJCcJXqnrLKgzUFBeUsFgEKNp1vIP10=;
        b=Huo9dShmB4eTHar9RyfY+1EEiktCh0weT6eOp7AK+RJ8puODlNzkjqnk/gkCAghpgp
         QGc/aAifzloiK3KKt50fcwGS0ZR3rEGqRiqez/8X+ESst+cEinR2d7WE//p0/JXwnV18
         bwR2fBwE4oB0Y+yGEPjq3wuSmXjWVRZjLjDAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661117; x=1796265917;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GGVu2LAHkDf3iJCcJXqnrLKgzUFBeUsFgEKNp1vIP10=;
        b=2zGMDlxI6Ff3kWO+i+1Ry38nGV7yyVKXXZKt8u6Q0znfbx6rfI61Othw78asemMbKr
         M3LBMA4F0DEGxvRKgTQxASXGKhOX2MC6AF8r2gsPKnYGMThTadwEO/iDoVpG6CLzTcA9
         jnIGqhRKNj/7rxaYAV2Y1iLIpwHXkDySBa/TblQWppgWFIz4luZt3TP6Tgp2fOO1ry0k
         ABEjOaU6FbF0UNQgYbsqyJA/I/h9ODQqhKzjWE1OO//sURzb6eDNN1jRF0cQNa8tLfhx
         27hh/BGmCpxWMdKLdl1nZTbacRCQqSPwud7tyy5ZGeHnMnRnH/nLwrwKIdeygucRS5aa
         Dkhw==
X-Forwarded-Encrypted: i=1; AL+hErFTdzZYIrOEzBhW5PEvQR5LtzySJbAteSjHMDGk6p71tReILhterpMFPptPeobTQiRGb3DA6b0jT/msVZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M/TvrfseTrQGgY5p/SGU4/Ju26EmGjg4OLHwe5VujXFLoFUE9
	T+b2mMX4o2A/5RLwj6FT0t35v9erCqTT60tUoDQfZGpNdWvIfZFhtwRWx8Kk+LQWpULHk5X9tdq
	K6DELZdi4gR11q+Ns9vdjdonldYiNYVaGTWZXhA1NGg==
X-Gm-Gg: AZFdTZfgRBYugZ3Ho0sTSiVu0odMzMcykz6w/3fzq5hV86SKnuiPn0jB0nGeIO35DTs
	ai3fhZHE3XlDBZxLbkvsjGwB+C5zquIlDNa6zHM+3xP/JKi8i3Nkp2t4IMy4dT9M23t9dB73j2r
	lWWolNccCTnf3xeK5yEHSec6Y2R3UwqI/hdfhgDspDAkkljNkdMu7D7LFE6on7YBrGmOJ2EE+Z+
	PcwYL17JsRdIpxOEoN0TUXuBil54Iet0QEMMD+ELVzkpMQkik32RlG7VSOYSr/+E5bDcXOXkXus
	uq9yOY6SYqX8N4lefcpisVIE7FI+h2rD+PmNcn9X5SjbODou9lOMmbGyQrCSzKch4fKWDLqedPY
	0CfztbBRKnQwNF0lDyKZhuL1oXmpRsA4lTcWUN0iZpoItsI9JQHX4bbC700scBZ884RkI+q96a4
	CTYbvgj2CJ2ME+ieY2wOX0Iv7r24HiGubWCCxKWmx2UXft4JANwWWoNoDoPOtQzgIwbKrl7KhPL
	wZTvlVc9ua57OcMIU0j5UDi2PoZFEXs5jcMsw==
X-Received: by 2002:a05:690e:4505:10b0:67d:be72:879b with SMTP id
 956f58d0204a3-67df44c230emr6133951d50.81.1795661116641; Wed, 25 Nov 2026
 18:45:16 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 18:45:16 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dickson Wu <dickson.wu@certik.com>
Date: Wed, 25 Nov 2026 18:45:16 -0800
X-Gm-Features: Aa3M54q8QrbiHxph-P-I586S9RXcVG2RoodKKg3v3nkECQJtpo61OGNzcer7D2M
Message-ID: <CAFaZ9eoNqw+mFPg2RXkP=gd=VPkHy3xxOFkj3Vc5iCpqSxwawg@mail.gmail.com>
Subject: [PATCH 5.10.y 1/2] signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
To: stable@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Christian Brauner <brauner@kernel.org>

commit 22b7f491be8f93ff72de0a3fe02b8ee9e64d3f21 upstream.

TIF_NOTIFY_SIGNAL is used to kick a task in uninterruptible sleep to
return to userspace and run task work and then go back to sleep. This
mechanism works well but breaks e.g., coredumps. dump_interrupted() only
allows fatal signals to interrupt a coredump and the whole regular write
path going to actual filesystems is impervious to TIF_NOTIFY_SIGNAL as
well.

Add PF_NO_NOTIFY_SIGNAL and helpers to raise and restore it. This is the
same approach as memalloc_nofs_save(). signal_pending() will not report
a fake pending signal via TIF_NOTIFY_SIGNAL if inside a
PF_NO_NOTIFY_SIGNAL section.

No functional changes.

Link: https://patch.msgid.link/20260824-work-tif_notify_signal-v2-1-6609e42b3157@kernel.org
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
[ adapted to 5.10: use PF bit 0x01000000, 0x00800000 is still
PF_SWAPWRITE here ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c5bd595f560..52624ff4a1f5 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1564,6 +1564,7 @@ extern struct pid *cad_pid;
 #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
 #define PF_RANDOMIZE		0x00400000	/* Randomize virtual address space */
 #define PF_SWAPWRITE		0x00800000	/* Allowed to write to swap */
+#define PF_NO_NOTIFY_SIGNAL	0x01000000	/* see no_notify_signal_save() */
 #define PF_NO_SETAFFINITY	0x04000000	/* Userland is not allowed to
meddle with cpus_mask */
 #define PF_MCE_EARLY		0x08000000      /* Early kill for mce process policy */
 #define PF_MEMALLOC_NOCMA	0x10000000	/* All allocation request will
have _GFP_MOVABLE cleared */
diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index 3a1b4c5118cd..dd468059ce71 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_SCHED_SIGNAL_H
 #define _LINUX_SCHED_SIGNAL_H

+#include <linux/cleanup.h>
 #include <linux/rculist.h>
 #include <linux/signal.h>
 #include <linux/sched.h>
@@ -366,14 +367,36 @@ static inline int task_sigpending(struct task_struct *p)
 	return unlikely(test_tsk_thread_flag(p,TIF_SIGPENDING));
 }

+/* Prevent TIF_NOTIFY_SIGNAL from interrupting this task. */
+static inline unsigned int no_notify_signal_save(void)
+{
+	unsigned int flags = current->flags;
+
+	current->flags |= PF_NO_NOTIFY_SIGNAL;
+	return flags;
+}
+
+/* Restore the previous PF_NO_NOTIFY_SIGNAL state. */
+static inline void no_notify_signal_restore(unsigned int flags)
+{
+	current_restore_flags(flags, PF_NO_NOTIFY_SIGNAL);
+}
+
+DEFINE_LOCK_GUARD_0(no_notify_signal,
+		    _T->flags = no_notify_signal_save(),
+		    no_notify_signal_restore(_T->flags),
+		    unsigned int flags)
+
 static inline int signal_pending(struct task_struct *p)
 {
 	/*
 	 * TIF_NOTIFY_SIGNAL isn't really a signal, but it requires the same
 	 * behavior in terms of ensuring that we break out of wait loops
-	 * so that notify signal callbacks can be processed.
+	 * so that notify signal callbacks can be processed. Not for a task
+	 * that asked not to be interrupted by it, see no_notify_signal_save().
 	 */
-	if (unlikely(test_tsk_thread_flag(p, TIF_NOTIFY_SIGNAL)))
+	if (unlikely(test_tsk_thread_flag(p, TIF_NOTIFY_SIGNAL)) &&
+	    likely(!(READ_ONCE(p->flags) & PF_NO_NOTIFY_SIGNAL)))
 		return 1;
 	return task_sigpending(p);
 }
-- 
2.43.0
