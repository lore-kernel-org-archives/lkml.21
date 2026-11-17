Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937586;
	b=J+IiQRLNzgCu+B7BzQ5l2q7rUrQ3DU3JGvyckCSZlP4rO43Wx/nZeKlepWJvjLM3QAJT
	 skW4PKx17SO9w8wTMOZ++ceQAByFq9GGT58gel2rYQQ5L5lIWffW/u78IPcPLEfwJZJ7C
	 DEhIrJE1z66gNXMlnMfAtcaMooQu6vZbxTA8xoU/eGYkUSF/s3ZJni7fIZusInA4Anv93
	 OvsRJInlhX7V+gNTKNdm8StafFy/f1ZlaZwxK41jeo6Xx83OEb2xE8XaTK16dtCGTAQC8
	 VozExK8YfJifv9DG8gQ0LQrhGSCsa1akKJA95iy8swsT3nqM4cP/zmbewfv0rrGk8Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4hOafILIV+CVlRkgIEaAaXXHXtmDETAgh8Q4GfXqJ4g=;
	b=Te65KPZiIblPMnp1oBGyomPD942Xd4jheZD71nhb9xENwvE6rg9HAJmaRzqDjXX5U0C0
	 H3j3N5XmxkXYSKB2ncqX34tgQvUsP9B7iL+6EFID44LoV7pOTvAuHOmRdl+rM/xKZjabr
	 vnq5xbm3ZXuBCwZ0kdS3Lbu8KApAKtNd1VLVty2npxjYPQDXaARD1xbdiZqlvNNssrwIk
	 1rSMksGaz2KXH5W1DCHTGMRPgZrQkUql0sQJ/6asT8fAfO432Mwc7QwdBtgH5HIq+vObF
	 vY39UKZE3Hr8sllBO+EfYZaR4vG6uJRlBHtFpvxeLJTVzXTxyJkKnATDCWlIAOyNoRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8TNrY2D;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51620606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51620606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S8TNrY2D
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91eed03da8bso82137716d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937585; x=1795542385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hOafILIV+CVlRkgIEaAaXXHXtmDETAgh8Q4GfXqJ4g=;
        b=S8TNrY2DrGLtY+a6KQj6xzqDLI6asI7+F7/RkSkT5Iilrp9f/TqEqmTcBn/jFDjwde
         1Gnm38A+VZzriOwy+TXdGnABQSQQSBgWb0wfWBVPwBqg+x3LWgN63KEhkVfi05nHVpIo
         tS3wA+XhcZ9TfYK6gdFOZHTXvHFgQtmhThzSDlVrqA1+ZkbYTFgjdI9yqUcBrdeqhcBO
         ZlELhA7E5V3qta3tokiodv/iomoHuYYLBFrG2eaYsjnAHhQf6TaHAX+imRTviaK4H+zw
         qphfKQhp6mq2LQY2nfMNbyKD5LKM96QXharF5vIYbz0G+yCTFUAYTJiIWTe8Dmms7V/S
         WBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937585; x=1795542385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hOafILIV+CVlRkgIEaAaXXHXtmDETAgh8Q4GfXqJ4g=;
        b=fOOHeUpjltXp+iAGxSkyk6m2JK8757XYyLqhd7pH0Q0H+LhTs/5ISDs2FmeJZv6PTu
         9yPh31injSpNCxo/VkKVifOLYDZqMS4UipFVKeeQwNn4+TJUB+2iGS6ipN4JG1EfpqKW
         EpQSpJ1EzBEN9bWcLpNpGtqhCV5QgPjjiF/EF4QcqOEAiTKt03p6vHHhRIheOrMrhV7P
         O2LBuQzHj2jwBtd1psTTj8mUau4qfGO4TzhCljCJNj2SPQOnEc/rb90pa6FAeVPc2+kE
         QHuJitzyJCsJ3NrnU+g85TMKgaLZK1o788ETzY05dY8ww+sf4+u0FbGeGH8Os1LatD9e
         zKdw==
X-Gm-Message-State: APuU4Z8fLKLIGQD87qtuws1b5KkhtXCU0V4McyTH35UOZhO9uYhqN/ZG
	QurQwLmoavPWv5VjKNzBZMDQj3ZFjz/sj27zmoDtj/TzYzH7q8Hnfr++dF2z4g==
X-Gm-Gg: AZFdTZerKN5qK5qOM+qCrXN7oPPsMjV7rBeEaG0FAjjRDQlqcT+tYt97gwl2C781LmH
	3vfjiNHDweGqJLpYuVtyvuEL0d0xyy44rpi177GBBvtlcIeAeAtQV0mTQlD8TnYsgCSJYwSLyHQ
	TScdlgS2N76HjLpIMsswIRMwyT51J3/2mpYpdxdkx914tZ/doTaoiwI0Jepp4MmEl7Trt4BdiFv
	9AI/wGd6BrBzH2pQcb/4zm8pIw677+BqFWniizGjMrCjvH6x8xun7bHIJn2Y8Q/rSuh4X8px4Kh
	Kc+zpLxjrC43EgUJGQAs60ZrZjWA2JRmWoWzebbQiq61xVkT5OeMq7GWBuwlGqXmTzIuAkyr9Bt
	mdtGMyVU1y6vza0UJOorL0C1pap7eQIgHdAKo2vtpMdSL2V8KoTa3JVOw6ibFYT0rNDacO1nC/r
	nT6U9OTPuWFXhgNsV5hBcndL2Jpy6hl6qkeVeanK3ARIg4BmClp5IpiXDgX6i4//7AIyb6Mgtao
	tllKFW8RyRXTdhOzQg6AKwurgeHDcbgZ7x0GLZXBHkvCzys1z5/ivFCJWqrzRosChq2i9mBIc/E
	3Mym7n9btRp6xt1o5pvzzNyr0mQBsm43g1LqEQvZCJ3GeedY2NtbRsman3AvOMuenZqZF+ABsoJ
	R5S0=
X-Received: by 2002:a05:6214:2c05:b0:91e:dde3:f213 with SMTP id 6a1803df08f44-91f24264fcbmr201544606d6.40.1794937585252;
        Tue, 17 Nov 2026 09:46:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9210fc8f89bsm7629036d6.19.2026.11.17.09.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:46:24 -0800 (PST)
Message-ID: <ccee564e-c705-4669-aef8-e0ed284fb776@gmail.com>
Date: Tue, 17 Nov 2026 09:46:22 -0800
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
Subject: Re: [PATCH RFC] rtc: m41t80: Support SMBus adapters without I2C block
 transfers
To: linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>
References: <20261103225027.1248035-1-f.fainelli@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261103225027.1248035-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 14:50, Florian Fainelli wrote:
> The M41T81 on the Broadcom BCM91250E (Sentosa) is connected to the
> SiByte SMBus controller. The controller supports SMBus byte and word
> transactions, but not the I2C block transfers required by rtc-m41t80,
> so the driver refuses to probe.
> 
> Use the I2C core's block-read emulation and provide a byte-write
> fallback, retaining native block transfers when the adapter supports
> them. Propagate transfer errors and reject short reads.
> 
> Individual byte or word reads do not latch the complete clock register
> set. Recheck seconds after reading the time on adapters without block
> reads and retry up to three times if the clock rolled over. Return
> -EAGAIN if a consistent sample cannot be obtained.
> 
> Maciej W. Rozycki proposed SMBus-only support for this RTC family in
> 2008. The same SiByte limitation was discussed again in 2018, including
> register latching, seconds rechecks and a possible regmap conversion.
> This change revisits that approach using the current I2C helpers.
> 
> RTC access and date retention across a reboot were verified on a
> BCM91250E. Host tests with mocked SMBus transfers covered native and
> fallback paths, rollover retries, short reads and transfer errors.
> Alarm operation and retention after a power-cycle were not tested.
> 
> Link: https://lkml.rescloud.iu.edu/hypermail/linux/kernel/0805.1/1778.html
> Link: https://lkml.rescloud.iu.edu/1811.1/07408.html
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Maciej, Alexandre, any feedback on this approach?
-- 
Florian
