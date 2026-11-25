Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607712;
	b=HC04uGnV8Sopu64MBRRtVJKrCEMC2wv2ibypEZLieijwgsrYwx1AajROC3gvXJgU1tVf
	 JjvnkqheKNGprh8nmpHMijMwQSih3/O8tZPN0ASUa0cuC7N8QjLF42uYS5h1BfwziL5jM
	 s3hCBCOrEaqhsKW2NsYI7d4+wQ7aByOJnfxLZpKY8WV6hi66xzXlgxQeVQnoi+Ze5FS86
	 ein3GVIp9GBu4c/VEwNQ75o9nse9XICIfuM38C5q6Mf6nJb4miayGtkQraUc64gtVdHWb
	 Y9FYbxcARyk/tJNdWVDwHc0/iFrPoT31A/IOlP3ue0Iu1nmZsSl7t9aLvQDVi2lHZPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607712;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
	b=t7pAetaUuVB14KMjS8BgeZjUv5JpJhQFpUvfhvaKIU63c6hKgQfs9UU9pWMtg6HnLBXu
	 MED7JPho59UuNUdaJxT/XewP46dzxzPFKQKkLCtaVOov48XeXaWXfwsulHkP1KSVI6Xxh
	 Jq6pBGVO/6gn+DE5vnWyRnImv6+SqPnvipInyPsZn4u/MrTa7kIXgca6QsdmWQsofwwWv
	 Z0bugrRwRZ2WT9p+O4hEQhd7p9qveTI5+eigPhpv7EjpvrD8sWdM+yFIf4U4FHLtuKLRd
	 EDDNr/rc0RFbRpaYpjD/V4dteL9vtmVdosXUaj5f2AZn9rOBEaNkGcx44HP5oeamLhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N2Ch7llE;
	arc=none smtp.remote-ip=74.125.82.98
Received: from mail-dl1-f98.google.com (mail-dl1-f98.google.com [74.125.82.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F52606A69D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F52606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N2Ch7llE
Received: by mail-dl1-f98.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3791997c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607711; x=1796212511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=igd8CofoIVVM4t3wAKiZnMrjTmxcxrsGv15FkQN/za7mBay04TIqKyNMdACWeNS4Tr
         IOcgTyTILQfKhDryz7T5VZiZbkKCrDiYF1Jipo143rZh74hlMB1PlnakdayK5OBjJ3ts
         LJ0hte2dXkytHCftgksbMbm46xT0AXPOe3gVDNH9FfqXlritUgd+E2v2yUoRZI3qrqu6
         xZRv2p3UKU9I1htZFEA5pSclQNt7+tZGJkq2ZMihDYRSOAwcznkrEf9SOICbTGFIew6g
         JEhSdhYelIjKRyO73HgOeokmhKrZddhkYDibQPVZtSsNpBm2kY3pjJUbolwl5TH23+C5
         eu5g==
X-Forwarded-Encrypted: i=1; AL+hErGdV+sRQCAJs558fQXixg8qgP/K1mFJqhsVLj6nVCnCR5H5AX5E1XkgBnRE0033ihmyS0Dy2svM8aCrnwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/62s9Zznk7rDfpoMaRkLes++JPGv3/38+sJqWkCsrjbtVkaAmo
	8e2RsmNv9pWZRxM71u08V9daq9Hk2UohKpMYWKPRWNKUYwRtist8qTtrXT/IEaxnBDqVlYp7RBN
	dgTwRayOoQgLV0iDDC9Xdn+zMgcrNR4jDvf1DvcD93oaUtn0k+9pY7PmSTpJZz0TZoESaPOSH/V
	muOcN973UZosEnCWS/CmHfFiw5SK7iK/Z3d1Ahxy/VsUngpny5dmt5cmBTDMFIa3bnE1RVgOdky
	7WWZFf7kgmLVP5n9w==
X-Gm-Gg: AZFdTZenHDf9iVw4Elu/CVP9/DRxKaJfUqAW/UtJMv3WSzb5CD2UyOZVc+/IeOTUNXM
	MYbBlgwHmxL425eZ5MwGDnDHbgra06FpvMyUXY5CBdalRsWXw8LoEaqbegrFFjgija987CWC4WB
	kCB1FHDTcqTYjkYitCEXtBBK7qTyVcB292mwtDubXU1JTT9jd10hzizJLJ9Ma9hcj4waVLgQ9JN
	RMSH85k/bSGGNcC+ZrRz7BpEPpFCGhcMIJX5nmMiH+3ztJklVuzEm7pP+8BkHq4BMhcUZ65Saed
	TKRH0qGp84nMTD3eWHn6lJ3bcU+R9BjlQpwh+nMd44KXNuE1pg6xLFUF17I4u7azFHXYjlnwJF2
	PDxyiZhemusZFHFWmfz22oeR3qVnFqxtFn1xGeaGpN6nhluoPVOgM3bCblUjdGH3nsFdbTXiEHK
	PEsi/MYaOTCe+TtaO7ZWoLmpvCCyBsUW5OjA==
X-Received: by 2002:a05:701b:4555:20b0:1a2:2da2:b278 with SMTP id a92af1059eb24-1b556894b6emr19524162c88.14.1795607710866;
        Wed, 25 Nov 2026 03:55:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386d2f538besm283508eec.14.2026.11.25.03.55.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so1233214eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607709; x=1796212509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=N2Ch7llE71wKKZAslcU9u3AibxLpFgi9w7ujnRiJurrMu9MmMjEI/fUFS6q5vcP3wg
         6cJbZgSkgFpFYZMv1+cnm/mbPKDbiGvOPUR6/KxblQZeOKxBahF+029fil4480KdUf9i
         mqqeKhyQyMEhkM/2SATi8QGsSUJJM65JiTw6g=
X-Forwarded-Encrypted: i=1; AL+hErGDn9cJX6epUg+L1NgOgdaZxnM45qO48JlWt1DkXj6PxLAtSxCsaLjWdnq25gfvwFVqYRqTPKrVQxlQLm8=@vger.kernel.org
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr9530246eec.22.1795607709044;
        Wed, 25 Nov 2026 03:55:09 -0800 (PST)
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr9530215eec.22.1795607708356;
        Wed, 25 Nov 2026 03:55:08 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:07 -0800 (PST)
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
Subject: [PATCH net-next v10 03/10] bnge: add helper functions for multi RSS contexts
Date: Wed, 25 Nov 2026 17:24:27 +0530
Message-ID: <20261125115434.2080590-4-vikas.gupta@broadcom.com>
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

Add infrastructure for creating, modifying, and deleting user-defined
RSS contexts. This helps the next patch implement commands for ethtool.
For each user RSS context, a VNIC is allocated.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  14 +--
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   2 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 113 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  15 +++
 4 files changed, 132 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index fef45dfa9179..45996d91dc55 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1126,7 +1126,7 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_vnic_info *vnic;
-	int i, size;
+	int i;
 
 	for (i = 0; i < bn->nr_vnics; i++) {
 		vnic = &bn->vnic_info[i];
@@ -1151,18 +1151,8 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 		}
 
 		/* Allocate rss table and hash key */
-		size = L1_CACHE_ALIGN(BNGE_MAX_RSS_TABLE_SIZE);
-
-		vnic->rss_table_size = size + HW_HASH_KEY_SIZE;
-		vnic->rss_table = dma_alloc_coherent(bd->dev,
-						     vnic->rss_table_size,
-						     &vnic->rss_table_dma_addr,
-						     GFP_KERNEL);
-		if (!vnic->rss_table)
+		if (bnge_alloc_vnic_rss_table(bn, vnic))
 			goto err_free_vnic_attributes;
-
-		vnic->rss_hash_key = ((void *)vnic->rss_table) + size;
-		vnic->rss_hash_key_dma_addr = vnic->rss_table_dma_addr + size;
 	}
 	return 0;
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 13871d3d8286..e0462a0f4f2c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -376,6 +376,8 @@ struct bnge_net {
 
 	u8			pri2cos_idx[8];
 	bool			pri2cos_valid;
+
+	u16			num_rss_ctx;
 };
 
 #define BNGE_DEFAULT_RX_RING_SIZE	511
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index d98a6196c859..a44971a7c74d 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -129,3 +129,116 @@ int bnge_alloc_rfs_vnic(struct bnge_net *bn)
 	vnic = &bn->vnic_info[BNGE_VNIC_NTUPLE];
 	return bnge_alloc_and_setup_vnic(bn, vnic, bn->bd->rx_nr_rings);
 }
+
+void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
+		     struct bnge_rss_ctx *rss_ctx,
+		     const struct ethtool_rxfh_param *rxfh)
+{
+	struct bnge_dev *bd = bn->bd;
+
+	if (rxfh->key) {
+		if (rss_ctx) {
+			memcpy(rss_ctx->vnic.rss_hash_key, rxfh->key,
+			       HW_HASH_KEY_SIZE);
+		} else {
+			memcpy(bn->rss_hash_key, rxfh->key, HW_HASH_KEY_SIZE);
+			bn->rss_hash_key_updated = true;
+		}
+	}
+
+	if (rxfh->indir) {
+		u32 i, pad, tbl_size = bnge_get_rxfh_indir_size(bd);
+		u32 *indir_tbl = bd->rss_indir_tbl;
+
+		if (rss_ctx)
+			indir_tbl = ethtool_rxfh_context_indir(ctx);
+		for (i = 0; i < tbl_size; i++)
+			indir_tbl[i] = rxfh->indir[i];
+		pad = bd->rss_indir_tbl_entries - tbl_size;
+		if (pad)
+			memset(&indir_tbl[i], 0, pad * sizeof(*indir_tbl));
+	}
+}
+
+void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
+			  bool all)
+{
+	struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+	int i;
+
+	bnge_hwrm_vnic_free_one(bn->bd, &rss_ctx->vnic);
+	for (i = 0; i < BNGE_MAX_CTX_PER_VNIC; i++) {
+		if (vnic->fw_rss_cos_lb_ctx[i] != INVALID_HW_RING_ID)
+			bnge_hwrm_vnic_ctx_free_one(bn->bd, vnic, i);
+	}
+
+	if (!all)
+		return;
+
+	if (vnic->rss_table)
+		dma_free_coherent(bn->bd->dev, vnic->rss_table_size,
+				  vnic->rss_table,
+				  vnic->rss_table_dma_addr);
+	bn->num_rss_ctx--;
+}
+
+void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn)
+{
+	u32 tpa_flags = bn->priv_flags & BNGE_NET_EN_TPA;
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+
+	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+		struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+
+		if (bnge_hwrm_vnic_alloc(bn->bd, vnic, bn->bd->rx_nr_rings) ||
+		    bnge_hwrm_vnic_set_tpa(bn->bd, vnic, tpa_flags) ||
+		    bnge_setup_vnic(bn, vnic)) {
+			netdev_err(bn->netdev, "Failed to restore RSS ctx %d\n",
+				   rss_ctx->index);
+			bnge_del_one_rss_ctx(bn, rss_ctx, true);
+			ethtool_rxfh_context_lost(bn->netdev, rss_ctx->index);
+		}
+	}
+}
+
+void bnge_clear_rss_ctxs(struct bnge_net *bn)
+{
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+
+	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+
+		bnge_del_one_rss_ctx(bn, rss_ctx, false);
+	}
+}
+
+struct bnge_rss_ctx *bnge_get_rss_ctx_from_index(struct bnge_net *bn, u32 idx)
+{
+	struct ethtool_rxfh_context *ctx;
+
+	ctx = xa_load(&bn->netdev->ethtool->rss_ctx, idx);
+	if (!ctx)
+		return NULL;
+	return ethtool_rxfh_context_priv(ctx);
+}
+
+int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
+			      struct bnge_vnic_info *vnic)
+{
+	unsigned int size = L1_CACHE_ALIGN(BNGE_MAX_RSS_TABLE_SIZE);
+
+	vnic->rss_table_size = size + HW_HASH_KEY_SIZE;
+	vnic->rss_table = dma_alloc_coherent(bn->bd->dev,
+					     vnic->rss_table_size,
+					     &vnic->rss_table_dma_addr,
+					     GFP_KERNEL);
+	if (!vnic->rss_table)
+		return -ENOMEM;
+
+	vnic->rss_hash_key = ((void *)vnic->rss_table) + size;
+	vnic->rss_hash_key_dma_addr = vnic->rss_table_dma_addr + size;
+	return 0;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index 72357e0b37ac..382df442789e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -58,10 +58,25 @@ struct bnge_vnic_info {
 	u32		vnic_id;
 };
 
+struct bnge_rss_ctx {
+	struct bnge_vnic_info vnic;
+	u32 index;
+};
+
 void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
 			   struct bnge_vnic_info *vnic);
 int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd);
 int bnge_alloc_rfs_vnic(struct bnge_net *bn);
+int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
+			      struct bnge_vnic_info *vnic);
+struct bnge_rss_ctx *bnge_get_rss_ctx_from_index(struct bnge_net *bn, u32 idx);
+void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
+		     struct bnge_rss_ctx *rss_ctx,
+		     const struct ethtool_rxfh_param *rxfh);
+void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
+			  bool all);
+void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn);
+void bnge_clear_rss_ctxs(struct bnge_net *bn);
 #endif /* _BNGE_VNIC_H_ */
-- 
2.52.0

