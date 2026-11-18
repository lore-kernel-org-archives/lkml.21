Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027216;
	b=kLrZffgVOCaaA4r/UoSw5vHAUjVJtyBsKSWGJGWaq3meSIlqZCVL8bZ2QIBMFujESyy0
	 4Dsk1E2187QJ3lc2skC/Td5CBOb0DBIiQWNMVC/N1EQ8AGRS6+oINcF1NO+kQdP+9LurY
	 IvG+dFseSIb7L49aO8xdHWAolgavFGPk974YJCVAm0lCYpounqZnMwxUV/nKuvSeWqNBY
	 EZleuG4PfYqItLyY8YviyZyEAkkvUB6SBFn31N7Bz133PEu2aBqO4j4oCIj0g9vHL/kY5
	 Jh8ogeHZ5dqB+y0AebXcSLveIlGqiTyL3/yP7AdSlJ2nz3Zn01kFbKVwscuwUWGoQaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027216;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=cxcci//GRMEdhKx1M6RiDiJ8JPsYH7BK12DQ2EXCG+s=;
	b=s4biDDvHvi/yVrcaO3BZm23vK0chOC+BADdYMpXwsoC5ay430JHBBu2vPETtfnt6tpSV
	 O+CJYVRA7xoEIZ1TeU8NLzWQDP//6j3yAHaI7tmUCI/X9AxPXkwc1bEP41hRw+vpygrfv
	 JodCPAjlsirhrBcq8r+okTEc93RI1tebSUZPStAob0PUuTVkc+M9kXlsfysDujNIfEAvJ
	 HQJdiz4eYoRk9QUnFAoiueEIzyrsiZRjvGBacUq9g96P4wDC/7Cp2hiIWmHY026wBZJGj
	 kMP1vPQQ3JV+tKp/PMh422EQWlBG48TJeiVAok2Nxw3vat+1zqsfCpIUD/Hf0zlQJHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xf0YQygw;
	arc=none smtp.remote-ip=209.85.128.228
Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69D606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F69D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xf0YQygw
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-8b4eab91bcaso10131407b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027215; x=1795632015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxcci//GRMEdhKx1M6RiDiJ8JPsYH7BK12DQ2EXCG+s=;
        b=EKk9wtdkWYZf1hpPAL6ZSBH64ZT7gvxzpo1tzxyIzgTYHGRJyNEaCl1cUdVm1YBtZL
         cs/PfCDtT+bmDmfs6DewqGh6aISGjIoQ9DrBaydN6gkuABdYKNG61JM0gVXTfDWTswHb
         IiJXOD3pA8ryLiidQ4y+3+OkE1eL1IORCSrYVEtFUiathmHjj67x7ZwKkPdTiC974ew4
         s59/VWJAr12qtkqHYWgvNQ6Q2C20RwLutBcLXn+FzgFshhgpi1pQkkFDXaks/ishjV2t
         DUk30uPJlMONvXsNM+GPv7rHQXBwSsaVmfm0oI5VDP4edDHhPkUeZwOLGm9kG57A4VfE
         fL5Q==
X-Forwarded-Encrypted: i=1; AL+hErEcB7ypYX+xtDVgHgm7EJnrVEVdIs0dVGkfXxjSvShvnNmDLr22AVJpt9fJ8HSNc+xZIHJIlfAIPxCTZEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z92wPKfI9Ub7S+HFp36M6IL3r72pcuQOFnEZFcMs1krptueR2tt
	JWdhY6skB5iy2iZYJfTp8s8vyOZTpcX6kYq3erdKcS6xaOxpN6q4EK9f8itn66iAXK7uFoDpqKU
	qolPGEMmTxuWnNHSpx/RRBMIx6P7BoJB9PoKteiBy/43yx320lejQVvtS7grDgZdJIj4wbFamE0
	/mqN2IfOHWAQv8S2YgKEIXSCd4tbP/SG0Zr2WGUctO+Q4reBzry0yAB+taKQdnfJGdoXQ64hiuN
	dx2/hZ7pz8FxbSThQyNEy74
X-Gm-Gg: AZFdTZfk/RGFypa7XoWCIHRl1/XbLLKxdnbrbVzyBZYvL4gN1kaydLcoDv9iBXFe3Y0
	qiAzhSK4JrBkaVU9WRLK1dTEY0z8Op2PfkFhy22RwUizZaNCX/6M5jXpJ9r+8VYqvRVRWC8z9VJ
	pAylcbLMybogn2S8Xa7gAs/ulxn2+zZZm3DCzho9pO8BLIW8EK7U39K9WS3iLKuOxHC9v7ODltI
	IEYV0XbZoWvYucMpxG20uxi+r0FWYjBsJyHouIL74gKLpNSL//imRSb0hAiJqM4eRGdDcelNG4p
	TgqtwL4yYnDVennx5gORq7jPzaec2i83UuJwFDPYzuG1U1EHZff9foXbwWuEe/9BASeBPycG6UW
	ENTQnFakbaBZSW4dK0XGeSMMN92gRAHX0vKHdbH89GmGdhvMSwStgfrwlzwa/HDKwT35xI6eo0o
	/aodqltLME6Tbi1i35Ztnn2aspI5QKw1pxdKRl7BXj
X-Received: by 2002:a05:690e:4848:b0:67d:b78c:71f5 with SMTP id 956f58d0204a3-67dd3f80a1bmr1034191d50.57.1795027214506;
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67dd570b6aesm27911d50.8.2026.11.18.10.40.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so1069223a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795027213; x=1795632013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxcci//GRMEdhKx1M6RiDiJ8JPsYH7BK12DQ2EXCG+s=;
        b=Xf0YQygwF/l1nypK4WSpBObGAEFMQFq1dQOy8siRYe7eTeZKJAv0rD8B62DCU3QAM5
         r4NYTDNvIhq7GbsbjlEPbr0hJKlkfzxmxHNU52+tDAu+V7VTn2VmJoxIRWKj/j7q38k1
         X2e/tgSvhrJQ6dyYt0lB6G9UQDGnGk3bBFekg=
X-Forwarded-Encrypted: i=1; AL+hErGTGgD+ULk6Mcax/TZAAz6Mv0md8ESMfANPz6XFUCcimbQbf0nu6AT4mc4WZLKS+Cp8Pwh85sYZwJIUlPs=@vger.kernel.org
X-Received: by 2002:a17:90b:1809:b0:3b3:cae0:2b68 with SMTP id 98e67ed59e1d1-3b3d07d4653mr3503188a91.48.1795027212796;
        Wed, 18 Nov 2026 10:40:12 -0800 (PST)
X-Received: by 2002:a17:90b:1809:b0:3b3:cae0:2b68 with SMTP id 98e67ed59e1d1-3b3d07d4653mr3503171a91.48.1795027212295;
        Wed, 18 Nov 2026 10:40:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56a3f93sm2428978a91.2.2026.11.18.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:40:11 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: dsa: tag_brcm: fix link-local detection with a prepended tag
Date: Wed, 18 Nov 2026 10:40:04 -0800
Message-ID: <20261118184004.1916105-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

brcm_tag_rcv_ll() checks eth_hdr(skb)->h_dest to avoid marking link-local
frames as forwarded by the switch. With a prepended tag, eth_type_trans()
sets the MAC header at the start of the tag, so the address checked is the
tag plus the first two bytes of the real destination address. Link-local
frames such as BPDUs, LLDP or EAPOL are then not recognized and get
skb->offload_fwd_mark set, which keeps the bridge from forwarding them in
software to the other ports of the switch when it is configured to do so.

Read the destination address after the tag instead when the tag is
prepended. Tags embedded after the source address are not affected.

Fixes: 762e7e174da9 ("net: dsa: tag_brcm: do not mark link local traffic as offloaded")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
This change was a result of a Sashiko review on this patch series:
https://lore.kernel.org/all/20261116222519.1416501-1-florian.fainelli@broadcom.com/

 net/dsa/tag_brcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/dsa/tag_brcm.c b/net/dsa/tag_brcm.c
index b7c49822ca88..b58669c92147 100644
--- a/net/dsa/tag_brcm.c
+++ b/net/dsa/tag_brcm.c
@@ -149,6 +149,7 @@ static struct sk_buff *brcm_tag_rcv_ll(struct sk_buff *skb,
 				       unsigned int offset)
 {
 	int source_port;
+	const u8 *dest;
 	u8 *brcm_tag;
 
 	if (unlikely(!pskb_may_pull(skb, BRCM_TAG_LEN))) {
@@ -184,7 +185,11 @@ static struct sk_buff *brcm_tag_rcv_ll(struct sk_buff *skb,
 	/* Remove Broadcom tag and update checksum */
 	skb_pull_rcsum(skb, BRCM_TAG_LEN);
 
-	if (likely(!is_link_local_ether_addr(eth_hdr(skb)->h_dest)))
+	/* With a prepended tag, the MAC header set by eth_type_trans() starts
+	 * at the tag, and the destination address follows it.
+	 */
+	dest = offset == ETH_HLEN ? brcm_tag + BRCM_TAG_LEN : eth_hdr(skb)->h_dest;
+	if (likely(!is_link_local_ether_addr(dest)))
 		dsa_default_offload_fwd_mark(skb);
 
 	return skb;
-- 
2.53.0

