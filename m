Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765413;
	b=YUMO61HW7gVYi0hSBkqcpDMR3gSl9YTaRSdTrHujfa8ptxhHvyJnvR3zYv7OwfZxooSf
	 0BWH7JC1HfGZpnSJKig3dA539fzrhJdqk+15pYdVU/5bUtSswua66FhTJzr+mMPiLKE7X
	 Zp5ZbXkBQCXEjSi2Izs80wTcYfKVOiFgh488vMhUznJuxKuV4ru7PwMERIoG51km9ysQP
	 8RunLCvuIuVCOhpwQn+QI0xt/hwEXQ/W/1GJp+Iyd8zAs8KzEGUfWgcz2fCBiGFelaYKd
	 8GnBWYlfD2lokbrf2P/5e/zGaEa/XFosuCtIg0iq0pvIymdw6Qxl4aSai4SLmeUQ62g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765413;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eJtsX3t9xw21teJVKJeFwZEG56oP5phaBgh7xgOsEG0=;
	b=gkN69KD+JdAxRe5uCwqVatrDgvlRSr81V3aM3iXQnW9bUse+Bu6YCFTnLsIzXBSkeNcD
	 hFmZg0Gomn2RArZz/RBsMpvKIvNyIdJ3ItJxRPwMghrnErJGkUJnMRe8hPHG9syGkHucb
	 PnOeRQWr9YEz6AdJos2I4gWl2QeYn8XwY9sJ987zLsPGhTW3JDdJ06LMR4aJdis1qDERc
	 3l3Xy3nVbVD0oKI+Tw/sngnOK5e0r8LLA6ceEjXM2FiNWohx9a3w0d/+TXP5LIAHKt6UN
	 k0E4QLSGpr1ci2UixPSO17bzB1LcOs48xaqmDS6j79bUe6gJneIHhTd+Y1LWcvjRHRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QG4VPnsi;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55858606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55858606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QG4VPnsi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QG4VPnsivjSb0/jdVr79i0WnwDwwtsPw3xtWXCFxb3rOmSbGUndku3+ge/aok/n3uIPeS2sNfBObC
	 pjvZKlvhZpAoDlGfSpthCmjiQXCBmLBmvMaKR1aDUIthWQ9H2FprnQEQaXhZ7XBkjAqpGMOV+2azAi
	 d2DUusU27JISHcFo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16b093459e3b-3fd1d;
	Fri, 27 Nov 2026 15:42:18 +0800 (CST)
X-RM-TRANSID:2ee16b093459e3b-3fd1d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36b0934574ef-146c2;
	Fri, 27 Nov 2026 15:42:18 +0800 (CST)
X-RM-TRANSID:2ee36b0934574ef-146c2
From: zhaofeng2@cmss.chinamobile.com
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: vexpress-config: fix OF node leak in vexpress_syscfg_probe()
Date: Fri, 27 Nov 2026 15:42:15 +0800
Message-ID: <20261127074215.1520-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

vexpress_syscfg_probe() calls of_parse_phandle() to obtain
bridge_np for the "arm,vexpress,config-bridge" property inside
a for_each_compatible_node() loop, but the returned device node
reference is never released, leaking a reference on every
matching iteration.

Drop the reference with of_node_put() once the node is no
longer needed.

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current tree. Leak found by code inspection
(OF reference-counting audit of vexpress_syscfg_probe()).

 bus/vexpress-config.c | 5 +----++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -393,10 +393,13 @@
 		struct device_node *bridge_np;
 
 		bridge_np = of_parse_phandle(node, "arm,vexpress,config-bridge", 0);
-		if (bridge_np != pdev->dev.parent->of_node)
+		if (bridge_np != pdev->dev.parent->of_node) {
+			of_node_put(bridge_np);
 			continue;
+		}
 
 		of_platform_populate(node, NULL, NULL, &pdev->dev);
+		of_node_put(bridge_np);
 	}
 
 	return 0;


