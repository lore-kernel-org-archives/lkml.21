Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450081;
	b=tAn6jtfzM/sdau9kEJ0rW4qe0gwOMq970rEsETf26APQB5Rt6EEelnRd9YPnueu3TcFO
	 j8Rnvxl38TqeNjLw2SlSKw34uUu669uMv2vjaS/TiSlO9PODQecL80VKhi9JicKKetSA/
	 2hT35/Hvgn6CnNPE1fRd9cR3JHa3L2GdFHgh08ne1S7S+l4AZDKJLpKq43Ix6JQ+WJoTn
	 Sv5aL5j7TpXZgDpjdzZi4tBCA8XCFML+r+YrUVC7h7EQnzaBaF07ZI2JqjEvg/d8kB1dy
	 pm8pkvJZsDnxMJgrWk0tFNG/1LWV+e+BA+GIKqbshyhzK649kFAQXsH6bqDqGfvwLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450081;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
	b=QEUCWEcY1uC2dGlJYfLRgkUAcLb7e6ZBFUkKc+ZgejS7CdUwaI+4+Jp1CP4q9uVct4z8
	 OD5eUOarb7v2iIwp2c2BJnfaMBmZ08yfB+cSqqqAUaWqUthhcVoSknuD20s97asZ+/Yk5
	 i+Sg4NXniEzqPQYFfgOZk5SDHIPx10sthhCIdZsKb8nAT7eLbl0udwHV9XdraIHv561dy
	 09nkc3+kiqkzg8KwEyaR5Hdx3/OyHqDf0SY6g5iIBNIvcODskKDfUylB5jHiOmFPspG4N
	 i/NqJwFbvIkqb4UfOtTg5woD7uFv3lkvDtcg0It3/AfkU50X/a82JS5lOkZdSjnHXsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U4Ht7x5u;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB24606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB24606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U4Ht7x5u
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1320164a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450081; x=1796054881;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
        b=FdL2G3RGHW7GDx5pbkX5oi1EmL0hMF9V3/c43IImmaIVhXaj6b3nPQCwS9mxx7fi2J
         5rhsTckgs0IGgXBxPL5pOozDUvtbeJVzPvm1eok3PJsxK7Csmo7jLO9jZbhH6iKuq7tg
         wz0tfH0cf5o+0NIR/grj5qYHP87G6Hd3uhURZ1NzY/IVvNY1KcaOlTYOAn5pZ6Bzr2vQ
         WXQQvRRZvrghlgHrjLVZ6RMRJmtdr9xKfyxM9bwjoMSFBmQ75zO1WS6nWz/pU6u8kCf4
         NywOY8EFDNFwtSYWArx9WxZ+fHTwJan2VgyunHIyqXVIoE99hEe/oKS/FnV/LF1PAh0W
         b1bg==
X-Forwarded-Encrypted: i=1; AL+hErEa/xZnyea9Gdan5+2l6FDiP6g/atfUsxNTG10nnwu6w7dgquRZUk2QonYsaMU/ncVdQDB7OcVrQl9SQHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VdqPsgGyOlj3XmQOgZ07FHRoqiJa7tVKSyfMtAMthpiqHaG5f
	ojoBbWxSyNXVwaGMIN8qqsmxzHYApHk+L7gOxvDWCtsp4ShbT2KLcuogamYdojd9ABI2Dp9en9S
	svBz/VXUtkgsvM6YSAJcR4Q2yJrOIqWGXmto/A9eTVCypsfIX3uSYUFur1sa2ywZ1YSh39LUXlA
	HMnmSQVru3R0Au2JrAD3K0UAzfBfOVuoQw7Vs2u8/zfYyxQBG1omteBiOLVDKh9FZbthe5bhQbG
	/2pIWdZQXBACaNvlispL3sy
X-Gm-Gg: AZFdTZdRN5TI19gZqIG7sZsnO+HBMRs4acpVXMVDstbtUmPHhoMGvaKbdOdXrOsmjif
	h8K+S1499xfRJtjid90j7sKFzQsEVFMW/7u6wFaK6Id1m4l3h6V++MukE7mt+NLTB82cN9ns6Yo
	/f6uXqJKtttKOkthRIbzSHXojxb6CLUAY1nHvtPeDBNFJLs7nFBDgjLxq9Wq5KD9tQQTDgkPP3/
	PEu5rwtOhVDokHNOHVM/P2/N+Ljbla5IYPO1jrpCyl99lpofSfFuNqe21B0S87MGsHuOrqWMyqY
	6HhI71yc4UwLBMRPJ8xYLJPxFex/wC1bYf4WE7M8V8GR/WDnLMd/+gfqR9EkJcTCOrm6pPL+Rbt
	g+X1pFpOquHu9To3MuJEPaIQRx5ejCIsAGK1uzn42BW4i/ORgCT4partg8v7Opf9HOdClNgTkyO
	gtxF3ipu1Z0H95pTQd8r+vycetbEEhdwNkxST7bwsF/EQ=
X-Received: by 2002:a17:90a:d2cf:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3b41c8fed4bmr9794354a91.31.1795450080463;
        Mon, 23 Nov 2026 08:08:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffc5026sm3140751a91.3.2026.11.23.08.07.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:08:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so2049569eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795450079; x=1796054879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGwu5CmCdNBM7nYfVxbLkG8Sm/FCcmMZiBEkkapxiDQ=;
        b=U4Ht7x5uck+laSXsCxRDpQAjoMePKfSC8+QwgMvQ8RSpYEkH2kiqWVGoaiQnzv72fu
         p0+Isu+KOxSqMvJ/Uy12hfv7llY0QJQuoqsalzJ736/Pysct5h45KvIzJZ8zjBvZjbFX
         Tm+0jaSRc7yMLJHMDPGhk6TLgLgdwyulv1DJA=
X-Forwarded-Encrypted: i=1; AL+hErETHvMvRvpZjAHLmbZtF0aFGrcD0jHHKrHXdcjha7wCnyIR+njhWDn0j2ziPjhnPMsNK2MkNhWLE8VmJVw=@vger.kernel.org
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr19381606eec.27.1795450078329;
        Mon, 23 Nov 2026 08:07:58 -0800 (PST)
X-Received: by 2002:a05:7300:7c08:b0:384:3123:a0cb with SMTP id 5a478bee46e88-3856ff5b880mr19381556eec.27.1795450077586;
        Mon, 23 Nov 2026 08:07:57 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm38560278eec.12.2026.11.23.08.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:07:56 -0800 (PST)
Message-ID: <c5e542c2-4d34-4ee2-8bd8-e3b5b5296f7e@broadcom.com>
Date: Mon, 23 Nov 2026 08:07:56 -0800
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
Subject: Re: (subset) [PATCH v4 0/6] Fix SATA support for NSP SoCs
To: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <179544998187.275844.18441245364658646762.b4-ty@kernel.org>
Content-Language: en-US
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
In-Reply-To: <179544998187.275844.18441245364658646762.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/23/2026 8:06 AM, Vinod Koul wrote:
> 
> On Thu, 29 Oct 2026 14:25:07 -0700, Florian Fainelli wrote:
>> This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
>> which was broken due to a number of things:
>>
>> - the SATA PHY assumed separate PCB windows when a shared one is used
>>    for this generation of SoCs
>> - the clock/reset (IDM) was not being configured by the driver which
>>    meant that depending upon what the boot loader did, or did not, we
>>    could have had the AHCI controller still in reset by then
>> - on some reference boards, the AHCI controller is not DMA coherent,
>>    assuming so leads to all sorts of timeouts, data corruption, etc.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
>        commit: 2a27baf6e203af422db2d84f9f382153612679a9

Thank you, I took patches 4-6 through the Broadcom ARM SoC tree.
-- 
Florian

