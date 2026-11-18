Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983396;
	b=BS5tBP6FiLqyMIhygAjLlYzWYg0hqucLzoMtV2Zsx0afqJyR0otIO57jbNAc3bkiVl2L
	 aI+o8o7c3yXQg9fvlaKWZ8s7By68QCLFwDK7SWx6IbJZvxrFvJxFylmZmch6bM2RliDRN
	 l8dPiaccPT2BFweWvYY7dSK5krEDS5+e4gRUsC5cC0rGXJ6gR14Y0/Me09V5KD/jTZc85
	 x3ZNX0rhPcp7RBiOq2q30k8pPzkgi/7OunnHxL4k9UvvbTdzNlm1jxs2gRIAYvThrBMWy
	 ztUiDJBQ5ZFQp+UI/z0v3lWeUrBWJrNQQnX/t32Jxqy1K4ayKWBU+glNjCuJdnjAXIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983396;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8C1So1mmCsoiaLd35+rXvL9hXixjldKX5HJN+wIacvU=;
	b=l0CuX8w1SVhC/amxm0N+GEWqGsEa1YZ7gCqDE1Kc/crO+eqT/OY0BGTErWo4iFJIC5nP
	 F7Xq1hZ6ZDAWV3wuGirBdQuJDFD+cgpEmbcz3fJu6HbJDBLL5oXjQWgWH6a5Q4UsBi8Lm
	 ovOcQomIBF2o6b++1+JP/1EYI5dMi96HC/3SdWZjJgCUVpZsJzL6BqCgwdJ1KO0WFzOlA
	 LQINA1mB8rwFZTm7SkBE+mmczwXj5/04tF1jcfLOa/8tPTPW7fjJZl+kMlizq0Vem2Qy6
	 Zb/OV2hWp9C3LbJfGvbBiAauBkRJAApBkwwp5yJ6o4DAZpFQ9RRu5K3VW/wADOz4Mlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BWJMHDXt;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC849606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC849606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BWJMHDXt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BWJMHDXt6D3OdDJR47P/ZU3QygMYvdeKqfxuMcV3mxkxk0jZpBF8cMWkr3nEb8PJsuSkQHpKWgpRJ
	 UFOR3IV4UimDViY947yVOdoH6dxa6qYLi5fX1GlAN6KY5CC5fSU1YXbymx9cqQiluavoTAFb3h6+Th
	 Vim/7W+nGlX7iBj4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd45db468-b085c;
	Wed, 18 Nov 2026 14:29:51 +0800 (CST)
X-RM-TRANSID:2ee46afd45db468-b085c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86afd45dc8c6-34d8f;
	Wed, 18 Nov 2026 14:29:50 +0800 (CST)
X-RM-TRANSID:2ee86afd45dc8c6-34d8f
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: bleung@chromium.org,
	lee@kernel.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	jthies@google.com,
	chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Date: Wed, 18 Nov 2026 14:29:48 +0800
Message-ID: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>
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

ec_device_probe() calls of_find_compatible_node() only to check
whether a "google,cros-ec-ucsi" node exists in the device tree, but
the reference held by the returned node is never dropped.

Scope the lookup to the UCSI block and mark the node pointer with
__free(device_node), so that the reference is released automatically
when the block is left.  Keeping the lookup inside the block also
preserves the short-circuit evaluation of the original condition:
the device tree is only walked when the EC_FEATURE_USB_PD,
EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on
every probe of every cros_ec device.

Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI")
Suggested-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---

Changes in v2:
- Scope the lookup to the UCSI block with __free(device_node) instead
  of a function-scope variable with a manual of_node_put() before the
  condition, per Benson's review: the v1 lookup ran on every probe
  (breaking the short-circuit evaluation) and the node pointer was
  tested after its reference had already been dropped.

Link: https://lore.kernel.org/r/20261118013935.1573-1-laixiangwu@cmss.chinamobile.com

 drivers/mfd/cros_ec_dev.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b80..b8d363b7a 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -271,14 +271,20 @@ static int ec_device_probe(struct platform_device *pdev)
 	 */
 	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
 	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
-	    !acpi_dev_found("GOOG0021") &&
-	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
-		retval = mfd_add_hotplug_devices(ec->dev,
-						 cros_ec_ucsi_cells,
-						 ARRAY_SIZE(cros_ec_ucsi_cells));
+	    !acpi_dev_found("GOOG0021")) {
+		struct device_node *np __free(device_node) =
+			of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
 
-		if (retval)
-			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
+		if (!np) {
+			retval = mfd_add_hotplug_devices(ec->dev,
+							  cros_ec_ucsi_cells,
+							  ARRAY_SIZE(cros_ec_ucsi_cells));
+
+			if (retval)
+				dev_warn(ec->dev,
+					 "failed to add cros_ec_ucsi: %d\n",
+					 retval);
+		}
 	}
 
 	/*
-- 
2.50.1.windows.1



