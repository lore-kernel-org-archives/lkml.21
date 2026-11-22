Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323195;
	b=OykDklpNYQjj8OhfDa0GmbAWH+MKaf0lER1M0h4XPzOsZFAlRKoAg8zTYNM/jV8UOwKQ
	 HJBAJrziF6s6dtpQSeClxeA1mIA7TL2rXU6oVMljZbSSGTU+4/NUFXkAGv0XbpKVU1PnS
	 BISndVE9sKgKrvV8LzNUjFO/hzZ8JFii6knz3eWgJcNz6i1+ZeDlqcaP4+7IJHzU6zex2
	 LbB8Th0L6pF+LBCqWb43Taty6izSt34Bi14p6GgSs1or915xl8FAlmUCERaP+aItrSTHO
	 nHgRW/9UzbGLEW93iqL8BuJFSEJOTH0N7DX0KbNDDXNSNqs0FJu9/F3YkzHdnavseKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KAzUKzhhhScUAMTrwfyxBtcZxPud2TmkB4S9e7vTEGg=;
	b=oF3RG0oo6HjRUOmeQbGpilHxD0zIgPe0T8dFglJkfQ9DYKj1S9dEGlyUkwvqXpXrU2TP
	 jka3gDv/3h+py3DqrdB5O+yLzK5ciyZKVPUika89mO+j/qBU53JJu/dCH3WVnDNeOWhR0
	 r43FWxXLkxL61moP/wt8vdX4N6l+zGGPA2/S6BCnQK6LP9lJvY2XIMvaqocgdxCkO3FGV
	 j9Vidc9IxVxTU6hIugyzLjv94rwTbxZWMRm/31hHSmDtmwzzWGbG4BHefi3z9ks8CCzW4
	 jTf224F1U7CTqn5iEaGEjw5wsTE3PqYthYibDIqIjCwECwsoe8OCSUHIb1RAxkH7IPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9Dx2IzC;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC6606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BC6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9Dx2IzC
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso2590057eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323194; x=1795927994; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAzUKzhhhScUAMTrwfyxBtcZxPud2TmkB4S9e7vTEGg=;
        b=T9Dx2IzCg47LpQsrxsYA+MyD/81CEBq4KpcGiiqTNbZBP6lFw/EEyzNcteG3bgE0Ru
         +eqNeU/qun6by1zItyn7vPz/AAncmqxiorYUOvoqxE3XZUrQ+2NZPEsqFm5FNR9TdqmM
         Dk1CPwcUOSRxEAJ5jITm8fk6Axtt5lxPIJCF1Ay4HTLsPmvfDIZKZJQSHqOXVQpsMaS+
         4ncoSOFZ+AqD0jh8pCAM/yHAPCBc3Wlkgqmo76++zzytXOlCiQHe/M7a2A9CKjHPsN6X
         W+DMxkRdDpa9EY6rvgMzT62shmJFWai8cODkxFTgELtK+BpFUuNrs2O6+hQ67NYsXy0x
         eZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323194; x=1795927994;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAzUKzhhhScUAMTrwfyxBtcZxPud2TmkB4S9e7vTEGg=;
        b=QCNrM4ot3MFZERxEAx28nUg2HkTVd/8bGX3z3BxQ0cO4bKJ8L0zmYZO9MJeqo2pXfx
         ODwY/N4quuZbd0zbvicAGQeLFSiwRDk8pzh+Y3UYCiMlIWtMdK+WNsePc6TLPTo9GO5c
         8hDPdBQzN0GJXl0VHXvdJbE9JHzhHjHZ/ZbSCysB+c/SS961vG5oTQRvR3RloVa4lCSS
         XID5uhGBrsDPRsna4wdoQLSXLC799UmDte7xjonVk77OVOMYdL+omXbJyYp83Jn4otsl
         qNAKAetLRTVAKNj8YQSr6khqwg7yo0TBjz9jlPhVf4m2vmnG9Z1eXptf2NpaL9OmRIXK
         RweQ==
X-Forwarded-Encrypted: i=1; AL+hErHKT2jjQFRsrjTWCztIo74dUiR0rEStIElk0csn3V3UhdktOZXySwRzQq3B0PN1hFoU2lfN9ezMSAzflqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+puRYe6HinGymkgf6si6nEVKkNHBo5XH2F883AO1nr8fWG8sln
	Ubz5Bzr31Qansr7+BxyPtsQ4lxmSmbxjGfVB50hZyI3LP6Imnz1oYNxmCHeZvGiIi1aSgJms8BF
	VIbwXoCRl8A==
X-Received: from dybzy10.prod.google.com ([2002:a05:7301:e10a:b0:381:6d21:2e90])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:20c6:10b0:36a:15ee:c20e
 with SMTP id 5a478bee46e88-3869a150409mr4897178eec.33.1795323193190; Sat, 21
 Nov 2026 20:53:13 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:10 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045310.17980-1-irogers@google.com>
Subject: [PATCH v2] scsi: aic7xxx: Check ahc->flags instead of ahc->features
 for AHC_SCB_BTT
From: Ian Rogers <irogers@google.com>
To: Hannes Reinecke <hare@suse.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In ahc_linux_run_command(), the untagged queue throttling check tests
'(ahc->features & AHC_SCB_BTT) == 0'. However, AHC_SCB_BTT (0x40000) is
an ahc_flag bit stored in ahc->flags (and tested via ahc->flags at all
17 other sites across aic7xxx), whereas ahc->features has type
ahc_feature where bit 0x40000 is AHC_MULTIROLE, which is never set on
any controller.

Until now, '(ahc->features & AHC_SCB_BTT) == 0' was always true, which
serialized untagged commands across the whole target via
ahc->untagged_queues and masked a second omission from commit
e4e360c325c9 ("[SCSI] remove aic7xxx busyq"): ahc_platform_set_tags()
sets queue_depth to 2 for untagged devices ("even though we can only
execute them serially on the controller/device"), while SCB_64_BTT only
stores one SCB tag per (target, LUN) slot. In addition, sdev->simple_tags
remains set on SCSI-2+ devices even when aic7xxx disables tagging on dev
(clearing AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED).

Check both !(cmd->flags & SCMD_TAGGED) and
(dev->flags & (AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED)) == 0, return
SCSI_MLQUEUE_DEVICE_BUSY when dev->active != 0 so untagged commands are
serialized per LUN, and test ahc->flags instead of ahc->features for
AHC_SCB_BTT so controllers with SCB-space busy-target tables can still
issue untagged commands to different LUNs of a target concurrently.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wenum-enum-conversion enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wenum-enum-conversion; not tested on Adaptec Parallel SCSI hardware.

Fixes: e4e360c325c9 ("[SCSI] remove aic7xxx busyq")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Serialize untagged commands per LUN via 'dev->active != 0' (and cover
        devices where AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED is clear despite
        SCMD_TAGGED) so queue_depth == 2 cannot dispatch two concurrent
        untagged SCBs to the same (target, LUN) slot when AHC_SCB_BTT is set
        (caught by Sashiko review on v1).
    
    v1: https://lore.kernel.org/r/20261119170605.1518761-1-irogers@google.com

 drivers/scsi/aic7xxx/aic7xxx_osm.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7xxx_osm.c
index d93b522695eb..af5782a63155 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
@@ -1429,18 +1429,26 @@ ahc_linux_run_command(struct ahc_softc *ahc, struct ahc_linux_device *dev,
 	 * We only allow one untagged transaction
 	 * per target in the initiator role unless
 	 * we are storing a full busy target *lun*
-	 * table in SCB space.
+	 * table in SCB space, in which case we
+	 * allow one untagged transaction per lun.
 	 */
-	if (!(cmd->flags & SCMD_TAGGED)
-	    && (ahc->features & AHC_SCB_BTT) == 0) {
-		int target_offset;
-
-		target_offset = cmd->device->id + cmd->device->channel * 8;
-		untagged_q = &(ahc->untagged_queues[target_offset]);
-		if (!TAILQ_EMPTY(untagged_q))
-			/* if we're already executing an untagged command
-			 * we're busy to another */
+	if (!(cmd->flags & SCMD_TAGGED) ||
+	    (dev->flags & (AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED)) == 0) {
+		if (dev->active != 0)
 			return SCSI_MLQUEUE_DEVICE_BUSY;
+		if ((ahc->flags & AHC_SCB_BTT) == 0) {
+			int target_offset;
+
+			target_offset = cmd->device->id + cmd->device->channel * 8;
+			untagged_q = &(ahc->untagged_queues[target_offset]);
+			if (!TAILQ_EMPTY(untagged_q)) {
+				/*
+				 * If we're already executing an untagged
+				 * command we're busy to another.
+				 */
+				return SCSI_MLQUEUE_DEVICE_BUSY;
+			}
+		}
 	}
 
 	nseg = scsi_dma_map(cmd);
-- 
2.56.1.750.gf70dc682cf-goog

