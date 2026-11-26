Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708549;
	b=0uKwReWDeXCydo1lB7sgxjfrzK9fruDNCR7tZnY689fIzn2r7lV3nGuCQ3smzUWHIL2l
	 WG/CzZuMrmli2pM4MCiXaVW/V30OtiuETE36/61p+8w2ckgdAJIw4/aIMOAmFFXyfMD1l
	 CrZaR6hsvzTWzWa2Ot4xXvkh0OKhk9liFa287I7lCKU3wTPYyJzML+Nmcw9yO066L8Wa2
	 vXct+z02lZkDbCIIBuS3v2EpjX1/hP/WdI71OKSoG6jBlMOWsV2GRQntAeNt/9jquxk5+
	 xghS82U57ApBBcBSeLr8hwLLYSAp3wwIgPplo8X0gQDu36FaVuwAEfQB9YODV940tOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=W7/uRx1XsGqE/NwPwsGs18nZC1l3GDgC+9VtG/a4oBI=;
	b=fsZkONecS31wAjVCCwyEkGTPhhSSL+Y4FtZ8TUD6n/OiMgkHkjDPm6OV3YcvSpbjrzYL
	 X9Tff8STYkn7xEp0e4v0jGuqa6PJjrEYuC+Y2wcf/XuHhaFyMtlgMCGQTkschS2e9cCNa
	 bcHZTFK2oF/s/hcXhnu758TJhx0nnjw/A3CBq66OW6PRHaEChN33jkjE/aCxUPayTU54E
	 eMw2yA6aWeuH0+wpK3ca7tRltw1Mo4ywSCyE0qvbvThP7c8f/o9KwE0eUvYhBQlK33YW/
	 m/U/eK+Pkk67CHKwUDDAz1xrLyRpK3wo8zE0Htd4K+kVN7qKreoPnmgg5U4/o5lswlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="JXoM/IjI";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE9606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCEE9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JXoM/IjI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5606447f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795708547; x=1796313347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7/uRx1XsGqE/NwPwsGs18nZC1l3GDgC+9VtG/a4oBI=;
        b=JXoM/IjIkFTR0wTt95IwnzlhPZS5PjgTza4kU0lPa6VpqI9uVAw5IVoVEoOU1XsH6t
         az82g+pQrpJSHgegOzxa19pKFEluidDtgxAm3BzpnRUIbZnmt8QFztw6DVsJwYgdtstq
         XLRnnuNXnRRi+Nci3Zd5db/XOmPwrHzCK2tHmZz6HTCj4H8+Zbpuu+LlYjQLR/wye9Sz
         dgmi/SA8vRmQqqPk/xeOrcIotduAdtvn7yTWjR2Xsz+6J+FzKTMCseH75u/ZmyJ8zzt+
         UhV1sTO9XV774oldLn88JZyLsQP7M9fb4S8px4O6JT7SlSISQSZU+h51vprFmP2kbEy+
         WCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708547; x=1796313347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7/uRx1XsGqE/NwPwsGs18nZC1l3GDgC+9VtG/a4oBI=;
        b=rMdq3qXMEf/6c/aDwcxP9cYnOYjFPZi1KQwEZ7Odypef+YMpa83wEmvwwSHeFAKUdq
         feSV1s2WFyQ0Fvl7f9yNy8aa8fZw6lzyewYVftxJ3FouEPiz1WVKt8qEZthqW1370zvM
         b3r5k7eN1iMwIq5NDzOqH/B0koE1RKT/BAiT9Fv4rkLgpKinTAd2Qow0xhPWPqjVhqvb
         NUiU2VizLjsROkAQ7Vjhvp5AJnZuJedYuAeg90osfz0bRRTs0oHXs471y4nMt/C5XkBd
         gi/RTIgp2zkBVGcnIxGQS6E5pIsXzSu4E5A+k0NJmN9azO+lUoVaU60rnvOaJx4ATGhT
         nTHA==
X-Forwarded-Encrypted: i=1; AL+hErHrRhinkOM1FoKeC5wliUgBOrDcBSAjLDQ9b1lzCP/xGr6HY4vNhnWkA150k8xZKQic/rx4YowQ04MM9C4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6IgLwpHpD8yYJlT/HNuqrgtNLIj1Lc71UnPOV3uZIPqHbLEup
	+fIwn1zknqJ+0Eu9pILI5ZCQ6ctrfemINykGVMpEJxOJeCKopDYfM59NiqTiMpA5lso=
X-Gm-Gg: AZFdTZd3Tl4QjynL5WpEJRtRqGniDtJdV1U2nr/sGdGS8fgWruEWAxXawRdJk22H5Bo
	QAvSPramO0oF4iK5qgzJCblNtF4zoP5t1jYpJsGReZFyz7UN3SAy5JN58lypN7KqGb++MhkPlOX
	1h1vQ1M4js1AHCIg51yRsNylx36w6a6pw1E1gEiSqr3d+UxdbTE6oKHiv9iuQHkRyOcfwpszBZY
	uyL9hNfEO+cpcFncdUUbdMFmgMZr4MNZK2BFL+nEFslGxHn4Eo1Tv7Zu+oHprrP2DBbUu1yVwln
	OaHIR13h3DgFnSw2/Ulft5kCEGTz8H9ZOPbByRLnMTw5/snUx+hUycShp39mwTYr3jNNaaCUCC0
	0Gjq9oMACB6BZ34y89GfMKU6HSN0wuz+DZwmxP9eW2ktiYfI2dLWy1hxFLqV8ZwU3xrunBigLyD
	N3yyT6srcfDMKXH9bDTFqt9G3n4LSRsxMjERDxNfEwJm7ReoU2vrH5+ROUzRcfrjVE+VnlHsIDT
	hdicFYBvKT2oCm77BtoC4qRE4O7E8dosxmJNfuQxbKP7inid5S3cKFv4SgCU6juS5Ljd8YmBF9p
	M3wO8zJ4K0mB0GT4h/MVAVJOPWIKQzCUBpScX8A=
X-Received: by 2002:a05:6000:2b92:b0:4a9:cbb5:803f with SMTP id ffacd0b85a97d-4abb400a6c6mr28239649f8f.37.1795708547139;
        Thu, 26 Nov 2026 07:55:47 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm40824853f8f.10.2026.11.26.07.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:55:46 -0800 (PST)
Message-ID: <e113453d-4ef2-447d-ab83-d5baadf2be4e@linaro.org>
Date: Thu, 26 Nov 2026 17:55:43 +0200
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
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>
Cc: bzolnier@gmail.com, krzk@kernel.org, rafael@kernel.org,
 daniel.lezcano@kernel.org, lukasz.luba@arm.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
 Juan Yescas <jyescas@google.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
 <CANgGJDp02H7-wLv6DoaPMeiy4UvDUC2nvSR=+mngEZ+Z4Hqgog@mail.gmail.com>
 <2162b02c-642a-446c-973e-ca80607da294@arm.com>
 <CANgGJDrnH7R9aTXhH-nj710OjwNcUTfpxE7eWGSP=9a3eoUnug@mail.gmail.com>
 <4adc1712-3608-4fd7-9eba-79b129c67b77@linaro.org>
 <DN586284T46G.271ABU0A683IZ@linaro.org>
 <e329ce21-5a24-4301-9328-917d0ae4fdb1@linaro.org>
 <DN58TGCM0EUJ.2DYM0M51C78MI@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DN58TGCM0EUJ.2DYM0M51C78MI@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 5:21 PM, Alexey Klimov wrote:
> Which returns wrongs frequency for the situation described in the commit
> message and in this discussion => doesn't work?

Yes, it seems linux can't see the hardware throttle. I need to study whether
there's a notification mechanism. On a first looks GS101 lacks it.
Let's keep the hot trip as a last-resort backstop, as downstream does.

Will try to ask around, maybe we find out what the firmware does. I'll add
the topic to my todo list, but it's not something that I'll get to soon.

Cheers,
ta
