Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031898;
	b=SXG8e4nKlVJYZVbWt63qI8K7ZeOWUo7RJp7JRlzs0buTBh54zyyJV3U2uDxQjrUyd46/
	 L5q9Ovmmj551jFHYUGfmWhAJ23Ji5F5L/hOrZXa2iq672zbSV3+LvxjecdWBRAN8UOt1v
	 f7r+3zRbtkU91gIQaksBhxsmxa7XhmGzc/uXvNlEITDKmbPmEYnER5I2P8MhQIyruVHll
	 AqoQ68OfBmz2tyQJoJBhfqu4dcuVWG43cpU3iJXg/NuAG8un9KmsbeOTTpYKEvvcNFp1K
	 x9Vx1H9JysB5tvgCdpLIhEGSPlLaqc8EIL/2KIlmXGbE/nmc9lNeuVtFdi3rVDiKCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031898;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=aPgt0G/x3Sm1rMJzqzLvoNWJf9u2fP+DnU9njYjX/go=;
	b=tPARh2c1X8Q8pZgqY2lOcfriMxpezl1S42/GkdYSoYCmRrVXAHD34q/DTyBo/RlHAWHe
	 AInOyTW8iOyl89OHVymQ+RrANPVMetNLz0wZNP43ufFwSRi29U8Tdm+ktmWSi59ri4u9P
	 2pcYrapK3FzwYWlE3NFTTmpC8s+itCTWlcCdHpPog4s5zZ5Pevs0aHh+hoRnZlDpEZJr2
	 thM/xXzRRNA87FMq3CGOzRwpNb9KbdtPPZnsMidysqHNLrtcfHzx0OlvIvACPpju1jNQJ
	 M1CmvarDrR/1OTllMT+oHLj06X7u+ukY6CVoRM6N5SkdfR34JvuFNcovUm4J+y5jgow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VS5YUASb;
	arc=none smtp.remote-ip=209.85.128.225
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D56606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D56606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VS5YUASb
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8b4e04eda5aso12638847b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031896; x=1795636696;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aPgt0G/x3Sm1rMJzqzLvoNWJf9u2fP+DnU9njYjX/go=;
        b=xs/jhY+FSnacxZQD3cpmTznTX91HotIv9lHQ0w+TjXcBhbrodJ3c4tRx20ao9vhKIb
         8Z9MsavLCdA+57Y+GtyHjsnCp4bAswakLp7w9Bt4JpKlc98wCoJEe0pkGY93/nH66moT
         F+B38ZUo6ZSrSPewf+LIxE0TE95VAgC1yOPuGqHTckjNzcJr9+Udtu3EnT2vo7mLSkpv
         K0a5gSRp2SUHBr/zTSNKxOXcx/o1GY9+3AwfCF62oFEHPepYepBwwS6o49EIIe/pkmYg
         0PyWObBVEmLrNMGycn511eP5FfPVxSCoNWIq0IyumYbAZZ7uMAcjrk6EI9l1RT3BlYRy
         GaAA==
X-Forwarded-Encrypted: i=1; AL+hErFxfAjkp3osXAWt6YzNmWwTARG9TBB0kP7HyTYE1YKTldBRaVo707777YDdHuRPIZuEP2vq9uNzh/i9DFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W2XNb1WknJ5+SzERliq7l/TSLYhbZ8fx4VEuMa+FeQ+o/bWs1
	rdKlIzRl12X+ootXZOfLjhMzU30YMbR8k/TERWjL30roZtxjojvdwlPNA10R+Le2tox5Ln+vD4o
	21X/2JdsOW65Fsa8TTmsZZ4MHMsEzeQRe+kluRZVbITYx6nrTLBCpACpd6qWpHDjR2u593jp6AB
	O7ITzBqhxN+OrjjgSII5BlytFlaOnOp+t+mdXelJbnj/A3X0s4xt56eSyQsT8p5Nq5if2L3csAq
	4pMJkXOMHJieDs3iAE1yTpW
X-Gm-Gg: AZFdTZf5gNaNcI+EKcYp9ZHXdWs+5zKfE3NO28QdTWKQXDvLwRDoa38g166eQISbvup
	ud9z+QuecI61QvIDoobwpHS7MzWmQbX3Um8P9o0luaB77jUl8RS06h+SDC2RHo0fW5SunSDb0UF
	6GyI8QcKdRMGaRP0v3O3gYRD6+XM0aMC+pNTChyONWMbKKGVZlnubOdYSfSnmvLN7LAY3rP4pPM
	S1paPxY7NYo5qFCfWuVIJMUgalCuvQ7pGVmhRF2meyMIf9tKbf1OL/nh7rPXtl2m6K/N0zvsca3
	NB+Wymf9mJa9SurYjx8BsZV5kTlHEcaic6jcJrPUv/drLN1801CkHNbVc1ELz+1sUJsVm0pwzV6
	sx6Nv4SNBcMYLSXSvI+gT6eVycXLFex/o0ip++iv7jJvrO4ndZ7QZgW7og87xm0mvgkXf5NqNkA
	DdNhDsqOhrkAF5CBbmGiulCp5rQJcAxo7fs+Xc9Bcq
X-Received: by 2002:a05:690c:dca:b0:8b3:7621:f695 with SMTP id 00721157ae682-8b4fed825c1mr17795477b3.34.1795031895560;
        Wed, 18 Nov 2026 11:58:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8b4fe0b1ae0sm207257b3.45.2026.11.18.11.58.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:58:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-542fc61841eso25587061cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795031895; x=1795636695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPgt0G/x3Sm1rMJzqzLvoNWJf9u2fP+DnU9njYjX/go=;
        b=VS5YUASbilzD+XvZHNfrpXhY6nnTAFSycHncgtrUb2z3D1lTezNivDaUoUNpmpc5Dp
         3TTgVhkYP2Y1F5E7jA/NZPHoIZ2hWHOXzHBXQSyrBZLuM5t5VrwIC5/Ak40cen+Z6Mdl
         9ix0pBjUSqHAFvBNgV7nHj1YEKKoC0Z+/XZQM=
X-Forwarded-Encrypted: i=1; AL+hErHVkMf8qb9Wp2VkNpRHWMB60obP/9IjtDqL3kEyKqRnVFqekl4smNVmdNpTi0ASCs/kCMrNDrRrXMk57e4=@vger.kernel.org
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr57244981cf.77.1795031894688;
        Wed, 18 Nov 2026 11:58:14 -0800 (PST)
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr57244611cf.77.1795031894077;
        Wed, 18 Nov 2026 11:58:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d669b7075sm7489411cf.2.2026.11.18.11.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:58:12 -0800 (PST)
Message-ID: <51a77e64-3e08-44f5-bc28-6fc110945653@broadcom.com>
Date: Wed, 18 Nov 2026 11:58:10 -0800
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
Subject: Re: [PATCH net 1/4] net: bcmgenet: accumulate the DIM packet and byte
 counters
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Petri Gynther <pgynther@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
 <20261118-nb-genet-dim-stats-net-v1-1-13b275f1e088@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-1-13b275f1e088@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 11:55, Nicolai Buchwitz wrote:
> net_dim() computes rates from the difference between two samples and
> needs running totals, but bcmgenet_desc_rx() passes the counts of the
> last poll. Adaptive coalescing then picks profiles from wrong rates.
> 
> On a CM4 at a steady 300 Mbit/s UDP, DIM changed profile about 1000
> times in 20 s. With the fix it settles, and Rx interrupts drop from about
> 4500/s to 2240/s.
> 
> Accumulate the counters instead.
> 
> Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

