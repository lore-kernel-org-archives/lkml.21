Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765344;
	b=ngkG2TJJDK/s59+vF1YqqvxSKZ7YpCoLPm8O+XhMkL7jAzENudBe09mutsnfGvqTXpFR
	 vhYd1GPsonWM35gHKdNcaasLCLKx9kIq3kt7WBjM8g7Jxq3ITC39LP4X/Wi9iM5yQDgER
	 2J4G9jMi/Wz4lawj0fve5fNTiGNu5BFjW8eoGWJrlVbWECoBihjoICTnDn4pnJMi/YK6E
	 ZRAVCidgl9au0UjxKBGO6iIk9VXZ2wMTTj7P3xwDO76xNdDk5XHpbyPfPl6IXyAHTeAq+
	 7KOZCmTP6wNOLiAdSadFidY0EWZWw5OkGAP39EInaHF2Gi8K1e900eeNmdmaD6dYpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765344;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2EMrqLxhB8NeX2lRlrhTsQgGdQYslPX62AQYL2s8aVA=;
	b=tDxZ2cYVzhEO6FwWBYwAMMsxxKSRzl2V/4neb1Fp0qB6pkLa0i3G9u2rbfYnX+esd621
	 Z4lcO/mHwN/LftCdm0Vg8uFVBPjy/paaGcxai6eUKjWoODP0EhVLjAopdNk6z+9SNSLHX
	 7Kbfs2USSnZVaaFHrOKp4DUB2tZuOARvDfuQaYXSfFa6PXC6CICn4bV0c9mhUEQmaHVss
	 JOpubPEED+ReDUzhIvjvlVS0Zvem7jwx3qW6qO9YNlyrXkaH2AkFRL6gHBzS1XY/1Ssga
	 8HmwsWrOH+YuM082L39oOZ/FCTNf7Yu5ev62HbyQ8DWHbYz6Mt9bjry6HrWskA10jmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ywHxZDm0;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F28A606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F28A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ywHxZDm0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ywHxZDm0Lvd0Bttj+3Ow4g4Piz06Ny2hJDsz2MWk3ZqmspXl0Of8XD1/4bGbFncLYE/W1qtSsHgyt
	 SY+Wf3UJGsuaERBzG05j9LlO88fsQtxSOQa9a0fXSPVNI0yIVfDhDF6mdeJENCTpEZUKWruJ97WvlZ
	 CbX0IVB7sxa76BS4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b09345d4d9-03dfc;
	Fri, 27 Nov 2026 15:42:21 +0800 (CST)
X-RM-TRANSID:2ee46b09345d4d9-03dfc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b09345b14f-8bd70;
	Fri, 27 Nov 2026 15:42:21 +0800 (CST)
X-RM-TRANSID:2ee96b09345b14f-8bd70
From: zhaofeng2@cmss.chinamobile.com
To: Andrew Lunn <andrew@lunn.ch>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: dove: fix OF node leak in dove_init_pmu()
Date: Fri, 27 Nov 2026 15:42:18 +0800
Message-ID: <20261127074219.1188-1-zhaofeng2@cmss.chinamobile.com>
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

dove_init_pmu() calls of_get_child_by_name() to obtain the
"domains" child node of the PMU node, but the reference is
leaked on the two early failure paths and on the successful
return.

Drop the reference with of_node_put() once the node is no
longer needed.

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current tree. Leak found by code inspection
(OF reference-counting audit of dove_init_pmu()).

 soc/dove/pmu.c | 11 +--------++---
 1 file changed, 8 insertions(+), 3 deletions(-)

--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -388,8 +388,10 @@
 	}
 
 	pmu = kzalloc(sizeof(*pmu), GFP_KERNEL);
-	if (!pmu)
+	if (!pmu) {
+		of_node_put(domains_node);
 		return -ENOMEM;
+	}
 
 	spin_lock_init(&pmu->lock);
 	pmu->of_node = np_pmu;
@@ -400,6 +402,7 @@
 		iounmap(pmu->pmu_base);
 		iounmap(pmu->pmc_base);
 		kfree(pmu);
+		of_node_put(domains_node);
 		return -ENOMEM;
 	}
 
@@ -451,5 +454,7 @@
 			pr_err("dove_init_pmu_irq() failed: %d\n", ret);
 	}
 
-	return 0;
-}
+	of_node_put(domains_node);
+
+	return 0;
+}


