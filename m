Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035685;
	b=r12wcYapez0aPUv+zKkugCVJdrWMBomOwoJNbLOYxTgK9sa6ckLehA6Ujoym9UN4UhFT
	 gzjVTuSUy9LP+QD+7J2ROfETj8vLtHvW2MhLNhEyaZSgPsWPa1MAEi+4jbR+hsau74qnF
	 407dTieUgKfVKsIHnhziRVUv1SaiAIH2lGniSd4FDWnmxkYcCjtG6pWZhM7wzswq3TFSJ
	 5zEeFDuNgjBsZypc8TmOl8jIsb67dw0kNwB+lRSgxllLad18S/s1ufpvNMjZlQRpZY05m
	 eAuN6EUv2zazFB7aIqYM7wyChoqTKqdFeiENdU60OIZUWQ7C3x5Z4uHvJtEWdnjEG6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035685;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Imern943YHETiwezL3CwrpcZ03ia3Tshoe7n+IbU3/Y=;
	b=AMr7shqVUgG9T+kaSQ+a/mxE9VJuSareL5S7+VidHVgJwiuRM+kjaz+8tfYXl3hPacmp
	 ILNjmu1IURS95a4htkNvXDMZy4YNyYmEuw8iTQhOCVD4Yzh4JLoW4AidhLeo77x0oQEfq
	 d9pVmSGzHfC7aiO8O8vQxj1I0djVYA8i4FkvGrK7Q800B6GaDryXQIzdaSrjG4oY3dOs3
	 uKC0Yz8O7shL+hmZPq4FDk9bZ3QqbxNMWrODGK7orZWuW8m0fr41TZDZRfuLe6Ppg5Rds
	 PnJOZs7FmH/4OeT/CyTW0ALxyruh3qGg3118HLquY7pBvjlQv2b4XT6ZHePUbadu7Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=faKY1bDM;
	arc=none smtp.remote-ip=74.125.82.97
Received: from mail-dl1-f97.google.com (mail-dl1-f97.google.com [74.125.82.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3EE60A2616
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3EE60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=faKY1bDM
Received: by mail-dl1-f97.google.com with SMTP id a92af1059eb24-1a2761c69fbso1663549c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035684; x=1795640484;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Imern943YHETiwezL3CwrpcZ03ia3Tshoe7n+IbU3/Y=;
        b=f8ISiiNN9uj3WVabPb9/e2PR52NCtPbnl/BKFtl9Lt7WbKC9Jjt2+lH8OBp+n1gfDZ
         nZCuPHWz4Y+SE3dNd/kpTGKC1j8t4KdZddC5IIlBHNy8cpjQD21AHxw/5nPqrYloa+dm
         kIJlBg6VePMhvvVnCdGFaWLQuhSAx70H8NLc4T/cO0QohRK3d5XB65PdIIW6Z73h7/SU
         kha9xJJTfRkW3nN1/Ih0TUOef9s+ZOeeTw6Zkunw8eDAw3MpbB2cqjvuGBC3bdf2kwef
         N1E4VaqFMF1Y0DqFCcPYY2mDf6DjW124Qba6HrQTosWEhcB9RKARplVyXG6N/rjDnoPI
         Q1iA==
X-Forwarded-Encrypted: i=1; AL+hErG5rzvxwqPGwq3EEcrGFRyRTRzI27X4s5CkcyJAHqupn2d8hTWUqjalLAz2etWZ9UOZVuKeBiiY7dGX09k=@vger.kernel.org
X-Gm-Message-State: APuU4Z99b1wTi/lwUKux8g3tgJVpgMjGRg+LcvK9azPfMwbT5BjLSPnk
	VWf4z2u6ZvxsUwU8AFQ1HFIc5PUQDbVjKZaVBc5miyBMDAOX1SruEV12YxfXfiH5gFJvk1uFopn
	voPRH0GLIDbToN0Y8sxHsg3SxaGYi77cyTXKviXpZTG188jUBzm+JXbJzy7qQDVpk795MVs4FYe
	nT/BgNGNkXzU8FKpKeO6LcV8CDTJqWBU9GrNWjGBrOBcnF8ISwJXlOyoA8O7zuJTdEHFNV1knGY
	Rtaq06Zg1LHd0Va4b93TD5h
X-Gm-Gg: AYBFou0ccRBOCD5643G2sqlYcdG3Lf81WR+Df18EnOTz3oovJAr8zZlbC4jUo0y2j8/
	Yv8kffAWgqNkI8PwN2/IS6j9Sixdv/o9hS1mHksbS+sHzzdKH392UwkbmI/84jhwK2Tev9oJpbs
	u3ANh+IeA+u6xWnMVCMyDpdyXaPNg5d87daYJjV/GSfznCnaeHcE9w6Hg+2HKz73dILNEXwfQf4
	aFijPr64NbXzS7kUMp1IYqDpC+yrZlXmOZnYl9GEtWB6pjzXqOIhR3IJD0fX+6h0kRyFYZ7n/Kl
	ylMx6ft9qhiQFZE2g5OKgh3qvMnJk0XIaxCvg+H1MzOEziYNnoQ0hAwkf7eaus5mMBQSUyQfFG1
	SvP955IHMpMD50gjKuyc1br6cHg/x/8CZRfduZBsw8rmJGDegGkvrARpm+1RER6XBtZCzOZMrj3
	lyx/C0Ne/qKxo4f2p/UGarLwwrZw8bRLwO0y7zutmM
X-Received: by 2002:a05:701b:4516:10b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b543c10e05mr3658342c88.19.1795035682666;
        Wed, 18 Nov 2026 13:01:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-1b5448337e8sm26898c88.20.2026.11.18.13.01.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 13:01:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so20758a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795035680; x=1795640480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imern943YHETiwezL3CwrpcZ03ia3Tshoe7n+IbU3/Y=;
        b=faKY1bDMm5nBj3NPvjLWhQ2QF2ySyl6b3TIOiFLV6Ol/I9uu35cAL3tMQOz7F6CSoo
         P0T5UX98fJVUUoJOI66T/4qikNYkv3i2fRjIWVDu9lCb1up3RSmhx+NzPGzmgM0X1vyY
         nPqnFaqNEmVgKMGMqZES20JsgXsAdYDsHuNTQ=
X-Forwarded-Encrypted: i=1; AL+hErGGCzXwjCD12zjqz2hBr9AA99jmjsX7F/qnuEiJYdQSCG3DrhMVyEEdMlMEoJpER4Q6gpvGdFMzSnVluvw=@vger.kernel.org
X-Received: by 2002:a17:90b:1c8b:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b3d07a848fmr3341312a91.24.1795035679710;
        Wed, 18 Nov 2026 13:01:19 -0800 (PST)
X-Received: by 2002:a17:90b:1c8b:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b3d07a848fmr3341277a91.24.1795035678959;
        Wed, 18 Nov 2026 13:01:18 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6e1a132sm889887a91.6.2026.11.18.13.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 13:01:17 -0800 (PST)
Message-ID: <377f9f22-4ef6-4b55-9276-ffa4893eda1e@broadcom.com>
Date: Wed, 18 Nov 2026 13:01:16 -0800
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
Subject: Re: [PATCH net-next] net: bcmgenet: write the Tx producer index when
 a frame is dropped
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 12:40, Nicolai Buchwitz wrote:
> With xmit_more, queued frames reach the hardware only when a later frame
> writes TDMA_PROD_INDEX. If that frame is dropped, the write is skipped
> and the queued frames wait for the next transmit on that ring, which may
> never come.
> 
> Write the producer index on the drop paths too.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

