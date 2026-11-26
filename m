Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661120;
	b=qN6I6YPkmNcoBOzorp6tHK4F0ktgG70yMPw7gapehvwMOWWMARbXT6j5KCxVcPy45rtG
	 mLgt1M5oqw9KLu/xmQGXGUdHAq2oPMY9bQNNqXD9tsbNI+D6NRMajAGdcFT0of9DPL4yc
	 W3gonk0J6gVAbMK8Wvm8joq1VM1XVmcXLOINs5GAFMU4Qr5mFrEuKafwbZnmCqbQb1KtN
	 kyyithabOh3KTc4uF37TlHXaY93lfVJz0oAJ4V1Q/V1BPsvkJ0R83MTKZkhzHDaTwqeYp
	 Lep3BtEC4YtirpQQHEC4JGKO4ZVkKqmUopJ1LUoXbdSRf2sqtE4Yh7m2fbogZoiIMXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=gkZgmOXe8E8lJdEQKBCDcbGRoKNnBZ93I+C3olx35lE=;
	b=aaox8GRrpHuzcCrFFpS2pioILJObZ+QGdmttdCrm2zEtLeL5kqyNYJrugbz02Qjn1Rxs
	 vnEQxdg3GFtoS37PoPN7nqDO4uvIJqENUWlwtA2M0z3sqj4BsDIRIXxSamkKZzi1xNNeM
	 hAb1DMsIphXw/IkssTdGKI0ToqoUmAW87lQ/UzU6nqZcUDAPHCeN+s+jB+4+R4NJ6cf4z
	 nXdFu4tjb26HlTAi350CQKNjDljgCcLyMdoKdT5ceQfxQfiOkrh7MyUgd47RwqBYFVPuu
	 ovS5kf8xBSRcZod1QsE7gBfndHGo0zTgf4jUo98wTxNFSffSGG71aVY2zcbl1nxtD1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=LcNtLRG8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00884606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00884606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=LcNtLRG8
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b315dd057bso41571367b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:45:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661119; cv=none;
        d=google.com; s=arc-20260327;
        b=QWriLjQCoW3FenMaoPOBMZ2WhlEqdfbGGYufNamsshuiDw/rtnxJI2MlCkQqHfYe5+
         CYVjHEyGvpaxZggXvoTExw5kVzTZqdhCUfQ56hAb2c1B0DUcEc4nHSO57mSdml8k1XWF
         DhTnLD/G1/7BNdL9J4f4CrdQ/aljbpWzxlydGHNCpdbwmjdJG3bDqLWyukLIESyHcMYu
         +uGs9rGh6CsDANGe89wM/YLvwqY+JyH8PpZGUx+sonT8UvXEKsqeFA4EXXy+7oQd3NSi
         i4a/OLRkP69WM/ZlXDWKClB6lOttkp7QZ3ve49kZuN68SyUO61ljGg+8wzrxDm6/pP7V
         UXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gkZgmOXe8E8lJdEQKBCDcbGRoKNnBZ93I+C3olx35lE=;
        fh=RxrU20LEGR02eZm7UtqgQhodJfomfFuGJ3lV5WHfcv0=;
        b=Oq0BvZ/CM07rhId3CFgR/LyachtYd3uCDkehyfEkF5f5uhzu6GkksK8S79zhTjR3lg
         AGm9LnQcnn5Eq8/GwE/4IDNAk6EeaSs5LsLTermsRawwW/KktiXs7ZqAxLgS2TRf6eVM
         DmbxaO0AL4005m6Kj22DqlSxIClKmLwGrolzey3WHdlAyl0EhIsC9YH4iLycSMBxb41P
         6mR2Rx6wYP5hWAwJpatAPdYosat5Pyxw3lAXe4q/xWnDuX46jHuvPG8U/TUeBs17+aMA
         PknSNnoaSCzVwwvfWwwDzioGEeCO674wnrrHSdjRkzD9ErMp/C6hC00sgyoCns7iA/0t
         aYHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795661119; x=1796265919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkZgmOXe8E8lJdEQKBCDcbGRoKNnBZ93I+C3olx35lE=;
        b=LcNtLRG8erXdCwZnbSnOIVksVMcJdh6PI96GV+GvDCbr0oojSxSoeQQi512IFQi5iE
         qklzsgSPgczps7Eth6YMF3FbN1HYi08adXCUc6k8tGy07zvxSYTiHIdaAs5XUz88WtZT
         UX654o1evIqrUyhAD1iuX7QnpaXcMZnJQPMA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661119; x=1796265919;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gkZgmOXe8E8lJdEQKBCDcbGRoKNnBZ93I+C3olx35lE=;
        b=CPV/WI9tCH22dyF4PujPx5SuyOuEgExNiBZgTI8RKRg+p8UHUakhy1kMQ26k/H54vr
         K9gPn27B4UbZKDFtay/c8VJCslRXxl+tMzoYtjR9oPKZgI6TPJ72ioPXNHZ9CQNztQC/
         dxfYDJtBM404890Y02E9hvJconkvtTOZh3QINySif1cCFJaI12D5Z/3bEdekkblf7vMb
         imZbhtlwBHbA++VW/8mC6FccDnV1hj490y4Lam9vZ7BW1deBTwGkps5XEoUdLEmvneI0
         n35ysy1Wf6aT+2JhxnkDXP8qAaxL/HVY09cRrJKCZP7PU3uoo2QqxfU0zj33469DN32M
         QPfA==
X-Forwarded-Encrypted: i=1; AL+hErELgWRJEqeIofzjmitTiozLlT/xrHeNeYPmyRQSedUXUL2lcI/7hohd6p4bDxgpc9Wwe+Tu7eEhEcDQqEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z//9Y6kkk7LUZbH6NK6A8T339/dzZwvbkdcInSuNtZY1nLzJP0+
	O8lKTG7QI6Q5UVoXkExvkms71iTfB6nYoXfxf4ASpFSXqRjPoX6obJU4ZIJ8UsNeMKrwPSQVqYM
	CPfMCa8OkPEXXwCCxmklN1AR732yYwFXKZL0mBeX1uw==
X-Gm-Gg: AZFdTZcKaemt7voryDvM9nCTRVSANmOo7//ZO1M5YuhgBit7pE+Iq7qkAyb4f3o5PWn
	dU0gZ+823TSalqUoG7fptAPtlg4bL6n+YbZKk3SKjq5M7QOkvtPjn5DDcoSfivyKE581CPmhAC2
	r61Y4M9L1LoAKdaRR/4NJevtuVVIiACUU1YrIv7nLAJZs++323yVxbcgN7GNigQKWEvcWUbMjFw
	uKsthO7D9L0in6QexKnJB5HE8eJ1/MhAT+0Rt5EPdxcmBsPPAW59AZhDmJEneOpJeREpkRaNzhn
	JLjwI/wVxd7wTqxipqLKQq/XzsXlRIhAeRIZG91Vh4prAB7TuBjcFv48vya8zTgGsiklCFe2wpE
	HzSSvF4JM9jP0KesUOwfmARpkfmygPYjdfqCim6KXRt1QKmREqeDPzpF6AIIFHH35idfbl7HKPy
	bg/CPjw+/HHyLC0L7SOP3paGVnFBlEgYuh0GYoyU9hV3juG47xaJj4dmo4Rhl2awhkFpf4/b+cT
	NhSxg7Cdddxvllh7n8t7De8NaFe9CHR1SUUb/2kVeIyfRTfgRu5SjvdLg==
X-Received: by 2002:a05:690c:6a0a:b0:8b4:e12c:2f50 with SMTP id
 00721157ae682-8b52050359bmr80461867b3.54.1795661118784; Wed, 25 Nov 2026
 18:45:18 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 18:45:18 -0800
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
Date: Wed, 25 Nov 2026 18:45:18 -0800
X-Gm-Features: Aa3M54rYGng247e5y8utKg1O4hSM46vZpPVS3jQbU2tGTPrp3PfXTQnh2WI-eqM
Message-ID: <CAFaZ9ep26fhdkKcXZHOPSndkE9UV9x7k6GaX1Himi_+c28XLyA@mail.gmail.com>
Subject: [PATCH 5.15.y 1/2] signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
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
[ adapted to 5.15: use PF bit 0x01000000, 0x00800000 is still
PF_SWAPWRITE here ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 561fb81675fa..523d727d27a7 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1703,6 +1703,7 @@ extern struct pid *cad_pid;
 #define PF_KTHREAD		0x00200000	/* I am a kernel thread */
 #define PF_RANDOMIZE		0x00400000	/* Randomize virtual address space */
 #define PF_SWAPWRITE		0x00800000	/* Allowed to write to swap */
+#define PF_NO_NOTIFY_SIGNAL	0x01000000	/* see no_notify_signal_save() */
 #define PF_NO_SETAFFINITY	0x04000000	/* Userland is not allowed to
meddle with cpus_mask */
 #define PF_MCE_EARLY		0x08000000      /* Early kill for mce process policy */
 #define PF_MEMALLOC_PIN		0x10000000	/* Allocation context constrained
to zones which allow long term pinning. */
diff --git a/include/linux/sched/signal.h b/include/linux/sched/signal.h
index 6f105308ab5f..c271fe5c2548 100644
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_SCHED_SIGNAL_H
 #define _LINUX_SCHED_SIGNAL_H

+#include <linux/cleanup.h>
 #include <linux/rculist.h>
 #include <linux/signal.h>
 #include <linux/sched.h>
@@ -365,14 +366,36 @@ static inline int task_sigpending(struct task_struct *p)
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
