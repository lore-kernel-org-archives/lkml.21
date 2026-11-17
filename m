Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943956;
	b=c8/jTk+rFXhlf0pcDFUHJZIjluL79RDC2qaW/5ukPy4WumeOo3o6HZZWxAznhcM/KJkc
	 ZULbhxgOMP22BidRrrNt/UH0iZlNv9OsLS2hbbkaHogF8keVL2FLMwgLGn1g89tURA5De
	 ru3q8gE9aNUXsqmFdUUEstL5E9b45ParqKNnBirBUctmGISoKdLR0Cy2u3OmhHeQFfdta
	 GAvFrE2VPWL68PlBKNNzzVf5MURH9bK/0xuZ/aTm5ZoKyIQjKPZj+hkuCHklwNKMgSOCQ
	 XxV5jxqwdKuy8TEs5ekcaxtxQHWn+zRUTRFIHbnxzu19ixI3HgIk1vnEpaIfFGCfytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xdvLbnh0OriBfinAwo6R8BZo+O30RlXB5vQE8tXi+Jg=;
	b=UBnO0sxfpiWpIyh5trru4HQOyImKnS1Z+r+ELLJzAxuNEmAqF7ieGpamWlC9WOedqqzI
	 7VT0WfbOBL3J/o9q73Y+HNFeN4X0bjve00s3viDOE7/b1fqGX7SqWI9A/wfugHWVxqkns
	 DK5UFIP4BPCXkpqkuHaYZCqVNqQneaoe3df7eMivMb6LI1DRySLjNAXQLMNnAnmLedgsR
	 ribkc5l6pO1+a0AlWLaihHAKAGaSEyanfJWOzwzSKRhCLz/gSEnL/vfNLzLdPp+IEy5/q
	 makTXxM8sixeuMlxLudJG83Z9e8GFvJagsIkDg02xpQV0FGhl8ZWgBkp1zyEAWkZNyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="glIv/3D5";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA3560A2620
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA3560A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glIv/3D5
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40319bdso433831eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943956; x=1795548756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdvLbnh0OriBfinAwo6R8BZo+O30RlXB5vQE8tXi+Jg=;
        b=glIv/3D5/xVwqM++NZBLjPHlif/bKnuLBbYJR/ipw4huxhXQZUWkP4Qt/vcV5fkgYu
         Q+2Eti697jYa4ZXw5YFXx/C4qCJZ6dOTQqAFsBT6cmvrJwj/fFdxzmLO7//Pzb6HVwBJ
         s65B4aQnrCYODREMVZjS288AFeaUI58YN3u46TAR50StA1+4VzQI12Yp8rRHyq1oNZIz
         gYtWxsdF/jxwsx8+9fQVbQxp1RifMZfOBACJ5z6E3+WVz/QDOI8G7RBIkvwR/xE9rZMp
         SWoWG/4JutRdv7+yMRRBWWx5uOvDM4fCTg0RQ11MUrfiEIcsuL/RPFizAw8Neuo5j0py
         4R0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943956; x=1795548756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdvLbnh0OriBfinAwo6R8BZo+O30RlXB5vQE8tXi+Jg=;
        b=sCQDgBIt+rmbimuwJc9jngu5neDQAOWnLGNmYQRGNq32OfRXxRm7Qkq5ndkRJpUwLk
         n35u+kO7wiOC2CGGKgOLdt+p9YiTSZel4uFp1YOpebdmP75Jgu9vuRNAS9S42JnV0LuN
         KG5+ITaR5xpkFGJyAMia3h7SlwtLhpDmDmGoozJo/976t5Ygc71gQE7INsgddmPJIfk9
         uER2HTHUM+plSdqeuqJ/sq8xUkbFwOXWiZuLO7ys6D8BffS1uWSraygGtxDcVxeRyX4S
         +1hQFHRA3VTL0xyRF4v7WUTpPuCOdaWpYa+6veuSgN5+lUNq494DRks0q9IJF3PqugFG
         XnNA==
X-Forwarded-Encrypted: i=1; AL+hErHMCQ8Y3jKqlWH5itYof81/EU8qWuY9xxFcqWpPbbs1tA/W2MJoT0k3FRxqQ2+bNSJxLkskkHhjgqdwqBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VVtN7PqtyUhLePXmPgEauEwX9TY2zoCUhJYkpOcbJzg+xaMOG
	0+RC03IB4eZ5HKJL6yDuMdqEUSyDT30GK0u4TPtJtaoS9+vW5QgVEV04
X-Gm-Gg: AZFdTZchSyVQALFyLrh9LVtjBxOl2yj5anj1PM4BKxsFO0zMSzNRC1LVK6H5KGpT0GK
	3cVJsTIqn1w4yE4/yj9lLL6GRCHIv9xW5+4HP7OdwNZHgdIvyQGm/2q1obgMEIENEw4BtocrxrE
	CPbSNqak8d+gCNb7nbZq78TRtVegcjLi2xkHCJU4seQBi+N00dyqRaFeJ5Jk//cByVxup5GNQcz
	xUWbnoL3ks83ff5v+mUrJsxwG/IE/JgoEvOJYhqL6VvJS7qLAsG6NX1cC6bUItkFOmN/uXUU7Us
	9YiBuFdxHv57N+02v3GiKiulRsUL28WZqN8oeSONODVhFa5mFbepts5ruoK0oaiuJnBX4g/ImDc
	6/Sh4A2nFpkbRciD/8fvMzdmYE2zhLAThyDx6wfv3rNGwpaVj/fk+0KLUqgxuIRr2QiZrw6DXBX
	OPrlD0vNUbh2TRZ4fezuchu4UsQ5IYjSdCPliEulbIBI2uVgjb1DMH54uecBAE1InF/n6ovE2Ij
	wD9xTwUzBhWZ4B4IaLFycXICTbN2URr13wCnBD3JRvNbEWnNx3KUP92SusJ5HcRm03cZsyoqlVX
	WP1WClr6
X-Received: by 2002:a05:7301:c14:b0:376:a62b:ae09 with SMTP id 5a478bee46e88-3827ff7aea7mr364158eec.16.1794943955744;
        Tue, 17 Nov 2026 11:32:35 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:34 -0800 (PST)
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
Subject: [PATCH net v3 05/10] net: au1000: serialize TX completion with packet submission
Date: Tue, 17 Nov 2026 11:32:18 -0800
Message-ID: <20261117193223.2795612-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

When submission reclaims a completed descriptor at tx_head, advance
tx_tail before reusing it so the interrupt handler does not wait on the
new packet while older completions remain pending. Consume the copied
skb after releasing the lock with dev_consume_skb_any(), which also
handles netpoll entry with hardware interrupts disabled.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 1935b1d4b173..805aabc6721b 100644
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
@@ -972,21 +976,25 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
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
 		ptxd->len = 0;
+		aup->tx_tail = (aup->tx_tail + 1) & (NUM_TX_DMA - 1);
 	}
 
 	if (aup->tx_full) {
@@ -1009,8 +1017,9 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 
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

