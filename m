Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943961;
	b=OS76oXvgs6llhg3qmKX30uNsLPFojXyd7fcyIYEyOprkGkubbQhTT/aoNFl2t1gpJVv+
	 cnKDKoyAF3+AahiC5lU8OxbtdEw4X821Yz3wYEQ6WRY/8qEsnULEjUtflfk8O8sJ0SWVm
	 b3Tid5zpgNRF2YqJO0yzKlwcuKlgiUxBZfMe7uoNOkFxMPTRpE2iEvwey/h7RzkQ2mqiF
	 kV/X1D9lw2XSV1G1HiRveOd/ZVQGfxtd4aiSPGaxa8ue/82CGlf9gRa7HG2kGXMS8Z0EK
	 q8BjYAKKjmBYKhBfVkxFXVAf3FtNpebbLLkM/osjAYOHNnxX7vkiygz+zU0WJQ9Wj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=56TQbsxmUPRqyb4FwMMv1HmmxLULm7kUzSEoRK8zoLQ=;
	b=mE5rQiO4T+jvQXsLXkzm7CN4zp5hNzLxfx6VIcv/AMtRU8Nbr9yG/DsW1zi2yHaCnb4k
	 CoCxzW01Kw1aLlW76wdqduGYELN85ckRfJ0dxO6XCJtUHBzDP1ctQqSGTdlntTy+c3iqF
	 U2p8LLX0Qg8F8/nlM+tcBsuFRmymUJPPbFf1qukRDP2ldvqc/seXpf8ykLu2n4XEIzkjW
	 kfMGuvgJcY0BSm0MRRicpXTXtLji7VA8RGlWfLdUbXSo9tHx3lnL04P7zAIomnXXY5204
	 xq5FhPLLa+lKBS74+PuqHIAXNKvrJF+Ry7Lxwj2//0D4kiSSjQHPQKo8tkl2PqQ3nJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhrdHD8K;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422F60A3837
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A422F60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhrdHD8K
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3704d30b84fso415701eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943960; x=1795548760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56TQbsxmUPRqyb4FwMMv1HmmxLULm7kUzSEoRK8zoLQ=;
        b=dhrdHD8KgfGYXwGTjMMA3hDKvYf7bB6mbtx4simgXUENyABEWjcX2ZjButVRclPrKA
         B7/vPj2A1bYzE2YahTWURWywtoLnrw7xnz9bCa23639VCmgQtCnYh7wMeWcD2k/VlPii
         Ai0Iabbw0iJuZ5Ngdh4EgEqFl/WYvdewQ6EFq5+KIdugKq2PKOVqBuH3QtXlQQpNXcvb
         1dEkY07UyzISyA8OCSj2wKqrMFqVPdUs6oeCPgBhD38U26KLdLKnlvolvB+YhfwxEvwc
         YeRGx0IsPbbDwDGZquItEM5EgnWY3sdtInCJFMuBSpaI7d6pi50PLpS2TZOSKMTRLO7N
         x5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943960; x=1795548760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56TQbsxmUPRqyb4FwMMv1HmmxLULm7kUzSEoRK8zoLQ=;
        b=gshAzWE/79zTHdfUQmALsw8+oBEw4jRqvpVNxXaLhCjVR2SPm/21EXxfZg5C7ka9cN
         umk+O45rFBaWq7uG6i+7ia2TJd7d1Rqy4Urmt/HpFavQnC45BsPMl8+oFu9VvaPrGV2q
         VEPBpwUB7yIFpYJ/GrT8nq1G25514w9Zi6FZ4UFk69Vtfp0+VVS9bfM+EpNvX3agMmhZ
         1PHaYmxkVYpObPHSEwyw8hb+p7qZvrElCoKKXuz0JJcPkYGixadbubWqPK0mSJlrr8x9
         zF2uqXQNAKUKeJgm/yL8i+fgkd1He8erSBvZdQBs/P+5NZ1aK1F9rN0w+FsrE1OjjEYh
         m9mA==
X-Forwarded-Encrypted: i=1; AL+hErEmBk+G80LOIpcDnGVM4SnK2wyfNiIWV3K/QH2eT1UUv3fcflUgVexNI7HuNgJTA5RuHbYgniaPvE5c7kY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p1O2NeoeqCfS76sKlgUvMdn6pABStb28HK1RGW5W7zvXQfJhF
	7KA0KhYpn4M/esraxiSUG1icY2P/rN7cGbqLzaVGVIdo8F9JYFmc+TYY
X-Gm-Gg: AZFdTZcamJ3LdN8VY+LLfNQ3DA/aRFpzLdDN4xkj7dWQDNkz9WefuPB0FpIEO99WPQ0
	BdTuotSvQRdrA3ryl9RMrOWOT2uGpkWG5EiyDG2L1S3o+vBLxlErh1txWYHVXUbnTXjdIpeqF2y
	Kwr0Hy7jzzMjR0S1Inx1/D/2HWYmP0DNg9rjr96ybjv782OsP9P4xBJW2e8l4tyuEdG6iofCRIb
	kzse5wIUwwW1WH/LQzU0YQGdnmfnntzsTaLsjiUL0rDq++2xJ+ALhzQqhMReCEMVHEpih3+XKkE
	fzuvsHQ47+7DWsqDyOPKK7m4ngczF57UMXA54WzbSsI2po0fbN/Ux+phHFuMIwrdFLJQoiohgmp
	nnY7+alU5xJKqnuyk8w0QOzeSGaULYw7FfKku7h8gfGHXiD6Ah7z5aN6eev/jFQEehGKPR7NYXL
	C9RvHtqsp217BrI94jR+TtJu/XjcqDXcGEnsSc89QsbQHKnDGv42GLS+RHX7G0QSMrKCFot/JQr
	+IoChrBMeSUPW68drrkpfC6IXGPhZzCfvyRijoKKh5ZywbzNrzUcofkU3gBxyCu5aoMU3prl3LW
	Vd+XeuAuXrKeg5M4G/TsMUMxKK6WDw==
X-Received: by 2002:a05:7300:f408:b0:369:f035:661 with SMTP id 5a478bee46e88-38280a3c1f8mr421180eec.15.1794943959764;
        Tue, 17 Nov 2026 11:32:39 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:38 -0800 (PST)
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
Subject: [PATCH net v3 07/10] net: au1000: restore RX buffer addresses when restarting the MAC
Date: Tue, 17 Nov 2026 11:32:20 -0800
Message-ID: <20261117193223.2795612-8-f.fainelli@gmail.com>
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
index 0e9226ea05e1..cb2f3333ba9f 100644
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

