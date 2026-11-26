Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705044;
	b=2FllS7+Jw5CWVVCfHkMPgCJNh42eKj4t2yefVIhogxVlRQO9XZFNhQ/0iLT7FrYu7g9n
	 G5ftt0UTpO08GNi5IaC9r3ce7aJiKb5CDnr+puv4wqI/XqzEODndtOl+LGS0kz9lxb/8h
	 FH725Yrh51OFSqIfFJGkuly6ng9f6I4v7JmxI2A2GoTBaOow8QVJv9XxCBNEdmWilV2Bi
	 NV1k2VYdGEa+X9cNiqaRWFO0IbGbA/DjCbhC1PgIyW+b6ngfNmSHcQX9CvLZrHuqx0gp5
	 grftVjQxFF0NMZ3FPWbmjUfGI+hHqdR1fK0zf2DRY9yJWD2/1A5FmHSXirhyl3/yvhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705044;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Content-Type:X-Mailer:
	 X-Original-From:X-Lms-Return-Path:Content-Transfer-Encoding:Subject:
	 Date:References:Received:In-Reply-To:To:Cc:From:Message-Id;
	bh=tSPNpwqN1AGoxJR0sE1rKOU1eRM9nN9WA7toT4992TQ=;
	b=OxuyIlFkHnesrDkT0q9rzo8sViQZQRTcNe58gs558zFzUs31W8MwEPVE5ZVgmwTF3Wdx
	 IRv8qLX9X/5TQVkiHSYC0t7MYkTfcbPDzZ037v2v0GLSbL7Dx03BzBNIqakvvdRWuln8K
	 OLU4UrU6u6SyovJ+9VxdTMV7PUXx1nU8veJgGGlyZyyIkR9kXOaqyiKCzBWP5pGL4FWGS
	 uoVw/Zxnp8cfNvzce71tJ6PF+BqFiG44cmpjUyujm8MH3q6G4mBWf3MaWBQ42b5+C18Mr
	 3A0VceOph+eLbdXw0u/6d/9uKsd0xehpL/c2tG1o4luARGJJzDBI1+uLfSHsa2z0RiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yunsilicon.com;
	spf=pass smtp.mailfrom=yunsilicon.com;
	dkim=pass header.d=yunsilicon.com header.i=@yunsilicon.com header.a=rsa-sha256 header.s=feishu2403070942 header.b=QlpQKaYB;
	arc=none smtp.remote-ip=209.127.231.59
Received: from va-2-59.ptr.blmpb.com (va-2-59.ptr.blmpb.com [209.127.231.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C973606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C973606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yunsilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yunsilicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yunsilicon.com header.i=@yunsilicon.com header.a=rsa-sha256 header.s=feishu2403070942 header.b=QlpQKaYB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2403070942; d=yunsilicon.com; t=1795705039; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=tSPNpwqN1AGoxJR0sE1rKOU1eRM9nN9WA7toT4992TQ=;
 b=QlpQKaYBrzK8WMAWjTbuNI4ieREzo+65dy+FMvuxYWYjHF2DiacSQSf1Imw7YejAc1/3OU
 KysqVTkd7OpjXooKdr0yfmNx5CdB5IbCNZH/hwb0hU53/XSgK/VEKRqUf6XtSaNsJTHZYU
 PR1WkhuGKlKncCW6GzzkDHxvBAYippBXkQUuIUQBWFPq3JjUjDpapaN8goGLCuHoF7CG/E
 7w1IqR8rAEV1IpSBiqDxE/depR6I79lQ1UlfHzQmGtevYvAYl3PqiSqlMawNgKFuL8Citx
 Hl6i+7CYVqO40HlMJ9ir9K5EtE/YSfbGQHgD/QOJNRSc3QAyXAkeoGjwwbWSdQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.25.1
X-Original-From: Xin Tian <tianx@yunsilicon.com>
X-Lms-Return-Path: <lba+26b0848cd+20df28+vger.kernel.org+tianx@yunsilicon.com>
Content-Transfer-Encoding: 7bit
Subject: [PATCH v2 02/11] net/xsc: add doorbell and cmdq MMIO accessors
Date: Thu, 26 Nov 2026 22:57:17 +0800
References: <20261126145711.70868-1-tianx@yunsilicon.com>
Received: from DESKTOP-TGBQGEC.localdomain ([183.193.56.110]) by smtp.feishu.cn with ESMTPS; Thu, 26 Nov 2026 22:57:17 +0800
In-Reply-To: <20261126145711.70868-1-tianx@yunsilicon.com>
To: "Andrew Lunn" <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>, "Jason Gunthorpe" <jgg@ziepe.ca>, 
	"Leon Romanovsky" <leon@kernel.org>, 
	"Junxian Huang" <huangjunxian6@hisilicon.com>
Cc: <weihg@yunsilicon.com>, <linux-kernel@vger.kernel.org>, 
	<netdev@vger.kernel.org>, <linux-rdma@vger.kernel.org>, 
	<kerneljasonxing@gmail.com>
From: "Xin Tian" <tianx@yunsilicon.com>
Message-Id: <20261126145715.70868-3-tianx@yunsilicon.com>

Provide doorbell writers and cmdq register accessors operating at
fixed offsets in the compressed-BAR register window.

Signed-off-by: Xin Tian <tianx@yunsilicon.com>
---
 .../ethernet/yunsilicon/xsc/common/xsc_core.h |  15 ++
 .../net/ethernet/yunsilicon/xsc/pci/Makefile  |   2 +-
 .../ethernet/yunsilicon/xsc/pci/doorbell.c    | 148 ++++++++++++++++++
 3 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/yunsilicon/xsc/pci/doorbell.c

diff --git a/drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h b/drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h
index 2d0eda8a2..9580d89a1 100644
--- a/drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h
+++ b/drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h
@@ -32,4 +32,19 @@ struct xsc_core_device {
 	int			bar_num;
 };
 
+void xsc_update_tx_db(struct xsc_core_device *xdev, u32 sqn, u32 next_pid);
+void xsc_update_rx_db(struct xsc_core_device *xdev, u32 rqn, u32 next_pid);
+void xsc_arm_cq(struct xsc_core_device *xdev, u32 cqn, u32 next_cid, u8 solicited);
+void xsc_update_cq_ci(struct xsc_core_device *xdev, u32 cqn, u32 next_cid);
+void xsc_update_eq_ci(struct xsc_core_device *xdev, u32 eqn, u32 next_cid, u8 arm);
+void xsc_update_cmdq_req_pid(struct xsc_core_device *xdev, u32 req_pid);
+void xsc_update_cmdq_rsp_cid(struct xsc_core_device *xdev, u32 rsp_cid);
+u32 xsc_get_cmdq_req_pid(struct xsc_core_device *xdev);
+u32 xsc_get_cmdq_rsp_pid(struct xsc_core_device *xdev);
+u32 xsc_get_cmdq_rsp_cid(struct xsc_core_device *xdev);
+void xsc_set_cmdq_req_buf_addr(struct xsc_core_device *xdev, u32 haddr, u32 laddr);
+void xsc_set_cmdq_rsp_buf_addr(struct xsc_core_device *xdev, u32 haddr, u32 laddr);
+u32 xsc_read_cmdq_err_status(struct xsc_core_device *xdev);
+void xsc_clear_cmdq_err_status(struct xsc_core_device *xdev, u32 status);
+
 #endif
diff --git a/drivers/net/ethernet/yunsilicon/xsc/pci/Makefile b/drivers/net/ethernet/yunsilicon/xsc/pci/Makefile
index c163aa950..4a08b92cd 100644
--- a/drivers/net/ethernet/yunsilicon/xsc/pci/Makefile
+++ b/drivers/net/ethernet/yunsilicon/xsc/pci/Makefile
@@ -6,4 +6,4 @@ ccflags-y += -I$(srctree)/drivers/net/ethernet/yunsilicon/xsc
 
 obj-$(CONFIG_YUNSILICON_XSC_PCI) += xsc_pci.o
 
-xsc_pci-y := main.o
+xsc_pci-y := main.o doorbell.o
diff --git a/drivers/net/ethernet/yunsilicon/xsc/pci/doorbell.c b/drivers/net/ethernet/yunsilicon/xsc/pci/doorbell.c
new file mode 100644
index 000000000..5bd64be67
--- /dev/null
+++ b/drivers/net/ethernet/yunsilicon/xsc/pci/doorbell.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2024 - 2026, Shanghai Yunsilicon Technology Co., Ltd.
+ * All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/pci.h>
+
+#include "common/xsc_core.h"
+#include "common/xsc_reg.h"
+
+/* doorbell words */
+#define XSC_TX_DB_DATA0_NEXT_PID_MASK	GENMASK(15, 0)
+#define XSC_TX_DB_DATA0_QP_ID_MASK	GENMASK(30, 16)
+#define XSC_RX_DB_DATA0_NEXT_PID_MASK	GENMASK(12, 0)
+#define XSC_RX_DB_DATA0_QP_ID_MASK	GENMASK(27, 13)
+#define XSC_CQ_DB_DATA0_NEXT_CID_MASK	GENMASK(15, 0)
+#define XSC_CQ_DB_DATA0_CQ_ID_MASK	GENMASK(30, 16)
+#define XSC_CQ_DB_DATA0_ARM		BIT(31)
+#define XSC_EQ_DB_DATA0_NEXT_CID_MASK	GENMASK(10, 0)
+#define XSC_EQ_DB_DATA0_EQ_ID_MASK	GENMASK(21, 11)
+#define XSC_EQ_DB_DATA0_ARM		BIT(22)
+
+static u32 xsc_read32(void __iomem *bar, u32 off)
+{
+	return readl(bar + off);
+}
+
+static void xsc_write32(void __iomem *bar, u32 off, u32 val)
+{
+	writel(val, bar + off);
+}
+
+void xsc_update_tx_db(struct xsc_core_device *xdev, u32 sqn, u32 next_pid)
+{
+	u32 db = FIELD_PREP(XSC_TX_DB_DATA0_NEXT_PID_MASK, next_pid) |
+		 FIELD_PREP(XSC_TX_DB_DATA0_QP_ID_MASK, sqn);
+
+	/* Make sure that descriptors are written before
+	 * updating doorbell record and ringing the doorbell
+	 */
+	wmb();
+
+	writel(db, xdev->bar + TX_DB_FUNC_MEM_ADDR);
+}
+EXPORT_SYMBOL_GPL(xsc_update_tx_db);
+
+void xsc_update_rx_db(struct xsc_core_device *xdev, u32 rqn, u32 next_pid)
+{
+	u32 db = FIELD_PREP(XSC_RX_DB_DATA0_NEXT_PID_MASK, next_pid) |
+		 FIELD_PREP(XSC_RX_DB_DATA0_QP_ID_MASK, rqn);
+
+	/* Make sure that descriptors are written before
+	 * updating doorbell record and ringing the doorbell
+	 */
+	wmb();
+
+	writel(db, xdev->bar + RX_DB_FUNC_MEM_ADDR);
+}
+EXPORT_SYMBOL_GPL(xsc_update_rx_db);
+
+void xsc_arm_cq(struct xsc_core_device *xdev, u32 cqn, u32 next_cid,
+		u8 solicited)
+{
+	u32 db = FIELD_PREP(XSC_CQ_DB_DATA0_NEXT_CID_MASK, next_cid) |
+		 FIELD_PREP(XSC_CQ_DB_DATA0_CQ_ID_MASK, cqn) |
+		 FIELD_PREP(XSC_CQ_DB_DATA0_ARM, !!solicited);
+
+	/* Make sure that the doorbell record in host memory is
+	 * written before ringing the doorbell via PCI MMIO.
+	 */
+	wmb();
+	writel(db, xdev->bar + DB_CQ_FUNC_MEM_ADDR);
+}
+EXPORT_SYMBOL_GPL(xsc_arm_cq);
+
+void xsc_update_cq_ci(struct xsc_core_device *xdev, u32 cqn, u32 next_cid)
+{
+	u32 db = FIELD_PREP(XSC_CQ_DB_DATA0_NEXT_CID_MASK, next_cid) |
+		 FIELD_PREP(XSC_CQ_DB_DATA0_CQ_ID_MASK, cqn);
+
+	/* make sure val write to memory done */
+	wmb();
+	writel(db, xdev->bar + DB_CQ_CID_DIRECT_MEM_ADDR);
+}
+EXPORT_SYMBOL_GPL(xsc_update_cq_ci);
+
+void xsc_update_eq_ci(struct xsc_core_device *xdev, u32 eqn, u32 next_cid,
+		      u8 arm)
+{
+	u32 db = FIELD_PREP(XSC_EQ_DB_DATA0_NEXT_CID_MASK, next_cid) |
+		 FIELD_PREP(XSC_EQ_DB_DATA0_EQ_ID_MASK, eqn) |
+		 FIELD_PREP(XSC_EQ_DB_DATA0_ARM, !!arm);
+
+	/* make sure val write to memory done */
+	wmb();
+	writel(db, xdev->bar + DB_EQ_FUNC_MEM_ADDR);
+}
+
+void xsc_update_cmdq_req_pid(struct xsc_core_device *xdev, u32 req_pid)
+{
+	xsc_write32(xdev->bar, CMDQM_HOST_REQ_PID_MEM_ADDR, req_pid);
+}
+
+void xsc_update_cmdq_rsp_cid(struct xsc_core_device *xdev, u32 rsp_cid)
+{
+	xsc_write32(xdev->bar, CMDQM_HOST_RSP_CID_MEM_ADDR, rsp_cid);
+}
+
+u32 xsc_get_cmdq_req_pid(struct xsc_core_device *xdev)
+{
+	return xsc_read32(xdev->bar, CMDQM_HOST_REQ_PID_MEM_ADDR);
+}
+
+u32 xsc_get_cmdq_rsp_pid(struct xsc_core_device *xdev)
+{
+	return xsc_read32(xdev->bar, CMDQM_HOST_RSP_PID_MEM_ADDR);
+}
+
+u32 xsc_get_cmdq_rsp_cid(struct xsc_core_device *xdev)
+{
+	return xsc_read32(xdev->bar, CMDQM_HOST_RSP_CID_MEM_ADDR);
+}
+
+void xsc_set_cmdq_req_buf_addr(struct xsc_core_device *xdev, u32 haddr,
+			       u32 laddr)
+{
+	xsc_write32(xdev->bar, CMDQM_HOST_REQ_BUF_BASE_H_ADDR_MEM_ADDR, haddr);
+	xsc_write32(xdev->bar, CMDQM_HOST_REQ_BUF_BASE_L_ADDR_MEM_ADDR, laddr);
+}
+
+void xsc_set_cmdq_rsp_buf_addr(struct xsc_core_device *xdev, u32 haddr,
+			       u32 laddr)
+{
+	xsc_write32(xdev->bar, CMDQM_HOST_RSP_BUF_BASE_H_ADDR_MEM_ADDR, haddr);
+	xsc_write32(xdev->bar, CMDQM_HOST_RSP_BUF_BASE_L_ADDR_MEM_ADDR, laddr);
+}
+
+u32 xsc_read_cmdq_err_status(struct xsc_core_device *xdev)
+{
+	return xsc_read32(xdev->bar, CMDQM_HOST_VF_ERR_STS_MEM_ADDR);
+}
+
+void xsc_clear_cmdq_err_status(struct xsc_core_device *xdev, u32 status)
+{
+	if (status)
+		xsc_write32(xdev->bar, CMDQM_HOST_VF_ERR_STS_MEM_ADDR, status);
+}
-- 
2.43.0
