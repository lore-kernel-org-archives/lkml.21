Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110612;
	b=LlCYZ1pUi5RzM8HMLIelYaEUf8+cHWH53uRid63XBs/7eckSsAR/9B5O36fnTQCItFHN
	 o4kmN2RGf9YL/MnAHPPTm81ZPpc+o4MTAB38RrSsRRI/aR370R5zx4zE64EYrR0JdIYOa
	 bh2N+HoOaMY2QN822lzrNuU7jMO5OUp5q3o8M7zulvbQ3M+LqEfI4TckuJmSTZYfAwBgX
	 cZjGPCl6KJz7FATM/yEgjaU88X6gxQ/VpxioGCJdMNKfjuZElvfNrlnSB5ffcOL0Fxvnf
	 7r6fLYjjS1C8UYxJo464AXoStcDVmJgOJKBjc0ySZfJ3GZVdeRHVTFdtKCZzWLtWpQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
	b=i5vk0KclLmMztBPXJ5GK53pJpzILBHrQpCJtnxKMAEfV3MayDK3iUvOCASLXnaWOyK8O
	 Z/eTeGu6fOL2qeHCmWijrZvuvEjWSd1zVBGiuSb3q1t5hx+dDKdiWjjA8dN4yEkXjrWWw
	 ozdzbZMY2/KhgxUmFMy7ZkhlNZidZYdfggJ9CwlGXUlOCrugqcAxVddCRLDI0be7fn9hE
	 E6ClSa+UjQS0p2x9xxuA8s7fXWUh2CkflvLZFhP/Entut3d6B7G3GoVecv/DnL4/PxDjN
	 NLPgnVRGXVErMYL97af5uki9aHWuEaPnfG11ic4jRJGDOTNr9Ewr8U8bQuEHqK8qYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="fvJykZ/n";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5B1606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC5B1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fvJykZ/n
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso16422135e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110610; x=1795715410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
        b=fvJykZ/neLyVItFEhBuAi0WmfnkNb8Y4jIVy1xZB3JP5mhV0QHRRKZuIo/1ChInedQ
         ozTOCjI7wfcchmNYhF669sue2/HmF0Uy6XdyhIrtktpdEYN3CyMnTTIufpcXJDebi4CY
         eOcOpBits2EoRc6ryq8QttSom5epvDHt7vHgHeTqiMIJNN1aOJRK0GQFL1Y5FTfzhkXE
         yyYVP4MJRF9EH1kSLVrO+m0Yi0PYAKmgSL7sGRfB1YTQtsDia+DoKocrsqZHpJoqUY59
         n+XiF6L3WfCtONnXjhitg2wRYLsXpW8Si8BnzO+aQ5aVv6QnbUq+c4PNY+/Od58FQ+4z
         HSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110610; x=1795715410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5m08k+pWTgZ26W4H99NIdw305iHAopUdzj3Kg8DMx8c=;
        b=FN3EJWguiLT73F+VHZeOAMVIPAHUVfz9qwFJ/cnTt9B69mNb1+sdp6GqsLpBkKeiWH
         sCUSDhr/kNbS1R9SmxWRNykwRCCkU/zCVmP491KXWvKupqIfJwuQzUUjbWRwQl9wbgoJ
         fgC9DOJi4lbeGf6HOPiWW4rW/JuPyPz4wJw4jndxrwzWlnvTJCICdrSbUFls1RIyr8f2
         17rHxWA+8dVRZvP7vRN/VLV0I5bcnbcknT5MlBoPEy5dTk8SXxE3iUOGVF7hZWAOI8Vp
         W59Tmp/7nAbDgPdTwJBw0WG3aGj1xR9FfQlFLgR1rO9z1LbmE3kXRbbVDIo2wzg6cMJ6
         5+UQ==
X-Forwarded-Encrypted: i=1; AL+hErGZDZrusfDppkwuJodOKIggobgQDtCtB9aptxcIHl92PYI/o2W2P+rsiAKmocmJXkw/gVNZvNiU8PQiO7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bBZEuo+JggsUBnTOMXr9F4hOI5JF3fNJd6K15y8cp4I73+6be
	eoFy69BYaJto627aNPuidQ0I0c66ETsDA5mHCkXxep7Rut4O8StpPB1tdIGH7XTSq/s=
X-Gm-Gg: AYBFou14aFSxIjkpZBcn1Dc9T/4MqqfypZkQs9NU/BPzf2VLT6ChA9AlcJaqKpZ+x3O
	lzgpwm45NNby4J7l7YAhj8Q7RqllZb1QzLZgm59gF0E9tSQo7hWhxIGKxPiDPP7PCVuym7E1eqm
	eFsxpMMWC0CFgxKOETO/bkiBQNyFdeIexvIGgeVQTkpSBtqZW9DCjyDSypoEO7cqpQY9rox/AlY
	xD7Ack1To/ET7VtMydmXx8WsDuJIiFTPzttXwbMGdlAvr+3apm2RHr1KaiTDgowDqWe7BnwpjrC
	k9Iho3V8LP1h/A2/loL3m1mLfZNAc9MXCpOKmtE8h5NNcfiOGjc+xw5634ZOMVm+8njrNGCT9Re
	poCd5cbIALlojIDzrcbBIJbHD/3GYdrrjCrMueTOGvTD8zd5sSZbz/uXySlfuJTGIatEO1g/JpQ
	xIUheh4hwHLF9isHCChHmQD8ZGTxsRmS94gR9XQ6H3WjoK+qmdd4WC7F1ausahmFzsyfy5jKBgM
	7emYMdPimJB7Gi5RltsGhrgF3vLrqJeDvl3utlLvVE7Fnbn+srD+0pkQF98ah97PVsSdAA35D92
	eNix2bNHrjsHUhK6NOOnW0wM9q0XRGsM8IwRwxQMsrxnQBX6q8z+P5Ek9hTCKtRvCWib9HviuCc
	k5SY0Wo9FzURZAP+A8rLPTcImjMs2gPmzYPaJS9CHhOOaAD3DfoX/cGPZntohlmlkq4wPXLnXQ9
	AT5yg=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr6329465e9.11.1795110610075;
        Thu, 19 Nov 2026 09:50:10 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm68993685e9.13.2026.11.19.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:09 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 02/10] wifi: cw1200: check SDD element lengths before reading them
Date: Thu, 19 Nov 2026 18:49:54 +0100
Message-ID: <20261119175002.458988-3-arthur@aheymans.xyz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119175002.458988-1-arthur@aheymans.xyz>
References: <20261119175002.458988-1-arthur@aheymans.xyz>
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

SDD elements have byte alignment. Read the PTA and reference clock
fields with get_unaligned_le16() and reject short elements instead of
using incomplete board configuration data.

Prepared with OpenAI Codex.

Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
Signed-off-by: Arthur Heymans <arthur@aheymans.xyz>
---
 drivers/net/wireless/st/cw1200/sta.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index 5d8eaa700779..db9f0c4a07aa 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -11,6 +11,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/etherdevice.h>
+#include <linux/unaligned.h>
 
 #include "cw1200.h"
 #include "sta.h"
@@ -1072,28 +1073,34 @@ static int cw1200_parse_sdd_file(struct cw1200_common *priv)
 	while (p + 2 <= priv->sdd->data + priv->sdd->size) {
 		if (p + p[1] + 2 > priv->sdd->data + priv->sdd->size) {
 			pr_warn("Malformed sdd structure\n");
-			return -1;
+			return -EINVAL;
 		}
 		switch (p[0]) {
 		case SDD_PTA_CFG_ELT_ID: {
 			u16 v;
+
 			if (p[1] < 4) {
 				pr_warn("SDD_PTA_CFG_ELT_ID malformed\n");
-				ret = -1;
-				break;
+				return -EINVAL;
 			}
-			v = le16_to_cpu(*((__le16 *)(p + 2)));
+			v = get_unaligned_le16(p + 2);
 			if (!v)  /* non-zero means this is enabled */
 				break;
 
-			v = le16_to_cpu(*((__le16 *)(p + 4)));
+			v = get_unaligned_le16(p + 4);
 			priv->conf_listen_interval = (v >> 7) & 0x1F;
 			pr_debug("PTA found; Listen Interval %d\n",
 				 priv->conf_listen_interval);
 			break;
 		}
 		case SDD_REFERENCE_FREQUENCY_ELT_ID: {
-			u16 clk = le16_to_cpu(*((__le16 *)(p + 2)));
+			u16 clk;
+
+			if (p[1] < sizeof(clk)) {
+				pr_warn("SDD reference frequency malformed\n");
+				return -EINVAL;
+			}
+			clk = get_unaligned_le16(p + 2);
 			if (clk != priv->hw_refclk)
 				pr_warn("SDD file doesn't match configured refclk (%d vs %d)\n",
 					clk, priv->hw_refclk);
@@ -1147,7 +1154,12 @@ int cw1200_setup_mac(struct cw1200_common *priv)
 			pr_err("Can't load sdd file %s.\n", priv->sdd_path);
 			return ret;
 		}
-		cw1200_parse_sdd_file(priv);
+		ret = cw1200_parse_sdd_file(priv);
+		if (ret) {
+			release_firmware(priv->sdd);
+			priv->sdd = NULL;
+			return ret;
+		}
 	}
 
 	cfg.dpdData = priv->sdd->data;
-- 
2.56.0

