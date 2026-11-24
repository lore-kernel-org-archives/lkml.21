Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514909;
	b=BGhfJYfEdp6VMATTcDu9H3kk6gXzJgDe+6/pz9G1KPHxA4OtYyb2LnMg8kkGjgiuwNuv
	 PTZ/RijvF8NrG/PcfgHVI2UvqrDDz2cPPc6hdK4Bqess0tg/6l+RoxTu2bK3f5sP1Pm4F
	 CO2CccLF68IN2bKwE0rNY6a2gsedGs8I5IUqZ7jAL9ABQrJyNpjrfRoFH5jrW+PwNl7HX
	 P7sA37eLV8FiOVuCvYKh5KrlwfyuAfkaMzDp6FJ6fniyIv+JsfkQERek+tLAaR7phjA7Z
	 x2+DOlMzCkfKvioKd97GxH+CEKw/U7BZpwr57nmOJodtBNaGfCC9bN1G+2GpIfQqziA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514909;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7sr2PlAC9OF5ENvJF41XPyVoCoFn1SUHJiRui8L1ktg=;
	b=VJmNqEaeJELNCDHliJSlflNiNkpaIfwFKY3RoI1q0+1+Em18I/Ib89GhkH/CRXOsd1oh
	 Rqf8bX2HDNoxTWTF4but0sc5R2lvWqQaTjaoU+Iaa2JemT4Rtm7Lt7USxAv75NpNDZ5aa
	 bEALR5tAJe6uHAxnbkE/STdFVYKZ41J2fJT6xWPUYBB3dkdsn3HMssGSgIEasFt2aPudP
	 w+c12wv9bkESq0mPCem7mHGRDt50bJrBpsaPg6k6t8ZTPRVH/KlnoCnA7vfVFpQxzSSGz
	 IKDmOmvrHYAT7SfUOS5sOkI3qoKHDHRz8HNjiCI5rI0Dh2SrDSWGLc4tlzrT+LRoZig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QSHdMSRq;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F197606A68C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F197606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QSHdMSRq
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-949657a20d7so436051485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514907; x=1796119707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sr2PlAC9OF5ENvJF41XPyVoCoFn1SUHJiRui8L1ktg=;
        b=Y36F566WA0qnu3dWdP3NL83Nyve0s8VX23WJOQ/Z7rhbu2WPgsbSxpxdIPbrSJml2X
         b3jkKmnGqCKd3Pa0uki+He8vA9aMUgATRZSq8DPYnE1yOAOTq+viUjLGEOCxhTgfY/tt
         QBOB3Yyt2SObVBE8UX/LILNgg7EjcZfoAY6KJuaOkSCPMX0Sst9k0Doghl/ewlNuk1wI
         zM8dS0PezypIfaE0JnMmfVabYJtShEnTr0Y/usKSwisUjYNHxA/OjtwMDy59RnaQdb4z
         9WWpH0hXPUxCjSsn+kp4WvyWpHUlhYb10eagUulREIFMXQNFH5bguIBQSTUusxUPNyhW
         Wqzg==
X-Forwarded-Encrypted: i=1; AL+hErEqPTufQGutXf4aRnQDswGWAdLF9GqoS5qDB8jNZr6HtRBt0OQA/ed/pUjt40NcVgf4yEHVet4qWLaUcc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sWWhKL7B7lfz80aEnD+QFrKsYF3sPtGcweFCjCxKZS8jkUYLl
	ySx08zEc0hXgLJKMCbDtqiOtY54l1xnTQsM4N+A8zgcYUMD/UXAY04ZhGFXLOyE95PgTO94RXp4
	GnrELtcUSQ1STkTHz+njYWpGYLAtzvQtio9h+ydEfTOOrU5No77rZ3HziSDr3rY0IcL8jgTSKn+
	ebYz+JSFXGAv5QrjaWAxaW+c9Y0qGccUIWko3rbHwwIaiPChOOs9filE3LKPqg6+xKirqSGdVyQ
	35+xxMSFXbytrQYo04VwP5/BqYI4Q==
X-Gm-Gg: AZFdTZfj4+f0Mgnjf5hRo8XwvyUWwY4bk4mVj3aUSW8A9GPaTedD7cFuhUntxeDj7Eu
	Cwitc0YUPbjt5dqXQUi7MRu5+TxvSPXsdJKat5aw7hH57b1NVvMmCJWN3F0MDhPGaQlNtKlmXou
	jXucAh9ZK7+AgTipunFKDNoBrgvVA8Ee05wgcKkP/sPBAoAUUWkYwTvPBAWW15Z89LskCrDm1l/
	lApyEm589RCV5peUafK1O6seAIP7DnlSQDN4ctE8kHge4VNd0xy7LPS2/JFf/9dC0djScbVJGhY
	XAuYzB12DYJbhGsmT121F8aRZF4m2K/VH8eIz00BAEPZk2wpAQpA2jEPq1K29P+6I69YypGxMSK
	oT0nN90pFw0dQdbcSYkLof5yuenEeggeBQZRs+C0N440vQD9UxZwk2INOkkCmIYgobsDVgdL6dC
	34DBWiTgKfjZRKdZBXnbgcYnmW9qJQ6qmMN502TM2SPqQScw==
X-Received: by 2002:a05:620a:404b:b0:93f:2ba5:1704 with SMTP id af79cd13be357-949ba95e600mr2611404885a.18.1795514907385;
        Tue, 24 Nov 2026 02:08:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb379222sm91581885a.11.2026.11.24.02.08.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:08:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so3420627eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795514906; x=1796119706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sr2PlAC9OF5ENvJF41XPyVoCoFn1SUHJiRui8L1ktg=;
        b=QSHdMSRqvbFg/PGVt3ZRnZMABxqpqWv1AXlsqf62guBB4wHQAPQ9EvCqtXgu7prNRs
         FEaSJ58SpnrWRNB8mfIIA9mW3MQsJLWc+uTFLSteR0DCuV3vmB/rI8fBTviP0RcJwZ/T
         YEnxOREhuXOIy5vIIxQ8XWJ9yexcN9Uu6sfBE=
X-Forwarded-Encrypted: i=1; AL+hErFpLZPHDWtmwb/nJmm0NYZB5lJORDB2hsMP1+vBgT0QJmiLzLrfduai99JYYZjovBfYjH4S4bRI6Abx15g=@vger.kernel.org
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr15470603eec.31.1795514905753;
        Tue, 24 Nov 2026 02:08:25 -0800 (PST)
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr15470571eec.31.1795514905064;
        Tue, 24 Nov 2026 02:08:25 -0800 (PST)
Received: from H10-S2 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm49931870eec.26.2026.11.24.02.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:08:24 -0800 (PST)
From: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	bhargava.marreddy@broadcom.com,
	ajit.khaparde@broadcom.com,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Kumar Mudide <kumar.mudide@broadcom.com>
Subject: [PATCH net-next 2/2] bnge: Add support for ethtool -d register dump
Date: Tue, 24 Nov 2026 04:07:51 -0600
Message-ID: <20261124100751.179270-3-ramakrishna.koduri@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
References: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
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

Implement get_regs and get_regs_len ethtool callbacks to provide
register dump support for the BNGE driver. This includes support
for PXP registers, PCIe signal integrity, PCIe Latency Histogram
and Adaptive QoS TX/RX MBUF registers.

Signed-off-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Reviewed-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Kumar Mudide <kumar.mudide@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   9 +
 .../net/ethernet/broadcom/bnge/bnge_core.c    |   3 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 168 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_ethtool.h |  19 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 178 +++++++++++++++++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   5 +
 6 files changed, 381 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index 64c792b278ad..a1255b63cd44 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -66,6 +66,7 @@ enum {
 	BNGE_FW_CAP_CFA_NTUPLE_RX_EXT_IP_PROTO		= BIT_ULL(24),
 	BNGE_FW_CAP_CFA_RFS_RING_TBL_IDX_V3		= BIT_ULL(25),
 	BNGE_FW_CAP_VNIC_RE_FLUSH			= BIT_ULL(26),
+	BNGE_FW_CAP_MBUF_DATA				= BIT_ULL(27),
 };
 
 enum {
@@ -89,6 +90,10 @@ enum {
 	BNGE_RSS_CAP_ESP_V6_RSS_CAP			= BIT(7),
 };
 
+enum {
+	BNGE_STATS_CAP_PCIE				= BIT(0),
+};
+
 #define BNGE_MAX_QUEUE		8
 struct bnge_queue_info {
 	u8      queue_id;
@@ -149,6 +154,8 @@ struct bnge_dev {
 #define BNGE_STATE_OPEN			1
 
 	u64			fw_cap;
+	u32			stats_cap;
+	u32			fw_dbg_cap;
 
 	/* Backing stores */
 	struct bnge_ctx_mem_info	*ctx;
@@ -250,6 +257,8 @@ struct bnge_dev {
 #define bnge_for_each_open_nq(i, bd) \
 	for ((i) = BNGE_FIRST_OPEN_NQ; (i) < (bd)->nq_nr_rings; (i)++)
 
+#define CHIMP_REG_VIEW_ADDR	0x80000000
+
 static inline bool bnge_is_roce_en(struct bnge_dev *bd)
 {
 	return bd->flags & BNGE_EN_ROCE;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_core.c b/drivers/net/ethernet/broadcom/bnge/bnge_core.c
index c5d51b8ee9d1..cfa2e6363de1 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_core.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_core.c
@@ -8,6 +8,7 @@
 
 #include "bnge.h"
 #include "bnge_devlink.h"
+#include "bnge_ethtool.h"
 #include "bnge_hwrm.h"
 #include "bnge_hwrm_lib.h"
 #include "bnge_link.h"
@@ -74,6 +75,8 @@ static int bnge_func_qcaps(struct bnge_dev *bd)
 		return rc;
 	}
 
+	bnge_hwrm_dbg_qcaps(bd);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 2467e44de291..3ada50832c6d 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -11,7 +11,9 @@
 
 #include "bnge.h"
 #include "bnge_ethtool.h"
+#include "bnge_hwrm.h"
 #include "bnge_hwrm_lib.h"
+#include "bnge_netdev.h"
 
 static int bnge_nway_reset(struct net_device *dev)
 {
@@ -740,6 +742,170 @@ static int bnge_set_pauseparam(struct net_device *dev,
 	return rc;
 }
 
+static void *__bnge_hwrm_pcie_qstats(struct bnge_dev *bd,
+				     struct hwrm_pcie_qstats_input *req)
+{
+	struct pcie_ctx_hw_stats_v2 *hw_pcie_stats;
+	dma_addr_t hw_pcie_stats_addr;
+	int rc;
+
+	hw_pcie_stats = bnge_hwrm_req_dma_slice(bd, req, sizeof(*hw_pcie_stats),
+						&hw_pcie_stats_addr);
+	if (!hw_pcie_stats)
+		return NULL;
+
+	req->pcie_stat_size = cpu_to_le16(sizeof(*hw_pcie_stats));
+	req->pcie_stat_host_addr = cpu_to_le64(hw_pcie_stats_addr);
+	rc = bnge_hwrm_req_send(bd, req);
+
+	return rc ? NULL : hw_pcie_stats;
+}
+
+static int bnge_get_regs_len(struct net_device *dev)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+
+	if (bd->fw_cap & BNGE_FW_CAP_MBUF_DATA)
+		return BNGE_MBUF_REG_START + BNGE_MBUF_REG_LEN;
+
+	/* Reserve room for the largest PCIe stats layout so that the size
+	 * reported here does not depend on a one-time discovery at init.
+	 */
+	if (bd->stats_cap & BNGE_STATS_CAP_PCIE)
+		return BNGE_PXP_REG_LEN + sizeof(struct pcie_ctx_hw_stats_v2);
+
+	return BNGE_PXP_REG_LEN;
+}
+
+#define BNGE_PCIE_REG_SIZE(reg)		\
+	sizeof_field(struct pcie_ctx_hw_stats_v2, pcie_##reg)
+
+static const struct bnge_reg_desc bnge_pcie_reg[] = {
+	{ BNGE_PCIE_REG_SIZE(pl_signal_integrity), 8 },
+	{ sizeof(__le16), 4 }, /* pcie_equalization_time: 4x __le16 */
+	{ BNGE_PCIE_REG_SIZE(ltssm_histogram[0]), 4 },
+	{ BNGE_PCIE_REG_SIZE(recovery_histogram), 1 },
+	{ BNGE_PCIE_REG_SIZE(tl_credit_nph_histogram[0]), 94 },
+	{ BNGE_PCIE_REG_SIZE(posted_packet_count), 5 },
+	{ BNGE_PCIE_REG_SIZE(rd_latency_histogram[0]), 14 },
+};
+
+static void bnge_write_val(void *dst, void *src, u8 size)
+{
+	switch (size) {
+	case 1:
+		*(u8 *)dst = *(u8 *)src;
+		break;
+	case 2:
+		put_unaligned(get_unaligned_le16(src), (u16 *)dst);
+		break;
+	case 4:
+		put_unaligned(get_unaligned_le32(src), (u32 *)dst);
+		break;
+	case 8:
+		put_unaligned(get_unaligned_le64(src), (u64 *)dst);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		break;
+	}
+}
+
+void bnge_copy_regs(u8 *src, u8 *dst, const struct bnge_reg_desc *desc,
+		    int num_desc, int max_len)
+{
+	u32 off = 0;
+	int i, j;
+
+	for (i = 0; i < num_desc; i++) {
+		const struct bnge_reg_desc *d = &desc[i];
+		u8 size = d->size;
+
+		for (j = 0; j < d->count; j++) {
+			if (off + size > max_len)
+				return;
+			bnge_write_val(dst + off, src + off, size);
+			off += size;
+		}
+	}
+}
+
+static void bnge_get_pcie_regs(struct bnge_dev *bd, struct ethtool_regs *regs,
+			       u8 *dst)
+{
+	struct hwrm_pcie_qstats_output *resp;
+	struct hwrm_pcie_qstats_input *req;
+	u8 *src;
+	int len;
+
+	if (bnge_hwrm_req_init(bd, req, HWRM_PCIE_QSTATS))
+		return;
+
+	resp = bnge_hwrm_req_hold(bd, req);
+	src = __bnge_hwrm_pcie_qstats(bd, req);
+	if (!src)
+		goto drop_req;
+
+	len = min_t(int, le16_to_cpu(resp->pcie_stat_size),
+		    sizeof(struct pcie_ctx_hw_stats_v2));
+	if (len <= 0)
+		goto drop_req;
+
+	if (len <= sizeof(struct pcie_ctx_hw_stats))
+		regs->version = 1;
+	else if (len < sizeof(struct pcie_ctx_hw_stats_v2))
+		regs->version = 2;
+	else
+		regs->version = 3;
+
+	bnge_copy_regs(src, dst, bnge_pcie_reg, ARRAY_SIZE(bnge_pcie_reg),
+		       len);
+drop_req:
+	bnge_hwrm_req_drop(bd, req);
+}
+
+static void bnge_get_regs(struct net_device *dev, struct ethtool_regs *regs,
+			  void *_p)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+	u8 *p = _p;
+
+	regs->version = 0;
+
+	if (BNGE_NO_FW_ACCESS(bd))
+		return;
+
+	if (!(bd->fw_dbg_cap & DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED)) {
+		int rc;
+
+		rc = bnge_dbg_hwrm_rd_reg(bd, 0, BNGE_PXP_REG_LEN / 4, _p);
+		if (rc)
+			netdev_warn(dev, "Failed to read PXP regs: %d\n", rc);
+	}
+
+	if (bd->stats_cap & BNGE_STATS_CAP_PCIE)
+		bnge_get_pcie_regs(bd, regs, p + BNGE_PXP_REG_LEN);
+
+	if (bd->fw_cap & BNGE_FW_CAP_MBUF_DATA) {
+		int rc_rx, rc_tx;
+
+		/* Version 4 is required for the userspace ethtool decoder to
+		 * dump MBUF stats. At least one of the RX/TX queries is
+		 * expected to be supported; the direction that is unavailable
+		 * reads back as zero, which the decoder expects. Report
+		 * version 4 if either query succeeded.
+		 */
+		rc_rx = bnge_hwrm_rx_mbuf_data(bd,
+					       p + BNGE_RX_MBUF_REG_OFFSET);
+		rc_tx = bnge_hwrm_tx_mbuf_data(bd,
+					       p + BNGE_TX_MBUF_REG_OFFSET);
+		if (!rc_rx || !rc_tx)
+			regs->version = 4;
+	}
+}
+
 static const struct ethtool_ops bnge_ethtool_ops = {
 	.cap_link_lanes_supported	= 1,
 	.get_link_ksettings	= bnge_get_link_ksettings,
@@ -757,6 +923,8 @@ static const struct ethtool_ops bnge_ethtool_ops = {
 	.get_eth_ctrl_stats	= bnge_get_eth_ctrl_stats,
 	.get_pause_stats	= bnge_get_pause_stats,
 	.get_rmon_stats		= bnge_get_rmon_stats,
+	.get_regs_len		= bnge_get_regs_len,
+	.get_regs		= bnge_get_regs,
 };
 
 void bnge_set_ethtool_ops(struct net_device *dev)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.h b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.h
index 21e96a0976d5..8de501ad7f9a 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.h
@@ -4,6 +4,25 @@
 #ifndef _BNGE_ETHTOOL_H_
 #define _BNGE_ETHTOOL_H_
 
+struct bnge_dev;
+
+struct bnge_reg_desc {
+	u8 size;
+	u16 count;
+};
+
+void bnge_copy_regs(u8 *src, u8 *dst, const struct bnge_reg_desc *desc,
+		    int num_desc, int max_len);
+
+#define BNGE_PXP_REG_LEN	0x3110
+
+#define BNGE_MBUF_REG_START	0x3800
+#define BNGE_MBUF_REG_LEN	0x12c
+
+#define BNGE_RX_MBUF_REG_OFFSET	BNGE_MBUF_REG_START
+#define BNGE_TX_MBUF_REG_OFFSET	(BNGE_RX_MBUF_REG_OFFSET + 0x64 + \
+				 sizeof(struct queue_adptv_qos_rx_info))
+
 void bnge_set_ethtool_ops(struct net_device *dev);
 
 #endif /* _BNGE_ETHTOOL_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index 227de771f2ef..9b8cb39dbe16 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -15,6 +15,7 @@
 #include "bnge_rmem.h"
 #include "bnge_resc.h"
 #include "bnge_netdev.h"
+#include "bnge_ethtool.h"
 
 static const u16 bnge_async_events_arr[] = {
 	ASYNC_EVENT_CMPL_EVENT_ID_LINK_STATUS_CHANGE,
@@ -597,12 +598,45 @@ int bnge_hwrm_func_resc_qcaps(struct bnge_dev *bd)
 	return rc;
 }
 
+void bnge_hwrm_dbg_qcaps(struct bnge_dev *bd)
+{
+	struct hwrm_dbg_qcaps_output *resp;
+	struct hwrm_dbg_qcaps_input *req;
+	int rc;
+
+	bd->fw_dbg_cap = 0;
+	if (!(bd->fw_cap & BNGE_FW_CAP_DBG_QCAPS))
+		return;
+
+	/* Discovery failure is treated as restricted so we never attempt
+	 * direct register reads without confirmation from firmware.
+	 */
+	rc = bnge_hwrm_req_init(bd, req, HWRM_DBG_QCAPS);
+	if (rc) {
+		bd->fw_dbg_cap = DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED;
+		return;
+	}
+
+	req->fid = cpu_to_le16(0xffff);
+	resp = bnge_hwrm_req_hold(bd, req);
+	rc = bnge_hwrm_req_send(bd, req);
+	if (rc) {
+		bd->fw_dbg_cap = DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED;
+		goto hwrm_dbg_qcaps_exit;
+	}
+
+	bd->fw_dbg_cap = le32_to_cpu(resp->flags);
+
+hwrm_dbg_qcaps_exit:
+	bnge_hwrm_req_drop(bd, req);
+}
+
 int bnge_hwrm_func_qcaps(struct bnge_dev *bd)
 {
 	struct hwrm_func_qcaps_output *resp;
 	struct hwrm_func_qcaps_input *req;
 	struct bnge_pf_info *pf = &bd->pf;
-	u32 flags, flags_ext;
+	u32 flags, flags_ext, flags_ext3;
 	int rc;
 
 	rc = bnge_hwrm_req_init(bd, req, HWRM_FUNC_QCAPS);
@@ -622,11 +656,19 @@ int bnge_hwrm_func_qcaps(struct bnge_dev *bd)
 		bd->flags |= BNGE_EN_ROCE_V2;
 	if (flags & FUNC_QCAPS_RESP_FLAGS_EXT_STATS_SUPPORTED)
 		bd->fw_cap |= BNGE_FW_CAP_EXT_STATS_SUPPORTED;
+	if (flags & FUNC_QCAPS_RESP_FLAGS_PCIE_STATS_SUPPORTED)
+		bd->stats_cap |= BNGE_STATS_CAP_PCIE;
+	if (flags & FUNC_QCAPS_RESP_FLAGS_DBG_QCAPS_CMD_SUPPORTED)
+		bd->fw_cap |= BNGE_FW_CAP_DBG_QCAPS;
 
 	flags_ext = le32_to_cpu(resp->flags_ext);
 	if (flags_ext & FUNC_QCAPS_RESP_FLAGS_EXT_EXT_HW_STATS_SUPPORTED)
 		bd->fw_cap |= BNGE_FW_CAP_EXT_HW_STATS_SUPPORTED;
 
+	flags_ext3 = le32_to_cpu(resp->flags_ext3);
+	if (flags_ext3 & FUNC_QCAPS_RESP_FLAGS_EXT3_MBUF_DATA_SUPPORTED)
+		bd->fw_cap |= BNGE_FW_CAP_MBUF_DATA;
+
 	pf->fw_fid = le16_to_cpu(resp->fid);
 	pf->port_id = le16_to_cpu(resp->port_id);
 	memcpy(pf->mac_addr, resp->mac_address, ETH_ALEN);
@@ -1637,3 +1679,137 @@ int bnge_hwrm_port_qstats(struct bnge_dev *bd, u8 flags)
 
 	return bnge_hwrm_req_send(bd, req);
 }
+
+#define BNGE_RX_MBUF_REG_SIZE(reg)		\
+	sizeof_field(struct queue_adptv_qos_rx_info, rx_##reg)
+
+static const struct bnge_reg_desc bnge_rx_mbuf_reg[] = {
+	{ BNGE_RX_MBUF_REG_SIZE(shared_pool_cells), 2 },
+	{ BNGE_RX_MBUF_REG_SIZE(cell_size), 4 },
+	{ BNGE_RX_MBUF_REG_SIZE(reserved_cells_cos[0]), 40 },
+	/* Spans rx_shared_pool_index_cos[8] (8B), rx_roce_enabled_cos (1B),
+	 * and unused_0[7] (7B) to sum to 16B.
+	 */
+	{ BNGE_RX_MBUF_REG_SIZE(shared_pool_index_cos[0]), 16 },
+	{ BNGE_RX_MBUF_REG_SIZE(cos_allocate[0]), 8 },
+};
+
+#define BNGE_TX_MBUF_REG_SIZE(reg)		\
+	sizeof_field(struct queue_adptv_qos_tx_info, tx_##reg)
+
+static const struct bnge_reg_desc bnge_tx_mbuf_reg[] = {
+	{ BNGE_TX_MBUF_REG_SIZE(shared_pool_cells), 2 },
+	{ BNGE_TX_MBUF_REG_SIZE(cell_size), 4 },
+	{ BNGE_TX_MBUF_REG_SIZE(reserved_cells_cos[0]), 24 },
+	{ BNGE_TX_MBUF_REG_SIZE(shared_pool_index_cos[0]), 8 },
+	{ BNGE_TX_MBUF_REG_SIZE(cos_allocate[0]), 8 },
+};
+
+int bnge_hwrm_rx_mbuf_data(struct bnge_dev *bd, u8 *reg_buf)
+{
+	struct hwrm_queue_adptv_qos_rx_qcfg_output *resp;
+	struct hwrm_queue_adptv_qos_rx_qcfg_input *req;
+	struct queue_adptv_qos_rx_info *rx_mbuf_reg;
+	dma_addr_t rx_mbuf_reg_addr;
+	int rc;
+
+	rc = bnge_hwrm_req_init(bd, req, HWRM_QUEUE_ADPTV_QOS_RX_QCFG);
+	if (rc)
+		return rc;
+
+	resp = bnge_hwrm_req_hold(bd, req);
+	rx_mbuf_reg = bnge_hwrm_req_dma_slice(bd, req, sizeof(*rx_mbuf_reg),
+					      &rx_mbuf_reg_addr);
+	if (!rx_mbuf_reg) {
+		rc = -ENOMEM;
+		goto hwrm_rx_mbuf_data_exit;
+	}
+
+	req->rx_qcfg_size = cpu_to_le16(sizeof(*rx_mbuf_reg));
+	req->port_id = (u8)bd->pf.port_id;
+	req->rx_qcfg_host_addr = cpu_to_le64(rx_mbuf_reg_addr);
+
+	rc = bnge_hwrm_req_send(bd, req);
+	if (!rc)
+		bnge_copy_regs((u8 *)rx_mbuf_reg, reg_buf, bnge_rx_mbuf_reg,
+			       ARRAY_SIZE(bnge_rx_mbuf_reg),
+			       le16_to_cpu(resp->rx_qcfg_size));
+hwrm_rx_mbuf_data_exit:
+	bnge_hwrm_req_drop(bd, req);
+	return rc;
+}
+
+int bnge_hwrm_tx_mbuf_data(struct bnge_dev *bd, u8 *reg_buf)
+{
+	struct hwrm_queue_adptv_qos_tx_qcfg_output *resp;
+	struct hwrm_queue_adptv_qos_tx_qcfg_input *req;
+	struct queue_adptv_qos_tx_info *tx_mbuf_reg;
+	dma_addr_t tx_mbuf_reg_addr;
+	int rc;
+
+	rc = bnge_hwrm_req_init(bd, req, HWRM_QUEUE_ADPTV_QOS_TX_QCFG);
+	if (rc)
+		return rc;
+
+	resp = bnge_hwrm_req_hold(bd, req);
+	tx_mbuf_reg = bnge_hwrm_req_dma_slice(bd, req, sizeof(*tx_mbuf_reg),
+					      &tx_mbuf_reg_addr);
+	if (!tx_mbuf_reg) {
+		rc = -ENOMEM;
+		goto hwrm_tx_mbuf_data_exit;
+	}
+
+	req->tx_qcfg_size = cpu_to_le16(sizeof(*tx_mbuf_reg));
+	req->port_id = (u8)bd->pf.port_id;
+	req->tx_qcfg_host_addr = cpu_to_le64(tx_mbuf_reg_addr);
+
+	rc = bnge_hwrm_req_send(bd, req);
+	if (!rc)
+		bnge_copy_regs((u8 *)tx_mbuf_reg, reg_buf, bnge_tx_mbuf_reg,
+			       ARRAY_SIZE(bnge_tx_mbuf_reg),
+			       le16_to_cpu(resp->tx_qcfg_size));
+hwrm_tx_mbuf_data_exit:
+	bnge_hwrm_req_drop(bd, req);
+	return rc;
+}
+
+int bnge_dbg_hwrm_rd_reg(struct bnge_dev *bd, u32 reg_off, u16 num_words,
+			 u32 *reg_buf)
+{
+	struct hwrm_dbg_read_direct_output *resp;
+	struct hwrm_dbg_read_direct_input *req;
+	__le32 *dbg_reg_buf;
+	dma_addr_t mapping;
+	int rc, i;
+
+	rc = bnge_hwrm_req_init(bd, req, HWRM_DBG_READ_DIRECT);
+	if (rc)
+		return rc;
+
+	dbg_reg_buf = bnge_hwrm_req_dma_slice(bd, req, num_words * 4,
+					      &mapping);
+	if (!dbg_reg_buf) {
+		rc = -ENOMEM;
+		goto dbg_hwrm_rd_reg_exit;
+	}
+
+	req->host_dest_addr = cpu_to_le64(mapping);
+
+	resp = bnge_hwrm_req_hold(bd, req);
+	req->read_addr = cpu_to_le32(reg_off + CHIMP_REG_VIEW_ADDR);
+	req->read_len32 = cpu_to_le32(num_words);
+
+	rc = bnge_hwrm_req_send(bd, req);
+	if (rc)
+		goto dbg_hwrm_rd_reg_exit;
+	if (resp->error_code) {
+		rc = -EIO;
+		goto dbg_hwrm_rd_reg_exit;
+	}
+	for (i = 0; i < num_words; i++)
+		reg_buf[i] = le32_to_cpu(dbg_reg_buf[i]);
+
+dbg_hwrm_rd_reg_exit:
+	bnge_hwrm_req_drop(bd, req);
+	return rc;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
index bf452e390d5b..f754ef8616bc 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
@@ -65,4 +65,9 @@ int bnge_hwrm_shutdown_link(struct bnge_dev *bd);
 int bnge_hwrm_port_qstats(struct bnge_dev *bd, u8 flags);
 int bnge_hwrm_port_qstats_ext(struct bnge_dev *bd, u8 flags);
 int bnge_hwrm_func_qstat_ext(struct bnge_dev *bd, struct bnge_stats_mem *stats);
+int bnge_hwrm_rx_mbuf_data(struct bnge_dev *bd, u8 *reg_buf);
+int bnge_hwrm_tx_mbuf_data(struct bnge_dev *bd, u8 *reg_buf);
+void bnge_hwrm_dbg_qcaps(struct bnge_dev *bd);
+int bnge_dbg_hwrm_rd_reg(struct bnge_dev *bd, u32 reg_off,
+			 u16 num_words, u32 *reg_buf);
 #endif /* _BNGE_HWRM_LIB_H_ */
-- 
2.52.0

