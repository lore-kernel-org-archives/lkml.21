Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364887;
	b=MjeJbd63uPboujejNkcTRSZ2es3mtK03gXE5xP5UDZooEfmGJWpae5OVuBP18O3Nn6Tn
	 T+b8rVDrpR/qaxHVHx+0FarLzSnLV3z+Q+BYaAVfdPnD3MQCGR1zgLqj8VQ6/9hp+TwmB
	 7g0eBrfqDsCzhvtg6B5SyJDT3+bOVaKdvQQXvMA/YPEvvHqYLJmV0ij+wChZWzmmiTkxM
	 fwvi91VapB9TZnIXjxT5seGT5VmGrKLKcYh5sxkACbrJABBVWv0iDb1JE7cFMUwclpglM
	 +KqgJwshku0mQAIN8KTm+pzhfC0X8T6RFVH1QN53FGv+IoV06uA1kPf/v/X9AzBy61w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wmw9kMiHkHIkNvmveX/rGow32td0mN/vuHA/wKKeVqo=;
	b=wVmbGOxhzEBf/nd5Vsij52+lJESRDQ0XiarlXTN4StHqFcBvAQmLG9V59/kSsi00oYk0
	 +OC151EDZQDy3q/tkLPDfg3kHVSElmVYw8sJqHKkcc4vkE3La8qqyjx+wy8MrASH99kht
	 tInV6XjehXAgRdNtvhuPfWFtxJ5AjWaXKli6458Sqdd6Z5wFyaibvswiZCguJkigQjtLc
	 wVt6G+Ox43SiGHXVUSz7LgCLbbZcQBFZjveY0qryr2CavNLGLwQxtojkh7q+Yp1BczS/w
	 cyWFT67/ZlParLkVAAxueWWM4ACoBI/EMMmFjW6XYGL4jd+XKu1EY8966+Ozy4L9HKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GAl1Ng02;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64D606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC64D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GAl1Ng02
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2010443f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795364885; x=1795969685; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wmw9kMiHkHIkNvmveX/rGow32td0mN/vuHA/wKKeVqo=;
        b=GAl1Ng02U0lZ/BOAyVR9esrJJalYpD6MAHcQ080WrV4nSsX4BPg7gAW9nCSibDtuXv
         67r7hgP/tnpSzgJNuGUsVX6UfckzI5QDXfqsLikZTBUvsRwsERjn24WvZJSKLsMAbpJB
         +SlvxJAIiLyAafb+jpZLHs9uarB2nYfIMtihwTEduAfW8sJ+SVQrgXEjHrhoOFnjr3oU
         IXL7WIvCXlwte5iMWVr5O0M8HqqnwkpZfjsS21Rd/CGNHTKAcJkJgxkWPnrBdo9ECJpA
         ydoW792lNzK0d6Q6m4QGCP9Cvrkrs3wX8H632OlFeHGp1QQbDktvCRgws+huU8H/hJrJ
         GLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364885; x=1795969685;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wmw9kMiHkHIkNvmveX/rGow32td0mN/vuHA/wKKeVqo=;
        b=q3pM7mARDqE9Vs+5ejix1h4yWEqIGZGCcIMekTa7eeaxwxr9mBMZTU7K8PGdqreNIC
         50F4BkNnQ1v4HmN5pN2h/J2Eutt3yOfjrNxcliNLMgOQKeXuA4lBg9eUBgjmIc7SevzZ
         8lRD9R2aqHGnd3/fTxsmofraFpvp44rOUNUSrNjAelDqgdMHezKFjQ+1HWamalCGKbME
         JTvDyhmuA6WEHeJYQ/kLRc1abz+FvmZ2g3g4a95WiGK0nBKOKel2R3pKph+PM19ccvQP
         SsQSg6FtBuUazvcmcANjhEQx90jbNzMbHXv7TnHfg1Clo1J3KxLdbhjfnUH1jP/aZfTB
         Le1g==
X-Forwarded-Encrypted: i=1; AL+hErGacsldy0Demt6bjQD5lZaspcTETcx1nqdW4EFyj6ZN0TABCOLch7HEOKSMI1Cbc4Zd0cTIET4Emmubtns=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VvYoKVjV+ZYdd/zQWc/rIL8esbDxEmlB1m/lKsmknX7O7sB8Z
	C53UXMF+dQ6/dLdzXp7vSNNvA+S8TQfOeHg0JZ0CSF/XeOGD6Dw8uEr4gOKSBz3toknizf62xQs
	N7IZysjB35dlU
X-Gm-Gg: AZFdTZdLTkxl14tQqklLdC9v1EvkviTwRBjTnsDWPb8rtK/DxTQf7P3kdI8T+/7iRmN
	541LPM0261moP0USgAIdmsD2xVG2Ohz4DggApNoLW/Fz2upMk7IRcFRGHvZSjZq3GaWleO1o5ka
	Gb5XSQ2dbxFUeF//OdIDy8K8E1MY3HdPYABOTppFy+aqHiL+JvRxDGCYcbwK5aVt8Gxabneg3hF
	/FuRyeyBlB6QpjKZXA9Rm/RuMsAYx4K3ElXXs1JmHtOYupc6aL8F05njOn96etuN37oUet6uFuR
	78u59p+8jxltJvDdERNqIhUoCwZq+iUuFbyF4/J8I9ic8RYh2mTf2W83G0DW8aI2RkQCqzxpzYS
	jrmKURtflxifvOza5PnpuKaNbMMf7jHNyH4IhQz9BahAfFJzJj+zFQvS3LsVzowaieyqXe7WsCB
	clyBeV+1SliDyXpiENWq56wNzaMBF8Oy9JILpOXsuhK63HwqrZRafEdVn2OJkl4M9savoRO6ETn
	yHQjdLUOdEbzog2pRlE8Q5ZgOGHSO9l73GZIIfVW2TtyeeBjDWF/EoP2bg4ag0NOhdDMMvg9x1U
	eGCM7ZfKJdUiI4YwDNYXyKlP4wucCNRmfzmCJfSnBPjvHqmFOe/mKAnuehrtoMFu4S55Gw==
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr188625935e9.31.1795364885287;
        Sun, 22 Nov 2026 08:28:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm17362811f8f.51.2026.11.22.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:28:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: vc5: Enable PFD frequency doubler for VersaClock
 6E
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>, Adam Ford <aford173@gmail.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261117-vc5-6975-dbl-v1-1-d332b89964dc@zanders.be>
References: <20261117-vc5-6975-dbl-v1-1-d332b89964dc@zanders.be>
Date: Sun, 22 Nov 2026 17:27:59 +0100
Message-Id: <179536487990.2728475.4863245677002258982.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ZJo1a9C/BXLQoHwq5QdRmDm3Dr2nuwnbw9QvlGUmVRk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMEkIprPauS8KnPmNqDMjIjI88ePDr3+Mfb/FWbyliP
 u/N71nZUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgInwejP8d5X+seNuku//lStL
 T6+5JXjxrSZfndPHrHkML8NvRxs96WFkOLIrofvAhoMF3V8UmQ2CzznGqURMLTgV9/632fmpk93
 4GAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The VersaClock 6E family (5P49V6965, 5P49V6975) supports the
> reference frequency doubler, but VC5_HAS_PFD_FREQ_DBL is not set for
> these devices. As a result, the doubler setting is ignored and all
> PLL and output rates are reported at half their actual value when it
> is enabled.
> 
> Set VC5_HAS_PFD_FREQ_DBL for the 5P49V6965 and 5P49V6975. Tested on
> 5P49V6975 only.
> 
> Fixes: 2bda748e6ad8 ("clk: vc5: Add support for IDT VersaClock 5P49V6965")
> Fixes: d8473831066b ("clk: vc5: Add support for IDT/Renesas VersaClock 5P49V6975")
> Signed-off-by: Maarten Zanders <maarten@zanders.be>

Could please split the 2 fixes so it backports cleanly and make the life of
the stable folks easy ?

With that:

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

