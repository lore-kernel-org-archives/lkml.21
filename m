Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547159;
	b=YPCIf3pTZwj4YzvnIJo4s5RmEg8FzDgB70R6Y1FGGeXpBS64Qy0G+V3Cti6FamwGUbSX
	 1FEk9bKWcjUTQWuvJ7kUUGFumuiS7DmFTLOU+z9quyW5zcghE8IrNWNaNR6NyGF07uAAA
	 bdemE6vKZVa4HLO1KU3UPBzN2JNIqE0obfPxXLcP5uf58pZABPihlUXoAsVTfuBSDLCNQ
	 kKAXEMl/fb+Q+hQs/MLHwQYJYW+xoWhB5B1qqsNig2KEjr9YV6Diu36c9rkj/hiH4d83k
	 Yy2KwQueI/nglroLEvpsdkdD+Tmsh1P4EV44Z64KddlRxQwwmGst3uvCDVnq0RTmLuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547159;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l5HWvAdbteddFFTaYe5iMeBI4K69O1UpafXxfUHxKDo=;
	b=iuG0IaPxPOsrqz1IafACF6tO2YHdtwyZSsoNiICe1JALDfKemhVsRzbbfmE/Hixas9+3
	 XHATAJUAvmyZLUCs83R8WTS8q/iR5wUFaOrlpcJsOuJTWWe1olM4C7/p+9ooj8XqRI4iq
	 gUZKJiKMFbkn5B0x1y3bsZagoWFCg49h/p8JGF5movHciDodQHlZ7MVKyZBzIEkI3C+/g
	 TpyRZUdnuj8OVLeg5oV1rtEJ3TS2ILh4kgFHsTb4LdysKKh1n3pTqE1rfnwlHu3txNlr0
	 vAh4rghKbbR+orJvUazlC/1Sz/B9tVqKQikks0UpubN+191i63qg2DgoCwHMUy9BjFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.com;
	spf=pass smtp.mailfrom=fastmail.com;
	dkim=pass header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b="LTwn8sI/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VOQFLsvb;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5A9606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F5A9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=LTwn8sI/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VOQFLsvb
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id BD0EFEC05F5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:05:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 24 Nov 2026 14:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1795547157; x=1795633557; bh=l5HWvAdbteddFFTaYe5iM
	eBI4K69O1UpafXxfUHxKDo=; b=LTwn8sI/EXwgiEBxzHJlfPafvpdABc5S8o0MC
	e0Hyqo/i+Qyc44R/V1MaIRxJlZgE2zvu5t6N49Wl2MXZ5Zc1YoWsVoraHme5WZic
	I7ZXhsBaB3q24NvTou36lP3u+2SAXUaLfw0kN2zNXOMBGPxceEYBmso/MNdiTbqf
	mXSKwiZJTriqeh3YBVUzSlofbsKcF/az9AwASFFmLI7h/XtnuBBwpn9/BkGXKK3Q
	cKuIKAxevr7huFL+c67ts5BCdNYPnQorDBVffOH0quUZEIBOoqKnXuldJUkHLG4f
	Rt1jHU6NOTEmguqhQqeBci5U4yD8r+2KViyKWEjUamZ3kYXAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795547157; x=1795633557; bh=l5HWvAdbteddFFTaYe5iMeBI4K69O1UpafX
	xfUHxKDo=; b=VOQFLsvb2L/iWxAWQ2ItYi2TqTXQb+S6L2f8nGHdNW1kplHlxog
	Yfr0F9EQdU1JWX+HYx7yWAuMSBOGuNLiOUV/thRFu2zovlqAzqpo2C0XcPTK9gN+
	XPn41pHC+X/bt9DV+jQNvRikCqg5fQEiLUrlEcPafPb+Lzlhc+9LMUOcdraily//
	4tCJepp5QmyDVDAF0tK3sE9OX7ltx8SYMnd5dNYHKzD1RwtnP8j6RaLQn9cRzSXn
	1g8pX/+Pw/7ZVAolUI0lCQNcxRyjXjEWSZBwOBmrLwhIHscG3kH5/YqzmZZo8QTY
	0ckfQhPCP24bj0pQkYYFsYydPaq8OpHS3TQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795547157; d=fastmail.com;
	mf=PGJhcmFudEBmYXN0bWFpbC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:aq4so3jfg5I50audI9N2EfKAH0h3YEjwIfYSVlTyHYqHVZU
	+T0a26xm1AjCE5ZH7flRnllf5FBa1SQxFu79Jvf3v1uXaZIIzzvcsk/SXAK56E/B
	KQ5rakvcf5clLgRlw8b6GuRwxIuJuKwtPZpVbMjfH2kEKgK5i54FEmuByivcb1tt
	EQNnfkV9SQ1Od7GvgZVUc6vJV0DRWuWQu8zIfIyMtW2SPjKQu/RlezjfosG+CnTW
	diab1iH9YpFMkKcIJLYzoY/gAm//zkCAMH1T6YTlcZYPmn9o3oD+S9kFsmAxOFW+
	CClufC65T1fS/xthIp72wrYzwM4h+qd8SfWv+ow==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:aUiUWa/LPAy/w+qjc1ZBk8coGBB9ccAsxK/LG3RDTak=:Kn1fNPjTECSVUwdX2gQH1Ss0mfOa3spfmrMa3HT0hOI=;
X-ME-Sender: <xms:FeAFa3Y7W0P3GVAAf-Q8nVU2cxOZ539lS6h3fABX1u7tLPsQXu3xZg>
    <xme:FeAFa_WuCM5BwbYC91EqBuGW64k_e--Y-fr3Cn3OI-MMCaJbWIN9Hi1sKWu0fRQ9T
    zAcgP3botd39WBaNke2qSOAu92xjUt_HrnDi6kJhX8paQZ7eYM>
X-ME-Received: <xmr:FeAFa1jk95xj769_Q7H-irdf6uuGx2c8PdrQrfxC70rmZG5WuhkbN4Rx>
X-ME-Proxy-Cause: dmFkZTGqoSm+JEsSMyskpHQmeWD+Nm5bmhoCsG8pT8fQLuM9Ju4YoAwUT0ToiqVhmRSyCa
    vSjDWaxDytj5eiI7p0wy+/AurvJcqrEy8bzhm0wAfHgrWKozIVKJgBiYo2JHmz7KXydIRC
    bc9BBbIYHXlm7X0ugmVtNaN+7/HAoJWrxfeZu0MyusSAgpCzWe901ILNd3X2eynA8jnSRq
    +m1AwTUzDlzDIF4zRAehZ5A2y/guYn7E6vXNc1fxsFLlADIhbSFafEEgvz6s9zRyavNJn4
    +Wx77C3uXdOHZM+MmA9GVKre7yG2fFJB+aaR8FuqmVV+9cZre8eEDda3D5o0FZdZ93DBXa
    Lfps5pgF9VlKLxhBEui/q1Ciy14ylaKjPk/k8r2Ji+8N6rTL+sg9tcQ8uvYddq1bFtrfFK
    2DeGsrz3dHWMm7f/OTNyQ1KFCV7DNYNf3RF+ZAV9uVigLPDrWVtvXhM8AjRCcS5IMmr7it
    4PfTCPaOE9Fa4xqFrwkD7umajikYmU2c2MzDsx70DP4aNL21ShJygDUTPNg+NZJq+oeyZO
    DaQ+n9ANgJprZO+mvFOjgg+sBKTaSby7uqk297y3L05yJ2cK9GU11Y+LK/CG6khuY+Nxd8
    4jW71Svt0ePsbEbDMFIDMnP3iWH5TSWOUfJijat7yemdTgwZXYdUavGYn2FQ
X-ME-Proxy: <xmx:FeAFa9uKRFXTzrZxIb6b7_bFUR9J_aeiZASAvrM5rtjkBXoeT5PSWg>
    <xmx:FeAFa-47lxchOh-nFQAyc2ZdWg91FPkjNe8H75y3vhrOvYEsX06qSA>
    <xmx:FeAFaxPIkXKlhyuFy5vT6FYmM9wICeT5Rt-0ZEPBJlsngXu2pnK_ig>
    <xmx:FeAFa0sRzROJfUMXFAoO02txCoW4b-KViLr3FL4MOrEaEMxbs9A4aA>
    <xmx:FeAFa3aQJ_G5eKKMpvelD6cm69bhZ8k2O-e3Wp0LXm10exBpJlsecR_X>
Feedback-ID: i9dce4b48:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 14:05:56 -0500 (EST)
From: Baran Tuna <barant@fastmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-svs: Use %pe to print PTR_ERR()
Date: Tue, 24 Nov 2026 22:05:42 +0300
Message-ID: <9448408e0bd0f37a05d458f0c8ae69ec848cdf71.1795546605.git.barant@fastmail.com>
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

Use the %pe format specifier to print error pointers symbolically
instead of printing PTR_ERR() as a number.

Found by scripts/coccinelle/misc/ptr_err_to_pe.cocci.

Signed-off-by: Baran Tuna <barant@fastmail.com>
---
 Compile-tested only.

 drivers/soc/mediatek/mtk-svs.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0f37b3aadaa2..385c4aef9e91 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -594,8 +594,8 @@ static int svs_sync_bank_volts_from_opp(struct svs_bank *svsb)
 						 svsb->opp_dfreq[i],
 						 true);
 		if (IS_ERR(opp)) {
-			dev_err(svsb->dev, "cannot find freq = %u (%ld)\n",
-				svsb->opp_dfreq[i], PTR_ERR(opp));
+			dev_err(svsb->dev, "cannot find freq = %u (%pe)\n",
+				svsb->opp_dfreq[i], opp);
 			return PTR_ERR(opp);
 		}
 
@@ -833,9 +833,8 @@ static int svs_status_debug_show(struct seq_file *m, void *v)
 		opp = dev_pm_opp_find_freq_exact(svsb->opp_dev,
 						 svsb->opp_dfreq[i], true);
 		if (IS_ERR(opp)) {
-			seq_printf(m, "%s: cannot find freq = %u (%ld)\n",
-				   svsb->name, svsb->opp_dfreq[i],
-				   PTR_ERR(opp));
+			seq_printf(m, "%s: cannot find freq = %u (%pe)\n",
+				   svsb->name, svsb->opp_dfreq[i], opp);
 			return PTR_ERR(opp);
 		}
 
@@ -1840,8 +1839,8 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 		for (i = 0, freq = ULONG_MAX; i < bdata->opp_count; i++, freq--) {
 			opp = dev_pm_opp_find_freq_floor(svsb->opp_dev, &freq);
 			if (IS_ERR(opp)) {
-				dev_err(svsb->dev, "cannot find freq = %ld\n",
-					PTR_ERR(opp));
+				dev_err(svsb->dev, "cannot find freq = %pe\n",
+					opp);
 				return PTR_ERR(opp);
 			}
 
@@ -1864,8 +1863,8 @@ static int svs_get_efuse_data(struct svs_platform *svsp,
 
 	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
 	if (IS_ERR(cell)) {
-		dev_err(svsp->dev, "no \"%s\"? %ld\n",
-			nvmem_cell_name, PTR_ERR(cell));
+		dev_err(svsp->dev, "no \"%s\"? %pe\n",
+			nvmem_cell_name, cell);
 		return PTR_ERR(cell);
 	}
 

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.53.0

