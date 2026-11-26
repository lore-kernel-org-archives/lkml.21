Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676167;
	b=Uhi2TdfBdSi6o6Fok57ZFw0eyg9N8fzQA+5o1sJmP9tf8wFrLcyH395PXjbffGoYugPT
	 Ydxm0GMFajSIXaIOJVEeHQCElq1yMYp/VxyFaxGHfFpNeYDJy340HT2L9df82zLB3q7b3
	 UZjRvMewnuh1Lny8Y9m3NPkNh3FhK5JGRJFHDkkzsGqbJbkjJ6rv20Sv/d3CN6qy3+4hZ
	 6lH+a2KjxBoOLaZqevdlfIbbdWIfxaeyGo2BCEgTMEwGCILKRwvLQ0Dog7mjKYaIRD7mZ
	 wEa48jxeZRW9qC8+Jt4myr7qeFNaKgbuTgySm/49Xw9HomyXDYvyXEDYtKGU+W6XsAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pjAKdV6H7ho3CHl4fwxI87EmxvozgcXb/JceKUbGfHo=;
	b=C2wASQapZNf6rpmTnA5E31aar6DzIZAEZpfyoP02U5XA7LUIy0xQyXQwse9pmvPp3dd9
	 Unf4iml8YsGuhQivsLSLXy3mhXxieTBxtzpHWd+xJlkHLK2wA/WGNGy7gZ8ua7UoPTzXz
	 nq3atQUWHKckF8RgfsAlR6sdWetjz/f8YUGO8t3bLAOJ5Uy2rHltxo0bP38XBhgR74Qfv
	 wi0N1hm/mwVW+ePXdzRb7Wy87e3h4Q+mTwhle2/VodZ849slRMMiwFD15I6w1L3dD6yZe
	 YmI7cY/OdfIu+nqzY+kjd2CiGS1MhW+BG448UCktDCG1dBidE8Bv/7K/SaH7y0N1/2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=HDEOs4Az;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120EF606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 120EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=HDEOs4Az
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so8674688eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795676166; x=1796280966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjAKdV6H7ho3CHl4fwxI87EmxvozgcXb/JceKUbGfHo=;
        b=HDEOs4AzXc4BVdFDsW8kQbCLVPkX9hjGoZIV/lcHoYWIodhvhziybVklzV2umtgIyf
         D7BhPjn2+FXR+nrR9mrOlS1zuyHxzRV4fLQh/quAO18+fJ4/4X/8LqYKglLAaR55hXTl
         piEH6AWZw1tnXCNRYtgpnQJy3uUfiPV2fhXvUWJiVeF+RSFc/gZ+NfvV4K7b3MezbXLG
         XuJ2N2MQK/ELquZPcP/4BddBc3qlqTvfZMxfTiokI9jiAqG8WjTDrMEgTrtV4rfHO/m3
         cpvfV2ZBdVVcThHIPwwl23tGv4rK8XNqltOAxd3YC2D0lqICCSd1EAoc66qy+YU4R7MM
         URTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676166; x=1796280966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjAKdV6H7ho3CHl4fwxI87EmxvozgcXb/JceKUbGfHo=;
        b=EAMgottvSOjOeBG+Bqlyq6Dc0CaxXPhWqhN9EMe69zG9ym9kb2UM4XhnBZNWJ+7I3e
         FbH0ZJfJIi5h2C7+3ereoITqiRx/7D04+KZsbXcKpAf5ybllfbXQ0N5LRlRFwZ77YXaR
         vh/JNsMedR4hguoyVcnCmf+QLzi+I7tXalYPFQqpF2zg0wrlmTOZaCGKAMiGPdPNFQ/4
         XXsr3Q4alfdjizLqL77eVF5bq02KwFiwP14cxlwg0gem2I+8lVvC+a+OG39UZ7hdaqNL
         X3acNIk5LWrSHbsEh85Q5dUkJLAm68PuAPihzoUJSH1ZRXw8AsNbYvBf528hpaeF91kF
         xD2g==
X-Forwarded-Encrypted: i=1; AL+hErGqyy1t8Y0EdqnisQuL6Ky035kAyGGYb/PnBprtzR9R2mnbvxrlLsMcAy8DPo4o8213eHTNoIn5hBOBIjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B5vcbJr2GZQ7bgJUntH4z1dCYVtJxn2nJa3H00s1BVbPWVoJ6
	32Kgwo9x3TvHvPMqc5Lmb2Y/YuSYGFfQSV1hbE0PdGrQs2dPARDzzL2Wri8+6l2nXb0=
X-Gm-Gg: AZFdTZeRzcFhBzYIlnQKrmYjSTcwHo50cDrLji8zaaH/cBFbdlbHGdykzwW9KUi48VO
	rjYenWdyAb4JxPLIQCtpd7H1hAr9IxNr4L1K6wE7SXCq7ecCdDicVuHvcL9Qjf/NPoDaSLIqCCm
	BRrV2/ridMkQAzvJIm5nUJH74/Y8ZUCCLZS0fFZdVUjXl3j7h26VN+4+xnQL431W498SAtkgrcw
	x9ULK+N4KPJKAKSc+sxhvBmoypz4q/Nud1TSibyCAbLJHXzPNETZnCnmr7onilEIWg0qEWOj4uo
	AEcVeKAN5zgsGE2X7iQ1jGKSvcd6mazRwkH5ZzJZ4Ax4vnt0sgpfrNP35nQbIePU7K9nT/PDIyZ
	0hJ8t3PhGQMtHcRvZXXuiH9VU5mcONHHkqx6zULBexXUb/QiCkbaiyUNxDSH5YdgVosGyvMnWJh
	rPa7VzZne/TQ68qR2kKviIyg8XQYaAeplYPBKAUBzlx7uajDhJllypDbEGzyuljyIuARJ0RUq35
	Q80UNXysxKjZhi0TWOL2KEH+zpFlOdEGdqh2QBv7wopgYWTQcIjcYdlfVBJyjVnA+oC25QfvWJE
	tRBNB5Qwofnw1fur3sO5ZrBfwILE2t3WYxBZDZHkIUeU
X-Received: by 2002:a05:693c:4143:10b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-386b1067bf5mr13281344eec.20.1795676166107;
        Wed, 25 Nov 2026 22:56:06 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm55580030eec.13.2026.11.25.22.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:56:05 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Zane Leung <liangzhen@linux.spacemit.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Eric Lin <eric.lin@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/14] gtrace: Add RISC-V Trace ramsink driver
Date: Wed, 25 Nov 2026 22:55:35 -0800
Message-ID: <20261126065537.705845-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-10-mayuresh.chitale@oss.qualcomm.com>
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

Hi Mayuresh,

> +	if (wrap) {
> +		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
> +		src.cur = wp - priv->start;
> +		priv->prev_wp = priv->start;
> +		/*
> +		 * There is no way to tell if trRamWp wrapped around more than once. As a
> +		 * result priv->prev_wp can't be used and the entire buffer must be copied
> +		 * even though some data might be duplicated.
> +		 */
> +		bytes = priv->size;
> +	} else {
> +		src.cur =  priv->prev_wp - priv->start;
> +		bytes = wp - priv->prev_wp;
> +		priv->prev_wp = wp;
> +	}

Consider the following trace sessions:

  session 1 writes 60 bytes, no wrap, WP = 60        buffer: [0,60) = S1
  session 2 writes 70 bytes: [60,100), wraps, [0,30) WP = 30, wrap set
                                                     buffer: [0,30)  = S2 (end of it)
                                                             [30,60) = S1 (stale)
                                                             [60,100)= S2 (start of it)

The wrap path copies the whole buffer starting at WP, so the AUX buffer gets
30 stale bytes of S1 followed by all 70 bytes of S2. Nothing from S2 is lost,
but the output contains data that does not belong to the session.

Could we reset WP to the start of the buffer after every copy ?
The non-wrap case then always copies [start, wp), and a wrap can only
happen when one session produces more data than the buffer holds.

Does something like below make sense?

--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ rvtrace_ramsink_copyto_auxbuf()
 	if (wrap) {
-		rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
 		src.cur = wp - priv->start;
-		priv->prev_wp = priv->start;
 		/*
 		 * There is no way to tell if trRamWp wrapped around more than once.
 		 * The entire buffer must be copied even though some data might be duplicated.
 		 */
 		bytes = priv->size;
 	} else {
-		src.cur =  priv->prev_wp - priv->start;
-		bytes = wp - priv->prev_wp;
-		priv->prev_wp = wp;
+		src.cur = 0;
+		bytes = wp - priv->start;
 	}
 
 	tbuf_to_pbuf_copy(&src, &dst, bytes);
+
+	/* Next session starts at the beginning of the buffer */
+	rvtrace_ramsink_write_pair(comp->pdata, priv->start, RVTRACE_RAMSINK_WPLOW_OFF);
+
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
 }

Best regards,
Leo
