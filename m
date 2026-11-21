Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222096;
	b=czSQ6tr1lCAoC5T3C01gzrX/IRtcarf7LrkYrI5kh6NfTHN/Ewi8zVfegJSJfG24A4Qf
	 XrKaL5KtvZUXvwdSeJ9P1yw6OKhTa0DIHPlPgdAbz44t8N6fN4CEMoQeiRo2Bz1KVJG3W
	 oEhElMxz1r9SySNggM1m4lAgVLln3/mqOqUwaA04KtWVc/smhDjmQam2uy7MyRYTFDtYV
	 wMT3HsP67Tc4kQx+0q/BFE6E86SsBziVeKH8N5pQwAh5kGBkSXLeMYMKBTXaNYCo/shEW
	 N3eu0PRXdaukhPJn+RXFaZeebBPr0Hk34Uy+O8jLFwCGcnELKSIh357VJjyNM4r0IGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
	b=mFtJb3MXw6cAnHTNfjLrRTtKC4TacA/+cJZFk7rEdwKM71Q/u/gtBSXRZhOc1HDuhCS+
	 LpOQ6SBZ1qu3t9kUYjH6HPD3NTrXIjFZ+4fj1JZcpIOpFY0YzpcjU7y14sPRihtvIEV6c
	 vCiCB3DwKDPy8v0c/I3uDdbJfLhg2+723sjo8oflct3AjLVhYMC01aPpKC7ubj5abqzj0
	 zoNO9DimAvKeEmuOjrwKlhCfAZXUynOslvjSruZNQb8eXVAtwTQoarpSrUXzUEebKy2dW
	 1KR+Aa4VrNkCwhVXVrU1+77FIG/MwPeezFcJyv/gQRbgyrA8aT7Grvoohy8DH6Pj7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nA5j9l9T;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01257606A6B6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01257606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nA5j9l9T
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3866a784546so1319771eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222093; x=1795826893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=nA5j9l9TnGc2ofeval0osHGmUatRVHuC8h0ZfCjdiPWL3Y9CHH92zy44+m11tG2rNZ
         K477NSGfyzi771sxhkbfg+0x2TNan+31CnZfDU63lgXOBN9U7T3JKS4fjsdkCdFq1+0Z
         Ocq0MU3C4/yBBFmPNJuTkD7vnTJsZdQc9f6ffCmuDF+jNNMtcBOI91weecfXpidcm2NR
         JS2HS2JIUVTyE336cVaJurB7FjkctiFWvKxpul+Uj+vR7WaYu1S1oFWLHZW5tr6P1k+G
         EegYp0ijOlXJdL5D8pNKBFZui/ohUjCA+ttJuBw3KPzmKSvmsmUPNVsy25gGbo9LyZqE
         qnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222093; x=1795826893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=iBtTDyFIuQkhjttnTfZAt5LlFTkUj6IYg64oeUgLYqoWQrvngPY8497QeR07eCTmuT
         CzHTC37hZ/WLvvllHQHC5w1iPCyf5MzrLi5yh9z+tQ4YZ9/G/E7Qb1810jGrd2GD2CTT
         SPh9wZyQcZ3Htt8ighsZYj+fGuw0oInRsBGa2ad887hCWmoZhWV6dg8HajTOZI4zb1eI
         MNwXAnFV8amPJWhUtX8GoPWyw9kH1APfnpEiFI/bmQWrmM3M3V9Dg9xItktPnbbhg2op
         s5FK9rhZIRzQSv665MWZ8KDemQCi3xM9/acdMmOIMQgyia4OPfn79ZPsI4FTpbrX5TYd
         dEsA==
X-Forwarded-Encrypted: i=1; AL+hErFpKT3aPfUd0cM5euiIeamkvUrWL/otH9D5ZuYLsNjcPQiuFowsm9XPZCwdAFUcLbpzjaMEaJlShue4/4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BSbn6Cg2vtS1oaoYM1y15ORTFU+jJctCcMX1onKeffl6OIkDR
	9f+FRNTjB0vJxFoiCxlMgeUGkmNVYU66AU2JUm2tsxkUKP5CR4qWXRvz
X-Gm-Gg: AYBFou1XNrXtGY6hqfO8nSCdGsNL4ILej9Uw/Z8gDCVoqpmFAOMnkGPR9U/8TJWhRDu
	0lVmhKw/67voeqClluJ0SV4cFkU8tihWRS5RSwe4R4qzpfSwUXY+xohO/eUzK3np2x1vi//6PHF
	65JuksXOITNND8cOdTCDEwq6AqDizNwd3zkIw+CZfWnQuNoFUAEmEBnF9LpTYFxrlgCHv4vU5Cv
	01U0g6A+osq4yjMRxn4nu6vicXmkhIL/ScUIok/GuLruLbv8mGNeNj6YWecrGIO/0iOixlVnTr+
	7JgU2pJ4bfBwLHMeQVCeGm2XnRRpR2vUhpnAm2bhnw4JnUcz8cH7CMiRFumHq0Nj+0famcJ7c73
	yymTMVjbpI0pArSatyhVPTTp0YphK9hzb1Nw7928OwoSH04cuags6FtAMPj8kPLE7AlYckg6zM4
	ZQMFOP8AYq0BLqALXKT8R1ob+1RSQLNRK5FNRH0t13wxhi7JMF/X2QUo7edSkOOyX+bWoUwtaQJ
	SJ0hRIM3yTI/fEe5HCbkhH+ZhgzwlXtKqCQDuYch/bo7EkEX6+GzeT+WyOnE8Llb/6bX5rE/q52
	/NbaGmvB
X-Received: by 2002:a05:701b:2804:b0:1b5:434d:b61b with SMTP id a92af1059eb24-1b5568cd633mr3993249c88.22.1795222093072;
        Fri, 20 Nov 2026 16:48:13 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:12 -0800 (PST)
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
Subject: [PATCH net v4 01/10] net: au1000: recycle RX descriptors on allocation failure
Date: Fri, 20 Nov 2026 16:48:00 -0800
Message-ID: <20261121004809.1690280-2-f.fainelli@gmail.com>
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

An skb allocation failure retries the same completed descriptor forever
in hard IRQ context. Return the buffer to DMA and advance the ring even
when the packet must be dropped.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 8682323d693f..cd25248f4e3a 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -788,7 +788,7 @@ static int au1000_rx(struct net_device *dev)
 			skb = netdev_alloc_skb(dev, frmlen + 2);
 			if (!skb) {
 				dev->stats.rx_dropped++;
-				continue;
+				goto next;
 			}
 			skb_reserve(skb, 2);	/* 16 byte IP header align */
 			skb_copy_to_linear_data(skb,
@@ -820,6 +820,7 @@ static int au1000_rx(struct net_device *dev)
 				pr_cont("\n");
 			}
 		}
+next:
 		prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
 		aup->rx_head = (aup->rx_head + 1) & (NUM_RX_DMA - 1);
 		wmb(); /* drain writebuffer */
-- 
2.53.0

