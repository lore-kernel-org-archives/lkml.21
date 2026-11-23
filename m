Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432749;
	b=UmCSIfrlZRYATawiGt09aR6100JfI0boVNAwcrdM5VMVwhTP8r/P7HQ3ghVW4uS1ltgs
	 TqfYlIcRlamE0BsmAQ2mj4gMkhlliiAUWBF+BEr3/AvErc/xcY+H9ruQB2Ouxzmu/Puy2
	 BtvlM6vwm+akNFWjAFtqYIBtGhJhKl2lJu9BPopr1lMNGEtAniUCwbKhKisZVKLeYC6qE
	 ddeOsWiAXCSy606C1jDeMc5ngvDVE2j72o4ChQX2W2x7tpc9BN2SmyMVvxoAIFtSyIEm/
	 ykAiMAAnddAbOHGqrOL2HuhfcvYIN0lcCNDAOj4SC7ttR62a+SOWjysue3vz38f9Q1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=4w5MOz7oNXtfVQcCh063w8YKKnIPAYFn/6zOsg4K2Eo=;
	b=PmlQfygzczL0RIi6gbDWinYsBArr7PE3EOaCIMCYnRb97VXFwaZESRKDr3z6P6bFMoAW
	 L0Kg1yTuDZOQIBKuQ1eub3W8lJH54dOvYbJvblc7tyn2JNVQ6VeG+IZHTX9Tv5JqDr/yz
	 cGGgaznz9IOulaOSMKXRnDPey55CZVwOEpg+EOvIsmghEQetxAtlZ7/TwcX9Dhbjy+CS+
	 TuqlwRLzvpH88F/kvVzvNF3VNTxb/jGUl2wUW84Q+zzSnkVf6gP7baqPl1+o0szJW1yt2
	 25GEIJh4dWDQSj40RO6yz4ABSTr6eNnW5eNXlu3cK3P2s8b4qW6wawCQ1roAC6QjcLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TwxPC7tx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC4A606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC4A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TwxPC7tx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so25845845e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432747; x=1796037547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4w5MOz7oNXtfVQcCh063w8YKKnIPAYFn/6zOsg4K2Eo=;
        b=TwxPC7txT85RQf48HjWOoxwIid60Vi92L3XMHraR5dn6noP7swGPs7RWLaTaCwgIOU
         7/YQxP7VI6uYs61wFrxOROcLw2KWK6mLi6kwLqV6A8GbQ1wrm+if6Yhk1olpT/x4sd3W
         6jkD06aEaqmnQtuOnvk/duCUuewEvwPfZQnqDMq57PJV4LtXNWtcO/Jd8kjtFu3SDbSj
         k6KTh1aWhQBOzQeyxMk3PKksNF84gIxU63riiU4VqRcWZTjLL3H5m3zHv1edCThp0A9N
         hxd6XILbU9a9O1tHfWME02MaUMmmt+vahUdXKEiM7iRN8lbuajBOyv3Bm6iEbbsETkw/
         NdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432747; x=1796037547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4w5MOz7oNXtfVQcCh063w8YKKnIPAYFn/6zOsg4K2Eo=;
        b=yJTpxr1q3J72Zg1APSB5KnloZt6V5dxofCSvv+ysWqBeNfUriktgXmCS7QY53MABMD
         0iA6gpaNEijKlqbpaDAGf7nX6tKvHylnf5JmyxGl80SW21fhilp6SvzoxyDhbBFuqtGQ
         /pmNPfTPi3oK9rUX3DJ6O3bpM6lHK4cB/IoOP4pCQr/JEfzG0Jxn81hDp5Bq+eqRNsJC
         l2mgPDQFLKr4TY7dPdZ7v9mIsKAR/cIEHPLjFkYjrRBukIDMk0Qpe4Ntjt0tzX5hG7Y6
         n47xFsyqUaoH2sRKdhLfsmksPP1IRLI2k3JtYaqlQg8d0UXssySrPCrMmkrvIjQtoyqe
         KETg==
X-Forwarded-Encrypted: i=1; AL+hErGcruyINdsglnGlTv3rRnV/4D450kvTz8+afauHfDhj0cosiZPD4/PuUC70TtH/+E+qnw2BFtKSpGssc9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w3FbMu7VqvCIbw7ZPzxLrPmOIHb3URIZJz+D5kirCaEUGwWQ0
	PEgOVliC42baIZuXv3Cvg3XBVV27TH4ibmDlcX9dSIOuhLjIcxoIj1ycZSLlwScq5f3wLaPjsAo
	AXhLx
X-Gm-Gg: AZFdTZeURbn7YGZ8ylV4W4qvO+9l8OJh1NRktk9KDNL7kaZ+P6NmdN5tO/bD1sJjSpY
	HZTh5o0Q0Ve5r6JtNeYv0irnvZxjjMYgXRHyrIYL9Y8qGtOAkeY89uK+L53dBqnzNOIGypHBTnj
	NEYTuqy1MHCNlJ59eo43i42Eb4Y44pvywDfR2soNCdedMmbz1yv+zlQK9sltqLyWq4yGpPtb32v
	fxIJHrXgcT6yXy3JqqjKC5sjK1BKKdwhoXPBW5bxj32Is3x4a8hGPROXTeckhJdBMXqhqyxEdLt
	ntrYML7DTeWs8m//1wx/rWHKrStDM1yi2SYduIrLI2m0mK/2drhJy0PY6zWs7xO3CHTgckUYnUx
	WT/zbNDcJKHMnww2PsJ+9lG48ppPBPTcfSybPKbQLp/dLYDAzwP0audfobYKtIamRV6Wf066MSy
	kyOLJ7eQnuTHVQo9sJNPaQQPd7OBQpIdCRtShBL77faoinkloqhb9ostBUtCzd3Dq5LqhedV0IY
	FGDFqGoG94l3H8GVVNqLE89N3RlJyJKL059v+r8B8vlMWYXVESDCO/hNCdDBfGhvqTTRmODSA38
	5A19DN51JZ83JvZRkac9Zv8JnY4op1UR8QEyEKoH/3Xlaw8V3Lt88hXM6tUGkODKMSbayZtooul
	TMZgsuHW/MkAO/pDN
X-Received: by 2002:a05:600d:600b:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb88815f1fmr231222325e9.21.1795432747376;
        Mon, 23 Nov 2026 03:19:07 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884ab091sm492561025e9.11.2026.11.23.03.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 06/17] mfd: rt4831: Drop irrelevant __maybe_unused
Date: Mon, 23 Nov 2026 12:18:04 +0100
Message-ID:  <5a156b0c78839229d6f2fde9969ef2b6ae040aeb.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=V6UpMGGkY65S72eHMVKfqXWtihYJHkQFIRAgF9lSblQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCD28rAKbUoU3xUCNhlqejCEq86VpmIyYg9b5 PQU1DjCUmGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg9gAKCRCPgPtYfRL+ TqhUB/0Y3ELc6KYLLcliz0oqjV4eTP/MlesSRrfOac9hm7mNe+BVwF0nktuuAVv1k+lAoNPFkCm XpJPv7qd4q5GcnTXzSm1xHf2vRUOL8Hcga1PDf70Bs1gh4GXTQgHgQgbaMEdAvkottEl1/8d8T/ Vra0xAHtHvaFSrMkljcY/5QL4A7InJ+sHgNCnxX60LZDhcCasmV/FES7yZ1FPIVoSifb8Bo45Wi qrPXVzWWGP/WXzAR9rA6cvsDKlCP+wyQ80rMk66sSQ7OQuJwKRot/WAOfSmsxO8slF+H0lyIaqU AF18gd6bLfzm2XcUzxtH98zZaTi7Eq14tL/yJIuyaGxGSo/U
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So rt4831_of_match[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/rt4831.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
index 1ab8870e4ebf..2b3f84b81c65 100644
--- a/drivers/mfd/rt4831.c
+++ b/drivers/mfd/rt4831.c
@@ -98,7 +98,7 @@ static void rt4831_remove(struct i2c_client *client)
 		dev_warn(&client->dev, "Failed to disable outputs (%pe)\n", ERR_PTR(ret));
 }
 
-static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+static const struct of_device_id rt4831_of_match[] = {
 	{ .compatible = "richtek,rt4831", },
 	{}
 };
-- 
2.47.3

