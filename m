Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428689;
	b=XidD5Mpo/FQfRp07/aimudh7Ib6V4gqM2GRKDqGQ+yROqQ/hRC1PlJ3XhrZdba4AOEk1
	 SNqC7kntLVc19oBBjrrkwbBW4Ff71IR23bYNsOg8x6Eq7OebDVlDQcGFohLnCvbTcTPGE
	 9OWtUS47xDY3tR63gwPPkZEvdwuApIYVXT46pqatGq4suU+wuxRflVXlPoQ10lb4EkhoP
	 pwZ7lYTIhpAI3pIPgyrPkA6yFjSDqG1p3RjLO4RU/I1qDCOlVtaKsDq5PX4Jtft5lIeML
	 OQLOAzDeEIH4QuYkqZjt+JwVapNFV7SdrY9c3JENzA/Ibr4VY4NZLHSqTPvHOq4RdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428689;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AnAwQ841IOGjh75NvtN/StXlo6Nrg4MwDeFEkCBWBSY=;
	b=0wg/bhq0RqGiUykWzxa380xu6Dh2bZdZmo2QE0x14BPU5D0/hqinTIl4BibmcbEABIiR
	 Tce5jWqBpDQN5Xsm3TgRoqVoxAixXxf2wYFnar9R/jYIj56C4AdmNAM7ESdD1dvJSmZSE
	 nvO99QAJ/SIG6YQ885ZipJvPqCVpFvXfRiqFM49W+CqnYno6gdLknaGrzF0S5BSx2UczV
	 noNvMVC4XloLyBHNbTnEKYjMBtYhPkd8wH80rJL9i6ZDbgzbMq3s33O6bsYIY+LpySArg
	 nKkjmv2DhU/qSvRKhnxCU4CfrFoiRlWmffKbuljCr0r5dhs0ekP7wYr6gsW6CeqvEig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X+tdNFYv;
	arc=none smtp.remote-ip=209.85.210.98
Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17A606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C17A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X+tdNFYv
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-843cf077f10so4502553a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428688; x=1796033488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnAwQ841IOGjh75NvtN/StXlo6Nrg4MwDeFEkCBWBSY=;
        b=0erNNxfHjjSxMZjydqH8QnU394qiHNerYJIEB7G4TlG5GcsM98tMdLi6F9YxIdeYld
         fpHm1Yo594tuNzQyjIpJJKWcQ/C99GbvVTfgKWMLa6fMLzQcYtEZibHROyvh3PbZaU6y
         RzCzkQIDGTvBTvUZ5Yi3WrA9TmRftKr0RF+l7h858gfI/sXNrymmWwloNOMkGgQwBO29
         fL9kbwGCJivb6zoujsJN66oW4o0YBfcwRL31VTXjiJjWfMQxSf56EUNy33COxfUnYIIR
         VHei8GcvhJvFOfirmGG6tGb7G2dAURZ58VSqdOlX/JLmC3ig1XGdo0VvJCJo5Tbs01As
         8U0A==
X-Forwarded-Encrypted: i=1; AL+hErEdJYH0Ljb4l4vR9RnmHSIlxNE6WdCQxdPZrvU0rY+VnHjv0eQfEmTh98asdKMFYYZq+d3MCC7PC+aXPkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ePv7I0RvvI3erK6kCWg9h8c0XW8Dp2RlKHdR0s3I21ENahipU
	QrqXaSmiMV4LtBy7ON7fIQImwFPFUQA7EJdM3FaIzVP9TCucmnxH91UUY36PYoMXg59Cz35aRmG
	X7LyeRYqtiiQA9QdMn6MxC2Tr3klhAtpNWd9A2ztFwwbAlPqZ4Se/3ANGBGk8lXpshpAQHWfM6G
	cDLp2z7XU7mVa7z0BUrBxzc5cHN/N7yn/Vt5x+S9Nwu5A1otCoSpvZWBjmrXUch88SnKp1Puk1k
	hBKlaCJw0KdbOkl0w==
X-Gm-Gg: AZFdTZcqsdbwvNqnJfAbJPPldCaQJuiCtAowtsYRIcCmeX/ilgDiMORjrmVtDQIuKmI
	cBqWdDgn0AzMNYO6s/17Iz/aShxKxhNYNSaR54lPkvNZPZWOmAtzcYQhNyyTUWrmlMkUtxB51Zq
	WC2Sxceh0cZ2yJZEmGC1HiAqNUGDCIsPWTmL4jC3D7BDU5AB5xiZLn15zJA2yzFizvz45ZgkNNb
	Hy1Ae6zM12hfzmRw2+5y72JcN25wDrpDYgbEpSsycnt7ZBCF5p34+onm7sNcBMxGbsP/dupP+iA
	NmGL2GGGthtDPQtBzxXALNxTqXB4n6+XbvM5GkPYFF+c7Aq3Xid3mzyD0eDuT+z1bszLjSUvA/0
	yjQr1t8aeoNqB6mhCPyEFrmDhlHVMIDpCA7ott8DarL/rxlF+liToQe+xPGOTpoMmd00oU8jpbd
	KTV8in+t7VsCvf0EHzM8UOum1+fmHLZ9TatQ==
X-Received: by 2002:a05:6808:448b:b0:4c4:3997:ef2f with SMTP id 5614622812f47-57a0ab2d94dmr10740172b6e.17.1795428688102;
        Mon, 23 Nov 2026 02:11:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4bc61370458sm77420fac.28.2026.11.23.02.11.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:11:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so895134eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428686; x=1796033486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnAwQ841IOGjh75NvtN/StXlo6Nrg4MwDeFEkCBWBSY=;
        b=X+tdNFYvoBrwfr+QvUNbidrVK/HCwD5jDppwBErWVOvrpR/47stY53IUhdL9dwe/uI
         BI0pYbN1XSJlF7Jusl7niGJPK60SenAgA5jXW5/FmUby+TCrV4nl/t4SFs7KdRAtV7Z+
         3xVelZsTv04A1UNA7J2Mi8WNWQpI6geaZTWwg=
X-Forwarded-Encrypted: i=1; AL+hErHlyIjsutmbTXlVB5V30LVqeAZvkmxMBiEhtF7q3wd5V0z3adaM9aTMfkjsiu/nVmyakUC+kLXfEyENl2E=@vger.kernel.org
X-Received: by 2002:a05:693c:62c3:b0:386:a9f4:2d49 with SMTP id 5a478bee46e88-386a9f42e68mr3653884eec.36.1795428686413;
        Mon, 23 Nov 2026 02:11:26 -0800 (PST)
X-Received: by 2002:a05:693c:62c3:b0:386:a9f4:2d49 with SMTP id 5a478bee46e88-386a9f42e68mr3653853eec.36.1795428685710;
        Mon, 23 Nov 2026 02:11:25 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:11:25 -0800 (PST)
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
Subject: [PATCH net-next v9 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Mon, 23 Nov 2026 15:37:46 +0530
Message-ID: <20261123100746.1975030-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
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

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index de7320521a3e..dcd073d8bdfa 100644
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
@@ -2569,15 +2583,53 @@ static void bnge_nq_free_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
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
 static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 {
 	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_irq *irq;
 	int rc;
 
+#ifdef CONFIG_RFS_ACCEL
+	rmap = bn->netdev->rx_cpu_rmap;
+#endif
+
 	irq = &bd->irq_tbl[map_idx];
 
+	if (IS_ENABLED(CONFIG_RFS_ACCEL) &&
+	    rmap && bnapi->rx_ring) {
+		rc = irq_cpu_rmap_add(rmap, irq->vector);
+		if (rc) {
+			netdev_warn(bn->netdev,
+				    "failed adding irq rmap for ring %d, disabling aRFS\n",
+				    bnapi->index);
+			bnge_free_cpu_rmap(bn);
+			rmap = NULL;
+		}
+	}
+
 	rc = request_irq(irq->vector, irq->handler, 0, irq->name, bnapi);
 	if (rc)
 		return rc;
@@ -2602,6 +2654,8 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	bnge_free_cpu_rmap(bn);
+
 	bnge_for_each_open_nq(i, bd)
 		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
@@ -2616,6 +2670,7 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
+
 	bnge_for_each_open_nq(i, bd) {
 		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
-- 
2.52.0

