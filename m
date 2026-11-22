Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322306;
	b=nnpJJiCJiBa+jlfireQMZlcPASfVJ47FtaqtxHEMIxMcmyC+wnaHIzI8eS/aGdsMdPx2
	 Rl+v25Zgdl7LbOjTayUGD5IvLjYmcTvn8pEXglEhayvBvzdFDgqxBxuvsnxDxVpoGsCkj
	 VCNOJb4FU9Q1Lt9reJf/+VKzyqRFsvoyB2PCob6SjEypsjthFGPhtcd+s28DkYcJxfxeE
	 h+FdaEHaXtydD9DVfFSz+alQgw34pvUctVrdrWf/NhgiTrRNljTeyohj6MVxgU1Z9lr2L
	 LUhdlDV1BMJdCI+cCO8Cvwwt/9TqftBCa2xRZBNwFYZT+TBQKe5fVqmWode95o3q+/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:X-Google-Nh-Sender:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
	b=V6Ge9eHCO79IO/2BhymiyPzNNqIieJLWjUQrg32QGu33rxOuV21EIa7mMewI9oQ+Ll2s
	 ajga15foicUvvXpxsLV6UoIegGexj38/GKFx3H4Z1FJJ49+Pyh3R8Yn5jpPQL/Fj1lvA/
	 C2IwwWl2oYQDd1GImxN9iryfvo5YJoaPkklL0+enGP9mizRTYd7aLPRwQI/y1Kbt7E2kG
	 73HgKKn69xEqFJleXM+G6OSXpiuZE9yvQqxlc/4yqKsOM3MO6FGYvHgttpfuwddWt8ktR
	 rVxVTtNC+0NnwjJb1EdjVQxQW828i/Mfn0/KkAzOeXOST2elRScG57vIiQggagx+b5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3WGWLXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A663606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A663606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3WGWLXR
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac01ff101so763573e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795322305; cv=none;
        d=google.com; s=arc-20260327;
        b=TneySGDING2LUOdLIDI2ogEn6VhY/iPkTb8slsOcQGo1nbhZiGZk5yTdnYtosMUB+S
         eZEjbbh/XLiiFQ0WaomSBcu38xtHngRLRKlj8p5cYhLCnONUlZHXCFKvkvdoW3QODx4k
         m/7JUvUD8NqvqSQVbR93OiOOKZNeup+J+M8tvbWklbeeTXY42MRRIUruE4ZaSPmPrRF9
         hMnebQoHbRg8OeF8nuOvtkhGMrMadkF6tojtLm7v84x+cC8VY42ujLju4TxMoL0NaUy0
         jxRoM9Cy1TgN+7OM5vFL6qL+XxzhPyBOMWCkXBMqgfLvdOopPUoARqQk9fCqz4Wkidtr
         pUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
        fh=IFYvoHSV6EvDYIkclGzXx+XBx+mlVP+qsCSbtFvMTAk=;
        b=DoZmI3rNQLCjwzkD4MBmiXSaLvCOaUtsL5WrjXIG7hd1yAushAxfZzv8SQ9eTvqF1J
         nnNHiXDK3rKi4Ave1yNXQR0chrMI1rvoiznDi9gJEuy0UbaeLfI0DxIAghQIbLXgnmp3
         gPkyTt0CWABnj0S2t57Im5Qe8lTxJNVDZWEqoYDCONOKKe91ipbGwtz+euct/N2rPgp+
         q84JdJsGHOdCipiMUKTcyG2CzWJgpc5U/7Kr4eCBkkxQTY3LIstV+VZ2ZLG07iPOJogw
         6KjvTr0Xfv8Ekw9Of6SnhSm3Pw/mTuybn5Z0I+IeERkdLiGTrdMEmoy24AQy9udsgLZ0
         NcFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795322305; x=1795927105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
        b=D3WGWLXRlb760u99BuvqKLPSmSyTIARrbZF2AnPulMDc9J7iW8xNYnHaIlX/PHllu6
         y8iPHWf8RZ6iIHxPmxIgFAoCfVNnEkP1QddXcGgEZ9TFVwbyQflwOsAUkcUbXAQBKvg3
         /9RMMc0ki5bv5GFaQEe7mAchPFOK+W4iiExF6/i9584KCL5Vi2FdmH8LVAkFFFd7htBw
         6lnGS/FUof+4crx0/2f36UKFRGh/uv7sSXye2DIyAcrTwxBih00FKHyJ29vhCD0+hH7c
         /KhgmIdSEUNIeWxl6LxzKMav+2qjb3e6PsIwReC7VX9txEAWZFyDct15BIbCTxuyjfqy
         3Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795322305; x=1795927105;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
        b=R1RvehzmPEr6sLeBc5a2yEKW4Op4W0+GuEIn0xvg2MYPV6M5E8RFXpCM+RiJdh2dQO
         Rvq8gpvAAZl+wiMr20EsIevp8MsZhkI0lIqDuXcnWSLMxAvZnuNAq8Pk5I4nIFR11hxK
         mwdOy4HbA4+uo8PQOODCWzua9HrtL5duyhaDfz3MMHIOogb/nG93HQq4tBdCOiDjTLqa
         lvVF2AF23qF38mCIIzi5WA5kCjmmpGrGL4T/miP7HbKhVhrjrugYwdhBFSFgj/c0Njtw
         c6VUmJzA5PJWgfqygAAQOW1pWtaAvzBjvyVy+ZBCT7Q19heI5efxD1DxUjPKG3uZBUT/
         Og3A==
X-Forwarded-Encrypted: i=1; AL+hErF7fv1LVqo0r06zt1FInr/vV+cC9QDLDb1yXeYiNg2LowC61CE7vzScU2vqzrNrgXl18ftTunGfJWoQ5k0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SDQ3YJbBEuAoM8fyJlRyVixPMqAptQ3pavI3qNiAkRtXbS0Cs
	7F4Rb2ldGJej/5ozA4wLAL9D6qRo7gYX1h0zp7KP4y2Ehd+YqZ6azKR3zmyFNTTcooFJ8cGe9vH
	T7js7E6mYiHfazUC9Djw3lHaVC1HWBQk=
X-Gm-Gg: AZFdTZepytEnOlREkGOpNLHitF4n0TOhsGGAUOdmk7RVCtUohdfzR1/wTmaP7nYKr8j
	6emtK+OcTMrfwfytPOIXjZcdaTV9VA84RQ9/LSUmiZ4T45NPKf8F67BD/OZOvDcZrqIRORrCzA/
	9cqB9b5mP/brPRFx/JiSlAK6psSZDF+EKTpWzaKvYEIwJYoMPwkUuN0I7aU0VmeDRd+4ffuoZe4
	A1tXt21XIhaPyaY6DeoqPE6L/KChLaXOS2A36bsmHi8uL4gEowb0lMYLCQbLq5TfoD0iiXemTAM
	yKv2GCFVahUuOU4fiLPh1u1ipC/UgTxkh6sqoNel5UmpmMqa0V/cfeVr9NQGCXv/aa8hJiR7WFi
	dCyCIdEMiE0bdcu5jsuNadeQXgEh3rf4qqA==
X-Received: by 2002:a05:6122:1d06:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ee8af5443bmr3374820e0c.20.1795322305326; Sat, 21 Nov 2026
 20:38:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 20:38:24 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: pocj8ur4in@gmail.com
X-Google-Nh-Sender: AW_J_Uod95KM47pkpq-dZFuzVGlMdaYzEwbdtw_hT0a3ExWtQmsJIzWV8HpMK38V-VnO2ShHlEhKieQ_nKjAXXWCOwO5Le1W_nee80AGIi94LVccqEvLoGb5INkDeYCtMkkHnCo2_tvXOv7C0pndYQUZI2ReqJqkyXY6ReibcrOR2u7kxj8FZ7gZbXSJqWYsZzqWHd7UossTc3AwBbzYaQYjHUlSRHWdIPJdtNBYvbptZTmCoG3GblMVpXqnyTbTUa3VYw
Date: Sat, 21 Nov 2026 20:38:24 -0800
X-Gm-Features: Aa3M54pMiP2epFZY2GI-9wGf9Xn1gzxs1peuSoAwj8hTZNZgeW7w3bjKuaXMoIQ
Message-ID: <nh-fc54eb6a-a671-409c-bf5d-51ad5828438e@google.com>
Subject: [PATCH] gpio: avoid undersized array bitmap in get fastpath
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The array get fast path passes the caller's value bitmap directly to
get_multiple(). The bitmap is sized for the requested array, but
providers such as gpio-sim process it for the entire chip. With a
128-line chip and a one-line array on a 64-bit kernel, gpio-sim's
bitmap_replace() reads and writes two words when the caller has
allocated only one. The second word is accessed even though its mask
is zero.

Use the existing per-chip path when the chip needs more bitmap words
than the caller provides. That path uses a chip-sized temporary bitmap
and copies only the requested values back.

Fixes: b17566a6b08b ("gpiolib: Implement fast processing path in get/set array")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
With an arm64 QEMU/KVM KASAN kernel, a gpio-virtuser read of the first
line of a 128-line gpio-sim chip reported an 8-byte out-of-bounds read
and write in __bitmap_replace() before this change. The changed kernel
completed the same read without a KASAN report. A 64-line control case
completed without a KASAN report on both kernels. No physical GPIO chip
was tested.

 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0394c7d6279b..29c34c46433b0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3512,6 +3512,7 @@ int gpiod_get_array_value_complex(bool raw, bool
can_sleep,
 	 */
 	if (array_info && array_info->desc == desc_array &&
 	    array_size <= array_info->size &&
+	    BITS_TO_LONGS(array_info->gdev->ngpio) <= BITS_TO_LONGS(array_size) &&
 	    (void *)array_info == desc_array + array_info->size) {
 		if (!can_sleep)
 			WARN_ON(array_info->gdev->can_sleep);
--
2.55.0
