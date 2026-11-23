Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428656;
	b=kDGjPtf5qV/om2t/zeL3mRUOBFdzij3GvB5Hj15dB55UMrIQKwpxJ2h67y5ct8l9JpEP
	 GDOBgtSyFcSkSXxY6vpicObHzaN/8kOm3kIrlEMig8zQq8257IByoMMnrJph/NOhtopWE
	 D5qhyG2GLP+wrE9Fah2UPAuG8UhnIWPr9dDgItEUsDqIdL8q+aair2OvEO+BbOyCyiV8F
	 Iueh9zLQZLTq+wMRMGcvqpfN/c5DZfIU4XhcZUE31vl9QdfCrXRSb/HwSc3gCRieb5DDd
	 SKuxmjGMoNd2/maDF2/jmz7zCC/MixDug5yqHniN9X3/ZrI4Gl2hrQ1XLPIzC3fgfsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428656;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
	b=x6jX+m7mW6LpjRzUiXXNIbIwFC3klF4NeJcLS7fg+0GnqJBlqxSV4e1v3pssprYY188G
	 z7Pyi7I1nkyFGeL4xStVePdiSvD9CQgjdc4NSLkRywqkBYMvoANFyHUj5racEABPeXkyi
	 Hea9gsRS6blRuSBQqSviH8vWRcj7xZ/dlAsdlZUdaaPaJdN7aCZJYkl8AXZhFlbtSIUYI
	 s6tiIYpL9O9BHPQpupwo7XKTV0hwgxHmj8ZIqvHengeSGWaiOrp81ahSdJPaWyfe+WANO
	 S+bYRRO5c9F/EPXE0y3y7YfOlKcVpkFnPVtUI5Y3KHAhxnPXuJu2xwDZDQepVkXVuSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LW6yudfu;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BC606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759BC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LW6yudfu
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc758830601so2458169a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428655; x=1796033455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=EAa+F/VtIO1WMQDn5gmvg+hGUNAb0zQRQq+apKLeChnsnN/enUNd3HYjwLe53bvMV0
         IgpLW6XnkbrylUySOp7EW47umvX5LPw/zYAzjkYdF6fgcquuJ5D6M7S/mg7TGKgg5BTy
         r/UTleQvr9RCXlMTRfsiJnKvOLQpxgwnfmYPgpTsAJjTUGFLDEkY94ckRWJ9tygC24mw
         ICeHRQVbSe839KmjEpO4Exge9+Ng1x3pG2VbsugfFWF9WfVjrnIqZpdB+BbZC7JSeXql
         YDzyDMwRktm4RsN9XIrT7t6X+fi78Uz8n1XjhGfEx/V46Go9wUbrHn15157cJTHEsn1H
         NQxA==
X-Forwarded-Encrypted: i=1; AL+hErEfTNfzKI4OvUpzceZkFVmVVfhyafldiHSqqBL72WN0y6b/1BUta5SjUOl7SskCQr6wn6m3DwBzKbUFX48=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hd2FfZvwBFDP7cBup13YKjX17k7sLJ9eXDZi+9EN+sb8mhbMp
	MUmVwmRXr+0B83FlQXW59mf1G6OcddZ4cypQdCEBtRahmgefW6e6wq4KVHF9J0+AvWSS5uzH7ue
	ycOcB4BfOyWnmGlfRWOj50lNlFhonmj/v42C7Xuf3iWZ8OZuU2dncnpC7ZjHswt/8HjrN5GsO9T
	icOAH5uWFY9gRQhLdAmAtW+8FLUqtb0ffDxaQWCkjvQj5G2+C9xvsPou8479vYXcgGyyCpgWPUy
	T31UtTybTrMNXGRyA==
X-Gm-Gg: AZFdTZfpCMwtyTSxZlXZT+K1mz4j2HQ+gEABkM7GegC1J8b+4dAu1DgslG7L7c+RMqr
	JH98K51lpmPNJ2H5QIVgmH6OGOKg1PrjEod/MHoAQ+vtnAWJsSBwNOkkj6I20qZQLFAFW5TQYFX
	wx1CSULzJX1VLfNKXBkobIe67irswRBR9Xi9c4CNzIGmoEqchbGDBB0z4bZ17tzhk2iuz43d5yt
	/GiMi04HHt2NxoNrKx3i/TNqk2lkLgwtv/WvE+lPiyK5xYCyt+coQDressg5bNdWv02BDXdl2VL
	WipnQJrGE/2d7Oq7yMgMiwUnPiERPgWukJYdKnrIFMjWqYVXlVoZfQyYZ46wkDx4dH43bGX3I1q
	+HERnWz6VC30bouAWTqDloQX4j9cmGTBcl5GFgJoNw39YvVOLDai6QK8a6JW7rCUmo2FcyjcqZ9
	pLJIKW/Vl6UvoYH/LMFI5Uomr23xvFFkfhz3AT
X-Received: by 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr11146010a91.17.1795428654784;
        Mon, 23 Nov 2026 02:10:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffe5f2csm3471649a91.2.2026.11.23.02.10.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:10:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so2446019eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428653; x=1796033453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=LW6yudfut9hZ7zLK5sGW6S0zU2ZST9UhAdKD4nelA3XjnSEKicHaXXHC9bL8fbNdFA
         GSfligbSqkQAXuovM6q5W3tN4/hbrM6D7berxYVINauDZxh4dNlZk1ftcWaeUh16AMoa
         cndykJ5GhRXvybMSnq/WhgfZEWkqvBUf/Q618=
X-Forwarded-Encrypted: i=1; AL+hErEtEVWTRcBzfNeBiHBLCOBKhDf93gOdm55cqjWZ0bFxZIUj7J2X7rIiPN6tXE6jLiEcKW/wssfw46/qKwQ=@vger.kernel.org
X-Received: by 2002:a05:7301:6a03:b0:385:556b:4df5 with SMTP id 5a478bee46e88-3856f94dbd3mr16337352eec.26.1795428652432;
        Mon, 23 Nov 2026 02:10:52 -0800 (PST)
X-Received: by 2002:a05:7301:6a03:b0:385:556b:4df5 with SMTP id 5a478bee46e88-3856f94dbd3mr16337306eec.26.1795428651754;
        Mon, 23 Nov 2026 02:10:51 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:10:51 -0800 (PST)
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
Subject: [PATCH net-next v9 03/10] bnge: add helper functions for multi RSS contexts
Date: Mon, 23 Nov 2026 15:37:39 +0530
Message-ID: <20261123100746.1975030-4-vikas.gupta@broadcom.com>
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

