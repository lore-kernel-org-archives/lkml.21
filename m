Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759994;
	b=I8JHImfALtMp9zF+1XgXVGWBL3RJoswE69b5krFg7Z0QrCM7JTvrXoSADiM0te+D/2uS
	 UVgsyJHOt9RIH/3O1m5y2rzEicmTAaDP/RSnXT2HWu3eOPKVugzsZZGgH90kmUDDTB1Lr
	 puEXB/NMyMNSVTvOpaiBoVFLwLMaNewiXwTB6kpgp65hOebU7nEBq0738En9sdUXmnU1t
	 LalxUr5NpY0JLO+GmqEGYYZmyRFdlfrNj7qgM8lOekdh9bxzwUSIdYxFLetM6fLdsyyHb
	 UkbaTaEItQo0U40hYFMj897i7g3ge40M4SdphBa7y+2Z8DN4Wo3uXcCgCPg588GBS7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
	b=c6lvkHd/9NEP6uHPJuueYY/rd3NwooFQKncICYp8JmuLhTp7n0zGpVYPgAdOKwSsM6Mj
	 mp0C4qrvgzArAfrvPSY78wmlvVJeVbMsh2qai4OeTNo7Vj223dzlxdW5hw5t61yhlVkfx
	 Q7inD07/GR8q4yWkXMxBDVlZf/skjvhv3wZgfkoSUtVLTTW6dFMhOtbQix5RRnUIWFKh6
	 J8yFcscH+eMDN6+NPW3snuvNM+XhdG5013lqGZMpZmZnnBcMC0xbTCu4R/Wsyy7AS/2/1
	 iAYSCtB5PQfDXki6blkkfBgi2cL5GM7bhCbFxUBpTx17DdhVDSw3UrQI5TDRWP3BfBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjFzfz0N;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD64606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD64606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjFzfz0N
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38692f62b22so10285164eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759992; x=1796364792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=IjFzfz0N8cD6ic0niqLenp5ugzZ3Ji//a5Dj8NActPbt+WY90UfXQb3oECKQteP6kN
         BqNmjWDZZSbRxQpzD1SK00OjlrxGC+t2Sqv1ccpHXabanp/jG9dXvEYZ8p3XSldxOq2c
         iHdmdkFyj3IAxsohyPyLzoujV68ilwMAzVONqBCfTnDHOhngld/2zAvzTkG6O/AfdKDM
         BXWMj+UtCXb5R9/hAqX8tWE3tInYVWNPbvhfuzvsTU0qxWjbKYhb7Q4rUglArvTjD3Xj
         rlgUVgagZh//9qrdeWdghGsh0qtzLVCvoxtZ3VmZQCvlJ8N3RdlyXMFHrJEiwoUZPTv6
         K8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759992; x=1796364792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=JVzZQVFFi5Qm0R0DMFgLFyTw75dpx5mZRkjV7+CVsXK2g3fNE2w8mdfEqn4wj/3glE
         EUsCqHpgaFk4D7SYQJd9o1xCsUyY64/6fEUE8Xaf79N/4QboyBqhSy81SNiOzi7eGCqh
         slhC0ULQdDpPOSLLZIrMYFTyjy9lPJlVmL4R4QyXH8W8pF/39t9kHZfMdAOZ+BVpIqBn
         EwXODywxrDzlDl3dTt5CmvUoBM6o122KjMtGm0MEuaMzp9xe2E4U3Uea+szGmOQLw/Kd
         z6HAiDewmF8BvkQgoLsWtygiOhn+0xj6Wz6wm47Ymx6guj3UYCJlAnDsY5LCI+DACnlq
         +dkw==
X-Forwarded-Encrypted: i=1; AL+hErF7EFinXLs71Enz27QnAhkAzsiLBjnWn52bmr4ACkGZKNpRXbPN53z4IbhhmqQwyInafZZ/rUqMf8Qy6zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vnHMNFSSKKVFlW7bNfQc6u8crOE+RfIoouycj0p+DWteHK1Ni
	JNgsSK2X6kg3/SN0t4v1U+yq4zbwgvEvLYzOgPct+xg4laVO3AevjKeI
X-Gm-Gg: AZFdTZfmrJ0gl8/HtM5CMNTohQbWK4uOC4SrL7JvIcbRKsZIOPhkG0Pstgc+UhU1aol
	6AyimxMGODLn3x/9IGXlcfA/0JyHM1CrlzmSqCd4HbVcoQqG2cdkDEQKwZO2cvb1W8bBvaGCERG
	lfBzqEvBYQvvAcCdrVuL57nVaLBotlXUVXpxUxK2sM8Tj+876bOEnI/JN5FLK8cxs7vHzBf1nl0
	ImOxh6M4am7fJIeffaG8ni5jzNbEpoEMFRPZD1+dfXd+SoGHWtcGjiw+Oj+p3IE97nNzhFMwsm+
	Vp4/nuJRpbfv3o47ReFjECdcIR8lzPTtWoY0VZ2oXf80iOwv+OUjHZEuNmBkB/tAik+LhtS51iV
	e3MOBhxTuhvS3rCA1e/2R8wSavarVlVsaiMAU3VNIuK2fPt8s7XUXgS+9xP0wYR/0yEfHhPVonJ
	Y2DX7LZmDHVizD3+A6Km5HWINUaQsD1QFz/EO4onfxhpyrPeTQj/lzjAAkWIllcpUDaspYzNUtC
	yI4mw5Nt0E19wt1INwYut4UYWzCVhBjrSlhK7kqwSQtzsr6U38jmluDTduD0+YNBRvSnhd21P6B
	QFKWu38SLGxr8r5v85rvhWPhWm3o49Dfr3E0Lm9gvqclPOkkwt/ThDbAegHzz2Kh1DNKyw==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr33877729eec.23.1795759992402;
        Thu, 26 Nov 2026 22:13:12 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:12 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 05/11] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Fri, 27 Nov 2026 14:11:35 +0800
Message-ID: <20261127061147.506129-6-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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

The L-SIG length of a mixed-mode frame covers its HT part in 4 us
legacy symbols.  For a short guard interval, the HT PHY's TXTIME counts
the data symbols at the guard-independent bits per symbol, then rounds
their 3.6 us each up to 4 us units.

brcms_c_calc_lsig_len() instead divides the bits by the short-GI rate,
which rounds the symbols down before scaling them and uses the rounded-
up rates of the MCS table, so it can count one symbol less than the
frame takes.  Count the symbols at the long-GI rate and scale them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 46116d66f3..659b37bb43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7114,9 +7114,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 		 * the payload duration calculation matches that
 		 * of regular ofdm
 		 */
-		/* 1000Ndbps = kbps * 4 */
-		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec),
-				   rspec_issgi(ratespec)) * 4;
+		/* 1000Ndbps = kbps * 4, at the long-GI rate */
+		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec), false) * 4;
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
@@ -7129,6 +7128,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
 				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
+		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
+		if (rspec_issgi(ratespec))
+			nsyms = CEIL(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
-- 
2.53.0

