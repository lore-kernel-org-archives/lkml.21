Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804955;
	b=g2teFuRPz6mWR8IF5UpBZp3vVP4SSwkzlTq+b3R7sd9wzjnQdz7MKBqX1ce3tPX8/5mz
	 gpu9WJooeoYvBNzV1cK76C1sbM+myJbTedArms9vTPSKDUKfy1gdBwJVHZubddRTb1prd
	 tUAmhDpNcOs7N4XiuOgHqMx4jN2Byblmd/L/8RnFlGHPtXFASiqW8U0p6dwzeq9Fya7kE
	 TuKfrz1XV0Fe/TBnoOJgy8heAn5FBL0D6AhP0GObT5n+utcpM5Lb42wUA7T35gCUupEc7
	 jxouo37V/lly2vyxUKN8R4+1TuY1s0wmjw+BhQWBxv1at22vkq43fljHJjJ2ByciyBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
	b=DDNLs+K7KTQZXEJW4Qz0PO6WzI0fE8isKtihWkHqSLo+jZnvM32U2iebJ18VhCWAj4Xy
	 kRjbAwQOUBEiOrQYQUd6s9IlnxeaNYmhEg8j9DsjzH03gmU/jo1ypvmlGoQHl/HbyAHJD
	 /Mkl0HoHxrxSXk3ccqQfa0xBOTYin6FNflYtYK1l3lpzlxCODuJxDN0hyNvRVO/NmpJfi
	 kCTStglK/uLxi0O0TnJypfrXWYAIPcE7GgUX4UuWbTKKbT1Rkqb6WQFwya5bmKS+jw2L0
	 bj2aa41vI7m2NZ5jD/5g8IU3qpDAISgdkyKykEj8mt8Q6cibGb6PlvGy8KOm8UkiWyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="a8LS7/jr";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C03606A6A8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C03606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a8LS7/jr
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b54096b2d0so398879a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804955; x=1796409755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
        b=a8LS7/jrC8OakwEkuivUxroAjF4H4gY4gX6cWu8fMCGkxfFRs+UrZ51doqLICEdh/Y
         bd6UMbb0T1AU8w56hW4+KE37WsRuLnljwg4Sc5RDSNxSfAJqPXAcOG014uFR+Tc40RYt
         iE+SFsc9KTu0O4p35wLt5V99yxIMv9js/u4xDaidKe8le+6itp1LqjUOcq3Oo22O8rrV
         1/AuKEvXfEup4hjbbsdUXkI64zz3OUH5yfRf9D4nI5mc1W8zKf9zgu8kW2ig/PlHaXxw
         0A/KSjF9p5cJGckzjRyMHv9N4YJDmbLgUNfVWkDngJEbvLNJ1YuVGkxNtpLK6nINZDPn
         nqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804955; x=1796409755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mz+Itla6D9aJ4LEfK+0eYjrF7t88lxIqTXb6+qpzWZI=;
        b=KGnyyoBrcXhijmWtuuP7/10IROJdFmkxrG56YlT8PW8MzStBx1LT93vdooDn173Lnk
         bhp8zgAcg86UoygmrZ/wt6JlZoP3wvPplAyueDY/cbO1ulpCorMcplV649NEncauMdTk
         iip+40ZJgqHkp2DKdbVBPntZ5oAepiiKtIhQewNBPs+witwpa+JB5HSRDZ4sQT5jhLxP
         dbUvQXJRtvf72PJJbwZGttRpfhLMkVQmnAXWA9cMlPeRVSu4kKP3t8UK+p5O3zl+RsXD
         FPJQPjtwqAM5+2wnTPsER251VEUfclXgtcLYSo+RvPANFEA9UByzIgoLpC+JWOmJXaNH
         BQcg==
X-Forwarded-Encrypted: i=1; AL+hErGHFKWlJK1c70NRSjhV8LYjH2x0skj42GUuGD/pLdKUOH1LqN6zp2Fucqblk4aj0U/rrsEdYn0JBD74NaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rv2jRFscXB7zUtex7Arv9a9nYIG7qhbNrKBkXPaPRWXddxF42
	i6dPodhWkE47ax2dVWuu34jtps2FBGpdabR9APFb0KQDGgxhAOWxK1BftYWjGgmwKjI=
X-Gm-Gg: AZFdTZdIr69FDfcG+3VFw7Fnm5ENLTRnS+jcsE6LT2nqoE1BbqWaEBIv7EdSXbQNMc8
	BT94TGaTqSZLedfYC2OBBVw7oKsi5iE48IK7bDIWDeUKJ2yKvQb/1n6THkUMNpO8IXIFOUjBSF/
	ki0NtUWW5+hzmjuXn+SMJ3Ck9jnGCg/LKXl9VXvQ8QHsfmb0GMZCB5darr6jjUDY+TXdqX4Dn2o
	UiZb1q4dhZjBwZlgmw/mUUN+EZkr5+Uq2IdYsQkPeKhrIgoKG8qcIYpEp5rZYnjS7EkJEgDKm7d
	fJDqZUE7qfXzUZU2LSBJ0AHNkldkJFLLifxtulaWjm2bVja3nmXUxP9lz0o2k/+C4Edi5kaJRCM
	OYzUzNKWrQtx5pbHSuwwaclERab0B3067q97WUw3Sb1L7DtjFskpZDs3DJU/DYJ3HdPMm2qIz/8
	gb8dSUijB0FYaXVop0/C0AEQLq6SA3wcIgLBeIy83ax5gklxJAb+5D2hedg0cvHMiwTIqJxioSy
	S9snUwxoSf0WQok1zwmx21ZZM10RI+K4pOerMMkVPS884ReEXvgh0tsVv0fS82j1D7ozOLZScrA
	+8Rcjol1KhfAnixczQOAs4iyi9GOd4hC1WeSGn15XkLmY0dWQQ==
X-Received: by 2002:a17:90b:4483:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b41c92cbb8mr25063012a91.35.1795804954700;
        Fri, 27 Nov 2026 10:42:34 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm19149071a91.17.2026.11.27.10.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:42:34 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: artem122novak@gmail.com
Cc: cassel@kernel.org,
	dlemoal@kernel.org,
	linusw@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vireshk@kernel.org
Subject: [PATCH v5 4/4] ata: sata_gemini: add missing newlines to error messages
Date: Fri, 27 Nov 2026 12:42:28 -0600
Message-ID: <20261127184228.185827-5-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127184228.185827-1-artem122novak@gmail.com>
References: <20261127181619.183139-1-artem122novak@gmail.com>
 <20261127184228.185827-1-artem122novak@gmail.com>
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

Terminate the SATA clock lookup error messages with newlines
to keep kernel log messages properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ata/sata_gemini.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
index 9d87603ef531..b69db749b49d 100644
--- a/drivers/ata/sata_gemini.c
+++ b/drivers/ata/sata_gemini.c
@@ -227,12 +227,12 @@ static int gemini_sata_bridge_init(struct sata_gemini *sg)
 
 	sg->sata0_pclk = devm_clk_get(dev, "SATA0_PCLK");
 	if (IS_ERR(sg->sata0_pclk)) {
-		dev_err(dev, "no SATA0 PCLK");
+		dev_err(dev, "no SATA0 PCLK\n");
 		return -ENODEV;
 	}
 	sg->sata1_pclk = devm_clk_get(dev, "SATA1_PCLK");
 	if (IS_ERR(sg->sata1_pclk)) {
-		dev_err(dev, "no SATA1 PCLK");
+		dev_err(dev, "no SATA1 PCLK\n");
 		return -ENODEV;
 	}
 
-- 
2.56.1

