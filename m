Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139767;
	b=yamWFgw8hnUgnUhkejpUWyq7X+X4BEqF4XqmN004lWymayrGv5TawtqRuHkQnwS+BJ+P
	 pqax8C7IiwYFH5XEiSE1P+c3EG6Q2ubkMmvi7+vJYN4+j92+1KkGloSMFSyYyk1ORaTwv
	 z3dDEWunUCq9JObXWpG2VP74eGrCt7GhE7F0sZdA+XVZPRdxIHINqcaFiVuKh5JtU358C
	 wLBJlaCveLxgOfSrQml7KThdtCGrcWxWxQv1qTTyULTkKrDKuMV7b9FPDnk3a74I2D+Nn
	 qyfyXOkE+nVHbmVCL4amCrYB0/nf8qbK6LJWQbWZl47xF54Z6akY2dIAQLnzB2fRutQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5CIrYxU9SqcPHH8M4w7TQAs5jKgmz9DB+3XKG13HNM=;
	b=dt5DLLqraj+V1A8AOGQlY9g1H0A6VngGnnKJ+3Eu0BQ3dnXh5fDbpKpL8AHSFpVlaDuO
	 RF+VvxdhjLCwykXKTP98Obx00WY2YD/9uw2P6vd1/09Z7MPpYB0U5M1MTkgmjs/rU7D5d
	 lp4eJ20T+mB553w5SlpjjuVbG7Ws/v23OjdTIFIzFXYSISqOLqozoSVb6IXzLgBdZ0VTJ
	 NcI1EqDRzl+a7lV1pqHV7cjBkfPK6SLmmQNK/hkvb79FoFVVlmC9gkSLmtrDWl5sRDVmo
	 W+vgjT2N7BUU28U6fycHAVH6U8G0HYrRhURI5NBQEeYp32Unsfn4QlCdZ6o4x2wcqpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfDteQ9m;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEEC606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEEC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfDteQ9m
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdab938dc83so173826a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139766; x=1795744566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5CIrYxU9SqcPHH8M4w7TQAs5jKgmz9DB+3XKG13HNM=;
        b=NfDteQ9mRoQOrVaEw6xG5NFS2S+VMbFp6z5vKMlojmwMkljHofsFySihNNjII/zd2L
         75uRbI7Nk/HAuFlW6kiCEZ5LgSLKX/aqfMoX0n4buoee3cccgUHBy0CS46YgnA8o0fwT
         ityPVvO2iXs4kznNNKqlbW+/B2ijcb28J6H6AVnwsPNMsO4bwLGhD6Dt5wGjBkWxEJcw
         /zHVdVSxTH/Iny8tLNL0bXnQNk/3snWscZIYIP0J+L+oeYU46d4kYX8EPkAvG7oyiJ2b
         r45MsS0EwXZYJVyB+5rYLBcGMWJBZQdpJN2CSL+hOBx2VAtJorTdBh0LUK0ulsJZXnhY
         e6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139766; x=1795744566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5CIrYxU9SqcPHH8M4w7TQAs5jKgmz9DB+3XKG13HNM=;
        b=lPWausouKwYknqTYiHBjo/1+qSF2W6I7qAwxBTOSOaJNbh9YyyuvMPBY4D/pw+pS+k
         7ffCBc7SgPzE7Z8lIWaN8fs+xR7QHGPIkD2gtWeYR9Wq7zuQGIE8ltQReVq5uz9V2w6d
         1v8uSp3BToKsuDduIdel1UfBsqxtMVQUjpLI68UnoMS6ow6uB1qr2e3gQVm5cjms5NLA
         kAQmRFFDPfUMNGLN85kR21KOIxYxKhuiRSkI1ivtZKInYQcE3+UixVaMGHMP2CJnZdYL
         o7T8l/GWT6CpNeCcDGCW9eZUHCR5teSIpTaXlh5Nk+COYQIvh7gCnOkdryCzBNWcyoYG
         jj3g==
X-Forwarded-Encrypted: i=1; AL+hErFUaQ9/F1Q1xOYEk7BUIoq0VHQznJAlIlaSk+RbceJ1UWePJjz3t74rauLZxOeHWEJYAzQHj33hI/wOY7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z98CUpmu7BWqX0RgT/9qs8va1p/jacosL2QUNe4WSyAFT2pnqtw
	PL3xPVI0D2iAaLkPkWcneGC8ZYpMtyJDLoHzqsbXg6BnXytywRgoCowZ
X-Gm-Gg: AZFdTZf93qFmZdUGHWuIZUa8lRi90pijfQQVbb3TbaSnI2XvDdIxrQuqFw2bzjaL59K
	DoEM9pwfppxG34Ej+BfcyWMBbdgClPla4BPMhogShP4oGV9FsxvQ7fqlnBGWXETTIFGIypo6L+1
	vuLzauhhR14DZbgU06v5rKDiabAtGPWZD+RoxHuRrh+REs6PmZysh2TVVbjCZIcj7HzhltTlPCG
	UTkKgeit6DC090f5+fvYH1SgkrVJKYCjLkzKbO/iWATnOG1hkOYp3l9EPtluYdxIHwNJlh8eErx
	/dYH+nm3EQSgkkFiiWA6WfNcVJSwwyCh40zMCAbNUv3RtpBbWJXWOwY9IQ8fcoQReh95eK+dBuB
	+S056FJNQGZ5/bNYLHRqMV41Wee5CLXT+DYrvjuSw3R0smYg+5FZT90EJF0HuOjgMuxOh+lWO4G
	FLJuL92rvc37M7iFJo3N7XjS8mgCeu2sDPS3rcE2w9FXEsZ7OJLI0jvLTg4OPUtGyhOg2CAubUl
	Jgt7C3ACzUSqBzHmg/X6YARENR3P06jcjWGqTgBfqt5ccyz5HGOxoid7QKTvBoB7kl3ezl7wdK2
	6CkR+POcC8OXEj+rBlTJzTAR4mFeNHRVmINZFgVD1ZQTp7qgBNA=
X-Received: by 2002:a17:90b:2701:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b41c7abfc0mr1202961a91.7.1795139765759;
        Thu, 19 Nov 2026 17:56:05 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:05 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 0/6] net: wwan: t7xx: fix TX push kthread soft lockup on suspend and RX stop issues
Date: Fri, 20 Nov 2026 09:55:50 +0800
Message-ID: <20261120015556.131547-1-tim770802@gmail.com>
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

net: wwan: t7xx: fix NAPI completion and rx_stop ordering

Two fixes in t7xx_hif_dpmaif_rx.c.

Patch 1 completes the NAPI on the not-started early return in
t7xx_dpmaif_napi_rx_poll().

Patch 2 fixes the memory ordering between t7xx_dpmaif_rx_stop() and
t7xx_dpmaif_napi_rx_poll().

v7:
 - Drop v6 patches 1-3. They need rework based on the review and will be
   sent separately.
 - Patch 1 (v6 4/4): change Fixes: to 5545b7b9f294; remove the code
   comment.
 - Patch 2: new.

v6: https://lore.kernel.org/netdev/20261002014638.47981-1-tim770802@gmail.com/

v6 -> v7:
  - Patch 1 (was 3/4): drop the explicit quiesce added to
    t7xx_dpmaif_suspend() in v6 (interrupt mask reorder,
    cancel_work_sync() of the TX-done workers and of bat_release_work,
    hardware stop moved last). The review found it incomplete without
    synchronize_irq(), losing the UL-DONE unmask and able to deadlock
    runtime suspend. Also drop the freezer: the kthread now skips the
    push and waits on tx_wq when it finds the TX queue stopped after
    the runtime PM resume, which also covers a resume that does not
    restart the queues (modem exception, shutdown), where the freezer
    does not apply. Commit message rewritten around the mechanism
    visible in the captured soft lockup; subject changed accordingly.
  - Patch 2 (was 1/4): use pm_runtime_get_noresume() +
    pm_runtime_resume() at every site instead of per-site flags, which
    also covers t7xx_dpmaif_irq_rx_done()/t7xx_dpmaif_napi_rx_poll().
    State when -EACCES is reachable.
  - Patch 3 (new): t7xx_cldma_send_skb() returned -EACCES for a
    successful send, so the caller freed an skb that was already on
    the ring; same reference handling as patch 2.
  - Patch 4 (was 2/4): retry every second with the first failure of a
    streak logged, instead of every 20 ms; Reported-by/Closes for the
    field report on the v6 thread.
  - Patch 5 (was 4/4): Fixes: changed to 5545b7b9f294 ("net: wwan:
    t7xx: Add NAPI support"); code comment removed; user-visible
    impact added to the commit message.
  - Patch 6 (new): fix the memory ordering between
    t7xx_dpmaif_rx_stop() and t7xx_dpmaif_napi_rx_poll(), found by the
    v6 review, and keep the pending PIT release count of a poll that
    is in flight when the queue is stopped.
  - v6: https://lore.kernel.org/netdev/20261002014638.47981-1-tim770802@gmail.com/
v5 -> v6:
  - Drop the "freezer as a global quiesce" direction: remove every
    WQ_FREEZABLE annotation added in v4/v5. Marking the data-plane
    workqueues freezable can deadlock the suspend, because a
    flush_work()/cancel_work_sync() issued from a context the freezer
    does not freeze (the FSM kthread, or an unbind holding device_lock)
    blocks until thaw_workqueues(). (Reported on v5 review.)
  - Instead quiesce the DPMAIF data plane explicitly in the system
    suspend callback: mask interrupts, cancel_work_sync() the TX-done
    workers, call t7xx_dpmaif_rx_stop() to drain the in-flight NAPI RX
    poll (the freezer cannot park a softirq), then cancel
    bat_release_work and stop the hardware last.
  - Keep the PM freezer only for the lone TX push kthread, and use
    kthread_freezable_should_stop() instead of try_to_freeze().
  - Fold in the pre-existing fixes previously deferred to a separate
    series: the -EACCES runtime PM usage-count underflow (patch 1), the
    TX push kthread self-exit use-after-free (patch 2), and a NAPI that
    is never completed on the not-started RX poll early return (patch
    4). This revision is therefore a 4-patch series.
  - Do not touch t7xx_hif_cldma.c. Restrict the commit messages to the
    DPMAIF data path; the CLDMA control path uses a different mechanism
    and is called out as out of scope.
v4 -> v5:
  - Fix freeze deadlock in t7xx_do_tx_hw_push(): when the TX-done
    workqueue (WQ_FREEZABLE) is frozen first it stops draining the DRB
    ring; the kthread then loops indefinitely in the ring-full retry
    branch and never reaches try_to_freeze(), causing a freezer timeout
    and suspend abort. (Simon Horman)
  - Extend WQ_FREEZABLE to the BAT-release and CLDMA TX/RX workqueues.
    (Simon Horman) [reverted in v6, see above]
  - Note the -EACCES underflow and the stale kthread pointer as
    pre-existing issues to be addressed separately. [done in v6, patches 1-2]
v3 -> v4:
  - Drop the tx_pm_lock / state-snapshot approach entirely and use the PM
    freezer instead. The previous approach deadlocked through the runtime
    PM wait queue and opened ISR windows by writing dpmaif_ctrl->state in
    suspend/resume.
v2 -> v3: process fixes (Fixes tag, changelog placement).
v1 -> v2: save/restore pre-suspend state; wrap pm_runtime with a mutex.

Tim JH Chen (6):
  net: wwan: t7xx: fix TX push kthread soft lockup on system suspend
  net: wwan: t7xx: fix runtime PM usage count underflow on -EACCES
  net: wwan: t7xx: fix skb double free when CLDMA send sees -EACCES
  net: wwan: t7xx: do not exit the TX push kthread on resume failure
  net: wwan: t7xx: complete NAPI on the not-started RX poll early return
  net: wwan: t7xx: fix memory ordering in t7xx_dpmaif_rx_stop()

 drivers/net/wwan/t7xx/t7xx_hif_cldma.c     | 12 +++++-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 35 ++++++++++-----
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 50 ++++++++++++++++++----
 3 files changed, 75 insertions(+), 22 deletions(-)

-- 
2.43.0

