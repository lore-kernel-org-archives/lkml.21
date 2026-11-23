Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437995;
	b=Vr3eLdk022xAvsawvAb7zvTaPvTLvIkv9YuwWc8zE4OnK6yK6xFkPH0GZPex6Ed6lmjo
	 9v0MJ3zRo8o5hc5ENRH3WQd+qcuZiKJL/1sMonCxF3S+YIv62FGUDs49/tDrXSsYX83wn
	 qP0uVBjKNa1HWCHEJmT1SDkOfAok1b2OFEjdde1STpFFe6awZLcKXCsSnThvT6sPvhwww
	 pX8dPDYxtJTMkoaY7IehxNusFg6Ra+5CkIiXewLtYopdbRcjydUFmain2ZaGbPAO6rOOq
	 o1oRwZFHNYM+BzIA1LNhoPWxk20g4NNTWB2EJX9eKlB7Li6AhDk9pFvgC+cD0WbhIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:From:
	 To:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xljfEW1ARtv9O5fRWcQQ3fcCIsF2gNs8iXKa4wamXZc=;
	b=r9xbXr9KCM5jyHpN/TRHlTvxmSqyuzCbbIt5iikWg5ioHt1TBUTztGOas0Nwc/zX4Qpy
	 vQewf5QEHk2j2G+I1ADFeostqdGQT2stut+REcPMnKj1wLGbsERt4J2TgUWlQjpNidUMv
	 RuZ2IN5mQsdD+QcmcXY9ua6y5O2/6xy4ZnZZPsmhm67fC1Nblq0zPPQHiIerfF0yU5VrH
	 igJWt83BPtrCcUNEk+R6rlSeCVGFwSSRLKp9oYuOL30QZsRMf2y2yWuEZnFovdBcQ0tyg
	 7s8xNOC+aWnN9bqyWDN5JmNTnitEyNmsCnm/zwD7JLyKWH0iUranpX0VbEG+2n19NAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GJVK37dR;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BAF606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BAF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=GJVK37dR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so3392625e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795437994; x=1796042794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xljfEW1ARtv9O5fRWcQQ3fcCIsF2gNs8iXKa4wamXZc=;
        b=GJVK37dR/Q9siyKu+M5KtXAt4XhqexpGLl+hNEL9JqcddI3JkinJ3I3nfYnfLSey5K
         7ktANB7NPwGSuSqoUgbhMSVgtxc24op6IxqQ8P2bWCnZER/77L9pgti0UttXuvFwsVX7
         kB/gATBIYMCzf2UaWGn+3p1+JzrdZuQdDs3O1Dvrr68fu4ustwKfW13Xvvw2qbMOu0gI
         /+ORJl8glpzDnCRG8tEA9Tg2UVeXfYMW+p/jO0PHc3DjW3G6DSdA2PGXBdG/zNNRqC0c
         xRtpzq1B0+bXGgmpka9BCPcMdv7lctpyZLq8gXsM4uH623uJAhmGrSKQic+2/J+AoXUl
         DhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437994; x=1796042794;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xljfEW1ARtv9O5fRWcQQ3fcCIsF2gNs8iXKa4wamXZc=;
        b=uQe4Euu2sf5tCk2PbUBv4WlHga9EhQ0uAuKedXjVFQZtLFqBvz7MLec/9pnydMRBWe
         9QeXmqqeZ5siW8FWWg/hCrNXFwlM758O4B19uKAhbixcsF3ADb7rmM9RPrrV8tJ57qV+
         +owAyUPef/RJk/irS8PSoIprhQCeaclYzt+Ryd/tYaiZOqvwgc/shg9b6n2gXzeVQSoS
         BXuV7R2XjO5V8LDNqCQbfOEzGpXkrk0zzXv1m8FtbydM1DgJo6FFlw+7Qd0AGfo5Ypkb
         vUFlAmFBJyw0/gCgIRO2C6dFsdCqIinFeFVwyw0ZHJZe/vV3h+eZc8Cne/Zju09zmh1Y
         8G7g==
X-Forwarded-Encrypted: i=1; AL+hErEtQaOnIN73y+aGyAl1Tcgx0yTiVbWw0CJCgFPjRtGhAOzKH3tedIDTlcVv5RWAO8aGPQWPH7ci5/8JIKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8syKWnWczgX8oL0xjjU7HuO+K/gVyg74cQZyaCdM25nueb/oS
	HYMy33rxW/WDTa65jEotFkoCTIE+Okz68ck1/km0Nq/jWmSbsbw0mtzotSCsXDpIfHQ=
X-Gm-Gg: AZFdTZfvsp0Kq2BkJVuHKf0vKFbPoVGwW8U2NyhmThQGpn5Yb/JV9VEHEbR376EvJVP
	s+I2lCNiTnZpdAjP1xDt56pVAe0uWKh6eodVAtAF+XD3Rv45yZE9sS1V361Y46a2ve2hdNHsYjy
	krD8SFPmZ/6g8oib+ZY5iw7ybxFeyQj7vXo69F3sIAP2CaiLBtP4BX1jQPXCeXCtKkobkHP69vG
	te9uoAHlHmDjmPU7Taav3KJqnNe+chR2O7lNl9eYhbumJ2uFlacQhtwogwu2RO4cgz9APMf1CoB
	1kakkgm/meo6zb1tlnlzXdZwACXrnMA+k9Os2s89OJw0XT0J9lLV95Z9rX4YLF8aOSqf7Ijoosb
	KkP574siZt6hNL9GBkvR8vmja1ylrk7ia4g1HOtBo7BMqoB2DJesA/YMX4lezlXPL8P0U+k0w3E
	rlZggIk8YNfoxF6GK96AFCrDAwmUCXU0Evx8M6BSk4ZADo6oCRWWDZV1xYWAuTjA09AtjPcgnFH
	xtEwfOalLm+xdmlZVoNCAPqX1zB9Jqg8k3COTp7MyjEz+Ne/Yq8VqucJcnJVXkTkVVpVedDKyjZ
	0awvWtIGpzRK3YlTdTqdaKuzNiGQdtm/wycVq1EjpjSUHVRhr+SUtrs3tU3E/o5y6JHCUzBrAcy
	T5MMc
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr239666355e9.25.1795437993515;
        Mon, 23 Nov 2026 04:46:33 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm399417215e9.7.2026.11.23.04.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:46:33 -0800 (PST)
Message-ID: <a0180b86-cd27-4a1c-af55-ed7ff09d911d@blackwall.org>
Date: Mon, 23 Nov 2026 14:46:31 +0200
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
Subject: Re: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its
 type
Content-Language: en-US, bg
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.271186140389290426@gmail.com>
 <20261123032537.GE10218@Liu-laptop>
 <179540710966.3093990.1416762538136490909@gmail.com>
 <9a533d71-7c7f-4946-9f5b-444db8737547@blackwall.org>
In-Reply-To: <9a533d71-7c7f-4946-9f5b-444db8737547@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2026 14:43, Nikolay Aleksandrov wrote:
> On 23/11/2026 06:29, Kyuwon Cho wrote:
>> On Mon, Nov 23, 2026 at 11:25:37AM +0800, Hangbin Liu wrote:
>>> Hmm, I personally prefer the approach used by vlan and team, which disallows
>>> changing the slave type after enslavement. If you think we should only disable
>>> the 802.3ad-specific part, this change should be merged with patch 1, as they
>>> address the same issue.
>>
>> For net I would keep it to 802.3ad, where the type change leads to the
>> out-of-bounds read, and merge it into patch 1 as you suggest. Refusing
>> the type change in every mode would also make the enslave of the nlmon
>> device in bond-eth-type-change.sh fail. The test would still pass, as
>> it does not check that enslave, but it would no longer change the type
>> it is there to test, so that change seems better made in net-next.
>>
>> Nikolay, would you rather have the general check?
>>
>> I will send v4 with the two patches merged once this is settled.
>>
>> Thanks,
>> Kyuwon Cho
> 
> Since this requires purposefully breaking the bond with CAP_NET_ADMIN,
> I'd go for net-next. About the general check - unfortunately I don't
> think we can do it at all due to one, rather weird, use case that comes
> to mind - nested bonds. There are setups which use bonds of bonds and that
> will put ordering on the setup, potentially could break scripts.
> 
> Cheers,
>   Nik

On a second thought - the bond is ARPHRD device by default, so nested bond
would affect only non-ARPHRD setups, I'm not sure if there are any such setups.
Just saying, it could be a path to stopping all type changes after enslave. :)


