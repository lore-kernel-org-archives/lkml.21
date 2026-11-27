Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770049;
	b=nefrRwgciwdz2tfpdv5siCgVLlC9/PVK9vHdPjiFhtCQlKMPQp3RHFc/W40avAQ5z+t5
	 PjX4YmNk8D/0vjDyec81Bs0N26yItFuCg7RiGZanVJPkH1/7qokqFHeUGp3v99wfvrh1b
	 q3/yOUHbkMmOIMd4lPNR3WuZJB0awrECQzWkuVNkfUgk1UGmqlGiZYfI3w2gdpUs4CcBZ
	 2JSLAVq2W2QLzbTtKu3VOH/kQvkaqf7Y/luZ2izclUmkjJIfk8YCud7uHOgqbTHqN02Ix
	 eaofHtEqTtDOoppIBWBF15X+UaNMM2DCQYg6dDLKrf5HA+8496tTQyPupeRZqTtVRdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770049;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bGBbvEyNXQ9kpI+I2OBxN/fHwF8Lik0cSsDj+zUuuBA=;
	b=GygdSocBFm4bSMfp20Y/1KwMu0iyfLSfByZgFORdJk/wYz8hEFzatL3CdDFgXC7wdv+s
	 TUwBCoTUuBLRwu8A040yKaqFUMQ0JHcd4i2KNTPWcZMzxTCsjE1uEtOaIcURXUccpPeg2
	 cUe/mGxRzU5MWnnC3dsk/oAFChSymFF18AjSmHYhMBEvhN7sGXyy+epiGVDQBfBSFPPaI
	 M/mWVQMvZ2+6Pe4wJ323LCYKC3ADrMaKEX1NzhytCJBcfcACO+ZsygvkAeh5udj5QYMkK
	 wq9iG8PcYuUy70vE98/Z/A15lkV9mApJIp5mINoBOolQBK20B/YnA/9+ijMQxAacFVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4AC606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F4AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f052ae3c86so42483375ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770047; x=1796374847;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGBbvEyNXQ9kpI+I2OBxN/fHwF8Lik0cSsDj+zUuuBA=;
        b=Ry8FplEP/Z8FX1DFqKrgKuciUQIvyOfpjPiJ1vxnzleUblNU6UJJbNsN2poY4Aki8i
         fZa7jOBugP4RuBFKvNRDvdPkifgjFFhdgngatfRVD8MbBUOizvSC5tLGVQ/qG9S6jJJj
         XejOH19ew3/WmqA89Xaku61xQF9C6amOf6WVw7Tf8HG0TbTWAr8g039ydYrnRzWxcUb0
         Ul7q48vyL/V8deJgFQz+z4U0N4bIq9f07ShVW6TJmDiO0RGuWSEdyaXdWzdKYo9ohgzK
         +M5GwjzgCWm+C96ei1AMpg4O0Tk1op9l7JyHnSS8tdrRRhMNBlwE1L5eFC9FErePzqEG
         j/AQ==
X-Forwarded-Encrypted: i=1; AL+hErFt0/tAFbHz9mi73ObGQlaUbRfAFWi/S8jgS653GmgfYpb3fJ2hfSVaCnTsKMP+q+gqIK0m3FUksyIl/uE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gbkovcLgKn9ft6NFfBR0PDBG2fMq4SbkTaI1pSzsAOp/n4HMh
	+ijD7teD506Z6nYbqJfi7Zz4EH6SZccmBrM49acS2/ehE3Be1kv/ecrt
X-Gm-Gg: AZFdTZdDuYqYr0dS0za3vGt3/WDB6nkKD/OIyKMKl8g3i1qk//vSW3Xs1ftwahGUtV9
	LRuA6hIuTgK0incZSHPgrj7FdjT+Ger2QYdtdHCQ9G194ViEVF6kkDwY4ZxS6XRf+jpA85hGUq7
	tgWGT4QJvtP8iV5TIRRRUXOD/zsG1xiLSzk9biFdBKbIU6TmPZ/ueX7NsjsVenZJRvT8JvzhrqV
	bXAQUwTUeVbYse2We5SceNSTCJ09MUGdEOutQquTEXc5dVfI27EU7edwtTJklP2VZt0PaPLQimJ
	GET0WktD3KiCDIf7UMhNZQ7eanZbiYO0nzdPm2MRKBWjeOtUYtehIvHcZqbSZ9ctWzimYb21+jK
	J3PvvW87owLPL4P/+ZDkyf92hMUiQnchVIpj52PjbemTaQriBrs5sr1eKoo74VJYIrpEka8IucN
	d8WIIGyxGUKt9gkVRf3lfHCHN9EkF5YK5BEUMQhpcaUKRD8gGJ6SSjDnHA3zAYNVMfyWrRKrBt/
	51Jl4rQXJbdcgzP9cUkIW+dOEmF3b0m+OHytRx32Y1OWVJekHhuXXkES/wh0SxBxw/yOdkqQ1rn
	h7xrLeG5X4iKmY+0QOD+hnkAsE0pe0Rk/FL/K3eJjaLeb5i+Vei7rlxIo8oezkpHBsCegsI9lGI
	AMsQAL62yDhq+atCVgk6REW/oHaaDX+/0dQ59ZVdH7SAk8g==
X-Received: by 2002:a17:902:d542:b0:2e9:6790:212c with SMTP id d9443c01a7336-2f03f190776mr241381205ad.30.1795770046311;
        Fri, 27 Nov 2026 01:00:46 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:00:45 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: speakup@linux-speakup.org, linux-kernel@vger.kernel.org,
 chris@the-brannons.com, kirk@reisers.ca, w.d.hubbs@gmail.com,
 stable@vger.kernel.org
Subject:
 [PATCH RESEND v3 2/4] speakup: Do not hold spk_mutex across catch_up()
Date: Fri, 27 Nov 2026 17:00:41 +0800
Message-ID: <179577004191.23588.7998850093219957436@kylinos.cn>
In-Reply-To: <179577002884.23588.802785530849276690@kylinos.cn>
References: <179577002884.23588.802785530849276690@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

speakup_thread() holds spk_mutex while calling synth->catch_up().
Apart from the indefinite retry loops fixed by the previous patch, a
synth that digests its buffer slowly keeps the mutex held for the
whole drain, so loading, unloading or switching any synth module
blocks until all pending speech has been output, which may take
arbitrarily long.

Take spk_mutex off the catch_up() call path and keep the synth alive
for the duration of the call instead:

- speakup_thread() raises a catch-up count and releases spk_mutex
  before calling catch_up(), re-taking it afterwards.

- synth_release() first clears synth->alive (which makes catch_up()
  return) and wakes the thread out of its sleep, then waits for the
  catch-up count to drop to zero before releasing the synth
  resources (sysfs attributes, variables, tty).  The synth buffer is
  cleared there as well, so a switch discards the text still pending
  for the old synth instead of waiting for it to be output.  As
  synth_remove() only returns after the drain, a synth module cannot
  be unloaded while catch_up() still runs, so the synth structure
  and its tty stay valid for the whole call without any module
  reference counting:

    CPU0 (speakup_thread)          CPU1 (synth_release)
    -------------------            -------------------
    atomic_inc(&synth_catch_up_count)
    mutex_unlock(&spk_mutex)
    synth->catch_up(synth)         spin_lock(&speakup_info.spinlock)
      /* reads synth->alive,       synth->alive =3D 0
         synth->io_ops, the tty */ spin_unlock(...)
                                   wake the thread out of its sleep
      /* returns once ->alive      wait_event(!synth_catch_up_count)
         is 0 (loop exit of the    /* resources torn down only
            previous patch) */        after the count hits zero */
    atomic_dec_and_test(...)
      wake_up(&synth_catch_up_waitq)
                                   synth->release(synth)

The SPEECH_KILL key handler can revive the synth at any time: the
is_alive callbacks set synth->alive back to 1, so a revival landing
after synth_release() cleared it keeps the loop running and the
drain blocks forever.  Mark the synth with ->releasing under
speakup_info.spinlock while it is being released, and have
spk_synth_is_alive_restart() and spk_synth_is_alive_nop() skip the
revival then, so the drain always terminates.

The wake_up_process(speakup_task) sites (spk_do_flush(),
do_synth_init(), synth_release()) get the same treatment: the
keyboard notifier is registered before the kthread is created, so a
key press in that window would pass NULL (or the kthread_create()
error) to wake_up_process().  They now take the task pointer under
rcu_read_lock() with READ_ONCE() and skip IS_ERR_OR_NULL() values;
the exit path unregisters the notifiers first, and
atomic_notifier_chain_unregister() synchronizes with the RCU
readers, so by the time speakup_task is cleared no wakeup site is
still running.

After this change spk_mutex no longer serializes synth registration,
unregistration and switching against speech output.

This depends on the previous patch: the catch-up drain introduced
here assumes that catch_up() eventually returns once synth->alive
has been cleared, including in the local catch_up() copies of the
serial synth drivers.

Fixes: 2067fd92d75b6 ("staging/speakup: Move out of staging")
Cc: stable@vger.kernel.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/accessibility/speakup/spk_priv.h  |  3 ++
 drivers/accessibility/speakup/spk_types.h |  1 +
 drivers/accessibility/speakup/synth.c     | 59 +++++++++++++++++++++--
 drivers/accessibility/speakup/thread.c    | 11 ++++-
 4 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/accessibility/speakup/spk_priv.h b/drivers/accessibility=
/speakup/spk_priv.h
index 9da57ead17cb..967862cd0440 100644
--- a/drivers/accessibility/speakup/spk_priv.h
+++ b/drivers/accessibility/speakup/spk_priv.h
@@ -75,6 +75,9 @@ struct spk_synth *synth_current(void);
=20
 extern struct speakup_info_t speakup_info;
=20
+extern atomic_t synth_catch_up_count;
+extern wait_queue_head_t synth_catch_up_waitq;
+
 extern struct var_t synth_time_vars[];
=20
 extern struct spk_io_ops spk_serial_io_ops;
diff --git a/drivers/accessibility/speakup/spk_types.h b/drivers/accessibilit=
y/speakup/spk_types.h
index a5762330e249..efb931db1850 100644
--- a/drivers/accessibility/speakup/spk_types.h
+++ b/drivers/accessibility/speakup/spk_types.h
@@ -200,6 +200,7 @@ struct spk_synth {
 	unsigned char (*get_index)(struct spk_synth *synth);
 	struct synth_indexing indexing;
 	int alive;
+	bool releasing;	/* set while synth_release() drains this synth */
 	struct attribute_group attributes;
=20
 	void *dev;
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/sp=
eakup/synth.c
index 6a49ff475c16..40870949b3c6 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -24,6 +24,14 @@ char spk_pitch_buff[32] =3D "";
 static int module_status;
 bool spk_quiet_boot;
=20
+/*
+ * Number of catch_up() calls currently in flight, and waitqueue used by
+ * synth_release() to wait for them to finish before tearing down the
+ * synth resources they may still be using.
+ */
+atomic_t synth_catch_up_count =3D ATOMIC_INIT(0);
+DECLARE_WAIT_QUEUE_HEAD(synth_catch_up_waitq);
+
 struct speakup_info_t speakup_info =3D {
 	/*
 	 * This spinlock is used to protect the entire speakup machinery, and
@@ -154,6 +162,8 @@ EXPORT_SYMBOL_GPL(spk_synth_get_index);
=20
 int spk_synth_is_alive_nop(struct spk_synth *synth)
 {
+	if (synth->releasing)
+		return 0;
 	synth->alive =3D 1;
 	return 1;
 }
@@ -163,6 +173,18 @@ int spk_synth_is_alive_restart(struct spk_synth *synth)
 {
 	if (synth->alive)
 		return 1;
+	/*
+	 * The callers run under speakup_info.spinlock (speakup_key()
+	 * holds it across do_spkup()), which is also the lock
+	 * synth_release() takes to clear ->alive, so checking
+	 * ->releasing here cannot race it: a synth being released is
+	 * not revived, or an in-flight catch_up() draining to a stuck
+	 * synth would never see ->alive cleared and synth_release()
+	 * would block forever on the catch-up count while holding
+	 * spk_mutex.
+	 */
+	if (synth->releasing)
+		return 0;
 	if (synth->io_ops->wait_for_xmitr(synth) > 0) {
 		/* restart */
 		synth->alive =3D 1;
@@ -197,6 +219,8 @@ void synth_start(void)
=20
 void spk_do_flush(void)
 {
+	struct task_struct *task;
+
 	if (!synth)
 		return;
=20
@@ -209,7 +233,11 @@ void spk_do_flush(void)
 		}
 	}
 	wake_up_interruptible_all(&speakup_event);
-	wake_up_process(speakup_task);
+	rcu_read_lock();
+	task =3D READ_ONCE(speakup_task);
+	if (!IS_ERR_OR_NULL(task))
+		wake_up_process(task);
+	rcu_read_unlock();
 }
=20
 void synth_write(const char *_buf, size_t count)
@@ -476,13 +504,18 @@ int synth_init(char *synth_name)
 /* called by: synth_add() */
 static int do_synth_init(struct spk_synth *in_synth)
 {
+	struct task_struct *task;
 	struct var_t *var;
+	unsigned long flags;
=20
 	synth_release();
 	if (in_synth->checkval !=3D SYNTH_CHECK)
 		return -EINVAL;
 	synth =3D in_synth;
 	synth->alive =3D 0;
+	spin_lock_irqsave(&speakup_info.spinlock, flags);
+	synth->releasing =3D false;
+	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
 	pr_warn("synth probe\n");
 	if (synth->probe(synth) < 0) {
 		pr_warn("%s: device probe failed\n", in_synth->name);
@@ -510,13 +543,17 @@ static int do_synth_init(struct spk_synth *in_synth)
 		return -ENOMEM;
 	synth_flags =3D synth->flags;
 	wake_up_interruptible_all(&speakup_event);
-	if (speakup_task)
-		wake_up_process(speakup_task);
+	rcu_read_lock();
+	task =3D READ_ONCE(speakup_task);
+	if (!IS_ERR_OR_NULL(task))
+		wake_up_process(task);
+	rcu_read_unlock();
 	return 0;
 }
=20
 void synth_release(void)
 {
+	struct task_struct *task;
 	struct var_t *var;
 	unsigned long flags;
=20
@@ -525,8 +562,24 @@ void synth_release(void)
 	spin_lock_irqsave(&speakup_info.spinlock, flags);
 	pr_info("releasing synth %s\n", synth->name);
 	synth->alive =3D 0;
+	synth->releasing =3D true;
 	timer_delete(&thread_timer);
+	synth_buffer_clear();
 	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
+	/*
+	 * catch_up() may still be running without spk_mutex held (it gets
+	 * taken off the mutex by speakup_thread()).  Wake it out of its
+	 * sleep and wait until it is done before releasing the resources
+	 * (sysfs, variables, tty) it may be accessing.  speakup_task can
+	 * be an ERR_PTR here, when speakup_init() failed after the
+	 * command-line synth_init().
+	 */
+	rcu_read_lock();
+	task =3D READ_ONCE(speakup_task);
+	if (!IS_ERR_OR_NULL(task))
+		wake_up_process(task);
+	rcu_read_unlock();
+	wait_event(synth_catch_up_waitq, !atomic_read(&synth_catch_up_count));
 	if (synth->attributes.name)
 		sysfs_remove_group(speakup_kobj, &synth->attributes);
 	for (var =3D synth->vars; var->var_id !=3D MAXVARS; var++)
diff --git a/drivers/accessibility/speakup/thread.c b/drivers/accessibility/s=
peakup/thread.c
index 2fc75e60fbac..5279e112248b 100644
--- a/drivers/accessibility/speakup/thread.c
+++ b/drivers/accessibility/speakup/thread.c
@@ -50,9 +50,18 @@ int speakup_thread(void *data)
 		if (synth && synth->catch_up && synth->alive) {
 			/*
 			 * It is up to the callee to take the lock, so that it
-			 * can sleep whenever it likes
+			 * can sleep whenever it likes.  It may indeed sleep for
+			 * a long while, e.g. while draining to a slow synth, so
+			 * run it without spk_mutex: synth_release() waits for
+			 * the catch-up count to drop before freeing the synth,
+			 * hence the synth stays alive for the whole call.
 			 */
+			atomic_inc(&synth_catch_up_count);
+			mutex_unlock(&spk_mutex);
 			synth->catch_up(synth);
+			if (atomic_dec_and_test(&synth_catch_up_count))
+				wake_up(&synth_catch_up_waitq);
+			mutex_lock(&spk_mutex);
 		}
=20
 		speakup_start_ttys();
--=20
2.32.0

