Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032061;
	b=vDgLPaq4O4I0qn/tT7+zNAoAwlf/5BiTGxpwxSvBX5HOZ8QEiVfyoypsIm/OSBKg5x7A
	 p78JdELuJOcoHji0U/0Ybha0aQR3OuXigrp2Aq0oyJjeAKZtXDGlEiV4OYRRuHdMAuepR
	 yl/7Lv3dZCctDwyQmBEPxrIDfGcCU9uM26AVQBD/w5WKpuoyEtgHiDvcNDDgIR1UQreyc
	 yXbUlg8kQdY8/cZfVfAagilkw+Gnk2pEyzsYpWNA+Yy74/XAfmWcLf1tpUcZvrLGn3nNc
	 3ftSZlSbX1Gt8rvJr/rUpG6Iqb6os+g79YGg1cGgQp5pYZeCvWW1Z4ROY9CkXsIgPCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032061;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Lq7CkMmJuQwZqEcazQJxvDjFuUJa/sZrrdXPNQLnPGg=;
	b=yhEGkmGsNUPWe1cx6ID0umEqS1xIr1i3/YFi31v6l8Q+FTezzANuT0XCDlT8Y8gSFk+4
	 DKGUPF7WotjQJlVRrRgmSHb0j3LwHrIcRrxge+DGjqvkB8872qWATzy4UcjuVGPWllygU
	 IdqL1DUtqz+Hx2yRlmnR/McIQcqUFjjvQCSVmoR7uyJo9iuWs8bM4sLFTRjMmjrjwyWSk
	 735dB/gSGjXkHmujZaH/GITIPYmEeyijMHlkUqoCCsXjvacb14aYVJhGxPhDNiZ+w8d1e
	 YaVLxivI23bNOvt9WRfo0s32YYL4amt7O/zm5AOoku/TG/awS3cSlmNfqAFv28gK0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e15EBQ3U;
	arc=none smtp.remote-ip=74.125.82.100
Received: from mail-dl1-f100.google.com (mail-dl1-f100.google.com [74.125.82.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF3E606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF3E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e15EBQ3U
Received: by mail-dl1-f100.google.com with SMTP id a92af1059eb24-1438d9363fbso99218c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032060; x=1795636860;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Lq7CkMmJuQwZqEcazQJxvDjFuUJa/sZrrdXPNQLnPGg=;
        b=GmurYdtvxg0uW8VYjA+jcwS2uc7pZebB7tNzriuC+sdyLK+8I0orXu/7hK1T6LXNjl
         j/Fhme0SJiONpG5wgTnpcPB0CW4gpdczfzyxtxerdU7hAJC40+pdbWrqcxvsrO4hxkq5
         j77Mcf/hMTD5dT63SZJTvzqzhaAAaaXnfa7ygB8j+uNIMCzuamyqo6K2eEeZdSBNXFbo
         mnNZX3OtAIAl7lGuZ/DRGfieE8P73QYKDYMWcZ0XhaOooMhDT4XKpyJWaaf2PFte3IUC
         YXEpwvWHT4yrrKosb4O51oc2C5ieP+K1pz3i6F+TOHyKgQ9cIPT29fGJYD5H/te+zMS7
         CF1A==
X-Forwarded-Encrypted: i=1; AL+hErGs4BOR55DV5sMM/KF+5IEkGLxBW36xWtxTSKxsjuf2rZ49UJYxqGfxmF1nN6v8nfcNv4ydqlKj+OjT2yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+AGfKf7v7wVeSCXKvXRJPePizcIS8I3pNEktpGzpTkcrnur9v
	hBtlNYiyP0DYLjYfU5X3A1+28TY4jQX96p/59Kvd8b8TTi/G7iRYAPxXBmwPZeqjJ6ImU8O4r5Q
	xcewkYUXPyU1Wy53JqLn67GUmxWmXRrX+ZuJauvPR5fjq+FZtgjtxldqaDWnJHq03zUL0TkAeNz
	XxQL/yFM3NkcvNkIVzc3mjR/pZM4f1//Zd/ChNIbqUwYnlwUxktPyhV7ZXuWvo5NbwRnYaIID/t
	D3Hp591DOMWF3UCgbJBBioH
X-Gm-Gg: AYBFou0QD8oG3L1gYcLzJ8J7P4uvKMIIXCwFaLtnL7p3aNNHo+vEncyNAoUJWN7yNlc
	CsZH3Hyv/CaM6/XOBaefJBav211VW5jTVNwGV29XjxmF1mEgN3xqxViVBYH8DxQAaMFxadHo8Ez
	vZG1UEgNr7ibSYFdgZptWCXsfUBQmdfk6niAO7iPYM6hbWJgwC0oAaR7DrZ5CHCEhRbZdr1Wi2T
	8dF54M3s1sFqemMoiQVLl80pvkGZtVyGsbbwv36BR0+by5FrEyYCW/LV3lSDRf3l/Pwh+7wSXbT
	M8lQArdd4Qmx+vWj4Q8uBwL/+/FNCcSWuAZkCDHiqZAIZwLJjfmsGmSkDslial4i2gRW1k67ZMJ
	qfdY2odTS+GMkmUrEoLa6d/456oXmCiDnCLAcurCQmESCc0r5Vq/PVTKrcRKuWKFbif1A7RfWw/
	Y3XqEF5jcIjhzr7LP9YsNlENCLTJwTSRsUux2LGSQ7
X-Received: by 2002:a05:701b:4209:20b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b54cb55643mr439090c88.4.1795032059634;
        Wed, 18 Nov 2026 12:00:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1b5447f6b12sm34899c88.17.2026.11.18.12.00.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd65070d3feso104800a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032056; x=1795636856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lq7CkMmJuQwZqEcazQJxvDjFuUJa/sZrrdXPNQLnPGg=;
        b=e15EBQ3UoNNXVBpTdS4QcJcevd9RfRZKjIhE6DdrSm3ui/p1qY0GRYsm42YP3jws3O
         o34ySgfh8+79WGhFV/TPgDACmLS02OTz6OBL3SvjhZc1K2fau6yRiM6fmvhTkYQlCFDe
         sD0EKI01+rehPETTzLu1bIl1reiHVM+0kDtWw=
X-Forwarded-Encrypted: i=1; AL+hErHQQO3U/jTGpxnzcrVSHOAKzsu4PCoqHw8tWcCzGa3v5mdGKpVWaZwWtxoMW/vBnWR3kDYx9fDUuEheNxQ=@vger.kernel.org
X-Received: by 2002:a05:6a21:4ea8:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fff55618f3mr355223637.22.1795032056070;
        Wed, 18 Nov 2026 12:00:56 -0800 (PST)
X-Received: by 2002:a05:6a21:4ea8:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fff55618f3mr355180637.22.1795032055461;
        Wed, 18 Nov 2026 12:00:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534de506sm459932a12.27.2026.11.18.12.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:54 -0800 (PST)
Message-ID: <01ed7754-886a-4372-8b67-499e8585aec0@broadcom.com>
Date: Wed, 18 Nov 2026 12:00:52 -0800
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
Subject: Re: [PATCH net 4/4] net: systemport: accumulate the DIM packet and
 byte counters
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Petri Gynther <pgynther@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
References: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
 <20261118-nb-genet-dim-stats-net-v1-4-13b275f1e088@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-4-13b275f1e088@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 11:55, Nicolai Buchwitz wrote:
> net_dim() computes rates from the difference between two samples and
> needs running totals, but bcm_sysport_desc_rx() passes the counts of the
> last poll. Adaptive coalescing then picks profiles from wrong rates.
> 
> Accumulate the counters instead.
> 
> Fixes: b6e0e875421e ("net: systemport: Implement adaptive interrupt coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
