Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770033;
	b=lb7C4/WXND8+kAGczq5mdQA3DvUSgFKBBHODnfgNmQL7Egvw7xQPBn+3nZDoHeXfRPGF
	 qE+hHJBu6WhRESa+qq4UgZOyuYuUcAj30DATW9uiWYA5FyUIkgxJSOQYoN8116+9nFVQi
	 Q6iNa+qg1jQ4Mbnq2rFN0ulFS9opSaiD1CQM+IPh5RynUgWp9msxeLDorlLLMsnxMsU9u
	 LscNkM7MmviD07ZnxAnnwlgXGs1bm0ThhnB4D3aCVBpXat9qoSKQ+O4RaEytecEBI9C8t
	 c/JEv/a1BDbYUXkytztbNLE/0XRquMaK7NQhaCs/zHkpolY4KnTcfsk7JUWWGhFhPfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770033;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=rOPZg4MvcQV19PSyH//5nx2RfgdbxY+varkZNiQRKts=;
	b=fIdR76IrIf8wn/TF4n9Da9CZIeuaiyao8ps+u2vXTaVSganGrhRp47Q4fsq2C+aLkjN5
	 m4TLHbkUqOH0koborMV+Emi+5+1DVBIvJSHipJztYrfNAMEFPNIAnixkW+AIsUVaE98L1
	 inXOvTjgL2WpB/BDZvtSimSokcdx7spPun4Upbou9NaIUAqeByQk06RtkV/i3js2kAGx8
	 BhQr80xsSiQ+fK9ddixXpt5V4G4pQfk8//GhDhp6AjePjklB0uPpA2PDFAnx0hwYQCs9O
	 X8LYp9P3WBOW66NT+fvYIW8PsxjX622DUfJY4NGyM3ZfDsRgqzpNqrUL5jUgtMBK44Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A974606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A974606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f07a960666so55073745ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770033; x=1796374833;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOPZg4MvcQV19PSyH//5nx2RfgdbxY+varkZNiQRKts=;
        b=1pwMFajgfZp8kfqFvkDEAAGtS0u+vmvTUd3GhtGWt4MhWvimEqYQyNT/YgkqbP85/B
         z0cXKSpvOyE7q+YYBR9/wn7XeBPC+2NlLbhAWGghjOpc1q/5c/Avg2NnXXIRA4r5SK3S
         7Xh2WDj3RtwmctzGCmHgO8g9fjBjXvkU0n45nJuHZkCtGj9Hqy+Y5TRR/jYJPfLYKedg
         SWLvigze7aalUz3LD7H1X6Y5aW0ZNiW2DYhXZrs7s4BA8qgYqwa4dWxRv52AF6Ah17yu
         rG+MR6iSwfZa0M+PGwkNK6QDYZT2unTAMyk///KaNDrEcVXyBSe8SXLowogScn4MYTMj
         z7Lw==
X-Forwarded-Encrypted: i=1; AL+hErEgmYCrCqnzJM8jZO7cE2vqzU9lmrpXrzRaiZPq6gulI9bOreQg/XT6MYEy5KvhtKJWwNdsRczXTpZr4/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VDA6P1vnf6YtDgthzJ1mWaczoYCIxz8Vrw56+mfkb/upBn8qQ
	qFlW24cNqDlD/o6zxie1hZNOHUPNQ8Bsa49tT7f2wEw9TozTKK/bZwrW
X-Gm-Gg: AZFdTZf/RWjbwlnQGG7/NMuZF0ay60SMUr6KqWsyQo4XK2naheTReTjOyvKkoVLzlCe
	C2tIvPzmdKsveE7X6+DG5Ltl6BxxzK6ZJ45Z6sdKAuTajgDDoCJFyTBvYjdLLX4khukP9Nbwxp+
	OOfeT1bMOR+GxO12NKrdpL0oGVnF3WZug/PwW9zLKCFd+fzmRPm0pK7yLPzeboAQEzp7PKSvTgt
	ibaag54AVZvr6XfGOKiAvrExpZqagOi57WxvJIQeNyALr2dnxWFwZAqyKGYdXWMOd6AqC6tJz69
	xoaUq/YQPnUBHHqrfI8Ang7WU5oMd5q4/B6Uoyi3pawZw+1Ow8Th5VxzPQdopeGeirx49fwV3We
	jZs4kz4ko0NfEQO/1B+guYyge5eBjNkv+XwDdw5TZrlSm1XwRs2HC1XuyDMHAJ79Q9f3lgpQaQG
	A8Wv1Gp1r2c7BlPUhrOhPv69BWyADQePIre3eYanD/gRd9d79vVVuljeuAeqkTXJv7Xrd1khtqN
	CLbViTGudxh7bpUdP1dVfYT46r/9XjPvtIOriU7oRjn2YUO03UHAajBmduXMK+csxSMve8AsoA6
	j9azCAUaskWlyCFvVIzjFOomJv7k6skrOK4CQbOwJzdac0S8hPqxUGye17wUYUoFLSklk/mF0dO
	iKaatUyYQIFwlph8AQAolwO6Gy+W2USkh0IGg+OUeQfyNUQ==
X-Received: by 2002:a17:903:1c2:b0:2f0:5bc6:6bc8 with SMTP id d9443c01a7336-2f05bc66da3mr214174955ad.25.1795770032437;
        Fri, 27 Nov 2026 01:00:32 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm117050725ad.57.2026.11.27.01.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:00:32 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: speakup@linux-speakup.org, linux-kernel@vger.kernel.org,
 chris@the-brannons.com, kirk@reisers.ca, w.d.hubbs@gmail.com,
 stable@vger.kernel.org
Subject: [PATCH RESEND v3 0/4] speakup: fix hang and use-after-free around
 synth removal
Date: Fri, 27 Nov 2026 17:00:28 +0800
Message-ID: <179577002884.23588.802785530849276690@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

This series fixes a speakup hang reported when a speakup synth module
is unloaded while its output cannot make progress (e.g. a serial
synth whose port has no consumer on the other end, so the tty write
keeps returning 0).  rmmod then stays stuck in D state forever, and
while the loop holds spk_mutex, any synth module load or sysfs synth
switch hangs the same way.

Patch 1 stops the catch-up loops when the synth is not alive anymore.
Patch 2 takes spk_mutex off the catch_up() call path, and makes
synth_release() drain any in-flight catch_up() before releasing the
synth resources, so loading, unloading and switching are no longer
blocked by speech output, while the synth structures stay valid for
the whole call.  It also guards the wake_up_process(speakup_task)
sites against the kthread not being up (or having failed to be
created) yet, pinning the task_struct with rcu_read_lock() so a
concurrent module exit cannot free it mid-wakeup, and closes the
SPEECH_KILL revival hole: spk_synth_is_alive_restart() could set
synth->alive back to 1 from the unguarded key handler after
synth_release() cleared it, which would make the drain wait forever;
the revival is now serialized against the clearing under
speakup_info.spinlock and skipped for a synth being released.

Patch 3 clears the global speakup_kobj after kobject_put() in both
speakup_kobj_init()'s error path and speakup_kobj_exit(): after a
late failure of a built-in speakup_init() the dangling pointer used
to stay behind, and a later insmod of a synth driver would feed it
to sysfs_create_group(); it now fails cleanly on the NULL check.
The removal side gets the same guard: a synth left set by a failed
do_synth_init() makes a later load go through synth_release(), whose
sysfs_remove_group() would now meet a NULL speakup_kobj and crash;
the group removal is skipped when the kobject is gone.

Patch 4 closes a related hole in the keyboard path:
speakup_key() checks the global synth before taking
speakup_info.spinlock, but do_spkup() and its handlers dereference
it inside the lock while synth_release() clears it under spk_mutex;
a speakup key pressed while the synth is being removed could pass
the unlocked check and oops.  The clear is now serialized against
the locked readers: both NULL clears take speakup_info.spinlock,
and every reader that dereferences synth inside that lock now
rechecks it after acquiring it - do_spkup() at entry, the console
notifier paths after their trylock, do_handle_shift(),
do_handle_spec(), the speakup_key() special-handler dispatch, the
synth_direct sysfs store, and the /dev/synth and /dev/synthu write
paths - so a clear can no longer land between a reader's check
and its dereference.

The races the series covers, and the patch that closes each (the
patches show the CPU0/CPU1 interleavings, before and after):

  R1  SPEECH_KILL revival vs. the release drain          patch 2
  R2  wakeup of a not-yet-created or gone kthread        patch 2
  R3  sysfs_create_group() on a freed kobject            patch 3
  R3' sysfs_remove_group() on a NULL kobject             patch 3
  R4  key path check vs. synth clearing                  patch 4
  R5  console path check vs. synth clearing              patch 4
  R6  catch_up() lifetime during unload/switch           patch 2

Patches 1 and 2 are both needed for the no-room hang: patch 1
provides the loop exit but nothing clears synth->alive in that case,
patch 2 provides the deactivation and the drain.  The drain of
patch 2 relies on the loop exit of patch 1 to terminate, so the
order is required, not merely convenient: without patch 1 first,
patch 2 would trade the spk_mutex hang for a new one inside
wait_event().  Patches 3 and 4 are independent fixes found while
reviewing the init/exit and key paths.

Tested on x86_64 (qemu, speakup + speakup_acntsa on a backpressured
serial port): unload, second synth load and sysfs switch all hang on
the unpatched kernel and complete on the patched one; soft synth
operation and a 30-round insmod/write/rmmod stress loop with
interleaved switches show no regression.  The whole series was also
re-verified with an automated base/fix A/B boot test in QEMU: with a
synth wedged on a stalled tty, rmmod never returns on the unpatched
kernel (hung task reports with the stack pinned in synth_remove),
and returns in all six trials with the series applied, with no oops.

While testing the series I noticed a few preexisting issues that are
NOT addressed here (kept out to keep the series focused, can be
follow-ups if wanted):

- the cursor_done timer callback still dereferences synth inside
  speakup_info.spinlock with no synth check at all; closing it
  needs the cursor_timer lifetime handled against synth teardown
  and is left as a follow-up.

- the serial read buffer handler (synth_readbuf_handler) also
  dereferences synth inside the lock unchecked, but cannot run
  in this tree: its only registration chain goes through
  spk_serial_synth_probe(), which has no callers, and any
  out-of-tree registration is serialized by the free_irq() in
  the serial synth release path, which runs before the in-lock
  clear.  Patch 4 discloses this in its commit message.

- speakup_dtlk.c: synth_flush() and synth_read_tts() spin on
  synth_writable()/synth_readable() with no timeout, so the catch-up
  drain of patch 2 could still wait unboundedly if the DoubleTalk
  hardware stops responding mid-flush.

- do_synth_init() does not roll back on a sysfs_create_group()
  failure (the global synth pointer stays set).  Patch 3 keeps that
  dangling synth from crashing on the kobject side, but the synth is
  still not cleaned up; the follow-up should make that error path
  unwind like the probe failure path does.

Changes in v2 (patch 4 only):

- patch 4: per review, the unlocked synth checks that only
  duplicated the in-lock rechecks are dropped; the only behavior
  difference is that an empty write to /dev/synth or /dev/synthu
  with no synth loaded now returns 0 instead of -ENODEV.  This was
  sent earlier as a single [PATCH v2] reply on the subthread.

Changes in v3:

- no code change; the Reviewed-by tags received from Samuel for all
  four patches are now carried in the commits.

- commit messages trimmed throughout.

RESEND note:

- Resending v3 (originally posted on Nov 3 during the 7.4 merge window:
  https://lore.kernel.org/r/179366847311.70545.1738521378158835923@kylinos.cn)
  now that 7.4-rc is underway.  All four patches carry Samuel Thibault's
  Reviewed-by tags with no further comments, and apply cleanly to
  current mainline.

Hongyu Xie (4):
  speakup: Stop catch_up when the synth is not alive
  speakup: Do not hold spk_mutex across catch_up()
  speakup: Guard late sysfs operations on speakup_kobj
  speakup: Serialize synth clearing against locked readers

 drivers/accessibility/speakup/devsynth.c      | 13 ++--
 drivers/accessibility/speakup/kobjects.c      | 10 ++-
 drivers/accessibility/speakup/main.c          | 31 +++++++--
 .../accessibility/speakup/speakup_acntpc.c    |  4 ++
 .../accessibility/speakup/speakup_apollo.c    |  4 ++
 .../accessibility/speakup/speakup_decext.c    |  4 ++
 drivers/accessibility/speakup/speakup_decpc.c |  4 ++
 .../accessibility/speakup/speakup_dectlk.c    |  4 ++
 drivers/accessibility/speakup/speakup_dtlk.c  |  4 ++
 drivers/accessibility/speakup/speakup_keypc.c |  4 ++
 drivers/accessibility/speakup/spk_priv.h      |  3 +
 drivers/accessibility/speakup/spk_types.h     |  1 +
 drivers/accessibility/speakup/synth.c         | 69 +++++++++++++++++--
 drivers/accessibility/speakup/thread.c        | 11 ++-
 14 files changed, 146 insertions(+), 20 deletions(-)


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.32.0

