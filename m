Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673989;
	b=cP5Quj6ytgCe4wjWAzkQBHbtSF5q0YsCCNvqaCI7VXxWwlHp9JbhvQW4xsjiCBB2Vb11
	 BOWRgb6CmL6xv4Ea/rlPhLWML7cCnJvHgF2qdrUN7LNxdXCclcia/QOa8zZ8CeJ8C97dX
	 58MeVVp5EfpNvyPB1lqOzwVrp86FhAzefyihzBiBJ5a+zkR5Jl2xdGTmrI37VAQMDz+Q/
	 xtRn08GdAyGHrwt01C1GvjedmMD2O3MSMPPfg2x0+X0sl5XRa/BuxvR1zBFiUKU66ijPY
	 /nbLpcpdSic7WUm4267S23w5/PJVug12Gfq3NlyA3Ilj5s6UwVxBSDpCn4LPGFIiVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0YXlOsEx8PTByp1QwbgHZi5PLgmr6v7Uc+yNKtoqErg=;
	b=AK782GTs4p9FpygGqmj6APf4KmCULba/6McU5UT6YwtXjmxvrODQGSWtxTij4KYuhrjh
	 a3Tg0PNi2HY1bwZZvaa0m0DXfb0NV+9h3882+MceCHGTAGZL+d9LmkJYxSKV9UsECNLiI
	 KPIhbzMj4spJ5osIzjxbVpVLBjSKjGgPifN9WFzO2pMCdaGj1eUOUbsLdtlqAl4Ii47r4
	 OnxXEj+0xoxDTqnTQu5SlH3QmjwurzZRsywzNoKbfUr9nNFr7j2/5XIgx4S8+7QIzS3z8
	 f1CF85+IV1Q5h8BEIfzaoxW3mbuD2RleQU9SN67GVxLv2KZM+Qer08pdoYtYoxPsswA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sn/ZG9zk";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA947606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA947606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sn/ZG9zk
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so11036896c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673988; x=1796278788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YXlOsEx8PTByp1QwbgHZi5PLgmr6v7Uc+yNKtoqErg=;
        b=sn/ZG9zkxthCbYgOLaIl17WW5a/3pM3Pw7B7r8UsNWWxpyFmntAU5uyNb0+3HjC4O5
         1o0gt19+klMXcyJsQQ5D0/XYsNuZ3HPY+NoTC7yHYMG9jbwC8eIFpsQhZDFBYVdOYNep
         fOju8zulDHP0Gi8niB+3u6FC8eiRH2bN7dvOHpWyLnXAbEGpUb0L9QW1A9Cbj5XYBXhR
         i4oplFZSSqo11CRUz9IR8lhZrFE67J12rASo2ay3+cBenoKTJtSkVEGArJwKd79u+iVn
         4XvKsjDnSPyRDdp5StlfbZ5pE9UPG5/3LCkj3lpPa2ImM2cx0ySr1J+YZf9Yb3o0fajz
         n2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673988; x=1796278788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YXlOsEx8PTByp1QwbgHZi5PLgmr6v7Uc+yNKtoqErg=;
        b=YLxBnh+zAbzS0wHrcX/W6wMjRhcaQQ1JO79cWJZELBqRZ7SP0FoM9aHipgls7bVrT3
         MrJVxYLMPgqFlx7YMV7RTyo2YwmA+/vG00IESwIW2DcPzUtVfAVm0J2YKkWu7IFtG1XX
         SIF4/82fdhxre1hUmJ7Q43kst3Uwqpb2taidTEnkWN7scsdlV01IjHOqEE4kyXDbqFla
         0HVYmjshb94vBSxZvf8Sgxtj2zqOK25gNTsniRUwB2de20EmjH/9K8isqxp0H2WM2En2
         FD2jZULYqs60noNidUete2PTxQyTzrGxiV/uE4unbbGZbjVEon7BsmOMD69TZ1/XoVPc
         BH4Q==
X-Gm-Message-State: APuU4Z+nPsiAtGuJsR+hGTlJuWCn+Z4KsH0by57IWHf19/Eo107zfhYV
	9QJ6ERLYeHbKI0KguXXTcZ0ydJhE36wtOoOGTHkKord5qjdQv75PEuO/
X-Gm-Gg: AZFdTZeq3+GuotJ86u0n2/9Fi6z4PRnX+20sI8gmLIFILWx9d+p91nKwHD9/viLtzXi
	wSFQKDu5nz2erzWjbXlNihvdie8fW1AD/xuL5T54W2coYd5U7mlSHIygQijcV8m+sSieVOByno/
	V/POoo4O32skqg0t3T6wi/uOc4jRKlxTMokJFlxiRN5XIJKAY0EG1U9z8udz4YmqalmpAUw0AoZ
	NPPthGJJXND5pwXOpXFdeZ689it3cTVkByKzxC8QJxH89lkO9pgUiaZBV0X33ZqvOggY0IM73cv
	HSggQfwARQzCJiw0+0EfxSZ1Z2s2jgQTUBVEba9lXSScW03bTXfzGfy+SDEBO1GGjvrXKS3hdJh
	o748Ox/7WxIKnqCQandqjCi/ZvOncXZP++Zysbc6LXJm7V1T3ZxL45Ax7xNkO7rUu4s7YFFl4Gk
	tsSlvD0dDcOcMsx8RGFvP4EHsxlybyUgur+j1GWPqtLa9hp8uzQ0eTh2HlzroXZmlkGsLQJg2Yq
	YjNuKOKvYTIu/J5sRKKMIuNLc9ef62jNaBiRKZnvpmXeLZSwSqeMeuEjwIt1gvj37HQWoqc8osC
	YlZQ5uRYsTVb202/h35NHhgQIrysYOah8MuDofC7ir2oj9zNxsE=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr19795063eec.41.1795673987845;
        Wed, 25 Nov 2026 22:19:47 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm105527747eec.3.2026.11.25.22.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:19:47 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de,
	perex@perex.cz
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: vmaster: Restore follower values on put failure
Date: Thu, 26 Nov 2026 06:19:10 +0000
Message-ID: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
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

Restore the cached follower values when the underlying put
callback fails.

Otherwise, a retry with the same value may be skipped
because the cache already contains the requested value.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/vmaster.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..f5cc11eba25d 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -193,7 +193,7 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct link_follower *follower = snd_kcontrol_chip(kcontrol);
-	int err, ch, changed = 0;
+	int err, ch, changed = 0, old_vals[2];
 
 	err = follower_init(follower);
 	if (err < 0)
@@ -204,6 +204,10 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 	}
 
+	/* save the original cached values */
+	for (ch = 0; ch < follower->info.count; ch++)
+		old_vals[ch] = follower->vals[ch];
+
 	for (ch = 0; ch < follower->info.count; ch++) {
 		if (follower->vals[ch] != ucontrol->value.integer.value[ch]) {
 			changed = 1;
@@ -213,8 +217,13 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 	if (!changed)
 		return 0;
 	err = follower_put_val(follower, ucontrol);
-	if (err < 0)
+	if (err < 0) {
+		/* restore cached values on failure */
+		for (ch = 0; ch < follower->info.count; ch++)
+			follower->vals[ch] = old_vals[ch];
 		return err;
+	}
+
 	return 1;
 }
 
-- 
2.55.0

