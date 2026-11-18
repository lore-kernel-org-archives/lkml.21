Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011427;
	b=QGaYQeCu/m+lVWJAvxrvurPk1gRu3Pt+key9OHRMqOOyP7UgIntCt1iVYRqTclNYR2lk
	 zUQhGWg3BtSCjksQfHQ7pKUMrhs59LTdrHogxm5ttA79LezNl3I9Zz/GLx4FLGP5ryX2v
	 pDmqZrrW/I0h3MO76g3fzgfqIEoHvQq1VkHD2+TpnOD2VeSxETL14+oMe05t/X9Rwww8K
	 eU0jI6OJPjF+nsMoWH7JnzQH/bvp1hXJpm5qTDjZ4ODXa+EcHvLL+umhvSNZ8QHh9NSvW
	 rIvChLogxj1oWXrGbYnBWS4/juObuVAZyn2gt6rMsE5Z7eZQM0cR+xxNgsp1Clq+nuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b34pYwhIMCotuo8i6v1F1rxLaKP3lXW4Z9fyRTfdjpA=;
	b=n7Ee+GdI5vSf3xU6Lqowo4yhR7F0O6/LELM4tFks6uRpc3DJEsKU5Ri6wrIBk7yPW6Fs
	 Jq3FNy6oyrO8/KfZLu3ALX4HYSOjrytVKEH4aaVsji1YkojMAv+vTl3kdHoI6C6RSHYVj
	 L2+bdn/8tssXNp+8ALSrAy0cboPrlvLSjBu9uRjujWkhkA2qWBu6FcLF6VLV5mncOBkbM
	 rm81C+T656HMEcRK4dIq5mWv2kvOMs14myfbY3djwFaU7L9OHln9ReWkQSa4f++0tHwwN
	 ctULurOZG88fWbkrjKSlqXP1yCEkeS6BI2jdbIOfrSL2zHgPNPw1wOpKSZWIk+ZDDQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwpEQ2Bi;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACD60A260A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0ACD60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwpEQ2Bi
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1219765e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795011424; x=1795616224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b34pYwhIMCotuo8i6v1F1rxLaKP3lXW4Z9fyRTfdjpA=;
        b=nwpEQ2BiyJzOgY/K6KL8CsKsUbtaIvzKrUXkCoyATGr0FA3sdNfjtAepVBzRgKdnzz
         8P8bTm2Eij1xtGat/HJ7k6Uzv5XCBA79Mi2zxZFRdLdxSndLo8b9eRz3ID1OwezpqKf7
         RRBO/k7C0kSFghrsE2yPx3VwRU+vWH+vZ6plAFbLHgMWtR0nE/f+JGDPn+IcAUNHHnf+
         lyG4YQoGKUYiC9BV64aV3/qDdY1GhCKP1ghJRV1rtgGXqC7JrRwKN9tZUd3myDRsie3C
         1i7gqOBjYTViooXM13NMXeW1OjX52710QfMEAJfbcjjm070/5fQtfbAg+AFdLgj60h0E
         9dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011424; x=1795616224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b34pYwhIMCotuo8i6v1F1rxLaKP3lXW4Z9fyRTfdjpA=;
        b=HB1IlPon4j0DVN/zWMzywTO3QXD79xcAUws5j3SsEliq8dbpXx2glV77J0VMxIGVdQ
         I9tg6MFO/yiGMY7Ysij3oTxZn2T89+Gw7USKtUA2/2aFn5Ojlsb5jWS/PIluJJGdXe9g
         GplCgzw882UHQRw+gvG2aZln8+U92Rgiq0UxZp6KYbX5zkgTghstFXRRfoVoMv4TUHCQ
         pbucSH0l8fb/i+SS6LeE8kb4jEiwPGHe+mn19oqHfgNGt6zQ2KstANAMsr6IZkAHi940
         YDhvVtD6833SJQZRlhLR2NQt0RVM6t4Xn4q8u/xAfdYV3w1tvxzbwfoK9mJdzkn929Zk
         MZDg==
X-Forwarded-Encrypted: i=1; AL+hErHzrvBwfrYjUB+0yDBJDqxBR+R3M19agEzsKyh4eIyip8mvrCUdXXVJWUp1lX2mbGsI0GItxT7adxlU4E4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BXiStkK+864Vrbmqajv0tenyIaDuEZCEdGVr93vD4S6QNsw9/
	FKVTChaigYwiXMOKB0HWn681mCjB3HE7V7Xp/p20UrYMKG2Fp1A8eHGD
X-Gm-Gg: AYBFou3mVRjdweRJiKBYPJuWBUyeQtflo2xlCTzVE4U+4KMfR+5fapeI1csw+DIF5L2
	7vhrj4L638OPTb+nUwuvTbCEVPOot/9q0VKFGE3qyzcHo5GRgiCo5EWDkARIrCKuT5QWNJXYzHo
	hCPrXZvvdzJGYSyMGDEe2Je5a/EGsJCdStmafODGoRmIPp910yZBjZhkR0yAOAe5GnbIt0g7yvV
	467WmgowNEQ2+GN0u1a3cOZsHoAFLmnyt3ftsiePIN0xHBZhJCj7fgPpzzGFKF51Csa9Bzc7hYg
	WcbO17oyv+emBu6z4f+3MY82H1h+ecS5KxvhxxVCaGfe4h5uRsWCFf1SO4E1l5X1tGVxcDQRf85
	zcCkIhrawxd9TTEBx3lhKd0/ww5PRcgF4YVOR14W629yFKJHgiiQYFcuDCUCKbWs9pbk2Dy++Xg
	w90oZbDcnPGBTrclBeSdDbjcNP6JPzDl2UPgXkpfJ5GhwMNZ1wE8p4wVgR/DwI9pjlETpbGwz9N
	R7Mj+2qTgkn36Rism+38Vv7TnCPaWBr7hHglNLh/Z/bODkbCrpnJLgrLPgNjrXr6f/Ebr0UJktP
	yluI7VkdwazvRWpjvId6VyD+F65EjLPi9xDZ7JOmXcg5ybMX+J7JAA9QhohlcH7jctlxyZKO7Zd
	SQV7/7oNY0g==
X-Received: by 2002:a05:6512:3043:b0:5bf:ce24:b1a with SMTP id 2adb3069b0e04-5c1aa072bf8mr1080207e87.12.1795011423541;
        Wed, 18 Nov 2026 06:17:03 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa7707b2sm553396e87.30.2026.11.18.06.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:17:02 -0800 (PST)
Message-ID: <c1a68be0-36ed-4671-82a6-8aafb1855c4e@gmail.com>
Date: Wed, 18 Nov 2026 16:17:00 +0200
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
Subject: Re: [PATCH v2] iio: light: bh1745: fix 16-bit register accesses
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117110327.198084-1-kapoorarnav43@gmail.com>
 <avxi4BBJ_Ztg-aN7@ashevche-desk.local>
 <820865f9-2ef5-4316-abbe-5c44c7df55ce@gmail.com>
 <av2PPiin8mJiJD_q@ashevche-desk.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <av2PPiin8mJiJD_q@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2026 13:42, Andy Shevchenko wrote:
> On Wed, Nov 18, 2026 at 12:31:59PM +0200, Matti Vaittinen wrote:
>> On 17/11/2026 16:21, Andy Shevchenko wrote:
>>> + Cc: Matti (even he is not listed as maintainer) for possible another pair of
>>> eyes and/or having an answer why this was missed at the time of the driver
>>> submission (from my perspective this patch is correct).
>>
>> Thanks for the heads-up Andy. Unfortunately, I have never worked with this
>> IC, and I don't think we have it in the ROHM Finland office (but I'll check
>> this just in case. It'd be nice to have this covered in my test setup).
>>
>> What comes to missing this in reviews... Well, I suppose the reviewers are
>> just humans, or if they're not, then they might have concentrated on other
>> important things, like styling, instead of the real functionality.
>>
>> On my own behalf, I was away for 1.5 months when the series was applied, and
>> I only looked at the GTS-helpers usage when I did my shallow and badly
>> belated review. (Furthermore, I am 100% human, so I might have just missed
>> this even if I had all the time in the world to do the review).
> 
> Yeah, I don't know how ROHM is big, but in other companies usually there is
> an internal mailing list is set for reviews. Maybe that helps?

I took a look to the Wikipedia. ROHM isn't that big. 2017 it has been 
around 21k
people, and I have a feeling (no facts) that size is still about the same.

List might help, if we had more than 1 upstream Linux developers... :)

(I actually did request a list when I started at ROHM - and we had 
something for a couple of years. Unfortunately, I was the only one ever 
using that. After a company IT-change accidentally killed the list I 
never requested a new one. Still, even when we had the list, the bd1745 
patches wouldn't probably have emerged to it. The get_maintainers.pl 
folks use to get relevant reviewers, wouldn't have known to add that 
list for a new driver with no 'rohm' -prefix.)

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
