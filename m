Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222102;
	b=dTeW+GxCsuAKaqkfdKPHZ+V878eMbDO4LZc1Gcn9vx6UT952BONGwX0ZyVgp8yo/ujlm
	 W5Q1WDE67zwdIMDj8jSeC4rHZifTHeNiCJ1vyz62XiXa/21fn9Ecm+HaQgQOkY1HCdGYc
	 VEKIh+05sZeVWZObDBRGu68TSZZyN1smWkEoqGXrjwhcPOI0CALffZ5soxiydpT1C2lHy
	 QQ9q4a1lhgd70ZOwfj/Zp7gLmyO06Pxqhhn4OsfNIDp6eI7UcTOTOXXK5jnrFUJqXhEqS
	 WvkR++8hJfr4LlO5W4MDZzOCq5GZUvyJSEiEodf6gxjD4nZkAvRWONm0D5m53lABnLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ozZ0zumvzuCL9uuVWsPAeJtjXgHGjtuy7R2140ToF1A=;
	b=IDK/+dGQhIxGCQp3Pm7Cl0vqeycOAnZ/I6VUmeF0IiFi6s+1u7RFQ/TsyJ1mW1fWx3Jl
	 Wk1xVLM5KmyecsBDoiu6O3RInnzJxjoLy/AOwIyRNenuppq9MAbOZsbO7sax07W5z69Yw
	 lKWyK1nbYnUDPWwTiW4js+nTr9NeP7m/l8XL/AJWYRcLaWpDLJTahp7U9Kjuekwxu92Tl
	 G66mzByOcIalOckdou97i3aOtyv55ZgWDD4UIybk/FNJJi993nW9fdtxz1mkFaXA6BUdd
	 zP3BpXTMQlm2P+VTYgf5cUKxaMvmn4wM1JYhIxVwvgBzuiD00+sr10RPMuEtKGd6EKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HotPZOAg;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EE760A2601
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EE760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HotPZOAg
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3869b68caecso395558eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222100; x=1795826900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozZ0zumvzuCL9uuVWsPAeJtjXgHGjtuy7R2140ToF1A=;
        b=HotPZOAgPwOmEcx0nk72FGaClVUjzq46CIKkip8PTCbbKyMQ9dQI+E14RFUzVw9wUa
         f8JsBwbC6gXKsK1vPQ7WJ0aiSwEopeg+M5I9bIPlqCDqLECo4RltNV2WpOUfbNiso4r6
         v1Vuc069dKmjdo29TJz1AeWGNLxw2TwhggyWVzK5VLKa6aBbRBGU0JGWpvJJZTjRIzxi
         9xu0HwJhGhwjQ/ONkvbqonFE6QMJFW86HWBSvKhk3vNv5wRbKfOAFswgz/kK6acVvUUW
         L+tMrfk8LfQ0pk3gVRMzhOFZUvaZeEmsce6iddkjfNGUoJSA9oNdSmbcdPF0zoWjlx98
         i22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222100; x=1795826900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozZ0zumvzuCL9uuVWsPAeJtjXgHGjtuy7R2140ToF1A=;
        b=rqUfpNihoJUX8GG2pAqH5RiGJfw70nOzS/FdKJNZx55RM3V4LyoQuQEnjdPxf1Utqx
         KwhQVUHVhuJWnd3/uSqCBtJLM3bj+M+FD1YgR8Pp5M1oXJc1XRGtIVj0z6+YLH8nKa36
         /bagxBxtiW+lYknKiFzB3e0um+NiAABNrE9sLtD4QwXspnPD0uMUj8NAB2b6KVsXbVyO
         TvsbGAe4ektamNWiNNL5BZz0438VMrtz5QPl6ysi6DDO/exj2mImaWUVOB8kB52VrKlp
         dQtSebGIFP4O8Rir70Q4TA4hIORmQvshq8e6WX9oSF00IMGk/M6adG/k9FUF8r7W5zQz
         oiIA==
X-Forwarded-Encrypted: i=1; AL+hErFuvDIPIn4ZONUWb2QrEpHAvmNbDow+YGXf5HTkbxt3pluVbR4mB20Jiegq/leZpQTNZsigkXpIN5b2lsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6ozDYvc3o0LIT5oAlESERM0YwPDaAzZw829irF/PA2kElP73h
	tVYuGO4qH+HlgTbg0+dJtHESsdnP1L6QRbo3NFJIyI65kfn/cAOeOlqi
X-Gm-Gg: AYBFou34hWIJMtZ1HMEilQLWneBI4xqQqIWLjhUdT4gmzOICu3HNesndzmymhntXbIj
	k0WmzLZ64Us/DIyQWZ6TuQq8SS7PY4ichxz6UExraS3NjzqrXgpzVyuR4RdRidWtJEZz+Fd5jAD
	t6+SEAX19uMp56mwVQf84snygckwsxwJwSsnGNGuNXWxG52hpDTHviwX27QiUcI7uxcMTBO23hj
	hPl72CtVGMVafeWP5e4ALhyVuvx4SZ0oQSLkH+16T/B8yyI3fsOWLrb74ScPzjRAIjL8Cms6eMP
	Rha+zhi+YHDFTCoqTL1Qv2WKagsGSWMZ96TfODmcQEhYXDsfS8WuHcXHVI2eyxWWF8IyYKyXr1F
	WhIlN7jPvCin8d7RtX83OhcNvWgxyEEbsPe7loj5EYFSzHJbUHgBi3zFr2PnYujzHAbAl9dMa8u
	H057JDwnBixSqelFjaLBZerN6snTHkNiE9XeK5okPF8w+hB5vwVgofuoJXicIuailR+jy8joo09
	32thkxZ5/Y392rVpMejt+nxXLU97Pm74+uhCTncuXkj8mfONRct3b+ZsdFpMxhE3/nCs6ky7qRf
	q6nXkinN
X-Received: by 2002:a05:701b:42d4:20b0:1b5:43d8:b82a with SMTP id a92af1059eb24-1b55689e7b7mr4531507c88.9.1795222100099;
        Fri, 20 Nov 2026 16:48:20 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:17 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 05/10] net: au1000: serialize TX completion with packet submission
Date: Fri, 20 Nov 2026 16:48:04 -0800
Message-ID: <20261121004809.1690280-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

TX completion runs in hard IRQ context while ndo_start_xmit updates the
same descriptors and ring state without locking. An interrupt between
netif_stop_queue() and setting tx_full can miss the wakeup and leave the
queue stopped until the watchdog runs. Use the existing IRQ-safe device
lock in both paths to serialize reclamation and queue state changes.
Keep the packet copy and padding outside this lock so uncached DMA
buffer writes do not extend the IRQ-disabled critical section.

When submission reclaims a completed descriptor at tx_head, advance
tx_tail and clear TX_T_DONE before dropping the lock so the interrupt
handler cannot reclaim it twice. The TX queue lock reserves the idle
descriptor while its buffer is filled; completion stops at a descriptor
without TX_T_DONE and never accesses its payload. Reacquire the device
lock to publish the length, DMA ownership and tx_head together. Consume
the copied skb after releasing the lock with dev_consume_skb_any(),
which also handles netpoll entry with hardware interrupts disabled.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 1935b1d4b173..60631f0dce18 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -872,7 +872,9 @@ static void au1000_tx_ack(struct net_device *dev)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	struct tx_dma *ptxd;
+	unsigned long flags;
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_tail];
 
 	while (ptxd->buff_stat & TX_T_DONE) {
@@ -889,6 +891,8 @@ static void au1000_tx_ack(struct net_device *dev)
 			netif_wake_queue(dev);
 		}
 	}
+
+	spin_unlock_irqrestore(&aup->lock, flags);
 }
 
 /*
@@ -972,21 +976,27 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	u32 buff_stat;
 	struct db_dest *pDB;
 	int i;
+	unsigned long flags;
 
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
 
+	spin_lock_irqsave(&aup->lock, flags);
 	ptxd = aup->tx_dma_ring[aup->tx_head];
 	buff_stat = ptxd->buff_stat;
 	if (buff_stat & TX_DMA_ENABLE) {
 		/* We've wrapped around and the transmitter is still busy */
 		netif_stop_queue(dev);
 		aup->tx_full = 1;
+		spin_unlock_irqrestore(&aup->lock, flags);
 		return NETDEV_TX_BUSY;
 	} else if (buff_stat & TX_T_DONE) {
 		au1000_update_tx_stats(dev, ptxd->status);
+		ptxd->buff_stat = buff_stat & ~TX_T_DONE;
 		ptxd->len = 0;
+		wmb(); /* drain writebuffer */
+		aup->tx_tail = (aup->tx_tail + 1) & (NUM_TX_DMA - 1);
 	}
 
 	if (aup->tx_full) {
@@ -995,22 +1005,26 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	pDB = aup->tx_db_inuse[aup->tx_head];
+	/* The TX queue lock reserves this idle descriptor until submission. */
+	spin_unlock_irqrestore(&aup->lock, flags);
+
 	skb_copy_from_linear_data(skb, (void *)pDB->vaddr, skb->len);
 	if (skb->len < ETH_ZLEN) {
 		for (i = skb->len; i < ETH_ZLEN; i++)
 			((char *)pDB->vaddr)[i] = 0;
+	}
 
-		ptxd->len = ETH_ZLEN;
-	} else
-		ptxd->len = skb->len;
+	spin_lock_irqsave(&aup->lock, flags);
+	ptxd->len = max_t(unsigned int, skb->len, ETH_ZLEN);
 
 	ps->tx_packets++;
 	ps->tx_bytes += ptxd->len;
 
 	ptxd->buff_stat = lower_32_bits(pDB->dma_addr) | TX_DMA_ENABLE;
 	wmb(); /* drain writebuffer */
-	dev_kfree_skb(skb);
 	aup->tx_head = (aup->tx_head + 1) & (NUM_TX_DMA - 1);
+	spin_unlock_irqrestore(&aup->lock, flags);
+	dev_consume_skb_any(skb);
 	return NETDEV_TX_OK;
 }
 
-- 
2.53.0

