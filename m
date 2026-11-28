Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853469;
	b=xPgG8SP3tmm4pqA5u5e2Q7YSnE2WyF5oGyrZkh665MqV+obQc1F2nwZ6mf54EiyArwfc
	 REaHOTG0MA8nFiDulUUoazsNM6XFIdQXWYyd8Tk6yf5uXpnluHetaEot5q2lDw/uC5ZUV
	 QOzVEnGKbI6F2dzj0jgO+5oxX0SqxSvkRcxU09k4wDvvDD/qz7V/kvnVuGoXapUnaS1zv
	 PrR4PWjVCCDvJp40e205JY0HZr7aGNKS+kyawXiML+sqTgzepUE8as7Yw3w+RAzfLkPQr
	 ZhZUidSb4uX2SDFVmiVKhWoIPqKYUbzA7MIxtixKfTqXaNwe96wyqNqf1r872L9QJZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/NKgGI4baMEt3ekgY9p12tXsFBBeGRj9nnWHy6cARGA=;
	b=b4ZwQrkrnprv4PhZSmwdRHY+fS25862CYV3kjJWZDWbbfU8gfCAVQBt7QSo6KOA2TqW6
	 ycUv42in1Nucy+4NJ+szx+HcDLcmndP0uNoOXc2/M5i7i6n6RZletXuwPnSwpsi3gm9Zw
	 XIxV8yJlpG2WsY27ZP7LVIfkxXrptS0i2iVGhcfsiZuAlHMkYNaI98qAqyjZMxik0ZJLW
	 CbVyPb4J+jnpn5YRCHs7YdVMDeK19LbFoVT9BfjraRTO0M6eLWk6cB0+v1GSenLPBU3Ro
	 EWMVXDilVcE+99qi1LFbZhOdVs1GXMXnfetiWCKNoWxO3TwUDfU85tJMu+s1Q39zxug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s/frIY+x";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1458606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1458606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s/frIY+x
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38190551625so16788666eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853468; x=1796458268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NKgGI4baMEt3ekgY9p12tXsFBBeGRj9nnWHy6cARGA=;
        b=s/frIY+xdUnqUWX2PGNcV4XTjxeqcBdbvf7pP16W1uLXqyfhFX+t+muWMK0eNwuz4S
         dh5RLB2E6yauBykK+xC09CC+W8pGiaZTyssxl5WUuYDFqr3qVsjto67xn+F9vLDkv1q0
         IJi3ceWg9i+86JqWIpk4ETv63A1XOsODniUoEa9k1OuhM6mhL1D/T9VB6/X0kaQMv1Q8
         /jebq2ctg+LJTBqu+yXQELal7prns9V+GvVSxNCidKYa4P3cKx+2dOGSyk0tsU6wgZRC
         3yNth/XZa0GtO5Ys1zPQzSqMNCeKYIuH4VBIXccFMZ2AVE8r69bVS+9zvyjPSoHKwXFC
         KySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853468; x=1796458268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NKgGI4baMEt3ekgY9p12tXsFBBeGRj9nnWHy6cARGA=;
        b=mss1SfWcOv+DjCFsYwYfKRnW279QirP2ZLkWptLALiX9g8owvlptA230yBM/qLENE+
         GhZudJTP/N9EhwxbQaNyVfo5G0v0UxrU6p5aNvr9vE4nSDYMt7kBpxj9K/tFuSM0CYWl
         guUFI4dfQFevMqsHqg6meuXFDnrMimusYzC8Xm2boqDCcX3WAxD7myk79KRkRc5r0a+z
         F/afa1tv5f2xGvV/ZVk+zIYn97haMiQBL8aldtmOJWFRbO+0+eJPZ/Ul6TyT29L4hbcc
         BqSZKb5DhWO2IAikXlAH+toA0v93Zg/knDErjJgtTaEpkKXqPdiF+ikytSf42+yxiR24
         mByA==
X-Forwarded-Encrypted: i=1; AL+hErFyqo7vJYC0KOqMtavX+BaaDsPtnRpHon4Qump6CHVrD0dtppEiRrkRYCD9dhhkwdUKPb0/uc2lfafdVYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+px5DQ8aZzTjzUGlSQspBNtfshbzJ1ZEAArxb3ZR2ofCqaQdyo
	4Wsu8RfwqERYq9uKqQIcvRoP4ZUTNRlacBLQiNh+WI5OjB5XVMOEdxN5
X-Gm-Gg: AZFdTZfXaa1ojb6VpAuV+nVt2K1BO1jaQAX83l52hatz08KxHA6QQ9cMybPX9zjrmMB
	2TCIenTjSWkvs3gshCWz1XWCgtVoC5O4KQ4Jd21oI+2pLaYdpOfI0/nmxkRK9JZ+G3o2XGHwwVK
	BFkkopIOwUOkNrD6PrHEyE6/wkQCVuixRQSbmDnjfOKoeeai8ZxopI+SHBPnCkErPJaNMo0Nrub
	AFAAIhhcdA1eQ1ZU/gKw1rgrNFfNXtwzz+k5D+VLEt8uj/Xf3tGvwqysx5JuxgQJ/2Ge8F5RPTY
	TxBPaq7d0NQ/7hpK8CcuPDxNjn0/8AI9Wy7ADRHOJJ8nu1hGnh+0JYOEtyxmEdI+9EWlRsH8tJn
	95vK1aVYxrM/UtCp1KXQtJJ0wMV+PNTDJgh8ScJy9dSTxWm0Mh6dspROKi8F9mSDWUMOHl1XOSy
	1SH7BgITdY7IN5L0fXHWK0yTf10j6yExGTzEoq5q8/yqcNeKCQAlOugq4XJ8dDP+xMKB8XSFn9X
	m3P96Py2umaiobti96gxBXMbAED7tP0XzAmWiioxRL/COcDBtyncjFJAkirfS6mz2Q6B/IbZnY7
	ToVSkCs1j19g/mCW/xm5Ncd43rI5q4UavMRRoWKHAlnZiX1hgWtw
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr26545761eec.27.1795853467909;
        Sat, 28 Nov 2026 00:11:07 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm47038711eec.9.2026.11.28.00.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:11:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.de
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] aoa: Fix codec unregister handling
Date: Sat, 28 Nov 2026 08:10:25 +0000
Message-ID: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Fix aoa_codec_unregister() to use the codec's own fabric pointer
when removing a codec.

Previously, the function checked the global fabric pointer instead
of codec->fabric. This could call the fabric's remove_codec()
callback for a codec that was never attached to the fabric.

The function also called module_put() unconditionally, even when
no module reference had been acquired by attach_codec_to_fabric().
This could cause an incorrect module reference count.

Save codec->fabric before unregistering the codec, and call
exit(), remove_codec(), and module_put() only when the codec is
actually attached to a fabric.

This also prevents releasing the module reference a second time
when codec initialization has already failed and the attach path
has cleaned up.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/aoa/core/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/aoa/core/core.c b/sound/aoa/core/core.c
index 99b032a4081f..41a3b79ca93a 100644
--- a/sound/aoa/core/core.c
+++ b/sound/aoa/core/core.c
@@ -71,13 +71,18 @@ EXPORT_SYMBOL_GPL(aoa_codec_register);
 
 void aoa_codec_unregister(struct aoa_codec *codec)
 {
+	struct aoa_fabric *codec_fabric = codec->fabric;
+
 	list_del(&codec->list);
-	if (codec->fabric && codec->exit)
-		codec->exit(codec);
-	if (fabric && fabric->remove_codec)
-		fabric->remove_codec(codec);
-	codec->fabric = NULL;
-	module_put(codec->owner);
+	if (codec_fabric) {
+		if (codec->exit)
+			codec->exit(codec);
+		if (codec_fabric->remove_codec)
+			codec_fabric->remove_codec(codec);
+
+		codec->fabric = NULL;
+		module_put(codec->owner);
+	}
 }
 EXPORT_SYMBOL_GPL(aoa_codec_unregister);
 
-- 
2.55.0

