Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416615;
	b=UYII1xOcjtodwl1hBovxc2/kIdfIjN9f9lekDohJeiLerHcz2X+1aKYV8wo24eUbAiek
	 PYzJycULNqF4QOqn3+od8IH+q9Ai+GM6D/zH+o5g3g4ubE7upwTSsK9r1Pl2kRFUwoVze
	 nxj79e0Vr9s4689k968o1PQQ6aIFWeHwaiTD+NK3EI5h3w+UrF8OhzSZhBHlAVRyqEHrz
	 12Yka36XycsYET4RL5nueCUd8SAX87ZlORetNFfXVNaKMPxwGqcPLglMdvy7v/liR/X/i
	 BEwXBQbueZiUAVbKQVF0IsMpZLM+sLw9BCD49MyE6gASJ2UWRBwJXMs4c46xxyZ1UiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416615;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8mbQTvtrZIi49PDytRQi6d2CD0lZbL/3QWzafrofBmQ=;
	b=WtMQSAxjnqSPBPlcOpaDb77I8IFnmuW5cp6/WKV+RvnMjtv29dhYT+tXqY/0nxHW9/9F
	 umNTTgvYHl2RpIl+LmxpIxJUoL+4xmjp3017YxCgqTzF3mGSAdt60XF9cOcaxXXRQPMw5
	 5+bsYrVk39V6AhBlPfigtE91SxFshLudQuH2UvtszOFS18bz5Rq/N//GYOgz64o2PECZJ
	 gUueyjOavq5ijk4N/FYVqmOw/L+RFHzurOISO1E3zUb69syvjswQ4d4KpF2DRfGVSEoWQ
	 oXb/PMmxnNoQkk83heECnt5OLv5ORgNiLIxyhUDyOyRUYKxcX9X5XPvFPW45fn4MrDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dWvkARxy;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A12606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dWvkARxy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dWvkARxyR0QvDgfJqZs74eYMOK4isqDvpggE5BB4Wc6HleGrUvdqlMeq5i9ZRtxLs+s3os8n3g2j0
	 EV1m1qPrRS9cJIlpa6rY1ZDOeSbKg3ivEbwaaNRE0ouADC9XagfNgeyD1+4fA/C2LgXMqM30qxp/Dm
	 3qlJMSCSVqH+oLR0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36b03e22215f-062b3;
	Mon, 23 Nov 2026 14:50:10 +0800 (CST)
X-RM-TRANSID:2ee36b03e22215f-062b3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6b03e21f673-8a128;
	Mon, 23 Nov 2026 14:50:10 +0800 (CST)
X-RM-TRANSID:2eea6b03e21f673-8a128
From: zhaofeng2@cmss.chinamobile.com
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: ti: knav_dma: fix device node leak in of_channel_match_helper()
Date: Mon, 23 Nov 2026 14:50:06 +0800
Message-ID: <20261123065006.275-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
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

of_channel_match_helper() takes two OF references: one via
of_parse_phandle() into dma_node (for the ->name string handed out
through *dma_instance) and one via of_parse_phandle_with_fixed_args()
into args.np (for the channel number).  Both are leaked:

- The three error paths (property match failure, fixed-args parse
  failure, missing args) drop neither dma_node nor args.np.

- The successful path leaked both prior to the initial fix.

Drop dma_node on the two error paths present in upstream, drop
args.np on the one error path where it is obtained, and on success
transfer dma_node to the caller so that knav_dma_open_channel(),
which only uses the ->name string to locate the matching DMA instance
within the function, can release the reference once the lookup is
complete.

Fixes: 88139ed03058 ("soc: ti: add Keystone Navigator DMA support")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
v2: also release dma_node on error paths and transfer it to
    knav_dma_open_channel() for release after last use, per review
    from Nishanth Menon.

 drivers/soc/ti/knav_dma.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--- a/drivers/soc/ti/knav_dma.c
+++ b/drivers/soc/ti/knav_dma.c
@@ -364,7 +364,8 @@
 DEFINE_SHOW_ATTRIBUTE(knav_dma_debug);
 
 static int of_channel_match_helper(struct device_node *np, const char *name,
-					const char **dma_instance)
+					const char **dma_instance,
+					struct device_node **dma_node_out)
 {
 	struct of_phandle_args args;
 	struct device_node *dma_node;
@@ -378,15 +379,20 @@
 	index = of_property_match_string(np, "ti,navigator-dma-names", name);
 	if (index < 0) {
 		dev_err(kdev->dev, "No 'ti,navigator-dma-names' property\n");
+		of_node_put(dma_node);
 		return -ENODEV;
 	}
 
 	if (of_parse_phandle_with_fixed_args(np, "ti,navigator-dmas",
 					1, index, &args)) {
 		dev_err(kdev->dev, "Missing the phandle args name %s\n", name);
+		of_node_put(dma_node);
 		return -ENODEV;
 	}
 
+	of_node_put(args.np);
+
+	*dma_node_out = dma_node;
 	return args.args[0];
 }
 
@@ -403,6 +409,7 @@
 {
 	struct knav_dma_device *dma = NULL, *iter1;
 	struct knav_dma_chan *chan = NULL, *iter2;
+	struct device_node *dma_node;
 	int chan_num = -1;
 	const char *instance;
 
@@ -411,7 +418,7 @@
 		return NULL;
 	}
 
-	chan_num = of_channel_match_helper(dev->of_node, name, &instance);
+	chan_num = of_channel_match_helper(dev->of_node, name, &instance, &dma_node);
 	if (chan_num < 0) {
 		dev_err(kdev->dev, "No DMA instance with name %s\n", name);
 		return NULL;
@@ -425,6 +432,7 @@
 	if (config->direction != DMA_MEM_TO_DEV &&
 	    config->direction != DMA_DEV_TO_MEM) {
 		dev_err(kdev->dev, "bad direction\n");
+		of_node_put(dma_node);
 		return NULL;
 	}
 
@@ -437,6 +445,7 @@
 	}
 	if (!dma) {
 		dev_err(kdev->dev, "No DMA instance with name %s\n", instance);
+		of_node_put(dma_node);
 		return NULL;
 	}
 
@@ -457,6 +466,7 @@
 	if (!chan) {
 		dev_err(kdev->dev, "channel %d is not in DMA %s\n",
 				chan_num, instance);
+		of_node_put(dma_node);
 		return NULL;
 	}
 
@@ -464,6 +474,7 @@
 		if (!check_config(chan, config)) {
 			dev_err(kdev->dev, "channel %d config miss-match\n",
 				chan_num);
+			of_node_put(dma_node);
 			return NULL;
 		}
 	}
@@ -476,6 +487,8 @@
 
 	dev_dbg(kdev->dev, "channel %d opened from DMA %s\n",
 				chan_num, instance);
+
+	of_node_put(dma_node);
 
 	return chan;
 }


