Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202961;
	b=V1j/7fl3K0klpwiMW3aSO7aRdA0TjGBcGyLLKBy2JFez5md9LrGUApgWfheLrqRFkEhR
	 0/FtlygV6QL/veveb7L8mZfMnnK2k+eLh/oSR4/itgIOntU8Vlap5Eh/WJY/QBdgAtv+h
	 2nGaRiqIA5YPeKfoL4fAFKVggs4cmtNAUjZZbLr2hfsAEwjhZB8NhT0gI4+qWP8RdJ0lk
	 rJBYLbiDXFqYE95Mgfx0JukieaU5cKJV8f3NuVx0/+ie6sLrtr/Aq6nN2pkczbYABHp+t
	 jL8d4Cl+X1TiwCJlwwEg648r/xqO0nLOX3Mxymw9wB1azrqjjwTUMx+XpMiXZx6zJTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0gjgUrbIBW0VpAasobxwISh3VC/YeyY4O56ZQRs0+TE=;
	b=d1UotA9DYTAthUAcR0apsYNeKAH+zU5IEKPP39dUsTT1HsZ0mNr+rYHGQanomGasKiiP
	 FMe5bOKWamMxx8oKm2kgWYxPvPlkVif5TLkRXXT+ZsUpTsMtEtMBmV3o0Nm1wT90SkFTd
	 HrKo5H4uj22S9GiK+V6kiDWR0RjWukpsBfmVj9oNfHcpREPY5BK+LiXFEgt8wpkW7rKTn
	 rjeS2dud0DumS0mv+iGiQDkJWYQwnb7+5d0w6X0M5WYfb5C50F7qTmelhG+RQl0sP8dcs
	 wf8Aga3od4JKcxPtqdhc26kdKyeStnCrVNpyAORDIDXsn+u/OrQeA67MXaJti8YVDYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DLd/JlEj";
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BA606A6E9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E07BA606A6E9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLd/JlEj
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-53dda625f63so745799b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202958; x=1795807758; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gjgUrbIBW0VpAasobxwISh3VC/YeyY4O56ZQRs0+TE=;
        b=DLd/JlEjcXNw+9ETiOXv0EaW6MqSdaV4Oy480zLiCvrTEaZZhjHG6ACef4OcORewbv
         C2oizLjD+hSJ8JNAZNhrLD0Zb/Wm7FhgatfAF+R0I3GFBTZ+JtBgzzHIwA4mfIgXJU7O
         mx/Dm88JCZv/sH+GCCKbRLjUgWX7a7dDdbXLtQErsKPMI9Nnbpi1GOy9560ubBvmzY/H
         7Gu0t/sf1pkcPNoyDfF+upvfzZFhpHHLq6KNOcoJ1mlrBcl01VC4U++5IFcgBgNsq8J7
         A7NFkF/pGcZl+ChyNFPOisgSQp8HL3J4TZkis+RZ2xDXQkfnW2kPNRTyNDf9gjo4gA7w
         Ydkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202958; x=1795807758;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0gjgUrbIBW0VpAasobxwISh3VC/YeyY4O56ZQRs0+TE=;
        b=hEJCsc7b7cocgJEIxiamGs8jE72wc+XH220ngUziflNxka7B8rWHfwy3zIl8DXswnM
         pwECw6n0VWrABqC+bhBEGPLKoprPJoQ+p95DvqJbQjVSVreQepVgQ7d2HPfEUSEVgHTE
         xuWY3RZTmJyFl/UCstkUB3kJIheryMcA3V0RgNJv9+lF6YP3DvkkMpPIwb2i9kgKwrBz
         8+WudBVM5QOUsKq2FBxVr8tMT6cCWlw+gWLzOluiM9IVa12KBHujoVyaxjfpiAAFQG/a
         YqpFSUiESQfsDouf9so7brD5C33X9oQqRchkM6hIa5sq/HSFmJ53oqoIdDUltq0pc4zT
         r+Iw==
X-Forwarded-Encrypted: i=1; AL+hErELN94rBU+tek+gpjCaBdW9zr+Xn+x32+T+3lsvWvff33F5IJ6u7QYJFuXGP7MUP1y+9URpmSRVc5mE14s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LpE8F0QuYLJqJDiIqqj87li3LJi+tObrbUzUDaQuWdoAut9/0
	Qg2ds9CtsGJBT59uwKqvxYbUzkSPTgf71uKY76T+thkV0zxnMWETpAyJ
X-Gm-Gg: AYBFou13KQifgzL7n6Y8apQtoPen4BDghBZGN9XfLHLSm3YiMOZ4rJMHPLrdO/JJC8M
	6ly87p8jGeevTbzQAjBTW8RibB3mLpL6DoND7qf8bi7K7eG7dW0xYgOVC2L28h39egZ5kF/psZm
	0iqGWJXXbW8bLGCywOYl+FrjGnzduvj4G76XV+9Eky1v5iBqIGjUTx2v8FNtZgAnE3M33tVRXKl
	/F22vW011PWQSohHAnsLkLSocoi0m2d8MVlOQ/VSguGzR5CbeEiOK6swtN5tuP6D+gqcYYYSQ2H
	PYbrOQ8UcDPva65iZLAoDQ8sxfKH4y3QPQZUgj2XOnmdoRZ6/5Z45V2hEaVMZ+mTuMgQI1B5JKw
	AHCnzBT0uNBxi2GujPp4PSBsdh6GWLq9afof2DK5Ec52zP9tYx1GMILMrhKsznT08FWVJNsXhfA
	GV5rPOGUiABx9EOe8ciyTC6st4d6SDn82iTeqmHzcUX8btz2L6jLvXUWuRM1RQQS/V2IUQC26Xp
	7HHEHCpLoBYSMplzCAYZl2jlom3IXwvh2KwI6C3n1pWv/vwCq+mLwnk6kF3Nykj3oOsfj18pNIU
	nncQHQ5NirzAlYDh7Wyq6twBDbEORwWJARDTvk/x/uHZoiL56MSue6zgZT345Z5DmDBWGx3hnVe
	L2epXl2940zjjmTq9fyq9ySHUnT/xFbVqjt+b/MALZUcaiOx4EPXCkTOTIPdJbbJa21rK8XcrEE
	U3hBuBqZxw3bDCLde4yGwKiff9y5NhTYpw8vqMicsBKi3yeRxaJFxC3A==
X-Received: by 2002:a05:6809:22df:20b0:574:c5e0:3d1c with SMTP id 5614622812f47-57b88274560mr643010b6e.25.1795202957680;
        Fri, 20 Nov 2026 11:29:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 0/7] dmaengine: dw: serialize completion and
 termination
Date: Fri, 20 Nov 2026 12:29:06 -0700
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SS07DMBAG4KugrDHYjp+suAdi4XjGrRFJUFICp
 erdmbQLrHRhJG9m5Pn0+3FqZpwyzs3T3amZcMlzHgcqhLi/a+I+DDtkGajRSC6N4FKw+bPr84H
 BF4M+sPk4xP00DvkH2SIYas2TsgkEhIaIjwlT/r74L6/XmubfMB5Wc93RhRlZNwVi1haZOOzyg
 I/XOdqxz/NhnI6XiItYpX+GoSWYCcnpKMEk4593fcjvD3HsmzXMIktMVjDJONNSKfQKYnBxi7U
 l1lawlrBoZJe4cklH3GKqxHwFU4QlDEpZ8Ek6vcX0H0ZaBdOEQSu5tdqlLt3cmSmx2jENYRKRx
 1Y5KRVsMVtgQlcwS5gDStWC8niLuRIzFcwRpoKjf6FSBBG2mC8xW8E8YRYiNwaBdzFtMcFLrfa
 cghPXBtta7W3gIErufD7/AtYOwnO0AwAA
X-Change-ID: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

Use virt-dma for transaction ownership, deferred client callbacks and
per-channel synchronization. Keep DW hardware event processing under the
same channel lock, including polled completion and software-LLP progress.

The first two patches serialize completion and error recovery with
termination. Patch 3 moves the DMAengine channel and its lock into an
embedded virt_dma_chan. Patch 4 switches the descriptor queues, cookie
accounting and callback delivery to virt-dma. The last three patches
extract hardware-LLP residue calculation, move it into the status getter
and report residue for queued transfers.

Status polling can complete transfers without invoking client callbacks in
the polling context, while synchronization waits for callbacks already
running on the selected channel. Both status polling and result callbacks
report a bus error with the number of bytes not confirmed at the
destination.

Each whole transaction has one virt-dma descriptor. Its child hardware LLIs
remain owned by the driver and are freed together after the callback.
The controller tasklet continues to process hardware events; virt-dma
handles client notifications. Submitted transactions become eligible to
start at issue_pending(), and residue lookup covers both submitted and
issued queues.

The series builds on Serge Semin's channel-restart and callback work
[0-2], using virt-dma following Andy's review [3].

Based on dmaengine/fixes at d460a02aa0ac.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://lore.kernel.org/r/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://lore.kernel.org/r/20240911184710.4207-3-fancer.lancer@gmail.com
[3] https://lore.kernel.org/r/avrHOJ-fVZOO32bI@ashevche-desk.local

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v11:
- Credit Frank Li for suggesting the preparatory channel and lock split.
- Cite Serge Semin's callback fix and explain why status polling still
  processes completions, following Andy Shevchenko's review.
- Rebase onto dmaengine/fixes at d460a02aa0ac. No code changes.
- Link to v10: https://patch.msgid.link/20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com

Changes in v10:
- Split the channel and lock member changes from the virt-dma descriptor
  and callback conversion, following Frank Li's review.
- Preserve the bus error and unconfirmed byte count for both the status
  getter and the result callback. Reserve error storage during preparation
  so submitting a prepared transfer cannot fail.
- Use the DMA core's existing callback drain on channel release.
- Link to v9: https://patch.msgid.link/20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com

Changes in v9:
- Simplify the software-LLP residue calculation and remove unnecessary
  braces, following Andy's review.
- Link to v8: https://patch.msgid.link/20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com

Changes in v8:
- Replace the private callback-deferral and synchronization patches with
  a virt-dma conversion, following Andy's review.
- Place the conversion after the completion and error-recovery fixes,
  incorporating cookie ordering, completion-list cleanup and channel-release
  draining in the same patch.
- Keep residue extraction, status calculation and queued-residue reporting
  separate, adapting them to virt-dma's active, issued and submitted state.
- Use per-channel virt-dma callback draining while preserving polled
  completion, software-LLP advancement and controller-tasklet exclusion
  during resource release.
- Keep child hardware LLIs under a single transaction descriptor and
  distinguish submitted transactions from issued work.
- Correct the residue-calculation and queued-residue Fixes tags to identify
  the commits that introduced the affected paths, following Sashiko's review.
- Attribute the cookie-completion and channel-release fixes included in the
  conversion to the lock-splitting change, following Andy's tag review.
- Link to v7: https://patch.msgid.link/20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com

Changes in v7:
- Use a scoped channel-lock guard in dwc_tx_status(), following Frank's
  review, keeping polled completion and residue lookup in the same scope.
- Collect Frank's Reviewed-by tags for the residue and completion patches.
- Link to v6: https://patch.msgid.link/20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com

Changes in v6:
- Keep dwc_get_hard_llp_desc_residue() next to dwc_get_sent() when
  converting it to return residue, following Frank's review.
- Remove inherited RFC notes from the individual patches, retaining
  the revision history in this cover letter.
- Link to v5: https://patch.msgid.link/20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com

Changes in v5:
- Rebase onto dmaengine/fixes at 6628e7d4c6b2, using the shared
  dmaengine_chan_dev() helper for channel logging.
- Split residue handling into a behavior-preserving extraction, status
  calculation, scanner simplification and queued-residue reporting,
  following Frank's review.
- Share completed-descriptor freeing between the tasklet and channel
  release, retaining callbacks for normal completion and suppressing
  them during teardown. Name the helper dwc_free_completed().
- Carry Frank's additional review tags and put the submitter sign-off
  after the review tags.
- Link to v4: https://patch.msgid.link/20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com

Changes in v4:
- Split v3's callback-deferral patch into cookie accounting, residue
  calculation, channel-release draining and callback-deferral patches,
  following Frank's review. The resulting seven-patch series preserves
  v3's final implementation.
- Place device_synchronize before callback deferral so clients can drain
  deferred notifications when the completion list is introduced.
- Carry Frank's Reviewed-by tags on the unchanged channel-completion,
  error-recovery and device_synchronize patches.
- Link to v3: https://patch.msgid.link/20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com

Changes in v3:
- Order channel-completion and error-recovery locking before callback
  deferral, retaining four patches.
- Require a locked RAW.XFER event before retiring a transfer; zero source
  residue alone cannot establish destination completion.
- Preserve polled completion and software-LLP progress in tx_status(),
  queuing client notifications for the controller tasklet.
- Serialize cookie updates with termination and report queued residue.
- Drain deferred notifications on channel release and let a pending
  tasklet return without MMIO after the last channel is released.
- Adapt Serge's two patches and retain his authorship and revision notes.
  Drop the Tested-by tags that covered their earlier implementations.
- Identify the introduction of the synchronization API in the final
  patch's Fixes tag.
- Link to v2: https://patch.msgid.link/20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com

Changes in v2:
- Carry Serge Semin's two posted fixes before the synchronization change,
  preserving his authorship and revision notes. Add the requested stable
  Cc trailers and Andy Shevchenko's Tested-by tags to those unchanged fixes.
- Add a separate error-recovery fix for stale error status, empty channel
  lists and software-LLP state when terminating or restarting a channel.
- Use tasklet_disable()/tasklet_enable() instead of tasklet_kill() so
  synchronization preserves scheduling requests from other channels.
- Explain descriptor ownership during termination and acknowledge the
  shared-tasklet scheduling race reported by Sashiko.
- Link to v1: https://patch.msgid.link/20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com

Revision history from Serge's series:

Link: https://lore.kernel.org/dmaengine/20240802080756.7415-1-fancer.lancer@gmail.com/
Changelog RFC:
- Add a new patch:
  [PATCH 2/2] dmaengine: dw: Fix XFER bit set, but channel not idle error
  fixing the "XFER bit set, but channel not idle" error.
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.

---
James Hilliard (4):
      dmaengine: dw: serialize error recovery with channel termination
      dmaengine: dw: embed a virt-dma channel
      dmaengine: dw: use virt-dma for descriptor and callback ownership
      dmaengine: dw: report residue for queued transfers

Serge Semin (3):
      dmaengine: dw: Fix XFER bit set, but channel not idle error
      dmaengine: dw: extract hardware-LLP residue calculation
      dmaengine: dw: calculate residue in the status getter

 drivers/dma/dw/Kconfig  |   1 +
 drivers/dma/dw/core.c   | 595 ++++++++++++++++++++++++------------------------
 drivers/dma/dw/dw.c     |   2 +-
 drivers/dma/dw/idma32.c |  18 +-
 drivers/dma/dw/regs.h   |  35 +--
 5 files changed, 333 insertions(+), 318 deletions(-)
---
base-commit: d460a02aa0ac6ba9e5d87f8462f75d78be83146e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

