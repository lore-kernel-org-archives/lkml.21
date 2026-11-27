Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.124.121.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785359;
	b=MYs1Rp6v5b5Y6sqkfBpgDd97gZnRINqF0EDWeiOmQSJZlg/yAHWu9fVQ8A/S2Vsu64lX
	 j/hxvG8b/balLy0w06+GKDUux2MWuDpB04wlw/eHOLxL682fH9ttOiKWBWhzc0y2GFgu+
	 CTFUUsOVxvyPd+K6gN7ukxDCINKAzHO4pb86wUQoGBmf/BpnpQcJZyH7/aeiZL7uF48jw
	 FwVOBIA0sOtBQAsm1ver2DQjf6lFR+pA+r5/oBbApUSbw0LrRkmWyyLy5rLkqmu4a0uo+
	 mopVL+piKGPSGiNYHLFijiadmlDL8mT5mXmFU+Bk4guB3gzgKPnIzK5VNDrvLlttesg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785359;
	h=DMARC-Filter:DKIM-Signature:X-MSG-ID:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2p/85pTAVfVb2YXrCu7wauDH5LERVNboPI4zfXAQ/54=;
	b=3tCZG47XBRtp+1TuZ+inKSL5U79t5iI4k2/n3iTkyHy7dBKRx+nGZOahL0SIb0xLhqgJ
	 oRwdqCBYz5noS3RAs8GvTOUGh6ahU2akMxeJHNFxQBpb0rQkGNjdiwUijrgAgfc7C16HD
	 Nn2zbaVU0vBQnlQjr1Q3sutVRrAIjFIp3/J6mV0WRD7WnX028Ra6DR12aIO4OE+1vzLAJ
	 86VxSwr+O/DSqh5dBhFrhtAHsicnpwvWoBPbsUr7gPhp2uQF5zpoJjCc313atzVa3chN/
	 IjnVzTXpLk20wi0iW7hpCZfK5o4c/+5endxMWZXax0QQ+RERghvSgzvt2LXrx4zF/bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zanders.be;
	spf=pass smtp.mailfrom=zanders.be;
	dkim=pass header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b="vZ/1rh9B";
	arc=none smtp.remote-ip=94.124.121.26
Received: from smtp15.bhosted.nl (smtp15.bhosted.nl [94.124.121.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB149606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB149606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zanders.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zanders.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=vZ/1rh9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=cc:to:in-reply-to:references:message-id:content-transfer-encoding:
	 content-type:mime-version:subject:date:from:from;
	bh=2p/85pTAVfVb2YXrCu7wauDH5LERVNboPI4zfXAQ/54=;
	b=vZ/1rh9BbRPjQwVuoHnV/ipaSGj5lHseaSXzeyTCEwxsyiKDDrkGBQDL93UYT1SallK6wtDa/E/Vi
	 TOf2l7BcHcpSH1IEdsyWDCCBXuPTZWJ9UNG9V60jgZndRqrtkuAq2zqjhY02HdoFSY+RQu0ZYUW3wz
	 7brar0EBgkJdrSL1Yt/66hcu1lWiPY4CCORtrUwMorxTkZo1ba54xr6Ep6j1W70GUaIUdxNnuwxrAh
	 7BcRH0tUCaYENwR98YaOKs0vMnKRFedCuH+nySouJAe2PkBRwu50FXVs8noMOJS+uN411Rcu0u3P0k
	 C212SNFKBYTRSqgQPF/XbKR4i65c0IQ==
X-MSG-ID: ab4159c5-ea64-11f1-8642-00505681446f
From: Maarten Zanders <maarten@zanders.be>
Date: Fri, 27 Nov 2026 14:15:32 +0100
Subject: [PATCH v2 2/2] clk: vc5: Enable PFD frequency doubler for
 5P49V6975
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-vc5-6975-dbl-v2-2-5a05581902c1@zanders.be>
References: <20261127-vc5-6975-dbl-v2-0-5a05581902c1@zanders.be>
In-Reply-To: <20261127-vc5-6975-dbl-v2-0-5a05581902c1@zanders.be>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>, Adam Ford <aford173@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Maarten Zanders <maarten@zanders.be>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795785348; l=1145;
 i=maarten@zanders.be; s=20261117; h=from:subject:message-id;
 bh=YXWlwVwFWp0TKLZBsZwZ5RZdFvhgSDDNAz86SQUyH3k=;
 b=uNSACx7CZl4D2FIYD5hz+s06bVCQoBL3o9oY273m1ZcbA+uH/n5SXWiP9y9R9wHlnwgjCRyM/
 vJ0OxEKrhyKA8kqOyGwjrFFMcV/3uf+gnD9/5lKMzKLF2g/UfHCm5BD
X-Developer-Key: i=maarten@zanders.be; a=ed25519;
 pk=9vkWF6gtn9DS+97n+W487XUEhrI3+9cvA7Fdon8T1uI=

The 5P49V6975 supports the reference frequency doubler, but
VC5_HAS_PFD_FREQ_DBL is not set for this device. As a result, the
doubler setting is ignored and all PLL and output rates are reported at
half their actual value when it is enabled.

Set VC5_HAS_PFD_FREQ_DBL for the 5P49V6975.

Fixes: d8473831066b ("clk: vc5: Add support for IDT/Renesas VersaClock 5P49V6975")
Cc: stable@vger.kernel.org
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Maarten Zanders <maarten@zanders.be>
---
 drivers/clk/clk-versaclock5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index ffa9e1c74fcd..7a7691841b7b 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1307,7 +1307,7 @@ static const struct vc5_chip_info idt_5p49v6975_info = {
 	.model = IDT_VC6_5P49V6975,
 	.clk_fod_cnt = 4,
 	.clk_out_cnt = 5,
-	.flags = VC5_HAS_BYPASS_SYNC_BIT | VC5_HAS_INTERNAL_XTAL,
+	.flags = VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT | VC5_HAS_INTERNAL_XTAL,
 	.vco_max = 3000000000UL,
 };
 

-- 
2.55.0

