Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617781;
	b=3NveEU0GBcz5dzycfqDBegSCvFQeUHTxCHrE2ozcNjHJZvcdknYT9nqPO+gumDMUu1tv
	 iEKth4omgnIxhS+bbYulnEoPr9RNXR5IcKO36sHxPNlTjd4Fxonbbi9a0WRuDKyUgTDq6
	 AMhFw7JpKkAnrWztcI22MFasiaKVqrdzYHjtGXWn3X9ux8WKpvRifqeMd21RP6xaHp7K1
	 oiQIW3jk9MHJR/f/G72YmGL9Pc8p4NKU0DdWmSyJcREI6kaAMOMmsT1C+K4jszGkQwCTW
	 Q+yM0mSuYHsTScAoOBi0+sbcoyQixqviqiT+UpQyymoHhHSh9UVLDBzHrqYyvoUBR+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/35ZT7tkGDk3Ixt2BLgjSRrFlCkmFPzwN/R3tpkcoUA=;
	b=sWyhLLbBUWkLgdeNBz5rI6+uudu1tg6QoxV2lBQYmFOL7eg1dgQS1JQuPODrBBL2SsZh
	 Ea27Y3aewYHqhWsLoHx4eLNg7Iqpa2LY9DtjxjJKWbgcd9mc6yZYfN17KeHYuL+G4F670
	 JsCy+8o1FtMoOe2ZQ1KNh5b8wTwRblWcARTwOWjQgvuqmmiTuDYcTjD1ivMdgfyPMmxmH
	 6xCty9R6SpnClsYJVKDPTrx8Sj7VUxSZJl2WiBTUNX/WMp2/Hvw/iY865OcfCVQheyNGF
	 rFH+j5Wi09Moti7q2/dAKrM1sJX/Y9OScHQFdC30+VQGTWirHun0cAALiSe6ZBRrdrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="extl/f2J";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E6E606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E6E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=extl/f2J
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso55522945e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617779; x=1796222579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/35ZT7tkGDk3Ixt2BLgjSRrFlCkmFPzwN/R3tpkcoUA=;
        b=extl/f2JmF+dJyf9e7Sz8XwAObqKDRZ2YbD9JT5vtwcT6zXb+6me8N2JZzCWWXomsl
         9/UxEE6X12IGI+eMckkKwuz0B1vEJl7AMthCVkwfafvq3qVl2ZMzp7lfHbbJCd324Hl8
         jEaGZpyK3SyC88pnDrhUdCd2stspvI5zxDFqrLSlgGnUSqDh4rs5YNPFUeXEa2MDaDBo
         SV6Hf1ZjL/ATKf+A01RgrncPXAbC8st7sX9fC2KiKnuF7rvSNU68/NQLgP3UvGF4dFq8
         Nm33QEhwDoiVI9tqdAx20XbX7b3gHKmMKnXotcs34/D+PcFx5r4M5i0gaBSHt9Satl+Y
         A7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617779; x=1796222579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/35ZT7tkGDk3Ixt2BLgjSRrFlCkmFPzwN/R3tpkcoUA=;
        b=sVQCEiTrwVX0DicEscevhTCNLz/nT3sgEqzkFvpEN7TmeMdSNBS3/uOVrVhjpKnTY1
         xFi8QZfsnbzpF2fvqMSlTWYqsd5XKCc+u0Owc2WK/utrwR87Yv+LEDXN29pfbloi2jEO
         Gyj/yRA7J35KlbvvXNncb+WS5Hqxh9SOTnUMNAK6pYz2v9ur0OEUsZSzt0rV3I3gPX4o
         6txTfqx2nb8PbLwcPt/rO+i2ReVBR1ZnKbyqRKmd78zjpa8ffCdmpol/18bL3Mus7vnX
         0Y626B+h8u9/JD3jhsYzJuFkun6VSf14R6Io3FegZafsiINO0AsJZdSyt9dtmpZffGMc
         yfAw==
X-Forwarded-Encrypted: i=1; AL+hErH0N71hk0UVTJinOvxELRnJrkYZmXVlbFNGPFzWq/iZyFRZiCyMEYeKHkAsSxrElBkIVP4cJD/tryMkBno=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yp6uEX9F1515dnrO7S50bWvPeEIOutXviL7VT7ri9gR4Yaa8k
	o7HF+xiCkkUCidYqFDGMGU+lovaPrxrB2+68Y6G7NebyQQSU1EPN7t/W
X-Gm-Gg: AZFdTZcsDOJ0MVtIqfDQF9X/Xim45VNZFVpnZLXuJlj6lLGmvYoK1GWfCN0JDl8ouiZ
	+9G1gW3X76SwBumzKe64Wad8pMyGrG2VQdTH34j54dcaJrtz1ZyGEpHT4cL4wclLaRcxiURyypP
	KfLP8IVPk1Y52ZCesUKtaU1N3/qoby2cArSoZLqs8i/JpGVBwmt0EUio49Cx8eDu5TL1wsBleW+
	iIALodNCWp4kOyRA+TtIiHcz+hzGLMFeQwCAAbRiG/hJsCqFNWjunTNbcfVXnYRjIuWZNjp0sx1
	GMLPIh9h+mfZFHPp/eW1eoJXiOPPUJ9pgUmiJwtW4vKcdpE1aVq4/Vf5vyEAg0jPnU1WvJyAxfC
	F4CEanxnchFFb/PdwNw/jCH2sTjUv79ryt8HAIKfWyj6xK5dNR8A9Es/0GteB2Y1CjlJjT34GEz
	HJDB4UZzITmjzu7Wk8kva05UWtQd8rCHYkxNFAvH6tO6ZWTP3lJ6zYDPW1L75eNiYDI8fSQ/m6I
	Kz9STtXmkVHON2S+BgB8Y0g3ej6mY5l9yPmLrnBhnioBhw7RaM9Cj7ONETCt1R0r1Pc8N/D1F0f
	hKxkcY9/qEXtN8bGmsLtbOOyJOoWz9xTCq4kbsytnzv2GuzAtX74X75qwM5ZkkmnP2VKuNvzs2L
	EFcQrpPxgTOs=
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr365655885e9.0.1795617779014;
        Wed, 25 Nov 2026 06:42:59 -0800 (PST)
Received: from [192.168.0.61] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm684133775e9.0.2026.11.25.06.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:42:58 -0800 (PST)
Message-ID: <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
Date: Wed, 25 Nov 2026 14:42:58 +0000
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
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125143531.GG191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Mika,

Because s2idle is Linux's path to Modern Standby — "look off / wake 
instant / state preserved". From ACPI's perspective the system never 
leaves S0 during s2idle; the tb_suspend_noirq callback fires anyway 
because Linux's PM core runs the full suspend chain on every s2idle. 
That's the mismatch I'm trying to address: the ACPI state says "we're 
idle in S0", but the TB driver treats the event as a real suspend and 
tears down the fabric.

On this hardware the dock-side TB host has power/runtime_active_time = 
515 s and runtime_suspended_time = 0 ms since boot, because the USB 
tunnels downstream keep it in D0 continuously. Entering s2idle doesn't 
change what the user wants that host to be doing — the laptop's job is 
"look off, wake instantly, don't drop the dock" — but current code 
forces it to D3cold anyway and pays the full re-init cost on every wake.


If you'd prefer the driver auto-detect this (preserve only when sleep 
target is s2idle AND the domain has active tunnels), instead of a module 
parameter, that works for me.

Happy to spin v2 along those lines if you'd accept the general direction.


Many thanks.

On 25/11/2026 14:35, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 02:26:56PM +0000, Tobias Heath wrote:
>> Hello,
>>
>> Many thanks for your reply.
>>
>>
>> On this hardware the dock-side host router is pinned in D0 by active USB4
>> tunnels and has not runtime-suspended since boot (active_time=515s,
>> suspended_time=0). The quiet host router does go to D3cold exactly as the
>> spec describes. The s2idle_preserve=1 path keeps the state that runtime-PM
>> would have kept anyway — it prevents the system-suspend path from forcing a
>> D3cold transition that tears down tunnels users still have open. Would you
>> be open to a v2 that scopes to 'suspend target is s2idle AND domain has
>> active tunnels' rather than a global module parameter?
> Okay so you blocked D3 entry intentionally. Why you are even entering
> s2idle if you want to keep the tunnels up? Why not stay in S0 then.
