Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032043;
	b=xJVCNufe/RqOoOZTplXlSoEAJX2SsQJkQjO6CtowXNcfKJhk9zYYmZgiG/pPI46uLvRr
	 3GgPjUS1zio+hVMXxm+X9uZfrmchD8Ou+EC5xk3PDdqKWB5wJdTOojnoTFKHreTvbBlx+
	 /giuUbbG2VcRPzmHUdLWVEE3WI6xGqJ3GR7yYr7hd9e1LOHr3bl911VvJIlusD1WUeCss
	 9tcwJUu5mKZ5qutu7Twx/IM1xQsUCp0Kx0giCm5WJiEchO6BmPUCTYZOHX6yu5MpZJmYM
	 mvcuzNp01Iv5LEwYR7WipJaBRuIHd1uuElk4UWQwhmt5dvu0C0uAS6GmWZYi2d8OURQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032043;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=/yYxxt0Mn6oysKZ/CcQR1WTgk2Do4jLyrnTAxSq0v/U=;
	b=gW1mrGFbFOHHIbUpUxfLjircvI61UtzmaLurS6tOHCTsbO5mz+46ul41JODGXAepQ099
	 4OYAj5N/HBsQu1Rge5AvQoEIxldOu0dfLb8hDsnVsQRKkCZRbkb6J4OV59G1rnGqOKe2O
	 DjaL6LY00cxLooy21kmGqq0d17pLCsWw6jB7WMkMIMbMh/nJc7sm1CfpedlH73c+OEeBt
	 rjVWjS8HTybi1Pbs8av9OwLZCcYg1nPKke1IAhicT95/I6U9YudojvrgDij6Pk4HeeGtv
	 BzfpYZ0RiJVpB+CFEW1OnlLz2aDKDTuWqcx39nhlJKEfVBdRKELBzVKDWUThti5QP1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tt5c+VUL;
	arc=none smtp.remote-ip=209.85.160.228
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD00C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD00C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tt5c+VUL
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-53639b8903bso2624921cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032041; x=1795636841;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/yYxxt0Mn6oysKZ/CcQR1WTgk2Do4jLyrnTAxSq0v/U=;
        b=YL93Rx73PekNNIKb6Poe6lQMY9ldb61m5UqzQX+Tm0gYVbSVvIsu4c9+xa5vKUv1tq
         4Su1+ABH2OdkEJon5A/TbDTBvnfy3uyWDuAL0mP9aawDTlTkWIGr8SqmeF/oBuhhhkQi
         BbxfNsPXnZcofGL3Fa2fd0SbJa96xQRg/n7ldn39pzJZ+c4QzN1UXqHAjDEl4G1YJhJp
         yO4qbyBdsVzJDDwe0/H+zxbiwHSxMMWxCVvkD9SzlBrhlJWEiMOVFLppSnUMnGLeDCaa
         S0WqxrMbnNLBUc3h5X5X/edKJdMS2IBX9g9l4Z41ZL2a5EkRWamtLz985C8WOewRHPCx
         YGcw==
X-Forwarded-Encrypted: i=1; AL+hErGqyV2375v+rtNYudbO61TKmgfDbLmgq/fwR+cVpLJuhUkmVVp99aPZz27+FbDA3ouDr3EdqyDNx4su25Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NWp1PrimK9KlgqU335PjiuK6TtRc2otk7UbvPOh4pK1utFjr5
	LOXkeIpc2knwoUrgDQF9Cy8pnxmHI6HT6ZKMoMuCVeSPLesNCrCMcgkDUYcXDYFPSWbs6oAXe1I
	ev3GbXquON8qWgJwERo6aIBbcABu210cKKvk5OenKV0SHrZNVab0/I67vjHo6ZhuOgOC2+ja3+P
	+CUVxlYNsfSCwJ2BXXk/mXmA2jP1Lo8J9Ik6wjyIMYLuKdbKp/GwR35rhq/y42FT1FR4nh2aUlM
	hpVVfQHksWi0RTXgjDukfYY
X-Gm-Gg: AYBFou3NEz/OPQKiBU0RrzN+LXx/Qnfx2I9Zt+IhPTT4lJOBkCsESTUQ4oKwM4GJ6U1
	d0PTyLdMAFvPQ9ej+QPNhOcgsAb6JemM7ecPyIWNELOlEstD4ms5GW6kCZTu7FizKRVsY4kwHRn
	mH8plYPnCnDBXonfniAcrRX3ehFSFCOkDsM6RMaAl5XDwXqlAGBodATp1ePWD+QeLcNhMmBcVMQ
	+zUvyhUHjkMnMBUkrVhCzOOOWG6qpr1eytQ+egsXZlT8PnC8Vhb6Y84SeZ6RYLOJ7Rs/OgLOPgs
	mArlX9XkgR90NikrIfUXXtaZN5ZhIxOX+IIokj5XKD2u0Y3S5cQWNpI0A1nYqWch23izA04BtAO
	CG9MB25KC9QwK+8fH6BfERWMT/fvltyOpxCXoqV8C3979cRDx8A2YP0tKfh23fO/RgBP5fPjZ8c
	iBe7ArU2OehrNg75zETocUwU7phQ==
X-Received: by 2002:a05:622a:5988:b0:55c:c7ab:443b with SMTP id d75a77b69052e-55d6843a99cmr9792581cf.24.1795032041250;
        Wed, 18 Nov 2026 12:00:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55d669ac3absm76671cf.7.2026.11.18.12.00.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso56200a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032039; x=1795636839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yYxxt0Mn6oysKZ/CcQR1WTgk2Do4jLyrnTAxSq0v/U=;
        b=Tt5c+VULGpMV8+UhIMpjDezMyj8hRTP0rI8r8K3Dh0Y+XtrbbMIF7EHM7DfTU3TVeC
         4oYl5JgqGxXZpogTA1i7ZDo+mVcAhVCSWAF0L+EXJixOmbiw8VnP46fMVNLKed0QNk3i
         QmcyQ+XpyEwMbYVn6iCBXqRl+ethXyKuAsjpM=
X-Forwarded-Encrypted: i=1; AL+hErGzi3ijO1tbrBmG8OgvHmJscmxa1c8wkmJ9OZwfOU11gI6rQeTs4IwONg3q+Cxm2l63GO1fDUi8FWKaGJg=@vger.kernel.org
X-Received: by 2002:a17:90b:3d8d:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3b3f5b4ffe1mr281311a91.11.1795032038697;
        Wed, 18 Nov 2026 12:00:38 -0800 (PST)
X-Received: by 2002:a17:90b:3d8d:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3b3f5b4ffe1mr281292a91.11.1795032037992;
        Wed, 18 Nov 2026 12:00:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f708ae2csm696261a91.15.2026.11.18.12.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:35 -0800 (PST)
Message-ID: <6cc7e4f6-5113-4920-9e87-10c62ad6b41b@broadcom.com>
Date: Wed, 18 Nov 2026 12:00:33 -0800
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
Subject: Re: [PATCH net 3/4] net: bcmgenet: reset the Rx discard count with
 the ring
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
 <20261118-nb-genet-dim-stats-net-v1-3-13b275f1e088@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-3-13b275f1e088@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 11:55, Nicolai Buchwitz wrote:
> Ring init clears the hardware discard counter but not
> ring->old_discards. Discards after an ifdown and ifup or a resume are
> then missing from rx_missed. On a CM4, after an ifdown and ifup, 3666
> discards showed up as 0 in rx_missed.
> 
> Reset old_discards together with the ring.
> 
> Fixes: d26ea6cc48da ("net: bcmgenet: collect Rx discarded packet count")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
