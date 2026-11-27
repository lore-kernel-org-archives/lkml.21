Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807386;
	b=RFOOU6SYBp//WcaP5MPnG+tBhbgD/vgsQqnjJr6DFyYCCuvBltY2d819yEFHJiC2ww3j
	 +OrVwQ/BtvtjH72KkghfSorBPVx+3wCkxZBdewpekld9nYMIQHidgXgwJL+4VawbUOxih
	 pw1tbWxNOw3FRqGyyYqnq6fAUtitriR7+pfCyLcXJ21UjLXv+j1sDvYJWt4UAgqJU/xwZ
	 36LCU5TQto/fFb6T15wM/B0nBMR6+Jqf03wTpe9uNASxhfrDWSgI8u37septDQ2R0VAf0
	 RFgAo4bdBf/WmrmTHQkiS8ILrXfOSUFoZNm8hX/+mJEJDar+cYB7kB8ZuwBSYRrkI7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AyAXB6xbDDqeZvT6Ombh9u6aR/WB7LaeUdof3GX3UIM=;
	b=hmET8VxqUKRlLVAuuQxcBC7ev88sE6eoRDoAujZh+rBSHjITz9UA3XcCD0XtRPtD8WBL
	 u22USRby9PPl3F7WD3zv86xd5p7eI1w9/qDJVmBvQW/4BM9loX09IPz+jCK0GOorj3sZ1
	 zIS/5wWX5FK1SG2LD8Nb3Uyqnh4inPJv++saReUNdnA6jCpoz6z/yrPetmEHqhUZ2+ILw
	 P6xoIsNvKgXnkYJ2bjCeKr15D8Y1rvY9fZayRqetmgBccxcSVeUjTYg2siHMG6eOWh8T4
	 GzqYB47l0hM8j7Cr1LDurVeXZWTQSY7l1DYk9o3D1zgiexjT6mkhn+hYkgGf+4KUREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycTjRckT;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D2606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921D2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycTjRckT
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so7933176c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807386; x=1796412186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyAXB6xbDDqeZvT6Ombh9u6aR/WB7LaeUdof3GX3UIM=;
        b=ycTjRckT7iCEnMau9oyTezmY1PRikb1X/mzCP4Zyk+yKSamZZqNv9ezZlVT/0r7dqZ
         VZCHOQL4GzfSvrNkF84KCxXySB2+l97yx2b9Q9w1rYxpqT5OKnzptQNgiU4n4uCQYyIf
         NsA1hTqpvG8jVX6UYzZrbtWtdJgprXvNTSSULv4iY7MLBtHdlCuZK8p1biiYxAQc6I4c
         EVD5sjgMyvpn82WX2y7JIe7suUBC3EGJmXIBER36FA03eTkfiPAecRukm8hqgH+jlnda
         5MPdWY4r6ON5o8fR9ANXSu9oX/hITluVNGs4HSHGnbccMNy+4a9Cy9EHZbThsQEJVNWA
         MZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807386; x=1796412186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyAXB6xbDDqeZvT6Ombh9u6aR/WB7LaeUdof3GX3UIM=;
        b=m0iLixBNcE7aQJchptmdzRo4Dlmf0WAYAz7W4rgKozHnTwbPpV9oMNfe7crC8/Erqt
         YP/h+aFZIDZ4tklhs3wZwdnfdG2/utuhbFbPN/JtMVwtKrMiEPfuPKjnEIC8GWIlewHd
         TjFhB0SAIyExeuZsueUFKDynfhusRSqtu6RvEfAm+LzWaleugcNBYW2UgKJkAHHiq5sG
         mGzSy+9kjkJur4yeeBKxbb02NU2X3U2n/Q9SFr/PGyEqMLU5R0sXXgj2DdUNSPl6ZOdI
         KBcsosqTPrYVNrEn4sv4sYu3R4yKF+cz8q9gEC26+Ordw6vt0yNXmWcBdS/PR0VtPwS8
         rXhA==
X-Forwarded-Encrypted: i=1; AL+hErGKk4RUGSp4RRKKM2qwXM75g8slh1Sy1bnmsoyc2BR6qBWtmmhTSuIaT+rVlv8muUljiIlyrlgHSeA6ns0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rL73nlZS4LMk5Z1LQs+xjZcmInvndi41DWHQzPAxfkPlFVnpj
	PzMLP1c01zH67XnfzFs3KqoHTHTykCuePLTk2euZWWr79QGKwsTJRHoK
X-Gm-Gg: AZFdTZccpNT+PBGApcKz9Vs9ob4F/CaF7/iowoSQEnyutpFyolODnvceGHVGwRTFX8J
	hNEVOE7vTdrNGYURhFTpdg4V44/ltJ6L/LXw1Q/JMbH78oyTVinfXMPX2l0/+tH3ZWgRuupuZvF
	isBBWo8FUMTz76kK0jtpuocheDqRGtt45Ej85tZxDIGMojIFBNhbl8bTeheuYI9dp7Pz1cu5n7Z
	dPXL2GmlwjEX/YBf7mYE2WkuffpYo0LPhtFEu9QCeM7aRi5MMXPJ/jrRQfnzZuyMaob2lnVdd3S
	VuKUDBB1Bw548+bCGehglPEjy6AVQdUG3tA6d50DlMHWi9CVJz7QtK1CtkqtM6YsPye5wBz9LPp
	HuWJJXOYMW8o71OjOEicYfjFzTw+fl429YYLYcXDP6b9FYnmAuf7lEf1ibr318RwXyITczHBmNY
	HeysM0Ls1zBATk9WGqlXfj0/2OMOQvHHlGwvlUBDJnA1wHYf3ED80QH9zgieoi0gj0aViq9FYCD
	+9/k5TsjFdqy4mwsU9G27O8w7obH7RKzixjp++19gOKXtdLaNe1ppfRXScD55EIrhXXbFKHelNW
	KGFsfzHksMgPDoru5Mp5ou9NfCAv7MApvlzecObH6G3TLy0K2BW/B0DgAEany04MzFQdTV+ZbU8
	jfid/C9HPW//BHZwP6YwZgPaoETgg+fQXlSeSfS4ohH4Wcnxr8SU6yjNBMD64ng==
X-Received: by 2002:a05:7022:38b:b0:1b5:2dce:1b6d with SMTP id a92af1059eb24-1b55689ab30mr30982366c88.17.1795807385697;
        Fri, 27 Nov 2026 11:23:05 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:05 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com
Subject: [PATCH net v7 1/7] net: dsa: sja1105: keep pin function on EXTTS disable
Date: Fri, 27 Nov 2026 11:22:56 -0800
Message-ID: <20261127-timecard-driver-v7-1-ahmadexp@gmail.com>
In-Reply-To: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
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

An EXTTS disable request programs the shared PTP_CLK pin as an input
even if the pin is driving periodic output. Select input mode only
when enabling EXTTS. Keep the existing disable and timer drain.

Developed with coding-assistant support during review and validation.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 350f958dcb2a..da35805152e0 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -816,9 +816,11 @@ static int sja1105_extts_enable(struct sja1105_private *priv,
 	    (extts->flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
 		return -EOPNOTSUPP;
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
-	if (rc)
-		return rc;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
+		if (rc)
+			return rc;
+	}
 
 	priv->ptp_data.extts_enabled = on;
 

base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
-- 
2.54.0 (Apple Git-157)

