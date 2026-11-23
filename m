Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399079;
	b=esgdAu+pi/6yp+LpQY9qREk30U6mzxqEfkhU8bNhMSwxg9+K0Sq3DqLePLTSKXCa2tCK
	 pD7GIfD1gF+z8zK8whgSw0PS7eLorBBpS3+NRetH7x8EbjMbQifXQ5cdLAaXyrFXOU20J
	 P2cyBtsjPpP92CMk+Jh6qdHe/FfI1v+4nSrPy+5B8hW1B4JPieW0BEedSeolGVCSyD906
	 61Q63OFi0yLfDVUl293AR79o/eATNYXgM2du8INjY2w5qyL/3PQJWJKQVplrSfslhAEcp
	 +Mp/7DlNfBQUunOlY6hODyoVHF5haSMv8QR6oIWBKnYo57UEHxhl9beMblGf9+Q/11w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ezHR48+9BwZ0n/i0dqiHwyr6GStnzWguX/xPKSwudYA=;
	b=u8kHIt0m8n+B3oJ3euswatCuOmGhXPfC3297I10pQqLZX4rsAqSJrLRBmRU9SxIiLPyt
	 08GevfgMK9w7zpGgMrM34+3kGJUoTVqe+x73YI3zENBdVdY1bcX9Vf8RAKI97Z1h56OMp
	 fR0DgZZL5bRYGk/jAPh0dyMS5xm6h6KsjKgLSmoOXftq+BbI8da2tj2SFY5P30n0f79SR
	 F3/KbuizRKSKAQB204To7iVAoD62ycQlMLpI0s9EjpEk1G9bGm997BHQ0r3nblZfjULwZ
	 8KEJNFDePI3E2vh4Cw8tCAYKIbf+k9/w49qH+tCwfeoczgc14VIxx0YIrU2heP98/cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVXLSQMA;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC4606A320
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVXLSQMA
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38699cf08dfso2348376eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399078; x=1796003878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezHR48+9BwZ0n/i0dqiHwyr6GStnzWguX/xPKSwudYA=;
        b=qVXLSQMAZQUdwvLsyxyO5e4h0NaeBfaIJgmL4jY/s5YBmmgDPwPOia5qZV0daN0lLs
         UbNCMhZTJYzpxeZHvPtoOHBwftQqVCELbRhhUoYpzVf8aFFqJ4pR1dWFRppvhgxmYPob
         nLdyQPCf5di6lhai/0GMz3baxRyqz4UXzszm+ZAiKhkD6frX8vzF3y6Ki2iTvNFrhRSF
         z7w7dNfXtLhDpMRVIVVVWYDAvpq2aVbm9a++yicZxg//QiDCaJXyWwZcIkIipj29Ttim
         lhCjiLFBUJd1paCUlTNF3wXyoznMCCjw4K8HKMdqKzQ1WusB6SOc3ZsBqrc2GduH6HbG
         a0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399078; x=1796003878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezHR48+9BwZ0n/i0dqiHwyr6GStnzWguX/xPKSwudYA=;
        b=yhhOULO2MRdun0h0GtpehOjA4NIz5f4RUPiTX0J6eF/ACNNCpKgULdx4/KRTOURlzW
         VaX+4P1XLcQ1w3UNAAuIeaheks59BR7QliHovzKVTbHNpFKITa4+DWUjrscz+Pdcxktf
         ghO6xZgJkFbZxHBZrQL6ekQKugZ8/+q52LRqPmuIpYi5Avtcc4SIe82fNVdNCbJ6kQiK
         BDuIToQ4YlL6lxg3CwKDmgzOz+i+CvNWTkxiHdJGVXZ/d+2ChZCQOD/V5++BNVO4wmEV
         LBeCOQ+JS5MiIhnYukKr/RtH/4N8O5isNa1g+W7U3bQzcnQU8aWXF1RbmJF4LVcUtVE3
         5YPg==
X-Forwarded-Encrypted: i=1; AL+hErGovKLBj9Jkb1vqHy5WVqDxLn8EMyzlP/6bL4UiJBbO3NoRSojtdoNljOgEJQrSelaI21Eclbd3u5v+Tag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Bmx0m+lLcEl1CQlh08wGHahFxAgd1c2dq/OtSGRQXDEdbzUt
	hRJYUnz8uD+J3cm3jPlPNinVsFj5DQjGtAo+q4XyxfkBF4bNntW6ewLZ
X-Gm-Gg: AZFdTZdNFedfK9DNbzHJnLGYQ9c2WKEydMjQNc0oXLTzgFyfOO4wn85JbWnxu1Sl0bg
	BMH4e1n/TSKINonDkMlZeNWJdJPlsBHHQJdgGZVL+v+iekRqH/VAelV+95I1SVL42fNHICnXb6U
	0YAo2wUwu5gYiv5SYP+2Lxj/bfHl8oHkVTWnFWVqu9HAwc8AHVgIoBSIFc+x3zzqhB3jWQo6VjL
	X4ii0RigeeuCSi/LoHssDKPCtvPSRseGo61Wc9S8AYgok5j6+G4tLrpqnfHIMPj5Juwf4YMPRvQ
	R7alv7pSEyqr4uL8GFAd0awsN7pvsCtRHMkmr1bO+V0rjsraQkBOy63gWgPA11A1lMdl1vszzm4
	x5sY6w/+SwH+XJDDt/8B0mKja9B8Ag9hBNQmCe/yjEx7RxZRuUjK65SduYYnui3nxgfljTI+4Xe
	n1+XpP3I3v3msnHgAfa6aRi8OvsWiRQwrZMtnyXFDVCwVsm0Y7ek6kvqiQg+JDPSHqIgzBxyu8k
	oXrrZ9QNEtyPdaNeGULbqHwI2dl0qGfV+k1NdtUkEraozJjYzpo/gFa2gGZKeAhgKrEd9iepGm3
	V99Pss101GyBYDX+PDHfOo5mTsvGIWG3fJ2oZUxJz+yu4+QnyOuwvK9JrKeU4eszeoMVpqi2wqt
	i+EjY2yz8zEbp32DKvCXD7NQ0DN+bJgFTqkohBXLGANaUGR6/u+r5G2hZy6ftQyRbRpajU3O1
X-Received: by 2002:a05:693c:60cd:b0:386:98d9:d5cd with SMTP id 5a478bee46e88-38698d9d928mr8331670eec.39.1795399078400;
        Sun, 22 Nov 2026 17:57:58 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm25649607eec.25.2026.11.22.17.57.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:57 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Sun, 22 Nov 2026 17:57:55 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r2-ahmadexp@gmail.com>
In-Reply-To: <179538006772.3135.15875996486888374193@kernel.org>
References: <20261118-timecard-common-301f823ddd-2-ahmadexp@gmail.com> <179538006772.3135.15875996486888374193@kernel.org>
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

On Sun, 22 Nov 2026 at 20:41:07 +0000, netdev-bot+sashiko@kernel.org wrote:
> Does this still return -EINVAL for an enabled input that has more than
> one destination?
>
> The commit message says that without the mask "an enabled,
> direction-configurable pin has no matching table entry and its DPLL get
> or dump fails". The sysfs ABI allows several input destinations, and
> sma_parse_inputs() ORs them into one selector:
>
> sma_parse_inputs() {
> 	...
> 	ret |= ptp_ocp_select_val_from_name(tbl[dir], argv[idx]);
>
> For example, writing "IN: TS1 TS2" to smaN gives 0x000C. After
> ptp_ocp_sma_store_val() adds SMA_ENABLE, 0x800C is written to the GPIO
> map.

Yes. I reproduced the error against the previous candidate. Masking the
enable bit alone did not fix combined destinations, and the DPLL core's
get-before-set path could still prevent recovery.

The v4 getter handles input combinations after the exact-match
lookup. Frequency-bearing destinations must agree to produce a known
frequency. Timestamp/counter destinations do not constrain it. A route
with no known frequency, conflicting frequencies or unknown bits returns
zero, as an individual timestamp route already does. This is a routing
interpretation, not a measurement of the input signal. Output selectors
still require an exact match.

The source-derived tests cover 4,669 masks across FB, ADVA and ADVA X1,
including TS1|TS2, timestamp-plus-PPS, conflicting destinations and
unknown bits. Recovery exercises the actual DPLL core get-before-set
function. The previous getter and a variant that chooses the first
conflicting frequency both fail runtime assertions.

> The commit message says passing the index can "fail on ART". Can a
> 10 MHz request on an ART input reach this line?
>
> The ART input table lists the 10Mhz entry at 1 MHz:
>
> static const struct ocp_selector ptp_ocp_art_sma_in[] = {
> 	...
> 	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
>
> ART pins advertise ptp_ocp_sma_freq (1PPS, 10MHz, IRIG-B, DCF77). So
> dpll_pin_freq_set() accepts 10000000 and rejects 1000000.

Agreed. The selector fix was necessary but did not fix that separate
table error. I removed the misleading implication from patch 2 and
added a separate patch 5 changing the ART input frequency to 10000000.
The tests use the actual ART init/set/get functions and DPLL core
validation: 10000000 succeeds, 1000000 is rejected, and the fixed 0x08
default reads as 10000000. The old source fails those assertions.

Both issues are addressed in the v4 draft. Patch 2's expanded
behavior needs fresh review, so its earlier Reviewed-by is not retained.
All testing here is software-only with stubbed hardware operations.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad

pw-bot: cr
