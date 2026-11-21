Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222122;
	b=dkitMmAeNtr1AxDJhbjPePqeAP/EGzVG5ybuw6OG/nme/HyqmIybypC+MVDYN+CiUY09
	 r60r+SPAfGDOtVbXY8ZuP3ggPBy6X1RtaQrHqOJPWGhmy2H+6XLfSMzqz3nN1vrRquiVR
	 Xwzt0B0Vh1icIm6UcgQ5JvTKW86bK5INR/sVVqFM3cxdOEc4MSh6gs1m5M+b0j4+LRvVA
	 NxMJaAZFXeXqH1abdjEMAn3SbMuKfJFVTCx9mYMOVvUcKqyed5jth57Hkb+sibIemvtJw
	 2fs8xBbRsxHtM/UNrm1mJFV9HLI/DtIsKbVmgJvu9R8rU9ivFmWgbwCxorZGAbZjUpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BEtJ2WqP+tt8+GCKUKFKbF/kVpKNshkodDn0UiC+JrM=;
	b=HYJrQ4JYoYWmMGQLzAOzJ0ATfs6bv35Nz99im0ERtVpNTbZhMEB5BwsJ7y19CncfouMU
	 HvjSXvkfG5hxVLgt9J6glnl9DbzEnSofUgWo8dCQf3fWnsYeyEfm2yVYs69fwbzneeIhK
	 DTUw5qY7weew3v90+eSujmidY3tnhRXv0N01bb/yRdEA3KrfSD3dPB1gKccYyGPKDeuk2
	 /8Cv+RdfA/zYrs7FWiviPyRAKEnTy1P6KMuN0I40Y+iQLA7yNGWIctenU52IvWZwJQBeI
	 wfgoFI1xyiqpa8jgYQxkfU/nX+mqeAPABEbb3ID7Sk5X27A814fJZOg/Ow+h/cIKLsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfgFQQK1;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6760A6F47
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E6760A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfgFQQK1
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so3072373c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222115; x=1795826915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEtJ2WqP+tt8+GCKUKFKbF/kVpKNshkodDn0UiC+JrM=;
        b=AfgFQQK1ZDfym5EHT+6HaM+mNzpAoHF24RUdmmSU41Esftpdja/V1jT7HyuCZ4Tecz
         wYZQaPRjZxnC2fgPk1GktlFeMq+txDoeVssOOjm1TqERwXFxbkWNLoZHKFjgtFwMXMKL
         1mDt3GMldQyjea29BywWnsnlE9Hbambv+Fy42p24x5Ley295XWbaeshJs6lsl3p2Pd2T
         AmXuFkINNNBcUCmA5ths+wvw7Mr4jUBHaiJVjSU7Gxvt1TTsHeXdEVnPFPvULN/EzXs2
         T2Nj2xJ3N0Y8FOvFpK51bjxvy7L5m29uN81GHx4zqTlgPk2ZmWPtLog7DtqySBW1oBxx
         Ck/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222115; x=1795826915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEtJ2WqP+tt8+GCKUKFKbF/kVpKNshkodDn0UiC+JrM=;
        b=P5MG98f6EfS2R6Q3oDK/JveoSBg/Dgqane6+06DZr8TntLNRoFk6orEXflb30OzNZz
         XHyxy9afIak2eqVAuK0MrQ6PBsC9QtizF4SUMVfVotPLar5vXKGbQPZ/AbiXR7bPHXhG
         I5nRTGO2b9o4PlIiN+WXMdsWtToeQDZdjaEpuFevrQR4GQ3hhMJKuVT2eY/oWNmn9Vz6
         pvlycS4EE7+ksemOIbAyjQhUDNmMgSq+NuMRF7lmqm7DZxHoIyjkGFFInu8+c1q/WeI4
         bqeevT4tvZsOSGxaroqR+zFGfjo2SbpnKWzJH0KcRpgon0tS7dpSJbZvSlXlSzUT282z
         N3lg==
X-Forwarded-Encrypted: i=1; AL+hErHKrNm5Cs0vig9iTHATrn92kCokpqB4bYLyGgEjdrpWTmZKL0M123FI5LphZsBudFkbB9T/+iseFV7yupc=@vger.kernel.org
X-Gm-Message-State: APuU4Z99th2DCxISO/DPCAKrUyNdxM4Mu4/Cu3IYbCTl+dZs/vVgdvJH
	c0RX4A/5v5oGNHmFozO/LmAAwFFunjbIJADr+TCWXZOsQ7yT6vbFLrkw
X-Gm-Gg: AYBFou2EnSO/yrNIlvsjA7y5v0bB+Qd3/GiEt6OZF/EbN988DJANRNbKyFdUNAGpweC
	DnS6OtjYmMcGXdtryrxl9W+upZQcMo43jVNqG1YZC4ENCBeN/R9BvEoS4XOr+XFG03NvELCSK/3
	e8q0plphey3yUk4fOp/9N8eG4iMAlyvLnjBLAFhEfI6/iFMIEgQiICzjBX+ebLc2XzTIvcx3iyT
	Zw4PgUfepfU2lfcDcPh2/8/amwISq3EgZXNIdlvhQZoDEz8RzUkIkP4JzL9vYFYzlDCuWHga4eh
	pbgUjorjbXcm74d7jHuhMhVglFGBAnFt4xgcIuvSZOdcfGsiVrutNG/xbRv0KQZxCgbETIYzW1u
	WT4OA/O7jozz8ab3S6TJ5dn0sLn0C7GkvpH6iKKMuND1SmnIE/35NjwF2Fmx3zx4cJLy0FNYBvY
	qN9xg9/+D4uT4tYumrOB6AJkH5ucXUW68w6Ktt8xqqlfSf4CqM49JVylIa52r2R0Uw0jZHIHREs
	sVgjdweVAE+s1bGLhR1aZPoem5kpwV4AGWRN6cGt7CBRngvll08JdwLoRmD7QUj24XIETIIvzsM
	H2fzRgJf
X-Received: by 2002:a05:7022:b0c4:b0:1b3:b455:93db with SMTP id a92af1059eb24-1b5568eec9fmr4623791c88.24.1795222114969;
        Fri, 20 Nov 2026 16:48:34 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:34 -0800 (PST)
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
Subject: [PATCH net v4 10/10] net: au1000: reject frames larger than the TX bounce buffer
Date: Fri, 20 Nov 2026 16:48:09 -0800
Message-ID: <20261121004809.1690280-11-f.fainelli@gmail.com>
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
index aa5fa318b23e..3e4335368837 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1091,6 +1091,12 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
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

