Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607752;
	b=JP2/gPZ1bMmvqBUQIhaieHFTpRdu3tGIm8TRSsV8D+xPlNK0jDfvzOyz2h7ngJykLRi7
	 FlUB+bQMr9XKskM5t8aX78Rl/ZM2DIfucHp2CqjBtx/tGmA4DcvyQTPMMEs7Y6AJNFGou
	 fYQOBNJ2tgTOr+4lBC78C4EoPYc0ArJrvw5ktNEPiQvftO6Gch/SfYBug4HLgDhdzbF3w
	 M8c/KqyGAASHukva28OnmI/OZ0eigYPCFb9YcOvDiwZ7INpsveu6BpvxTUO7TjIEHFsig
	 0kU10Pwn+xM8Zyi2AeVVpShnj4YdCWsAAzTX3QKtswLPTfv1MHXfy2tS3hIm40/VX5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607752;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=6sEKr0Wik7R27XPTt4Du8uhrH8DMmzZEz/wCOQWOaFM=;
	b=JNY4iwGntJT0hcemP7HxB28qGjSEtnPxAGnSDOo4iIW0YzHc+8iW8cqKVawYzZTsSaRX
	 IESYdsSlxd/SIaHNvnoSkDJdI+QwpwfE8m3utXPG5f6GszGf9KIOGIM514U8+3N/wOPOs
	 wg3FDtKmzaaCkSF2q6ar8ZCo5l/41fLzMmQqU8UYPIdD0/oqKgS30kT7vZM2IIs1bFzQE
	 8s2Qa+dsfKLbLmEJo2BZQGaiWfmuxccQBlNuWGyAnStOnaRx7Z7Ls9FIyf6TVpNP79P93
	 6/gAwDdiw+B1AHqDCdQ3rukn7EnmNIp7Vx/cEG3M6K1Mza1IJbBuwvhL4zpnKkDTPLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GtxkPN9D;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4DA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GtxkPN9D
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3682267a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607751; x=1796212551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sEKr0Wik7R27XPTt4Du8uhrH8DMmzZEz/wCOQWOaFM=;
        b=jHFC8plZvWmmarrhaP0PN9TWUzi3wf6ZSSxZwzIJsOXAfyDNhY7o+N+RGTMBokOtQg
         zrLlGNn73ErN00O3aSZbCdJo1600xtYRAb2VN7SjV9l5YeZOvDhgrFRZePcT987lDK6a
         Ryd8l0BVEcjnPHGHkEbG5CRZDJNPZBKE5CLXDbigtTzrflyFT12kujZvKCXPd1CbZJE+
         Oyaj0HMtR8u52iovw5jpyxKDRK3O+To05+zDAVcPBoB5X/A7AUyK+zBFZw7JSRH3Ki4a
         DZBhJD8gseYG9oNT4nlwLuRIQ/ezl7vlqj+GZLo94Nm5yPHtp3kdEaYTvZ0lmCZLFnzr
         bm5w==
X-Forwarded-Encrypted: i=1; AL+hErErLG7eJBzZ8xQANvX+A6w2x3CvuOeLqeU4IUZJ7PxVeznwGNzumP6oVQlN19t3WH80W4MxHWmY4b2v4bw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dQNb3suHAgUv5MLS2aylmkB1F0TNSCpHN/Mn66kLfliohBfOQ
	Q/ARZX/HnCodKtTVoluVNlE9bpGuep7UAUyQwStiGG4Otq+DInHG0AXIFQkKbioDOCsZxzKAHjB
	eE9C8D0SV3ruKmugcwey57UzzudKgcRu4isUj9ANELN66eVhYIsmKwXyyczc92quk/ycH94U5x4
	ofrMRUzIN+cF9xGisMSu+YGcjJqVGS2SJRsJilh31j/gTX4at1QJXIOKExXKVCiv1aqCWW9MHWC
	+6GEUdKHlUHQklnww==
X-Gm-Gg: AZFdTZeK8XXy92/emXpIkq2T8EHHJyX59VMyJyjOs26m6u8MnPNqSBqxDCEwFzUQbMS
	AHnCZVtCWOhJBLfFXwbP6nXP83kioUFKVNWNIxNjAFK5EBM1H30O3bdpeJmhLxukPjB1cMYiMFV
	x+m84vYy3gW/HcYWK0XCmvS7sP3fNqSm+CdIDvhmUQY+7hyHh7Wi55Mip6CSYsa3JGRuwkoG1du
	dx+jXojGWuMAe6k91YtWgc/2EONauj5Fagae/eZPEjCx0/4fQAm89TqRO12iwTFhtch2hbV2Oed
	oEENG63cT41qiW+5nuMgjdfMthiQWxlXzBY99Ol6Ph62q3msO0pgU5vvDdKe5iRyNfLOpxAG/mE
	xYAbbT/ZATv0BwuzkmFAtyfLtsRvsiXXxB9Xet+WQ2wNCboCO9eYB4eL5/K6HPptBwpUq3BltD4
	9ZMfkvC7aehHlFQHFRx5gF41jiSk89hDTBUQ==
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b41c90329emr16956200a91.30.1795607751056;
        Wed, 25 Nov 2026 03:55:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42a5a2de9sm11887356a91.5.2026.11.25.03.55.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6186490eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607749; x=1796212549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sEKr0Wik7R27XPTt4Du8uhrH8DMmzZEz/wCOQWOaFM=;
        b=GtxkPN9DbNSFnInrvZKgPDcdpFnTQ0Kk7mLYYP2ZPIDR+/W/ceCcrmgzym9eVWBJwn
         aoQRsk5uAwOYmfWZN71SEyr9VkSjYFKSxAQRVhIyTmpFChH688eur8u6vT7dbBSM8WxV
         aSxPEC+O18zoCtDo0+8B+Otga10LVRt2+ZYc4=
X-Forwarded-Encrypted: i=1; AL+hErFz45DKMu+3GmVWu5ojLayARPf/9CrC1oVloXSOibALxrU9wW+HgCkp40EZR7gG7SLWhqWAdgHdb+HII7A=@vger.kernel.org
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr16140547eec.35.1795607749331;
        Wed, 25 Nov 2026 03:55:49 -0800 (PST)
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr16140512eec.35.1795607748615;
        Wed, 25 Nov 2026 03:55:48 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:48 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v10 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Wed, 25 Nov 2026 17:24:34 +0530
Message-ID: <20261125115434.2080590-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
References: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When CONFIG_RFS_ACCEL is enabled, allocate and populate a cpu_rmap
for the RX IRQ vectors so that the kernel's aRFS infrastructure can
correctly map flows to the RX queues serviced by the nearest CPU.

This ensures that NTUPLE rules created by the kernel steer packets
to the optimal queue based on CPU/IRQ affinity.

Also, This is the patch that turns aRFS on. Before it dev->rx_cpu_rmap
was never set, so set_rps_cpu() took its early exit and
bnge_rx_flow_steer() from the previous patch was never called.
A failed rmap allocation does not fail the open; aRFS stays off.
If adding an IRQ to the rmap fails for one ring, aRFS is turned off
for all rings, because a later ring would otherwise take the free slot
and map to the wrong RX queue.

NQ0 is requested at probe, before the rmap exists, and is not one of
the open NQs that bnge_request_irq() loops over. Add its vector to the
rmap first, so that the index of every vector in the rmap is its RX
ring index. Otherwise each vector lands one slot too low, and aRFS
steers a flow to the wrong RX queue.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 71 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index de7320521a3e..b031b3c0af0b 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2539,10 +2540,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
 {
 	struct net_device *dev = bn->netdev;
 	struct bnge_dev *bd = bn->bd;
+	int rc;
 
 	bnge_setup_msix(bn);
 
-	return netif_set_real_num_queues(dev, bd->tx_nr_rings, bd->rx_nr_rings);
+	rc = netif_set_real_num_queues(dev, bd->tx_nr_rings, bd->rx_nr_rings);
+	if (rc)
+		return rc;
+
+#ifdef CONFIG_RFS_ACCEL
+	if (bn->priv_flags & BNGE_NET_EN_NTUPLE) {
+		dev->rx_cpu_rmap = alloc_irq_cpu_rmap(bd->rx_nr_rings);
+		if (!dev->rx_cpu_rmap)
+			netdev_warn(dev, "Unable to allocate the CPU rmap, aRFS disabled\n");
+	}
+#endif
+
+	return rc;
 }
 
 static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
@@ -2569,6 +2583,50 @@ static void bnge_nq_free_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 	irq->requested = 0;
 }
 
+#ifdef CONFIG_RFS_ACCEL
+/* set_rps_cpu() reads rx_cpu_rmap under rcu_read_lock(). Hide the pointer and
+ * wait for readers that already loaded it before the rmap is freed.
+ */
+static void bnge_free_cpu_rmap(struct bnge_net *bn)
+{
+	struct cpu_rmap *rmap = bn->netdev->rx_cpu_rmap;
+
+	if (!rmap)
+		return;
+
+	WRITE_ONCE(bn->netdev->rx_cpu_rmap, NULL);
+	synchronize_net();
+	free_irq_cpu_rmap(rmap);
+}
+#else
+static void bnge_free_cpu_rmap(struct bnge_net *bn)
+{
+}
+#endif
+
+/* The index of a vector in the aRFS cpu_rmap is the index of its RX ring, so
+ * the vectors must be added in ring order, starting with NQ0 (ring 0).
+ */
+static void bnge_nq_add_cpu_rmap(struct bnge_net *bn, struct bnge_napi *bnapi)
+{
+#ifdef CONFIG_RFS_ACCEL
+	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
+	struct cpu_rmap *rmap = bn->netdev->rx_cpu_rmap;
+	int rc;
+
+	if (!rmap || !bnapi->rx_ring)
+		return;
+
+	rc = irq_cpu_rmap_add(rmap, bn->bd->irq_tbl[map_idx].vector);
+	if (rc) {
+		netdev_warn(bn->netdev,
+			    "failed adding irq rmap for ring %d, disabling aRFS\n",
+			    bnapi->index);
+		bnge_free_cpu_rmap(bn);
+	}
+#endif
+}
+
 static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 {
 	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
@@ -2578,6 +2636,8 @@ static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 
 	irq = &bd->irq_tbl[map_idx];
 
+	bnge_nq_add_cpu_rmap(bn, bnapi);
+
 	rc = request_irq(irq->vector, irq->handler, 0, irq->name, bnapi);
 	if (rc)
 		return rc;
@@ -2602,6 +2662,8 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	bnge_free_cpu_rmap(bn);
+
 	bnge_for_each_open_nq(i, bd)
 		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
@@ -2616,6 +2678,13 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
+
+	/* NQ0 is requested at probe, before the rmap exists, and is not one
+	 * of the open NQs below. Add it first, so that the rmap index of
+	 * every vector is its RX ring index.
+	 */
+	bnge_nq_add_cpu_rmap(bn, bn->bnapi[0]);
+
 	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
-- 
2.52.0

