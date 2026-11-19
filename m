Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096126;
	b=CuOTUf4wnp8JDR1Oq9/BxN17bkQ9CVXOfwxJ++xB3JIo2WxPSzNixAkIWG5S04FpJ2eP
	 Ah30cgGbrGCKyjuHsU+s25pjC7W48+q4O8/BiKjVnPJJPWWk+yBdGdwcQrsCfOvb9Ndtc
	 i5OA4EpJ/JUBpoZ3UDmju21HN5OY5Z5NHNlVO8BnlP6z5zBLxkN9XWC8yyoE0Ed7b9e9r
	 3NkkHXdILH9pSZlNmm2GBOLOag2dWNset57/3XK5sSxpktxoh1UieSfIFh+h3WMWIFgQV
	 rK2unR7vMmSVUZswG0NYS4vM/7fZO6LVniqDdCdZdW1bXAekzNbqT541X/ouy+aQiiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BKa5IC7AB3kLyLATonakZgU4RKoDnILa/q6mHie7Xw0=;
	b=hmKCU21Tqp4QzvlSLA6DCmW7soWZEj1PDgcjQwdliJm7s99rmQjsLcT9Tadv/ibXVQ/Q
	 Y6RlTaiFmcxy6Mv2f+wrCvr6H9LNov2Al8BDuVicDeF98BtVm1PHqSv7PUsuWEdf0IiEf
	 +g+BD3MXQL4Cz71BrthOFzB7RV4rkCtLe24mF95MKp3sOFMX94HaSYqBqmBkJkA258wyg
	 MyHGv02CbaqE5Z5ZvIkfhIWXK1mnUKbV+T70OvL8lhq/Mh4Rxn0M7Cu3v/KLoso+8z5gD
	 7D4il53ybvJYY3iMGCsqz49+f1h9sZ1rlIM9SLh2BSWENTCI130SdF/IC+iy6r44akA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fL93sBph;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307B606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E307B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fL93sBph
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1313743f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795096124; x=1795700924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKa5IC7AB3kLyLATonakZgU4RKoDnILa/q6mHie7Xw0=;
        b=fL93sBphOCi0c4Cbb9loeHvf7xl9+2wRsGNd1Zkk7WfkZbs7Br+PFcCik+0Qzose8F
         wlV1I5nH3tgPGkQAjg5duPXqhqd9s6Z5vPkS70cjUl95yVpMfiZITXE70sOC05uR4Y2+
         9HpGfjPiT/IOS9gSLXjBLURHQaAqef92Op4wStEFvcmhJKQgepquUQVW1Q2AKUpo3Mv3
         ohdXw1wJRFURvNCMejSS4JWuDBgXTp64OvouZBOVWfNP2jUmu70SzRI+wCopIcp0jEBv
         NSdAW4mQQSZzeFSQ1B8E12+Rqrv7aFHAscPvQtj7FYHoLcuw9DKHXHW3KGGuveUZ84Ms
         JVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096124; x=1795700924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKa5IC7AB3kLyLATonakZgU4RKoDnILa/q6mHie7Xw0=;
        b=BtNzz23y6eKkiglj3LSv90lq/mdFEDJ13ryvvNSvGeEmLvZTKIhbT7Uvj3h/XMLWB7
         J+GZin+vDbGvF4d8OyeAXqOX5U0h+PHylBZYk0po/+rtKjSDhar+/hz6XbBFHz0RDzx1
         15G8P1qq+/gtJ8oZAEop9phpUHivq779Oor9WzMTFT9YMzPKoCWgK3BCf5VQXz8qA7Hg
         vAIYZ2YKowO3d3sq+OzSQERMtn0BC5Oefc3/WamjQOwMQQlLcjvYCj7+/vLCdxgkbsgg
         PzM9p+ZyqEshwF3WWk+GUDqNVb++jgDbGHMIIQfc0dY3N9wVj6eP4rWhgZWuiBoNtXlr
         eNGg==
X-Forwarded-Encrypted: i=1; AL+hErH3Uspw3eL+SGHCHt/dcN8aTa6UPy8XW3WOGnpF1C04jkX+rnm8NuPt1SwfztRC5y95U1H3AI7v6HWUq6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SrS7voSyQDAWQy2nRC1p400BKo/64HNY+kOI2AJnJwmQqJUgj
	bQ6812/sakdeGDQlfy7bWU7kmTLrNKbHVD906sOkAxhW72Ny2eznfY7VjJLCtugktMw=
X-Gm-Gg: AZFdTZeCfhNU17elsPfgXPJmIfRgg0ivZSOlNvI6dwwWHl39uYuH0qlVLN5Jj+eP8yv
	AbY9QXYQt6GZBE9aX5oVTmztI/ubahwpL/RcbN8bE9o9aAJ8eUPFM6hEAslT+2k0KWfpT0HKm31
	9ERZzzX02zhfskHynMyeJol2BUGTIBgiMfHkFDbopzmEyT3EzmuI4AIF0WTw007feN2We9y+Wf1
	Qz1CS3wsB+/4iR6+s/y9stG+kI00rxJdcX2aWdFLjblcAmclrMRZkMp+Ext21q5Sz21D6VaYon4
	fOPUFq9Rx5b8YudGNGYgp7EZg/ac4Rnlw4jfFSdp+TsUxP58uyT1n5SB0Nqssl9GQz/CS3w4wo+
	g2U3eC5W8wiDQbkkEP4ANxValbaWMQjrA5oiHWQchdZxjF7gfcXc5vWKbYDa9qnS4NnDxNz5ef0
	00nMqdG+2v97PfN7fzAx1/wmgQW4etZfnp1jGO9r6fntmeNhxk/bn8BK2BD5NjoyK6lTcdFmPLx
	IG/oCUlx/7x4ImfdwhU231yHEn298Q3lpHJHz50FGB6W11N/KMc0TqqEdDKWH8oZn7OTKGfWWJq
	9U2/N9uCBdN4KcPR9F9mhOCclI5C61yz8OfdffXa
X-Received: by 2002:a05:6000:613:b0:4a7:45a2:ec26 with SMTP id ffacd0b85a97d-4a745a2ed63mr12002121f8f.16.1795096124130;
        Thu, 19 Nov 2026 05:48:44 -0800 (PST)
Received: from [192.168.0.252] ([79.115.63.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm10932012f8f.36.2026.11.19.05.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 05:48:43 -0800 (PST)
Message-ID: <96fb6324-7563-4d0d-88d8-cba55b92eebf@linaro.org>
Date: Thu, 19 Nov 2026 15:48:42 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: samsung: acpm-tmu: Fix spurious CPU throttling
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: krzk@kernel.org, rafael@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, Juan Yescas <jyescas@google.com>
References: <20261117083442.830549-1-christian.loehle@arm.com>
 <3ea5d94b-6913-4534-816a-3935c689225b@linaro.org>
 <56a7a762-7667-4186-973c-ca0fcb399ecc@arm.com>
 <b2b0ddc6-964f-4d8d-86d4-a0bc24d9022e@arm.com>
 <4d51fe5f-d233-44d4-a50e-ef168b6f0402@linaro.org>
 <2cc6efc8-db35-4b40-ab71-815f08ed9dc9@linaro.org>
 <a1c4e409-2d73-4689-b136-41825ee2b61b@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a1c4e409-2d73-4689-b136-41825ee2b61b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/19/26 3:24 PM, Christian Loehle wrote:

> The alternative is of course to just hardcode slot 7, downstream uses 115C
> as a default value (supplied by DT trip point 'hot'). Or do that as a fix and

I thought about this too. The problem with it is that we ignore the DT value,
and downstream relies on the DT value too.

> then follow-up with a proper wire-up? What do you prefer?

I have no preference. DT was queued for next, so nothing enables the driver
in v7.4. Maybe that's why Daniel queued the other fixes for next too ...

Cheers,
ta
