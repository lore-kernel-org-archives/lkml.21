Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222114;
	b=U8LDNxgA2NYq/dS3A53h/cwDrGwFZsILWC5YUn9yjJCFyZo1NQokXRs2MjHTY6XlAuav
	 WTS52jd45yzFz7waUvwhfFXoebT7O4KC9kkTqj6WizZJVVw/8vFpGKQILRK+bv5X+0aAx
	 o7x13jonpo0AhExMDQMGvb/vXrLPhrmzqcMSpOvlhTtiSsQxUXDDA2loscVso4t2TnKbP
	 4Z/3WSlmsnuXDm3cmOyXEKMsN/Wp9hc4WTowqqwdbFKFh0t7ueoGblo88XcQ/SYu5OzIf
	 YGFQYqYdrzkApLbir5pLvEafNjKcHw340CLApAXEECeLSbuDQ8UmA6ewjtUtuTivNXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UFWZWstMGMaVQ6jTjM817I1SbsECX0IvaSBcjmU5x2E=;
	b=akdiylzUPeOvBqFoaIeRjKWYyBlIPKBKC6RmMwOzlzqFx8RJGBf0gw7MkZSDuT8OoJry
	 MDpoOLcr2SgU8cT35re7nHcBgJrN/lFY7pZPMaiHMqMzH6YZrzdBqixzsHX13KvJ25RqF
	 ply3p971RuI+pOWhtcyvWU00MzXd/zJFfQhajSfTDy0uH0xEz7ZDWewrmYGNgZSrkROO3
	 KM4jjZXG/4PV6j+ubX571SPNvwoHChQDCDPpezYsd0PjhYxA1rAaeAeA+q9hgIHdnew99
	 SKkSLiW5RpMOchekmOOLc367/PPGH1fyOHNGydTwReSXYLJZus4Wrl59Ub+gttJWyxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egEy5DYh;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781B60A2635
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4781B60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=egEy5DYh
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so2026890c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222102; x=1795826902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFWZWstMGMaVQ6jTjM817I1SbsECX0IvaSBcjmU5x2E=;
        b=egEy5DYhVrzgrGPfmSniIUy6G8710z0MSMVx2nz0ojo8F8eU+eUdXdmF7/C0D8eBmw
         sqDVTf/T7Ayyhs0+d8Oy0vDe64lH5RoaY/nQHIZ9LXn/Xz/pl7KgovH+hcHucnHdfS3z
         i++hlEhT+KDvkcof6zYdCPWP5696C+zzmcmMYM4P8VzMDkXDvFQjyiTyp7FhnSRcun57
         o2desbsej4F4KSu9QpgMCqfitBBXbBIUH/x3w3Dc86a+jb+9NVh3c5yFL55NpOWpJOEQ
         BBsi5bof2vGdEOf5nDsSKqubcJQFaCOO68kt3gLvk5ukfC4Kmv8UkucU4wJVV0kuNcy7
         Z3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222102; x=1795826902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFWZWstMGMaVQ6jTjM817I1SbsECX0IvaSBcjmU5x2E=;
        b=VdFvwhxZycaVL8+nyrlEHa4y8GLl5uDEpfNOLmVQkhkfISgxuioUfWHeMBjaHpj1C6
         Xg4WjgNt343uKAWeVh9eqvIVKcVqBWHveDHRV39icXAy5nzxgekgTITkpMtdWRSLDkMQ
         YBxKEENPkUZ8QqsIyiooa+VQryidzZvB+yG6HMjf+NJhIikYLCtUMzBRHJJAJCJe8isu
         JAadhM7AZp2V9PNm6VUwCPbafUy8ZUYuX1Tb/u5b3hVM11t4ZEjb2Iuyp7PfgXH5CHjN
         mzx3QIJo4IU1brwdiS5ECbl95DhAINvz/HnGxXWEalO3Cp1AZbww5wGrGyKwjbFcLVmc
         M/ow==
X-Forwarded-Encrypted: i=1; AL+hErEPYSpLPIym9lSniJshN10DHSa9Gb8+6tXc84Z92IQWy+Ytn05obe/jgSbAesol3exkhssefwgvwihaRCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WWB6vyMwwHDV5QhBt2b+BvJAe8diPEj3S3W73p9XMWXsUj0hV
	DfNKFK2TlfswyFSiUpDvNlhtI6joNVYFlE4F8L4QBswXmGUGw6lWQBrH
X-Gm-Gg: AYBFou3JHIJqZGVOpWhGOH7Iy6VtIHolNEvKOWZJ3iB/cFjzVkqlR6gutmD3Iq4rcyl
	wFEJ+41NSrNdkVsgfshCPM68ObQbjDoTepE8G8WW60aaZ9qMv/xdZ0BtMoMNsRtw4g9i9npNiAK
	NaQlwWrooNVEA96AcsCYskNOg78EpJPBQcJ2e4WN8yOQEq2IOFhcoTbB0Sr+WNpmjXk1chVUIii
	xaCGhvJALxOYi1iQT1kH9RKBCH+EcyKBKlWOpixorRPzD82Nr8Ay8hRP4dTJtAM9xbWCa9zqfMA
	MtMtB52SMXf2voToCz+bu7vAy/O8Dw39+b9+hueFD2PmlE0Es7fjwVCZRp0WSxT3SWBZ1BDXdLQ
	N2uc2qanjynjiu5V3ybg0k09jGySngs3s4Ai5W6/BW2jKdTaEcdfP7oVR1FSvSDbgmFW/O/Ui6L
	HRXMpB73jjf/tHf/6TP+klk7Gdo18jlWCY5SOVuBy14f4CtSKWWmtYsdZUFycKWPwCYa8DJSQTa
	caenG18dF2ZlZSSpwmGqfCSgVXxvFIE5kdqC0cLLUOs2dSOyB3hMBDxQCZc9LRUcQ0s1euCs3Co
	CXloHv1E
X-Received: by 2002:a05:701b:4513:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1b5568cf65bmr4503989c88.32.1795222102439;
        Fri, 20 Nov 2026 16:48:22 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:21 -0800 (PST)
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
Subject: [PATCH net v4 07/10] net: au1000: restore RX buffer addresses when restarting the MAC
Date: Fri, 20 Nov 2026 16:48:06 -0800
Message-ID: <20261121004809.1690280-8-f.fainelli@gmail.com>
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

The MAC DMA engine updates each receive descriptor's address as it
transfers data. Clearing the descriptor control bits during reset does
not restore the buffer's starting address.

au1000_init() only set RX_DMA_ENABLE on the address left in the
descriptor. After closing and reopening the interface, a receive could
therefore start partway through its buffer and overwrite memory beyond
the allocation.

Reload each RX descriptor from rx_db_inuse before enabling it, as the
receive completion path already does.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index ea2766343d51..ec28ed33bf69 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -724,7 +724,8 @@ static int au1000_init(struct net_device *dev)
 
 
 	for (i = 0; i < NUM_RX_DMA; i++)
-		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
+		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
+		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);
 
 	wmb(); /* drain writebuffer */
 
-- 
2.53.0

