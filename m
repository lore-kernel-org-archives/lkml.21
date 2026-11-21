Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283645;
	b=EuqLUH6F9yl50qRoAQ5D5gQiDTmoL5+YSY0QFFdDdsPyCTHXLJIDNwTcCNGYsr1ofuq3
	 fyv9S3gNqPCEpOYwYuRZTw9CVR/zflno/pyVS3O96easGw30AwV1i+sbu2av0LkCzbEUr
	 Y7q6PuNjCuECt2rgWR/cdgXPoGhdLVrgYTrfOLENecpIk2qxcFkr7IPoUfQq7KIKfHk4d
	 wbAiyEH+618JlSpD/FJuMJfaDFaOkG/dvOSm7/n8YhdHFKbKvXuleEnRKlfWuSlSE9aDa
	 +Sm1hF0K0vKvnTET3A+pKfguSdu5Ccd3mpKBnjvbrWaDKD3eWSmzD9XsZP1txbs2rnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
	b=ttwED6GPv5EQ6RqwKCUANU9ib0haFvhvgDnvQ4oe2WOlfCR7JEtzw6sseGM8+VCz4Xiv
	 YOK1h7UmDdSRVlOxsfoMxkB6bv9uaZqdvUAwTqbz4N72ZTmLhRq03PPEJxVW9lQlROo+H
	 KNhEJ556iDecc81q47hUNPEcpiT0lqv1lVq6TEmdgds1wm0gt5Xi9aTGmii3StmDtWuAb
	 p+MFForSbFnSzJy2PDD1NU7U2zN841sVGVvpULPJq8PVnr35sv5E1JjDuBqZYuXyERgjx
	 xgzUQRW2UX87144XsPcpDNfSqzmwbrBT314T63xP8apbhTN7+SBL3yxACelf6GLPwKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T0tyFv3o;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72393606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72393606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T0tyFv3o
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso299048466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283643; x=1795888443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
        b=T0tyFv3oA9/NMSI+VLBro5Y0SVpcIpKeQXaWihIv6bzBqnfY1RIzo55W1U63TI7war
         YQdGpxqWkNEtt1v1uu1rDqIgK0WPTnyg9LTHE17aa0MfeUEN6b6b4c2rW3AhVxX+z/Ph
         JCUE5+e148e1E5u5iJJNvcWxPrrhF06lcnuI90Qam2xOTuIPAWgzvt6oVrLLtl8HlLxR
         iFHeY2MMYJ9OHl6AXplEuQsK58l1vuKd2YgdXglUrEUazo7we1lhFaK7TCIdxy4mXUYL
         Q0VPYTr3fewBcR5TQgUSPVu43Y80xBQxbum/8pXV2+ycuy8WCD8h9+fkxxfplR2OPa/j
         RJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283643; x=1795888443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
        b=vQ/I3/Pi3Se14bvx3b/1Ifpa6ZtfaGeDh9EgOtDUWzK3PSE3atgUjfiO7VRn3p96ow
         qZp8bQj/UX5Cnq9L1g1QUVMeDNz+kZoaR5UfayDQjL70cG2lL3lVXPhynUw0UpRNp7W3
         spXNLVz/8i/eCevx30RqgfqHrJN9dN4enrSQ6iAFNyMFW2RFV4KPB1pvqL6qe306Gj7Z
         /eWWPZlOehVRZdP+XuYOBd7myrpPRKD+k6UISx6wwrlFHoClRd9s1HjL0JMmst6N2ndw
         GCvK6PEcUMcc7JlxdAWY0l2+ABw+pt6DBF8dt1k65M4gCguW9RBcXYUH7qo2fei7+uET
         uo/Q==
X-Forwarded-Encrypted: i=1; AL+hErHr/ZK95nKgW0GGxScn91cW0SyHOSSQglgTvQJnj1PdgD4V2s/8DOsPl3s5qkdtJT0+p7dmFgwVqlZhAaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IgR0XYEW5jKJCYP2Y0Vuait1I7zMRKuZqXxilBVWO22ihjEsC
	Udie0WB+yg7sszm9nL3OeqOn/rQmhyxO1wOkh3PVUlRLnP1YTF72yk8ROJzrfyLElA==
X-Gm-Gg: AZFdTZf1iEP2M1D/wR1ka/4Bpkd2XniB5Fwq49pHrzgr5DW8aeckRaMpFxU4S7bz/Xq
	yHZPw6rGyKAO6mRTB4nnvIMDExobyW0cVnMby+NgGXV415G2/5EwQZ42GjpvDIUZUlMSvQTmrXK
	v4D++Lv5usIvm42QRToiQzNj5Lgp230plhyn8kmdnfWMdWWINRMwhY38LfnCi/tXOQK5t0VX7gL
	ep1pF28I0xTWb2waOt5mgXHF533Y0iD+ysS5ki9TsTHfECQ4sAbwYeTGEcxvl6d3HevpM8+8NXb
	YxSbsVCPRikwvKpz0I7J03mEBJxroczc3wamlmnhovOHaudb4DrjsfUn3fMMVMJTo3AlwwWVV7L
	Klx1z4Go4cuPrlNxypEZbgetIW9zhug8dO2Hizz+EC76sY5sVtVDbrAXsn1qzzXHnos2AA0bRSN
	nTuB7tmua6bqwjwQNNii3MkFO9qDQtVAzrCitRHFQRa1YZLBlgXdT385rqmgW1vhrwGvYRRN0SA
	0xrQfBQ7IIjhzTxQsiC7wxUfMpRjifuRTwn0+zyMeFhuzTYFpkM1KpIUyDfUDicBF9WVaTSs7Dp
	ikSIVnuUmWxjd5Kl7FkUzINyHr6sjB1nMoMwz5XC6K4eCeXtLxS+4MrImvJAyKx+ElRwrgbTVDv
	Pz4+AZjHDuJHNfNNKB0LoDbg+yp/9FcRDt684mnyq5jb+b0ytVN7TM3fb/+TOXE+x7uzN8gGNW1
	fpJBd3jorXxnwqeEsBevKBX1O8KSMTqiSI46B/NX12Sx3Bi/RUvsPhU+mmwnWfsKm3iVUOso7MZ
	8chko1MI0MpAEOaNvjfwE1FNOQ/GuSQFPkwU75VdjyC4N0YFOupOFCOcYITf74iBVomG9IFil06
	niM2Xeldeh0z+9tt91qIby4cm7zo4+UHHvGUY+HZFGjeUti2s8JKLQw=
X-Received: by 2002:a17:907:bb48:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c513a9af930mr531868566b.30.1795283643039;
        Sat, 21 Nov 2026 09:54:03 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm220167466b.45.2026.11.21.09.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt mode when probe fails
Date: Sat, 21 Nov 2026 18:54:01 +0100
Message-ID: <20261121175402.644803-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121175402.644803-1-julius@bairaktaris.de>
References: <20261121175402.644803-1-julius@bairaktaris.de>
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

Since commit 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB
device probe") the err_deinit_irq label of ath10k_pci_probe() only calls
ath10k_pci_release_resource(), so a probe that fails after
ath10k_pci_init_irq() leaves MSI enabled on the device, or the legacy
interrupt enabled in the target. With MSI, the device's MSI data is
released at the end of the failed probe while its vectors are still
allocated, which warns in msi_device_data_release(), and the next probe
of the device hits the WARN_ON_ONCE(dev->msi_enabled) in
__pci_enable_msi_range() and falls back to legacy interrupts.

Call ath10k_pci_deinit_irq() again before releasing the resources, as
ath10k_pci_remove() does.

Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device probe")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2:
- New: the probe error path left MSI enabled (found while testing 2/2).

 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..4843a41ea801 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3716,6 +3716,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ath10k_pci_free_irq(ar);
 
 err_deinit_irq:
+	ath10k_pci_deinit_irq(ar);
 	ath10k_pci_release_resource(ar);
 
 err_sleep:
-- 
2.53.0

