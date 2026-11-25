Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619460;
	b=sfGActgqXRgTCgZZz61LqDPREpsGMkR7h0MuKxU304u6RV1+SuRfwhhAtWkmWDn9svUO
	 jffK6dEcQZEei/XnjJTh572kaTEkvh3X6X+64H/CO8C5eZ7bmi0RcsjncBQFaqE5y7Inm
	 JYOslhV66l8oPzeWyEPp+8BoH0OBm7X2viBInwE3RbKfaJle8dgdNldXXYHqFGahc2l3K
	 vqjxNnffDhDwjm/MZD0PXD0YtAHDqylwcONai8jRc2iLlrYMooUna4CX5C5A6CkVtfOAm
	 207VA1FgKoQN154JRP/4Sz8fCwQkJH5UP3lSoMyOX5Jpc7Y+pvWhrdwn3PkCiry/YJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JwlPeECvQEEIvvkRP2SoNRScUU29bdxsw2mOvi0iroI=;
	b=J/c5iiMk7FtFfmmXzcxN6+2eMOMGvxf6iJ+Dg4Cf7dnLwgQicaYUEzbm0O69etgCOsRl
	 aT8l1LfZ5XNlYRcSaSgAfPwQv5k3KUPdu32ANW4XxtHPxHqa6SCRl0R1ddkTQ/JdvKdH7
	 DADhibAEfVycU1or/Wre8TgaJvQk3MLJ6Ak2ukeJoVaTOBcBC51bukPUuDI6Wdhnuma5X
	 y3+VB4tFc/ztf4JpCHoPuHe6S1PdYoJhigI3kn9leWyxUehfw2LV1VuqamlvK3N3NFQYu
	 jpWwjxS0jhpTQjWF154AiOjkeOLFX8B5Phvps8yhdA52hyo9I8VdTfsvsqCDk86fpRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pvgO/YEk";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643C606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1643C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pvgO/YEk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4817408f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795619458; x=1796224258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwlPeECvQEEIvvkRP2SoNRScUU29bdxsw2mOvi0iroI=;
        b=pvgO/YEkUdlTI28zuYZC8bFmQ0ov6Ytr8mgLvhlmdjJrFmun/YQy/s9ogNGEO3ScvE
         y1yjxZFDIf0mZkflbv+NqwdMv1WaH5epqxsxN5igi76syFebxcbfpJOqB75BGxQKCSvw
         ebLE1FXNu/ZtoIfutYBQOfokYl5xTtUhRQj+b8VJ7pNfWSwNv6xM6cOaIKoqFF6y7Sqx
         MyuaLImm4IKg2FypDwXdX7El2lpChRMrsRTrDNzAqJwkVhnE+2rm8VWe8XNLMHWzVGzB
         q3z9B5LxWMyh1VERl22N8/nBkejYHSL96cRVXEz2ncfq2mugX733q6F4Uuvwkf9LoyfJ
         e9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619458; x=1796224258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwlPeECvQEEIvvkRP2SoNRScUU29bdxsw2mOvi0iroI=;
        b=y7W79ZrRqUxRdC+haRi4YL25SXtDsmHCNgn6sk+f6T9YO03mz+2TFNpD1INO8CsfwH
         ZeZGXU1xzPmwgzq8SyG4A5pl/V1lRFdDDhQMs+wNzyic7bbhCGbRKq3zr8l62t5ECYnF
         JCRWDB032hhvRr5MfjGU9kTELNBmYNWTX1ua9r364Y7oj2jUUthqeML1ZmTAmaURFygh
         IrDZX8uS/iXbDnBSfJTXc4cWBiOjqT6w0nTrCGIUwp0Q3Dr9Q/pzyXafF0fa6TD1VRKL
         6wKZpQW6SuHg/94JPDplgNDhngPfSpAP27GTRzEA8kgTQ9vzboLlwObCCdmP26HxLwnq
         Y0qw==
X-Forwarded-Encrypted: i=1; AL+hErGhU19PAhhtRR2gGfn2CT/9ySR8PbfKc229DtLs/+bScjQqR7DkYYLS2MuMwDA44R8QgP8J2sPzFIs3q/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/pMm8AFTRhrl6Ww0/qFyte1x3H78AxZqi0GdvaxBZn3k0kgWZ
	toEPORmTzfAwtC//p7kLYOXj5RS/QQI+QOYSBfhgAdBrUn5BVsnxcBn02LxaeYRylQQ=
X-Gm-Gg: AZFdTZcpTA5DFkUP562CVmEiOYhwPJGsSiZHrSCOUxDiBdBB5AHAVQv9B9m9Qk48lAp
	qcRiwRh6j+p207Ij95VK87OWDwksCCbp2QT1ZW7G3OX2bqIVhqjmpa3GYKo+BRVCckR1zi56+yT
	M1bapCQM6aNlxpAv+kQrgoFxh4YloJ44YlRwVPL9CpKWy421yZKMGmn7QylHyPRYLIFjjrZ16pB
	PI8BljANMj6fCkWTaOA59dZIzudskx16MXihnticKQtiu/hHRFLfNQ2W/uI0aCz4sL2dWQpj1Tj
	IoYRDPtv1dP8uIdgz7diR3Z+ifjLlGojRGn5WxLByafMiWYCpt2ZND+ysJM7Kxew6KIj+1YtlA6
	acGSOlFm+AlxvK7KvilPKD3gTK5pe+n3Ddnlsz6FJyDMt5nmelVqQCui6egHau1xu3TqQB15YDl
	l7LBJ8ax09Iw8ySIn3tEJKgoEHSQNBDcfSb3MXua1RiizjkimjEeVMPUAWCZk8tnxNAsEr9XnUG
	GqfoHTlHav4jaV68+gKK8SKEgvt0C4iHHRjuZloTPlgDs/86nKqTPJLMeRoY2w5w7fPzS9/fHtj
	W2TLbzxNA7j34qlcyyLyBxs4GTNg2k4hC1RWW44=
X-Received: by 2002:a05:6000:470e:b0:4aa:323a:d7b7 with SMTP id ffacd0b85a97d-4abb16e310bmr35276861f8f.23.1795619458249;
        Wed, 25 Nov 2026 07:10:58 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm33656875f8f.40.2026.11.25.07.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:10:57 -0800 (PST)
Message-ID: <2b369a93-d20b-4df7-b667-1775117e9470@linaro.org>
Date: Wed, 25 Nov 2026 17:10:53 +0200
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
Subject: Re: [PATCHv2] thermal: samsung: acpm-tmu: Fix spurious CPU throttling
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com
Cc: krzk@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
 lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261124132756.1306906-1-christian.loehle@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261124132756.1306906-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Christian,

I tested and I confirm the CPU throttling.

The patch is looking good. I have a design question please.

On 11/24/26 3:27 PM, Christian Loehle wrote:
> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clocks
> independently of its interrupt mask. Setting it to 0 C limits all three
> clusters to about 200 MHz while cpufreq reports the requested frequencies.
> This was found through trial and error while tracking EAS regressions.
> 
> Program slot 7 from the lowest active critical trip. Cache the low/high

Do you think we shall program slot 7 from the hot trip rather than from
the critical one? If we keep the hardware throttle and linux shutdown at
the same temperature, the throttle only matters if linux fails to shut down.

As you already noticed, downstream programms slot 7 from the zone's last trip,
which is the hot trip (115 C), there's no critical trip defined in the zones.
I can't tell why downstream misses a critical trip and why the hot one is
in slot 7. But I guess it doesn't matter too much because in upstream,
the critical trip doesn't need a threshold slot of its own (we use the
low/high window in slots 0 and 1), so I think we could use the hot trip for
slot 7, even if there are critical trips defined.

> window and update the critical limit from set_trip_temp(), because the
> thermal core skips set_trips() when that window is unchanged.
> 
> Suggested-by: Tudor Ambarus <tudor.ambarus@linaro.org>

thank you, but it's not needed, let's drop it, I commented only on the
implementation.

In case you're going to send a v3. I guess Daniel prefers the subject line
as "thermal/drivers/samsung/acpm-tmu:".

Cheers,
ta
