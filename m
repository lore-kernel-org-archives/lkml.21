Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943967;
	b=5toKL2Tfkw+p7E84YkeMRWZlbTsv8lCZ+yZ1siMfRoRDpYyu+NB8kn18hbWwPBR/6xH6
	 gLjsvgtBFQum3zt+qNjojOopVhXN2YBCAtGibjrTnnwlHNCn1bQ39l/DZPvrLIeiLqedN
	 iJDZLPEc8hMLvTKEoMBTNpE6N3SINwIDt8IIpBm1z1HQRFpRH3Hw5zpOZqua0Y+oaoj3Z
	 +5vmaGjkLqrFwEwkbVWDeHllbaASTCW4j1orgp6+ql5ImgWCA3B83dxCiaxxj7j6wPIYw
	 pTXnYjTT+wDRAHM6+6PIVDL1jcukCpiWsZRszzpOrgcdAakwO/GGnWsCBeYGTkQADhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uK3oyUZEbP98ZvZxTlR0TYUEfbA7/YrKuYvNSCORleU=;
	b=aE1p5/0v8j3xKByTCstCD307hf8tL2e7Llnc5QZl+/uj5WRvF0SWDsY1yF+tXG05lMjO
	 YCd9qd9Jlf9ITnvu8NTKsJXBl7pW6A769Qbg4SoLsExlYUqpd1nOW9TsTpNRBtQClL2m0
	 SoPoaDR8wqa0z0bdPteExjeZyuyCfWomq3zsZtOpUGr1mLMJH10OYVVUEEB5gJtmOb03r
	 tC32V7imuMPMJvdBeXLCG4WOOUsZUjLQWV7s7kQxr1FnHQ3fCC4XweX2SRGZz7vKBVCj/
	 OcT6pIXzbS5qobbNWEkSbANMEmfl3z7jVG7AqdajQJGTZKm3nA79VxtvpeV7g1411Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wze86KUH;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464F60A6F54
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9464F60A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wze86KUH
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so469525eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943966; x=1795548766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uK3oyUZEbP98ZvZxTlR0TYUEfbA7/YrKuYvNSCORleU=;
        b=Wze86KUHZm7tmc3gE+xO0FbJsq9sWxaFy3My7WGRits9YWkEpV6xLM4gR4hkGQEmEr
         a+LJXqZF8Nb8bk7GOQ1CWRS3mKKBRLcebet6kcThk/qpGknOqZ+3zsJ8EeLo49OnWzhQ
         J6iDGwx8NjRegJ9ER9zQGW/AGxDetV7ZtjljRKixi0L0FBVTcR4ShNef+kLVZXE/8GC7
         bcF7iFsmgdx5ZkhCU+m0CrQ23He/+VsQD71r5BOfEqe/e3CqUHzxnjq6TRSIDNtj0OdO
         hmPuROhHggxwWkyNodQC3P2qMrI8NFLijMvYPE4IfHg9ciB0D7I38E6Cd/P1mc5pLydq
         BtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943966; x=1795548766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uK3oyUZEbP98ZvZxTlR0TYUEfbA7/YrKuYvNSCORleU=;
        b=UPl+Aev/1NxVvI8dLUelhHz8tY4PdF4Yyyc+4phlamhg+SSvVLneZTr3kd6i7XnVyJ
         A7fIlOzDz71H/y60VpWS66vbcNCDx+wCTszIeKnWv0CH5L/Kyk8hN+07Z5W6kYWdj46w
         qt1TSEQjg5q033mBMPCB8Bm++zRBy9oWc/VMTNZHz2ZM+5rELwRKODf6xrM1UGmW2Pjy
         GREy+aldY2nJrn3aK6elGbjjemiVR312SqRuZmS0clpx0Ac//6Wq+DUJIm6KyKhqM/88
         YA7OeFeNXEyDOyg6btW+LPMSE7jBCEQEkQtazPTsQDXJ8Nma+ZG4aeu4gfM2fjKacgn4
         T0kg==
X-Forwarded-Encrypted: i=1; AL+hErFAVBTwWBGJn3lKjqHY4Iqstn4QD7D0ihcHOnn8XpSwbcyWIklVQuuH/OkkxS/dhWEsEn4ouC8TiOvVgBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pcsgoc4JFrEiK4baMuHioftTb/LXNs3diT/SCXaYOFKe5JkAi
	LgArTxAZGVATtC9/FQB9QORRs6ahlAm+Ox7wkZVB+XPJ9ZpeWcNk/7ak
X-Gm-Gg: AZFdTZcM2AHMS4jDl4WVKcSDzMhICXDgUwXUoCSFBD/qBeqfjapTLpGNvQKlo/qdZbQ
	gi+CBzoGPg8virO14pVIQAe7tHELiKgr9OdP8egdvre1xbRtL0TJq1JxHFrM9fkNfxzTFFjpDaI
	/A6RSn1NVd/JiiRtI0ZVGxJh4ati4vUFH+snYu6Nql6CPc4bdF9TPmCMywHs3w/IPTfqE2TFoL6
	gkZikw98AC7JvqqPbZ/1Oe9wciR9HcT/m8Zr9IZ3RUTOtzV58+C3CQErJRxT5d6U+O4qwTWbmoQ
	owYSfTLVH/joFLmGLWWChXhGKiF09wT4ODDu7UXmW3ZemRKlIVriQNWr9L72UYBwRqCC2kL7LKn
	KDi2AvFAXt6UVx5nXijhfcsl8TdObyAFcpjJ/Cys3DAL0LvoOCJOTwXOFrjLOU8WtqpJcSDfgfU
	TY/A4SXiMK6cb0iVpZ2R1doQ6UiPkkE08JLM6C2HepS0M601H4YmsPpTXMnRXQLGMsuv+fPKk1i
	B4VZqd+sS5mfR5guh3LxYi4nD/h5HkE2kvQzESr53pjMQQk9rfVGYOPN+StjOCp46i2MDjL8JV5
	IbpTgcjwoxzkT0FqjzjgVnJAT5NooQ==
X-Received: by 2002:a05:7300:ae1c:b0:372:eab:d700 with SMTP id 5a478bee46e88-3827d71fd36mr461912eec.1.1794943965652;
        Tue, 17 Nov 2026 11:32:45 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:44 -0800 (PST)
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
Subject: [PATCH net v3 10/10] net: au1000: reject frames larger than the TX bounce buffer
Date: Tue, 17 Nov 2026 11:32:23 -0800
Message-ID: <20261117193223.2795612-11-f.fainelli@gmail.com>
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

au1000_tx() copies skb->len bytes into a MAX_BUF_SIZE coherent buffer
without checking the length. The copy can corrupt neighboring DMA
buffers or run beyond the coherent allocation.

AF_PACKET with PACKET_VNET_HDR can deliver oversized frames through
both plain sendmsg() and PACKET_TX_RING. In packet_snd(), a nonzero
virtio GSO type bypasses the MTU checks, even when the supplied gso_size
is large enough that virtio_net_hdr_to_skb() leaves the skb non-GSO.
Genuine GSO packets can also reach the driver as oversized frames:
au1000 has no TSO, and software segmentation using a user-supplied
gso_size can produce segments larger than MAX_BUF_SIZE.

Drop oversized packets before touching the ring or copying any data,
and account them in tx_dropped. Use an IRQ-safe skb free for netpoll.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 98a75aba92e1..3b40843d0499 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1002,6 +1002,12 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	int i;
 	unsigned long flags;
 
+	if (unlikely(skb->len > MAX_BUF_SIZE)) {
+		dev->stats.tx_dropped++;
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_OK;
+	}
+
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
-- 
2.53.0

