Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164357;
	b=AhhsRcOd+EGrsXwerKnSeaTvRuccDnkJLTDiYUG9RNGFJgj3g7vlPWReXLqiHiuC/Rda
	 30eZoVBujCrDfrp/x0f60ppM+vUbA0KR9fS+NkmbaZF38J+UlQSlroNltAa/rXNECQQQa
	 HOn3u612KFjnR6SSgvJSZlWuGQHEyx/fM5H02AeSGMaw+G8fQPsuL+ugAfKNKLVDYZSUh
	 NoOL/bD9Y54X4/hafaSn+TcJLM2QmiU2nSd93U2QFPf5zsSmc1A7zIOouHJ3uh8e+YtQ6
	 t0oeaY7KUI97rQyMwK164QNC7k5LmTgb9mTEGUSAYdLtgIkXuMIKpyxruHdllJg/BhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164357;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rq/gZAi7AbAU2kxVfBjimDlzhlEqecyWhKzkOdYilJs=;
	b=r0nnG2Ged8g9iJ+u9rt64DfJY69eeu4C0nYJ1yu217UmpoCTenT8K183TpQwHWaOf4Pj
	 EhAKVNGBpn47O3SBHJTrTqV2v+G46aKQ3A6nFNvZZTz3Ffx9yPK7IrKhQvGhEx/Mqm21M
	 KupvjHj2yXKsccXU2Eh4of/5rWcgw4t/hNXlGCQmSErhEop3hGJ6HOnKrMFU0i0dJL1s4
	 k5QVreJoEltp0DFx0f1SI6aW4a5lGq1KJgTFQ/SR5ItovL6qSxG+jFTf0tPoJBRRTqDFs
	 oQ5KcpZWHRULEsf6aUO472eMoYHNQBGPbOWvx2Uyr7CBQTAh486bC9KehX1uEv8aX0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ow0jqaAJ;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DC460A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DC460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ow0jqaAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ow0jqaAJtWw1OS4t3Vpjz8tdXiovA6ieFsubN/LVwXsMYICvdOnD/KyMOKG7PRSQPphm/BlCTHQb0
	 G4zin74r4BhmP4boLVBGkaVq8wUMOlN4VGZ2AgSj27b0j5QqCi2jcvTWZinIJ5MXQN+no6c4NCymxI
	 0DvMTI8dkhuLOAVw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b0008bfb00-6313a;
	Fri, 20 Nov 2026 16:45:52 +0800 (CST)
X-RM-TRANSID:2ee26b0008bfb00-6313a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76b0008bc2b1-1e2f9;
	Fri, 20 Nov 2026 16:45:52 +0800 (CST)
X-RM-TRANSID:2ee76b0008bc2b1-1e2f9
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: jdmason@kudzu.us
Cc: dave.jiang@intel.com,
	alok.a.tiwari@oracle.com,
	u.kleine-koenig@baylibre.com,
	den@valinux.co.jp,
	bhelgaas@google.com,
	mani@kernel.org,
	Frank.Li@nxp.com,
	Maciej.Grochowski@sony.com,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] ntb: fix peer_spad_read() returning -EINVAL instead of 0
Date: Fri, 20 Nov 2026 16:45:45 +0800
Message-ID: <20261120084546.2018-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The amd_ntb_peer_spad_read(), ntb_epf_peer_spad_read() and
switchtec_ntb_peer_spad_read() functions have a return type of u32
but return -EINVAL on error, which results in a garbage value
(0xFFFFFFEA) being returned to callers. Other NTB hardware drivers
(e.g. Intel's ndev_spad_read) correctly return 0 for out-of-range
scratchpad indices.

Fix all three functions to return 0 on error, matching the
established convention in the NTB subsystem.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/ntb/hw/amd/ntb_hw_amd.c        | 2 +-
 drivers/ntb/hw/epf/ntb_hw_epf.c        | 4 ++--
 drivers/ntb/hw/mscc/ntb_hw_switchtec.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ntb/hw/amd/ntb_hw_amd.c b/drivers/ntb/hw/amd/ntb_hw_amd.c
index 36bee0d8ac6c..40ced4043340 100644
--- a/drivers/ntb/hw/amd/ntb_hw_amd.c
+++ b/drivers/ntb/hw/amd/ntb_hw_amd.c
@@ -529,7 +529,7 @@ static u32 amd_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx, int sidx)
 	u32 offset;
 
 	if (sidx < 0 || sidx >= ndev->spad_count)
-		return -EINVAL;
+		return 0;
 
 	offset = ndev->peer_spad + (sidx << 2);
 	return readl(mmio + AMD_SPAD_OFFSET + offset);
diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
index c47607d4f8a7..dcc5eb4bea74 100644
--- a/drivers/ntb/hw/epf/ntb_hw_epf.c
+++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
@@ -273,12 +273,12 @@ static u32 ntb_epf_peer_spad_read(struct ntb_dev *ntb, int pidx, int idx)
 
 	if (pidx != NTB_DEF_PEER_IDX) {
 		dev_err(dev, "Unsupported Peer ID %d\n", pidx);
-		return -EINVAL;
+		return 0;
 	}
 
 	if (idx < 0 || idx >= ndev->spad_count) {
 		dev_err(dev, "WRITE: Invalid Peer ScratchPad Index %d\n", idx);
-		return -EINVAL;
+		return 0;
 	}
 
 	offset = (idx << 2);
diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
index e38540b92716..a9fc94869aeb 100644
--- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
+++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
@@ -762,7 +762,7 @@ static u32 switchtec_ntb_peer_spad_read(struct ntb_dev *ntb, int pidx,
 	struct switchtec_ntb *sndev = ntb_sndev(ntb);
 
 	if (pidx != NTB_DEF_PEER_IDX)
-		return -EINVAL;
+		return 0;
 
 	if (sidx < 0 || sidx >= ARRAY_SIZE(sndev->peer_shared->spad))
 		return 0;
-- 
2.33.0



