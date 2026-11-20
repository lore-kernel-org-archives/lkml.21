Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163897;
	b=sma1+I5MAfcy5EkJIzQHnZ0fhREKMh4ECPNis1mxgc/czTcAUkT6DEO/m3rY5x9xpuXa
	 8kcelH3QHlh5Aw75W2BlR3nHDRj+KP05KSp2dNkhU+s2dNOwIU4PpHXOPtp3oOkGLVcaO
	 jtlG5ZvM+KNKEgPtk9BdGykNyPreZadYD2Qto6+Td/Q9k7xKHTeI1f26nIIiL7D0hzbaN
	 Lwg9k2CGqIoVHZFTrAT7FY8R+pL+ZIaR0Rvx/rsfrXJAbs29yqu4qpk3xnM4SRJzo3B2i
	 /le6RnRLqhGtmbEhKBw7tUT0o4TM1Jrekng35f+726CjhU+pNpHu669e2sIlRsqyRfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163897;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sQzeiFfzWlmD/NHlV6I8Pj0zWoLYAFs2Omk5zoRoS8E=;
	b=GhCdRFzqhEZk2ft12nk9lOlIge+lqqtWO80XUlHoadjOgGNl8ES+sVwNrB2F5xuudD9K
	 M+/NpXZX6dMTWW/uKTEV+XKP3kbJelK7ww27TSPf0upnzBUEKsC15njCuX5nF6ytHFVi3
	 cwJNs8afBrGOF/7MkoDrbFDwOjZVXdVUBuQmdWvWWxijy1klqeL9JysLUkllQ3LE/swV6
	 zq/X2VaLNYyh4dE/PNWd1HdMhY0inkVBe5IMdFpAEAlnY22NPmhLrfZUx58vyGK0z4vwl
	 h1eMegnmqsgnA+CF07AkJnn1fnihv2wW8sly6o2hZgSdLXBD43aHU1yrmYNSnI330bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Y3I2nu+X;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AAD606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4AAD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Y3I2nu+X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Y3I2nu+XlICNXe17xE82bESZume54+UX4DbyhxrDyF6VDDNQ/mKQKhEnaVZFpA2EYo9ZNMjI+ROKX
	 JzejCB81pAwmBdI80V8517r3CQgOlZLfipvueL93A4v0NlJELIMoVbsSEI+mLzkmFNIoam9674mvec
	 klex/mezzg8XoCvA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b0006f06ee-c6ca7;
	Fri, 20 Nov 2026 16:38:10 +0800 (CST)
X-RM-TRANSID:2ee46b0006f06ee-c6ca7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b0006edf26-1e250;
	Fri, 20 Nov 2026 16:38:10 +0800 (CST)
X-RM-TRANSID:2ee96b0006edf26-1e250
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: linux@treblig.org
Cc: jdmason@kudzu.us,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] NTB/msi: fix NULL deref when msi_first_desc() returns NULL
Date: Fri, 20 Nov 2026 16:37:58 +0800
Message-ID: <20261120083759.1887-1-zhangjiao2@cmss.chinamobile.com>
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

msi_first_desc() can return NULL if no MSI descriptors are found,
but ntb_msi_setup_mws() dereferences desc->msg unconditionally
inside the scoped_guard block. Add a NULL check and return -ENODEV
to prevent a null pointer dereference.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/ntb/msi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ntb/msi.c b/drivers/ntb/msi.c
index 13e9f52ec8cc..cfe2125b2fe0 100644
--- a/drivers/ntb/msi.c
+++ b/drivers/ntb/msi.c
@@ -108,6 +108,8 @@ int ntb_msi_setup_mws(struct ntb_dev *ntb)
 
 	scoped_guard (msi_descs_lock, &ntb->pdev->dev) {
 		desc = msi_first_desc(&ntb->pdev->dev, MSI_DESC_ASSOCIATED);
+		if (!desc)
+			return -ENODEV;
 		addr = desc->msg.address_lo + ((uint64_t)desc->msg.address_hi << 32);
 	}
 
-- 
2.33.0



