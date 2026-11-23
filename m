Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451523;
	b=LEm+JmItz0lhfADhtIVitit/Pq7vXRbLtZm+XSbXUXxvAQYoA9DroiwitBo8cXDvC8X/
	 N9RDIiAkBa/Hah1+dox61pVCAIzRUy2j4eyY0BiZwcY8lzBJkr3nUUj5kPxsMrls0/DfL
	 viwVAlr7+PMFAgAsO9RsIkie7Ape5guCF48RXHGjMr8418WAMgWC9tUvleyQfEew15524
	 qMWI/EaYxU0xuwaY3r6XQDmA9GjvakwrRIO1Uo4xrOopfUZAOtt7nNWaQIO0lP7yHwdxy
	 rnMI2MwF9eNAyf8ZXTDUgGnP0sXc8OXo8PIccdzupl8ewJdhrSyKVqnB/HafbwqYKuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
	b=DfFdLUHL6SzTtHEpMM6JlFFqXwwNr5pIDMn7lJihRFhZjxd3VOnWWHBmF55GWEaFvbzR
	 6BEh0NdTbEvLBxBzHwudarlX9py54Xcz31WWcKHGHshBKXZ39Lt3vX27iKJY3FVd3C3C8
	 J7AF1zZ05qbNelBpfk+ieFjk6Bz10CbG6GZ1SmzncGiz987UcLgyojT9HtYiKWRYTFhQu
	 0c8Wpu/e8yog6lbDhjapqWQ+79PKI9a25NtwqUN7vuicGFOyz3UWSNT3nluYlf9CoXLAg
	 BW/B+ocOcF64RSf0bTSxKZNWP5i1QFDQXl7KfEHZLr1h8wUQKduiqpTHH3g5dZ6q5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpQgYNvD;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B3E606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B3E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpQgYNvD
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so10429872eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451523; x=1796056323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
        b=CpQgYNvDlFm0WiYd39sOK1W0UR0I7V31U8ortklh7qSSwm6F8QJBjE2TEoURaVPaio
         Srr2IE+9Tm0WbczfgbG+NWbjvV2h91gsiKYgbaklbxHOHby5HGHBvez4C8KMrJuSEbXI
         M0VW36eGCJH5M5vt9n0DaQVPCyYGNgKTxr2hdPO+XPO7GPuSmj8XnJ2eBEwIpI2wFnfQ
         T10LTXL0XnaQar7JkJJHwVnpHD61Hd7Joe/guVvRpbjBuxIE7Ebags33MrTLM8qahW0r
         XDFyWIgI+mCm592NsA5FxqrxKidmPHa5kZOFVc6CZu9mex+kyt0n2fk0EUWL7hBNYIhk
         BJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451523; x=1796056323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
        b=E4YuhMqlc59AF2apqaDFHgL9KwLC5XdGXKomcunQVZd+eLLWdf+8bKgBRBendwzyDd
         JFvYKWcfEQPTzrpF53OPITFPqxFSStXVRcs0ACx8Os7y2vGA+s2I8soeCQbu6+Qiuy2T
         fRRHF7NkUYfJouaqGcv4OgN5VOBoXXJUkfphRBrP+9agcSc4XScmD9W2EyKXmzCpkcPd
         VJF38mJZNnfoTkNBciuWe2412/J9L4HwjdXC4ymkHhugofHxdhvsRQR3ycsJKJeD4/2h
         jkfIVDx4g3I4AZB31vQPSmMyD1DFZuJS9K2a0p15rauWrw4NjBoG5ETZW94qhhTQpzhK
         Qt7A==
X-Forwarded-Encrypted: i=1; AL+hErF7FshVp9atQYqAW1iV407CqVfGNKVYpXohdLZC/8HxqoXj69cJN1nMN4mGmzcxlfsEUC+KLKU4yj7sup4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/82480g98jh26z+pgXm4cXW5IWL5eVS8yTS7lcUzEash3XdnmR
	LjDVI2G6yCgkMPTHfxxwtWUXVEu3lO+oxMsiNXyHzt+KcAhPSUJztwU=
X-Gm-Gg: AZFdTZcN+eS89tMtjs5CfzfEHsAl0aJuiJKKy1j+Lp4ZoRP+iGKNPTYxrtXX0DiXv+L
	n+WwIKr1BTqdN43pIPrEsf6uF6QVTQecnPxFWrCYO/4UdMjT4Stc0H1RnpXG4vv9o6NXX5vLdqr
	atO8JPUWxs4ObWHRgWhKoWY1doVonYY1sNmckb6L9SJz5wfVBoWBkYAEKZ3ewSS+m5jxIjfqGBg
	L/NKODA1xtUnJ+v149bEpRH0SZXK+NQ0liFSEMjBhU0DKGQJhuG5AZPj6iTEKWhyFph064enUsD
	MtO0K3y4PTKFRIAQK6d4zC+Ynm+pcalLSOYVXO/SMN6xP3xCn44C8J9JIWyFkvS6trCFCcC19xS
	/wzXEdRL1KKHbTMsgXL6XQ5gdwusNbX0gfLqKVJ+nCrwyBuw9MIY8KrH/j4I0NxR7mZXGHUmO2h
	j01doOLS3NXTplP0rk33wvBdf8MG3RxEv29BffCIFg9fBoUIkfF12wM83ugMAsJCyDwyYxj2mTT
	APXZ8IWCQrHaJsgceo8nOObLkVqsiUWjQeetPoIslYmdnah1SEtv+uxypkfyK2/f0/kAAd2Nd0A
	xncvG6RHp+Sqw0LflWj5GpJxjdxyf53MV+xi5Sk+zecEt3kr7ASiO+FDGA==
X-Received: by 2002:a05:693c:88c7:10b0:386:b3aa:77f0 with SMTP id 5a478bee46e88-386b3aa7d6emr2891515eec.18.1795451522495;
        Mon, 23 Nov 2026 08:32:02 -0800 (PST)
Received: from localhost.localdomain ([218.212.26.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm9727659eec.27.2026.11.23.08.31.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 08:32:02 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ti: icssm-prueth: Retain port node references until remove
Date: Tue, 24 Nov 2026 00:31:30 +0800
Message-ID: <confirmed-20261105-26-ee6bb3813c44@gmail.com>
X-Mailer: git-send-email 2.50.1
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

icssm_prueth_probe() takes a reference to each available port node and
stores the nodes in prueth->eth_node[]. Those references are released
both at the end of a successful probe and in icssm_prueth_remove(), leaving
one excess put per port after unbinding the driver.

Keep the references after a successful probe, since the stored nodes are
used during teardown. The existing remove path and probe error path then
each release the references only when they own them.

Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/net/ethernet/ti/icssm/icssm_prueth.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index b42c98e861e081d6c616881786b94e8bcde6b944..4f9529e0e404fd9cfee9e7340f2f048442ab938a 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -2018,10 +2018,6 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
 		 (!eth0_node || !eth1_node) ? "single" : "dual");
 
-	if (eth1_node)
-		of_node_put(eth1_node);
-	if (eth0_node)
-		of_node_put(eth0_node);
 	return 0;
 
 netdev_unregister:

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
