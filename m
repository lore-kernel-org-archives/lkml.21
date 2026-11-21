Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289531;
	b=MJGdZEJ8xEZIhqiu8oS8fScGUda7rjBNKOG4Oi7K377CyrOEROJUEwCiBnFEvM228dqM
	 G2hPKXyuNzUZcBKH3BUppFzV8JsoJu+KD3VqlA8qwwDuQX2JLfwXes0ThGzIATQ6h7uuY
	 a9V30j5l9Tq/UPJnYKjkqqJPVqB2zMyhf1pxwHlgo+V09ppl4QGFu3RWqLYWWyQSzT7bh
	 oi64DRR8UAF2qPoIS7GrjaZA9rCR8vfvJdo35X9IPhL/rrT1w5S5w/YzfB1/q7/aUEUnz
	 T6xZn7EDsr8b1Ww22ZSG5F9xdZvTl8GRAOwy+p3ejh6FevMw7jHNZyKPLdmQKyz6htg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtGGBcYFLH/+8lgOsFq33g5o0zMHPu1MjtNUHieI108=;
	b=iNkxtilY2SGWU6vU0wRx6ojg4Qrnff9TfHtSFx6B0sZiKa5pdyRvMyeMVqlgP4Xlsqlu
	 QLwqK1NcfSHaYBe62qOPug39G1CxfQmk1B+5vsCo2mm5V7AVgS/kL4NLdWvwcs9BXGy7b
	 XfIs3g/ihy9rx5wC/oy4reCeJYwYBqYbd6MMY1Y/Dma4C9fh0nxYyqnt8s749f3F9rBeL
	 AzGhehX8S4FLIkcFjs8lsgob6kCyXIUsBFi8oVQlSWVMpmlQEIKkaTAZuHNdpkR5iJiDH
	 YnxkwDr5LB7BWaGVy/skzs+zNFwA0J6ye3J93WOO+Qi4bjU8tNGdHtl9MuIF2xv2+Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="goc/tD7G";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F60606A682
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F60606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=goc/tD7G
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1102672a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289530; x=1795894330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtGGBcYFLH/+8lgOsFq33g5o0zMHPu1MjtNUHieI108=;
        b=goc/tD7GgY57pBypEHGEz/djrG91+Qjb6dAF3/xnQIzzue6qu5+03oJ8AzmhyQsyL7
         No9wKtNZtkB6P5JQTfVvtpPNLfBxMiGMI0WusktvGzXzNqZfOrLpFWE928XFa8u+4DpC
         0z4awFPJw09YRNn6pvnitLTdy+nIdqjxL3T8yw9K64HbC25fV+YXNs5Fd/Ip1UuI9xvK
         X+WoYfVKvdFUqVUQBP5vMDENrllPvcFz/mD52qsPofb4PhOsD51iXqn4EIWidMB2k0eP
         Yc+dzFSdivAeNyIx0J6YVGLJoEDrgqskhbx6R+C2+OnqUmtkauP8fkMw8DHgG9LMDYoU
         Edfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289530; x=1795894330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtGGBcYFLH/+8lgOsFq33g5o0zMHPu1MjtNUHieI108=;
        b=KNU2KstBDRd2D3Ghg5d2oRetQn/MF8Mz+G7PuQ+HBn4io0mzdTxISsSBteQiYIef93
         q0fzUWIwxYBDI0K126wvxl3HXjWrnu9IBEd1OWoFan8TIgxr4AeOUWr9NdOZe5o2fQgN
         Z6b2tpj6hyxHvxxf04ZuKJsFlM0X+/Ut1UU9tsLCw+AwGmdc/m2s6nPxeazlt2fKsFQ0
         43ofqqK/6mvOG9FkRQeS8wOMFB6B5qpQ65Q4uzLCXrbByN/FJtFO48vz/m9+qSETGUmN
         Xd56l0s08b6kobwrOy/yF26mzvlFKjxL6JRjqqNTrN7KOd3G63QK3B/sanC10nwSM6k9
         SN2g==
X-Forwarded-Encrypted: i=1; AL+hErE0c19cA/dka+Ts5IBb3x6t49wW688UpT4klJcszFfj2rJpclwmXaVBv+tGCV8J6nRN5cZnugwNJaeAdXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EYrvnGW+bXhXC7/yUdS5Xfq0AQH9fS+3wnb/vo4kG8r7XPyZa
	06wJhtieBEZpWDamSX/0WqXtwSwXJOGF5QGBvmLJxt/rHwucOK/cqXwt+dcwnlI9
X-Gm-Gg: AZFdTZeJ4Dyh/W9IdJha8GFDKqvSsqE70wr6ShxxQ9voOTOG0o8U7UdqOANa3rmrqbn
	aL/owtC0BhAJ+yBH1IfJBRVdFJ6ASIOPrjmi/ct8cChn5wa+J4YprK9295SQIAasJQX29OU/MSs
	u6iCJiAAD4LrbF5bxuVWB9XkYteiTEOyhEoao1kESS8CDSDTG4gD4mIJQgGawbfIQ95eHdBK0P2
	Dac0QTzBdn+YefpZKN0v+HEpuev6rH/aCC6/EuAkq7LUyVaeTQU6QsSCQP+aqOpxz3O0dCbS3fn
	ayxZOYj8q0YGcxXL7FiHS0h7C1NdPS3APqqL3jRK5znNfvPKvM3SXpAJOwqsZD9y9B6yMQ/bIhd
	cRbxW2MdMJt0wbgrWCksqTbhyPqG/q41pSRfOkMlXY7AdQM/9seH89JEOGkMmgKnJIuJNJxRzrQ
	qto26WihpQR+Y3v6cahdSUKJCO9BMzml6SB601uZ3nxqT/i6s0OKN9hGPEwjjHQrEuCuzXAHKv9
	xZokiT4cIKAvfMd7hc9MZUraee1ZnkVu+Rgy4ZRVaIrHQhKJpu2YntzF4vjZeEznHTQW8HpDRBC
	I4DyFKXZr8Xy4PQ2ZR7hcUPQJD8MPaJQwlMrXPQO0gmTiMAzvG2+vQOPwAtM1lIxMe4=
X-Received: by 2002:a17:90b:442c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3b41cb235cbmr6305923a91.59.1795289530104;
        Sat, 21 Nov 2026 11:32:10 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm28591205ad.59.2026.11.21.11.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:32:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/1] netdevsim: bound the peer TX queue index in nsim_start_peer_tx_queue()
Date: Sun, 22 Nov 2026 04:32:02 +0900
Message-ID: <179528810243.2011658.9050974542546209152@gmail.com>
In-Reply-To: <179528809256.2009509.5007624677973207521@gmail.com>
References: <179528809256.2009509.5007624677973207521@gmail.com>
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

nsim_start_peer_tx_queue() wakes the peer's TX queue with the index of
the RX queue being polled, and only compares this device's TX queue
count with the peer's RX queue count. When the device is relinked to a
peer with fewer TX queues while its RX queues still hold traffic from
the old peer, the index is past the peer's TX queue array:

  BUG: KASAN: slab-out-of-bounds in nsim_poll (include/linux/netdevice.h:3834 drivers/net/netdevsim/netdev.c:60)
  Read of size 8
  Call Trace:
   <IRQ>
   nsim_poll (drivers/net/netdevsim/netdev.c:409)
   __napi_poll.constprop.0 (net/core/dev.c:7997)
   net_rx_action (net/core/dev.c:8217)

Skip the wake-up when the index is not a TX queue of the peer.

Fixes: ff2ac4df58ad ("netdevsim: implement peer queue flow control")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 drivers/net/netdevsim/netdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index eebc02ccc4a9..6e287ae692a8 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -53,7 +53,8 @@ static void nsim_start_peer_tx_queue(struct net_device *dev, struct nsim_rq *rq)
 
 	/* TX device */
 	peer_dev = peer_ns->netdev;
-	if (dev->real_num_tx_queues != peer_dev->num_rx_queues)
+	if (dev->real_num_tx_queues != peer_dev->num_rx_queues ||
+	    idx >= peer_dev->real_num_tx_queues)
 		goto out;
 
 	txq = netdev_get_tx_queue(peer_dev, idx);
-- 
2.43.0

