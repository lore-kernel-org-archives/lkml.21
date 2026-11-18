Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025029;
	b=Dla3H6MjOLfcyQr9vyBci+Lsv0Q1nLEL/+szJcTGbp08NSOpb5t8kIjJbEgnlxtyCHqI
	 22CGAqgz5KJM+zh8lMrMPLbhYvSlBLPEPlak2UQjwFXzpRYi9iwbe76fvwrMwvmiQ6PBU
	 Z/ES82HZj5WAe7HUMrBU94Xv+Rqd/HCczBmNl1kbysgrfZkkl3p7rKCt8jASxmRrtxzmJ
	 D+Yv9FhyYquqQJWMuxDiqmDF8waM9zAkzSFck+v9Pyrjb7jyGIMEJUq6HcZde+2ZS3+th
	 VD+mEaUVR/FVXQJxcHLnzD7Pj9wzuA+VMWZij27/dEAxxQsFzoTnFu9EbNtyVAFQ8qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Xy1OFiK8QAKsLOeQzLn4MLjhiucoVu2UoxJd+NgwY3Q=;
	b=EyIL0H4POkEnyOsVqMCxJbkFi7Z9appUswONloybfY3EIUUiUzimKdobso8IqCcgOUtU
	 rr9mFhNw2GUXU1T754QGy1dMN4J9nmqT75VPBe7oLcdS2wxIqYAUFTsQUHD6VyTJjbHtb
	 nFaxAI121QBZSjEWd3TM4qPv2W4ml+IEdQ5+CKLntGr/H7APcejnPAcTk8KLJBKYjo7u7
	 Rm5gxzMTh7C4QP2Vpofpki5jwSI8pRimBRcpv1Z9dKg2MaTj7uUQKaNAdyHY/QJLc+qmp
	 DgCI05UEKjE6s5x/sK5B2NBg7bOzx3kIVk8/iaIZi4/RNey9wyOxeHGcIJb6HdfT2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tadamsjr.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K51IHVWv;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF39606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF39606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tadamsjr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K51IHVWv
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso1542611b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795025027; x=1795629827; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xy1OFiK8QAKsLOeQzLn4MLjhiucoVu2UoxJd+NgwY3Q=;
        b=K51IHVWviCB/DgjBsWFTM7fLyRlVZoQA7tIXKeKrJYvkVbSYZLEr6Q0mjkru9VswBi
         az013HPGwrheCU8MbZPXIsUqmJk/VuK/Mc+noJ5Lo1a0RIht0PzaZFO6KJ0X/rpeS1FQ
         BlOjQfSnSreGtjvd4wZZTnTJArp2UktvTNCpvmc6JZcUaVNDM30ag8Dp998MXGFFQtc7
         hsKjYMdC0RkAAVbe+TVudL6yCA4DX1kAr4M87BWnWMq4EL4EjFthGgHQf7ar4g8W3OW5
         WijWZ5DpEKnVosjI3+UIj01XbvtRPTRGjAu/4H2vD25Ur6Mfyt8/4X/xK8vG0zA34PQO
         PsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795025027; x=1795629827;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xy1OFiK8QAKsLOeQzLn4MLjhiucoVu2UoxJd+NgwY3Q=;
        b=l5jnBxeuI52JtZP5kKPznpY0GgtBFbvXVo+XfsnBGEqJVXDFaVorwnQXcc6C7Y5g9Z
         GDVyrpgj3QhPiB0G4Hnsz0srRo+ddhMajmqMf/PZl27MAZi7xFWBOUQjg85lVS2zlQ5+
         2Xub3XN3mFORlxOG3uLRYsUUSFKBYJt0gAreJccL42e7AbM0hH1VoIJUYYc/LTdg/uUq
         EUY5SB01F+BRbs4iHco6U2mN/fjTh3aiqo43Q8LbxKzksVJJ3HPiMlqt2ucai9XEsNCf
         MZy2Hhum5lxWvswQzul5DYAdSqw7D5iXqs25fycfp7sKFXi2VujSgJb8WPdniUj8rntu
         2Lng==
X-Forwarded-Encrypted: i=1; AL+hErGFhJ8d8glxkNaWcaU2gKlBM9So0fN+OQbFC6Mp6yG62A6lsbDjiMsnycd2TqK78VYS6jXPN2wSt3U8Htg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rq+Gfe+lKfqmKcOcSdydRuEqpogxFcyxd95llOVYvHNX9hSAT
	HxYUxYtfUDe4RuJdq2CVUXvUcmpLXSVN0sIMsJN0SurWH1aOt/d+ElHmiuM2Jrl2Q+Du0thIPQk
	u8at12bb5zBzQ0A==
X-Received: from iocqp3-n1.prod.google.com ([2002:a05:6602:a943:10b0:9c4:2037:88e2])
 (user=tadamsjr job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4fce:b0:572:878:fccf with SMTP id 5614622812f47-57743847637mr3821681b6e.59.1795025027191;
 Wed, 18 Nov 2026 10:03:47 -0800 (PST)
Date: Wed, 18 Nov 2026 10:03:44 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261118180344.1159617-1-tadamsjr@google.com>
Subject: [PATCH v3] scsi: pm8001: Offset hardware queue index for MSI-X pre-vector
From: TJ Adams <tadamsjr@google.com>
To: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>, John Garry <john.garry@linux.dev>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Terrence Adams <tadamsjr@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Terrence Adams <tadamsjr@google.com>

When MSI-X interrupt vectors are configured in pm8001_setup_msix(), the
driver requests vector affinity with .pre_vectors = 1 to reserve Vector
0 for non-affinitized housekeeping interrupts.

blk_mq_map_hw_queues() maps hardware queues (hwq 0 to nr_hw_queues - 1)
with an offset of 1, mapping hwq 0 to Vector 1, hwq 1 to Vector 2, etc.

However, pm80xx_chip_get_q_index() retrieves the queue index directly
from blk_mq_unique_tag_to_hwq(tag) without adding 1 for the pre-vector
offset. Consequently, commands on hwq 0 are issued with responseQueue 0
(firing unmanaged Vector 0 on CPU 0), while hwq k fires Vector k (the
CPU affinitized to hwq k-1).

This results in 100% of I/O completion interrupts being delivered to the
wrong CPU core, causing heavy cross-CPU IPIs, cache line bouncing, and
increased kernel and IRQ CPU processing overhead.

Define PM8001_PRE_VECTORS for the reserved housekeeping vector and use
it consistently across MSI-X vector allocation, hardware queue setup and
mapping, and queue index lookup. Update pm80xx_chip_get_q_index() to
accept pm8001_ha and add PM8001_PRE_VECTORS to
blk_mq_unique_tag_to_hwq() whenever multi-queue is enabled
(number_of_intr > PM8001_PRE_VECTORS), routing completion interrupts to
their affinitized CPU cores.

Note that offsetting completions by PM8001_PRE_VECTORS routes the
highest hardware queue to outbound queue max_q_num - 1, which
pm80xx_chip_init() also programs as the fatal error interrupt vector.
As a result, process_oq() now reads MSGU_SCRATCH_PAD_1 (and
MSGU_SCRATCH_PAD_RSVD_0 when no fatal error is reported) on every
interrupt for that queue, matching the behavior before
commit 42f22fe36d51 ("scsi: pm8001: Expose hardware queues for pm80xx").

Fixes: 42f22fe36d51 ("scsi: pm8001: Expose hardware queues for pm80xx")
Signed-off-by: Terrence Adams <tadamsjr@google.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
Changes in v3:
- Use a tab instead of a space after #define for PM8001_PRE_VECTORS to
  match surrounding macros in pm8001_defs.h (Bart Van Assche).
- Document the side effect of routing the highest hardware queue to
  outbound queue max_q_num - 1 (shared with the fatal error interrupt)
  (Bart Van Assche).
- Add Reviewed-by from Bart Van Assche.

Changes in v2:
- Define PM8001_PRE_VECTORS in pm8001_defs.h instead of hardcoding 1 and
  use it consistently across pm8001_setup_msix(), pm8001_pci_probe(),
  pm8001_map_queues(), and pm80xx_chip_get_q_index() (Bart Van Assche).

v2: https://lore.kernel.org/all/20261117175558.4146151-1-tadamsjr@google.com/
v1: https://lore.kernel.org/all/20261116224811.3362188-1-tadamsjr@google.com/

LLM assisted with drafting the fix, v2 refactor, and commit message.

 drivers/scsi/pm8001/pm8001_defs.h |  1 +
 drivers/scsi/pm8001/pm8001_init.c | 15 +++++++++------
 drivers/scsi/pm8001/pm80xx_hwi.c  | 13 +++++++++----
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/pm8001/pm8001_defs.h b/drivers/scsi/pm8001/pm8001_defs.h
index a9605ca317f3..9b37a76d8b74 100644
--- a/drivers/scsi/pm8001/pm8001_defs.h
+++ b/drivers/scsi/pm8001/pm8001_defs.h
@@ -178,6 +178,7 @@ enum port_type {
 #define	PM8001_MAX_INB_NUM	 64
 #define	PM8001_MAX_OUTB_NUM	 64
 #define	PM8001_CAN_QUEUE	 508	/* SCSI Queue depth */
+#define	PM8001_PRE_VECTORS	 1	/* non-affinitized housekeeping vector */
 
 /* Inbound/Outbound queue size */
 #define IOMB_SIZE_SPC		64
diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index 5af81c73a8f8..b1788788b7ed 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -104,8 +104,9 @@ static void pm8001_map_queues(struct Scsi_Host *shost)
 	struct pm8001_hba_info *pm8001_ha = sha->lldd_ha;
 	struct blk_mq_queue_map *qmap = &shost->tag_set.map[HCTX_TYPE_DEFAULT];
 
-	if (pm8001_ha->number_of_intr > 1) {
-		blk_mq_map_hw_queues(qmap, &pm8001_ha->pdev->dev, 1);
+	if (pm8001_ha->number_of_intr > PM8001_PRE_VECTORS) {
+		blk_mq_map_hw_queues(qmap, &pm8001_ha->pdev->dev,
+				     PM8001_PRE_VECTORS);
 		return;
 	}
 
@@ -977,10 +978,11 @@ static u32 pm8001_setup_msix(struct pm8001_hba_info *pm8001_ha)
 		 * include in the affinity spreading.
 		 */
 		struct irq_affinity desc = {
-			.pre_vectors = 1,
+			.pre_vectors = PM8001_PRE_VECTORS,
 		};
 		rc = pci_alloc_irq_vectors_affinity(
-				pm8001_ha->pdev, 2, PM8001_MAX_MSIX_VEC,
+				pm8001_ha->pdev, PM8001_PRE_VECTORS + 1,
+				PM8001_MAX_MSIX_VEC,
 				PCI_IRQ_MSIX | PCI_IRQ_AFFINITY, &desc);
 	}
 
@@ -1183,8 +1185,9 @@ static int pm8001_pci_probe(struct pci_dev *pdev,
 
 	PM8001_CHIP_DISP->chip_post_init(pm8001_ha);
 
-	if (pm8001_ha->number_of_intr > 1) {
-		shost->nr_hw_queues = pm8001_ha->number_of_intr - 1;
+	if (pm8001_ha->number_of_intr > PM8001_PRE_VECTORS) {
+		shost->nr_hw_queues = pm8001_ha->number_of_intr -
+				      PM8001_PRE_VECTORS;
 		/*
 		 * For now, ensure we're not sent too many commands by setting
 		 * host_tagset. This is also required if we start using request
diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index d2572dd66071..1d4f5ee861c1 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -4328,14 +4328,19 @@ static int check_enc_sat_cmd(struct sas_task *task)
 	return ret;
 }
 
-static u32 pm80xx_chip_get_q_index(struct sas_task *task)
+static u32 pm80xx_chip_get_q_index(struct pm8001_hba_info *pm8001_ha,
+				   struct sas_task *task)
 {
 	struct request *rq = sas_task_find_rq(task);
 
 	if (!rq)
 		return 0;
 
-	return blk_mq_unique_tag_to_hwq(blk_mq_unique_tag(rq));
+	if (pm8001_ha->number_of_intr > PM8001_PRE_VECTORS)
+		return blk_mq_unique_tag_to_hwq(blk_mq_unique_tag(rq)) +
+		       PM8001_PRE_VECTORS;
+
+	return 0;
 }
 
 /**
@@ -4371,7 +4376,7 @@ static int pm80xx_chip_ssp_io_req(struct pm8001_hba_info *pm8001_ha,
 	ssp_cmd.ssp_iu.efb_prio_attr |= (task->ssp_task.task_attr & 7);
 	memcpy(ssp_cmd.ssp_iu.cdb, task->ssp_task.cmd->cmnd,
 		       task->ssp_task.cmd->cmd_len);
-	q_index = pm80xx_chip_get_q_index(task);
+	q_index = pm80xx_chip_get_q_index(pm8001_ha, task);
 
 	/* Check if encryption is set */
 	if (pm8001_ha->chip->encrypt &&
@@ -4510,7 +4515,7 @@ static int pm80xx_chip_sata_req(struct pm8001_hba_info *pm8001_ha,
 	u32 opc = OPC_INB_SATA_HOST_OPSTART;
 	memset(&sata_cmd, 0, sizeof(sata_cmd));
 
-	q_index = pm80xx_chip_get_q_index(task);
+	q_index = pm80xx_chip_get_q_index(pm8001_ha, task);
 
 	if (task->data_dir == DMA_NONE && !task->ata_task.use_ncq) {
 		ATAP = 0x04; /* no data*/

base-commit: 63fdb511c27afcebce797e3db580b3534ddfa639
-- 
2.56.1.809.ga0b61035b5-goog

