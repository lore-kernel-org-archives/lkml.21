Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110613;
	b=krPwrY2323bNh9fWvq7v9S3XIU/YzcckSXwul75ypfqKDOEoCff3keQn7FsyGGVH27k+
	 VRP4wZndtPyR523XXr/SEQpN1kEOmg7Kpl9CWUbSrbVhPcyt7+Jm9aUf1xp8ObxhU17vj
	 7x+Xd15soT6X1WMHmlEcJepFgQ/b4DcW8D29QdM5OuqKi+NospFty3oPeVWpQlIi6yblP
	 EA3ILftxK9KWxxPck60/Lija6savr/ycph0VXNqgFfaMXMP3h5Xs51tbYDH5OT9j+fMtu
	 d6rlG5toPa2HG4xCO7B52gb0yl06gf3dyPjk8aKQa5HUPsqn/E1SDJCvOQBpjpwU7JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
	b=ttjBr37e2gIO0hhY+Yq5KsUqkH7TbekRIKvyN/rQCBf/fNvjpN8bGRiDpjvL5HRxWtkL
	 HTaRxCH0llp0J0ROAmXnzvLnNz+EgqoxECPipGKh/fyb75KTI5zPEOYC3NlBhPROT0Ao1
	 3J74tFV1ftqMouSYjc7i0n8OBBzNldeATivlULr10wMJirzdxHeTavmDGUrsHFbDUnI97
	 87gpfo6CPMHjIKmD8qxo1xX3FS02xwAEQBmWRTz6XAFgM410hmezEZDNfqScVDhZQSegg
	 YQjO7ETU9mCqIL+XJguAWUYKgSC2AEKi6ub9xRZ0ubZOahyDiiWO4eVb0bJCxBzVgTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pipCExca;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C138A60A2614
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C138A60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pipCExca
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso35273985e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110611; x=1795715411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
        b=pipCExcaAkgn33Jj+6XRGBrNhCc+5e9sj5XWlJo6lmJ/sjHGiZAeX5r2xVCdiCNUfI
         IIWErUWiAWY+B3j7mrp99xi/YrTIjNUJmkgtKvMfFAjEQ6Sd2c/u5fSE42jeEhPhMuKf
         T8/lzLvWPyKKXU1B0LGYaxfIjgAtb7+6pcaSd1U9NNSHH3gq+AEMHQ4/k4LhsUlyBHP4
         3ALctnth2LWKxHQHdzsj9TEau7rdpUow+TvP/1XU2wF2xnLb0txNfNYpf8LiZpbZOyI0
         zwyGZcgeIuEYEsujTM+NBjqz+fMizNvqzmEZdGcaxL3JqO3Mzt50eiIn30KmzBfM0KzR
         rNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110611; x=1795715411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMvJgUgIWQ9UB+m69mwQOPyQAv9bwycAqVzJU4J35gk=;
        b=mVDTvavpS/6T4X8PyPDnH9LYKVew3J+ZLpAAv/C32oQlUuCZ7Q9j2tdt4XFGym6Mm5
         6ReLBGAY71CucGtcVxVzQxSJurXQNE5kgyJ4nIDpVN+PykMgaOnM/iokDm+OkCA6iW9Q
         Gg1zrl+HEReuwpX+FCcn8VFKQBwh0fhHEyHKYVl4crgRmIFgEDQUif8Um4nbhOR/IqM2
         Uka4wkR7kJ7ufxRL4n+X04RuS4wjEuGWh8fN4qk/bZvHbTTGuvX2ch/ioeLQ4RNDo6R8
         ShuTcbFYeReDomTTlphQkKruZZ40zPRKGsbjFy6ynrlfyVfPrIBlfTb0/eVIcySTUf0T
         adZg==
X-Forwarded-Encrypted: i=1; AL+hErFu7rnATwhTHC/7fc0j1lk2EToA1H6LLQ+brEJmwm+/LLACC+JhF3RRLmPH2VXUDxtPCTO4JBcFpMHic+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vnakw3f9h5yxf+p/8x7eNVavRgGROkDwnOCvPdYgmu6FGWDmj
	kSSxQJzWzKlHGjIAwgPY7nMPZT1HT5eoN17leMYdcse7Lg4eOjfhE69cGKHwtPuJSaw=
X-Gm-Gg: AYBFou2iyZDmGIr8rx0lLx5Cc9CAr8ygeoq4Euhonc29QxxCy7410EvtUAzSMD0Jocj
	NuEP8UyCKRzOF1hz0aj4JZYd7VxrMMAjuCQJz/jQF34oYmTKPYCxte3hFIh4sO0TJPfe0PfvnzG
	yYVHYda/DoYWuWCFPHHhsWHLuWbWkU9IiXACoJ6D7CSNRSUs39a0IUKVlDcXnz/mQmBSXtaQYVW
	5/4noG6GCwLWeNveVWc7+rc8GJ850CGPNR+gW7XHidSASUrWK/kje69/qgNIterJx07Cex7dArX
	tc3MT/5MBfWkzEuVfObR28GMkKYasAz+OBnC6tdugfr6RKVl1Nqh6aRclF0tEno7feWDTYmSQUS
	rCBJinE+/vCHyw+VdZkNMVMNw7uQNpaX1D0fnWzwLKCIQ4t72OtzwcC4zSo0GdNYgkX1BWaEZsr
	dlXWn64Zbb6R5hng2jkrOOfwDZQxcsJIz206DpCKd46m2BUJ7jngkbGILoqgcVduLBdehDxTBH5
	WV702L09feQfVwOw7LAgC3BHLr/fb8D2WrTefQOPEnsQHU8iUiEUjeyLXWXkVmqk3TM4ahn8y59
	MSPRWsAGqHUvAAsmsfMTwbepu6UH9D8OzjOmWl8YqMLk9ybnXMkhydUo9DGIioFOvyIkTSPP6e5
	0pnJeiWlezW6OZTZye5cVcRBlgvtwtP1jRUS1U12waNr+52/3PcgHyajxKqN4ro+3b6m3y21Le2
	y3A+Q=
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr8080595e9.2.1795110610855;
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm53032625e9.15.2026.11.19.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
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
Subject: [PATCH wireless-next 03/10] wifi: cw1200: bounce SDIO transfers that use stack buffers
Date: Thu, 19 Nov 2026 18:49:55 +0100
Message-ID: <20261119175002.458988-4-arthur@aheymans.xyz>
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

Register accesses pass stack words to sdio_memcpy_fromio() and
sdio_memcpy_toio(). Use a heap buffer for stack and non-linear
addresses; keep the direct path for ordinary packet buffers.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 35 ++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 2b6afe221268..1894359ee9b4 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -10,6 +10,9 @@
 #include <linux/interrupt.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/sched/task_stack.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/sdio_func.h>
 #include <linux/mmc/card.h>
@@ -61,14 +64,42 @@ static int cw1200_sdio_memcpy_fromio(struct hwbus_priv *self,
 				     unsigned int addr,
 				     void *dst, int count)
 {
-	return sdio_memcpy_fromio(self->func, dst, addr, count);
+	void *bounce;
+	int ret;
+
+	if (virt_addr_valid(dst) && !object_is_on_stack(dst))
+		return sdio_memcpy_fromio(self->func, dst, addr, count);
+
+	bounce = kmalloc(count, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	ret = sdio_memcpy_fromio(self->func, bounce, addr, count);
+	if (!ret)
+		memcpy(dst, bounce, count);
+	kfree(bounce);
+
+	return ret;
 }
 
 static int cw1200_sdio_memcpy_toio(struct hwbus_priv *self,
 				   unsigned int addr,
 				   const void *src, int count)
 {
-	return sdio_memcpy_toio(self->func, addr, (void *)src, count);
+	void *bounce;
+	int ret;
+
+	if (virt_addr_valid(src) && !object_is_on_stack(src))
+		return sdio_memcpy_toio(self->func, addr, (void *)src, count);
+
+	bounce = kmemdup(src, count, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	ret = sdio_memcpy_toio(self->func, addr, bounce, count);
+	kfree(bounce);
+
+	return ret;
 }
 
 static void cw1200_sdio_lock(struct hwbus_priv *self)
-- 
2.56.0

