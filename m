Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786129;
	b=fd1RUIaho2XbwcVWrKOFaNOYa39nlQDI5Fxf6f2gM9U70BfmrtMLEc30VVBdYX/4HiPN
	 E4PeSBAk4vfBP5oUpeTvly6tYMM58BSgg01HnB9GAwZiGDbjvGjmimjqGm2Soqhe16KzT
	 srgY32E4ya0ZXDX97riQf5VPMJIbtCC8twW6eCdypv4QYoePI1wo+lnH00xj2qysx3/18
	 D1mMlXVMwGwbDcYnfgZb+BHnGTzb9zo7JLE5ZhWQIz8EgaQuJ0k+PvOHaHO6o6xvLKb/r
	 ZoN7Id7dX4j6L8chOMT0dpwNpjfAK9PKAtziITK3znoXE3+lBnMPrkiI2aH1iEHVi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=cZfcia/WhT6K5lVV4VbxAMB/XSHNRpsnzuXrR/+PKqQ=;
	b=X/6qMHtmVxR7aK8XMuZi0cPwXEJNjTfBitcvEZ0quLzANzkSQu0wCdNSB8UYYoHUYzu3
	 iYMkltW/KuFTCnRZL7qhJOC4OACjFmU7Jw4i298PcrSgUes7LXy8/lyz4itrMWE+rdFMB
	 P781K2Kf8IrXy6Vu6SOKODe39+oDUFHr5MQ7BBerPAfpcVjPoN6ICbXFs4HBIcxC2BFdT
	 9inPITvPMfsmB/5f51go8jugeuBeKwi2fkL6XKWDTo3unBJpB5ZNDqzri0OCIEE85ilX+
	 lAmWn9tTL52WtNy7WFBNQ0QOnPYSfqLOcAcm3mQGucjXW3cVfadYj2/pMw475QV409Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC916606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC916606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b53db3d0a5so195791a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786128; x=1796390928;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZfcia/WhT6K5lVV4VbxAMB/XSHNRpsnzuXrR/+PKqQ=;
        b=eBu5rZ1ddsU+bMdi0g6yJwc5p8NyVYysnedER5DwqO1D8M55ViUFoK6SlbpP2RX2eh
         OvGLZcJfJTq+eGCCm/8GbukYsJVvCDor9UH9V85kltf5ZmTTWkAz8LtrXbxcz8RUySex
         27khCHwQNSVVTXQ8rcoOlItWT7LM3dqY2xA4nHRjuUoY/quQVDf3oxPeVgu4SDA+/H6c
         35gZG/9iu/WhtxnQf/K5sLsnyYe38ZPgK1HobNJMgCAlxjE6RB6AobTqoX5USkQoDqKt
         kesqM7e5ordMLftO9iOriQeUKr24gnBWFSmQqWTZpFJnhii1tskSX1/+apAFmOZQZHRf
         xAQw==
X-Forwarded-Encrypted: i=1; AL+hErEVZs91cMzp2+wGOeegX3Zqll8/ICAUZKjqX4BcLq6+LO2lmdXjSYOSYLUktJr1MG4jycMN+rKVztIbl+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qEL9gprVqCnMvI9Q6fBKk+xKs3exRukTM3i5FCUyfMZ8NPhV7
	CMg+KFBA2Xay0W04WlQ3BIEbXSE3qNixcG1O3LVYXKL5pjsbaQet/dQs
X-Gm-Gg: AZFdTZcCN9kEm19L5o9dxQ83y4/QppWTeNh+VM8mzg/opO0o+ApUrDxcKuskbF6vanF
	N7lLs8Z4nQh9PFNltP58XrHe9xC4FnznHNZQYXAsyM9GCmcUb4UAe4glwJwgLdVhpVvE1lxs6Kj
	lExt6iUA9vkChRXxYHq0e6JL93B0i1Fg5Ld7nmIG434N4yRy6mWBmkABk18dZEpdF0FEIFWqLvX
	2pSINsgLrC4fsttGwG8knBu98XWYX67fgy9bDgOnERbHnZqQQnZM3xRlzS/OiOoTeOVXD7S4ITc
	9THWOj/F4tw3Fi7FmDDo5QMZo9RpzOfXFCYXErHNhOnloBg1KlHqdQSIaGTNox2U1NhaXTzlCaS
	4do8w9pQVQNa9ZGxhS8ZneSgkX0oQB3Z4Bz4V3PEvM6oMuT1vRIJp0DbLT6mrb9VXLId/k7ovS8
	+8CPgkmBbCjZ7afAt6cOj86pBlPRjnj/1c0w/1IWHitnlP5kv+vU/c7e8VlwrqjVZuggjiIByCN
	p876DqwNWguLsV5vhwq+gQcefcSGLKWePpyMQBwbtk7SgfwTWmf+QJFFTLkDK6o4zhZbwAmJkji
	p/Q1AtbhW3hrTvbYrZM6lau7L+64pEoqizjBlibOt1FihkDBwx3FqL6KjI7k1+ZY7J/pBKMGuaN
	dOEHTUGIlyo218MoNW0lOgJtTP3ti30N3xCI27zFAdDkS6g==
X-Received: by 2002:a17:90b:390f:b0:3b0:9cc6:62c1 with SMTP id 98e67ed59e1d1-3b41c9aeaa6mr25160443a91.63.1795786128028;
        Fri, 27 Nov 2026 05:28:48 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([216.236.36.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm41143707a91.12.2026.11.27.05.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:28:47 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
 Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] usb: core: fix three use-after-free windows in the USB
 anchor protocol
Date: Fri, 27 Nov 2026 21:28:45 +0800
Message-ID: <179578612505.44635.14553263875690325600@kylinos.cn>
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

Anchors are usually embedded in driver-private structures, and
several anchor API returns -- a non-zero
usb_wait_anchor_empty_timeout(), usb_kill_anchored_urbs(),
usb_poison_anchored_urbs() and usb_scuttle_anchored_urbs() --
license the caller to free that memory.  The wakeup protocol backing
this license has three windows in which a URB giveback or unanchor
still touches the anchor after the caller has been told it is
unused:

 1. The waiter's condition check and the giveback's
    suspend_wakeups decrement plus wake_up() were not serialized,
    so the waiter could return while a giveback was still in
    flight.  Reported by syzbot repeatedly since 2019; patch 1
    references the two reports this analysis is built on.

 2. __usb_hcd_giveback_urb() captured urb->anchor at the top of
    the function but incremented suspend_wakeups only after DMA
    unmapping and the usbmon hooks.  A concurrent unanchor could
    empty the anchor with suspend_wakeups still zero, so the waiter
    returned and freed the anchor underneath the pending increment.
    No syzbot report is attributed to this interleaving; it was
    found by extending the analysis of patch 1.

 3. usb_unanchor_urb() and the giveback read urb->anchor and only
    then acquire anchor->lock; between the two the anchor can
    already have been freed.  The gap is as old as
    usb_unanchor_urb() itself and cannot be closed with a
    reference count: the first dereference of the freshly read
    pointer would have to be the increment itself.

Patch 1 completes the locking protocol for the waiter/wakeup side.
Patch 2 folds the giveback's pointer capture, the increment and the
unanchor into a single anchor->lock critical section.  Patch 3
turns the wakeup protocol into a contention-gated RCU lifetime
protocol: lockless anchor readers register in a usbcore-private
per-URB counter (urb->anchor_readers) inside RCU read-side critical
sections, urb->anchor is published with rcu_assign_pointer(),
__usb_unanchor_urb() snapshots get_state_synchronize_rcu() onto the
anchor only when another reader is concurrently in flight on that
URB, and every teardown return that lets the caller free the anchor
calls cond_synchronize_rcu() only when an unelapsed contended grace
period is pending (touching nothing on the anchor after unlocking).

Contract notes for patch 3:

 - usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() may sleep even on an empty anchor
   (when draining an in-flight giveback pin or waiting for a
   contended unanchor's grace period): the empty-anchor retry blocks
   on the anchor's wait queue instead of busy-waiting.
   usb_scuttle_anchored_urbs() is the only sleeping-context contract
   change among the three (the others already slept transitively
   through usb_kill_urb()/usb_poison_urb()), and all three carry a
   might_sleep() at entry so an atomic-context caller is caught at
   the call site with debugging configurations enabled.  All in-tree
   callers already sleep.

 - Uncontended waits and drains on persistent or empty anchors pay
   zero RCU grace periods, and usb_wait_anchor_empty_timeout()
   preserves its remaining-jiffies return value on uncontended
   waits.  Only when two threads actually raced to unanchor a URB on
   the anchor (and that grace period has not yet elapsed) does a
   successful wait or drain wait in cond_synchronize_rcu(), in which
   case usb_wait_anchor_empty_timeout() may overrun its timeout by
   up to one grace period and clamps its non-zero return to at
   least 1.

 - The safe-to-free license is per caller: a caller that frees on
   its own successful return must first wait for any other
   in-flight teardown calls to return.  The kerneldoc of all four
   teardown returns states this proviso alongside the no-new-URBs
   one.

Why the retry loop must not busy-wait: on !PREEMPT_RCU kernels
whose scheduler tick reports no quiescent state for a spinning
process context (the v6.6 stable tree, for one; the 7.3 base adds
process context only with CONFIG_PREEMPT_COUNT), a busy retry stalls
every grace period that still awaits that CPU's quiescent state for
as long as it spins, and under real-time scheduling it can starve
the very completion path it is waiting for.

The sleeping retry keeps the re-drain behavior of the busy loop it
replaces: usb_anchor_urb() wakes the anchor's wait queue (gated by
waitqueue_active() under anchor->lock, so the per-submission hot
path stays off the wakeup machinery when no drain is sleeping), and
the wait also ends -- without declaring the anchor unused -- when a
URB is anchored after the drain, so the drain restarts and tears
the late arrival down too.

No driver changes are needed: struct urb gains a usbcore-private
reader counter (anchor_readers), and struct usb_anchor records the
conditional grace-period state (need_rcu_gp and rcu_gp_seq).

checkpatch: 0 errors, 0 warnings for all three patches.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---

Changes in v3 (patch 3 only; patches 1 and 2 are unchanged):

 - Gate the teardown RCU grace period on actual unanchor contention
   (urb->anchor_readers + anchor->need_rcu_gp / anchor->rcu_gp_seq +
   cond_synchronize_rcu()) instead of calling synchronize_rcu()
   unconditionally on every successful wait and drain.  Runtime I/O
   paths that wait on or drain persistent or empty anchors without
   unanchor races (such as zd1211rw register write batches, hiface
   PCM stream stops, usbtmc reads and btusb traffic stops) now pay
   zero grace periods, and usb_wait_anchor_empty_timeout() preserves
   its remaining-jiffies return value on uncontended waits.

 - Link to v2: https://lore.kernel.org/r/179577006613.23588.11203087005423939=
12@kylinos.cn

Changes in v2 (patches 2 and 3; patch 1 is unchanged; rebased onto
v7.4-rc3 in RESEND v2):

 - Patch 2's usb_unanchor_urb_and_suspend_wakeups() race-loser
   path unlocked each branch's locked anchor before clearing the
   local anchor pointer to NULL.

 - Replaced the kill/poison/scuttle empty-anchor busy-wait retry
   with a sleepable wait_event() on anchor->wait that re-drains
   late-anchored URBs via waitqueue_active()-gated wakeups in
   usb_anchor_urb().

 - Dropped teardown-side suspend_wakeups pins and updated kerneldoc
   and Documentation/driver-api/usb/anchors.rst to document the
   teardown lifetime contract and per-caller proviso.

Hongyu Xie (3):
      usb: core: Fix use-after-free in anchor wakeup protocol
      usb: core: Close anchor capture-to-increment race in URB giveback
      usb: core: Close residual anchor read-to-lock window with RCU

 Documentation/driver-api/usb/anchors.rst |  26 +-
 drivers/usb/core/hcd.c                   |  10 +-
 drivers/usb/core/urb.c                   | 490 ++++++++++++++++++++++++++++-=
--
 drivers/usb/core/usb.h                   |   1 +
 include/linux/usb.h                      |  10 +-
 5 files changed, 488 insertions(+), 49 deletions(-)

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--=20
2.39.5
