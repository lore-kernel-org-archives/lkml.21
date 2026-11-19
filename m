Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110612;
	b=EkqD1Bhx84dZB/QazG20InzmjVocMdZySVsWq3xmOSIDckVzIY8x+5sWYTLH9l71NWuz
	 1w1FzNnY8vySWYSi4odSKSJ9klXaUAGG4eCr7N/u/qtr6CWq9Iv4TE2+9VlymdlFl7KLi
	 Oh5wM79Q4O2Tbgy/NyiCyTvReDhw5dh5a2Nialb4INvNZiV1zUiE6ZHN4ogmD5JaUU0Oi
	 dBwq+FQgUKvRqGSzSc2CkzcCPn9T0pUjXW42/aLXoM85nbrFAl5WpHWmRm/oIwOsJPlHS
	 S3DTYuhIx2/QxUijrzMrhGHYtz4x4+kldSBxmkL3+aCMAE6lFy+1lxJx13m6B+72GqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
	b=EzjhOKCU+j3TP/uamIME2e1ol/jcn31he/2WLdUUqWHUCHtH9+++csX4BY0G6dZkxgYA
	 c8Uu9sEBmK+5enmo1xBbhOklFgEMsMLtwrX4xb3YVFNkb9ZkEUh57MKx7eOwIDly7TZ0g
	 J/G7KIsbk01LsVmTqAK4U7iVQ8LvIt02nB9mATp062gTa5NyTxbutPzMaZtXC0R+ochBR
	 tQ6GZMQ2QwtICHzfCXsDzg/nr1HliHdiCXxgr1ozlFD7O6fWR/r0FLzS5Z3VIXBhXVT57
	 8oy7lGnCZYAvV9De8SDOF7RewF1Rp67zn2xjrbuu6FaqID662ZtjKQeyayoK62eXqFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=noXf1rHX;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA9606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CA9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=noXf1rHX
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so25090935e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110609; x=1795715409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
        b=noXf1rHXHVA5Bo4zBqtRn+YjTYtHNXGVE83xggHGKpOWjneiUdG5LTFmE9tzs3PcFi
         QDgwMI0eZzahFKbbUHQxOzro7v4Hw3kiJ4m3AYRUtEkI7RUatHAETc/wADxUDy48QzWy
         NltjoUQNyPz91+WrQGjtvuHrtGTA7HQakwoozd0ncQc5831PnXftOw4lhkDLw/7sDU2A
         5cF+ssEbbYVFSUwmA53rpP3GVOutHQ/72+f9fJqIRZo1Deuv6sQUSQjSD1ZU8RhziwLX
         M6YNfnpf2S1ZK5CHuPW2PZYCZ/XVkE7wLBdZJYg1Er631mnNtAF3hoy2QVU+0gJo2z8X
         JXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110609; x=1795715409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+y4Dhz36GBPfKNKm/OZQCyp1F0ego1607MuK1Oaddis=;
        b=zQDO0H9IWh98+rEPWGzJfrkjwFZWBVva4R6M+16UU2JEjM6hM1A5p+UOioUoLpwXgY
         YXg044Tgslnpog6bFR7m/pULNxxAE+l7Ia2ZT2WSqUTNDXK2KaFZpxQTBFB8yCkNx8J6
         60bZgtxfAbw40MXwGQpHzC6hNFS7S0qGAh9kgXsmCiaXYIw++j6zQW7gJYq+yB7Cc0Pq
         cRKxpTESBMl5ZOKouSV26kOgfKybYFzBKpr/yRa0Lq1XNMZfXb7B6Nynd/6vFFyBv7xb
         JvIP8eEx9IhQ03cBSE2YdzQ8vEmIzfBfgFTV8NdScNlz/jlVKKFKPzAKKdJzduXDHYpJ
         8Qmw==
X-Forwarded-Encrypted: i=1; AL+hErHW+KT+Fjb/N6/tuaCedrNBiiqp1Im26kRFyU+g2ybJnf4m5QFGZ6LGT7mvI8xQlem6Z/AxateBSwhTPFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1AOq0AK1pnqqhvfKwc5RTV7DHlwF6/JAPluMcBihKRCSW52r/
	z09ESO9YtfjXefSlQW0i6Kd0KuLp5LOKbVjiJK1asccopTV5bOGg42Z0Hzkpugr2aOU=
X-Gm-Gg: AYBFou1QccaW4UXNKntgmuH9tt7h1TOeIEl5qHG7bh69Ex8gv0hzHbEy+EikCBJEmz+
	RqngBKUGBYgvX1SkuaOgGvoKBwBJbnEsb9ihq7riisptdrRjfoZkOTAd/etgj/O7ukDNiCv5pCe
	ATUy4ja+JPCAM5SdrUqXYg/1ZwXBXGA5kTU69+rSM6aKywHxT+4vOOuryiQRsuoEZ8Mi+o39Ysn
	xTK2bgN2YpLtnKziZyayfl1eI1wn6BU4GzZ9EJTe/tgxiscoK3+5flcmk7e8P3zh8KVa4p5c8Z3
	dCJvVpGDtnr/ndzEKdnoEkKDQWXxIKIQcpB53GobTYJ3zcy2v2sBFPgDQw1UkEi1X1sVWQSQp37
	EmiBN3n9TSEn/zO38RGKRI8xqiIF09eRYGVx+9Io8no6zEb8/Cg96CWMPX5M1texsdj3OupGFeG
	modnZZUVq0aHVKj2b8CgWWn+krLYRLZLnWlhFEMUU7tIh3K88lhrRMVeJMMBY1WkAZDz/jmuwgi
	STmJNsNsh7vpdOzpNhpEIAiFRz4xYoB7kAEX5VqBkpxgiV+UNZazLWJfUSd8ZG7nFLvBawU9qpG
	sR3XRmvu6jNL35Erh6Z+RvuZvAfsZ4Vp4DvGSYdS69/O1bOjTU8edXVvmj7baQSDz4q3Q7xcVVH
	huOa1XLpvYq8RPQuHgDl7j+xvJAUSELE3+jPqcM3cze+qbR3EemNvUKK2lukFOvLcc34X3d3umh
	6xDw==
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr5216045e9.27.1795110609383;
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e06c73sm90730215e9.2.2026.11.19.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 01/10] wifi: cw1200: avoid removing the debugfs directory twice
Date: Thu, 19 Nov 2026 18:49:53 +0100
Message-ID: <20261119175002.458988-2-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

Unregistering the wiphy removes its cw1200 debugfs directory. On SDIO
unbind, cw1200_debug_release() then tries to remove the stale dentry.
Leave directory removal to the wiphy and free the counters as before.

Prepared with OpenAI Codex.

Fixes: fa8eeae10257 ("cw1200: Remove "ITP" debug subsystem.")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/debug.c | 19 ++++++++-----------
 drivers/net/wireless/st/cw1200/debug.h |  1 -
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/debug.c b/drivers/net/wireless/st/cw1200/debug.c
index 7dad6d3ba239..6b8b6ca35103 100644
--- a/drivers/net/wireless/st/cw1200/debug.c
+++ b/drivers/net/wireless/st/cw1200/debug.c
@@ -359,19 +359,20 @@ static const struct file_operations fops_wsm_dumps = {
 
 int cw1200_debug_init(struct cw1200_common *priv)
 {
+	struct dentry *dir;
 	int ret = -ENOMEM;
 	struct cw1200_debug_priv *d = kzalloc_obj(struct cw1200_debug_priv);
 	priv->debug = d;
 	if (!d)
 		return ret;
 
-	d->debugfs_phy = debugfs_create_dir("cw1200",
-					    priv->hw->wiphy->debugfsdir);
-	debugfs_create_file("status", 0400, d->debugfs_phy, priv,
+	/* wiphy_unregister() removes the whole subtree. */
+	dir = debugfs_create_dir("cw1200", priv->hw->wiphy->debugfsdir);
+	debugfs_create_file("status", 0400, dir, priv,
 			    &cw1200_status_fops);
-	debugfs_create_file("counters", 0400, d->debugfs_phy, priv,
+	debugfs_create_file("counters", 0400, dir, priv,
 			    &cw1200_counters_fops);
-	debugfs_create_file("wsm_dumps", 0200, d->debugfs_phy, priv,
+	debugfs_create_file("wsm_dumps", 0200, dir, priv,
 			    &fops_wsm_dumps);
 
 	return 0;
@@ -379,10 +380,6 @@ int cw1200_debug_init(struct cw1200_common *priv)
 
 void cw1200_debug_release(struct cw1200_common *priv)
 {
-	struct cw1200_debug_priv *d = priv->debug;
-	if (d) {
-		debugfs_remove_recursive(d->debugfs_phy);
-		priv->debug = NULL;
-		kfree(d);
-	}
+	kfree(priv->debug);
+	priv->debug = NULL;
 }
diff --git a/drivers/net/wireless/st/cw1200/debug.h b/drivers/net/wireless/st/cw1200/debug.h
index 80bc1567533a..339a375b4c18 100644
--- a/drivers/net/wireless/st/cw1200/debug.h
+++ b/drivers/net/wireless/st/cw1200/debug.h
@@ -10,7 +10,6 @@
 #define CW1200_DEBUG_H_INCLUDED
 
 struct cw1200_debug_priv {
-	struct dentry *debugfs_phy;
 	int tx;
 	int tx_agg;
 	int rx;
-- 
2.56.0

