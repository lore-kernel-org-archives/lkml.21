Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049622;
	b=qr1q8K7JA38fjJZTK6QsjcSLT8hqr5GEcITc9ZXy4TbCCdBCckiOj7UqJcj5UDqqgp9S
	 V7yhFLf8KApm6fl7a/1YNniXCwKH0QLg7EKe+7PEZeR3LmAb2NyqR+Uj6kpUusiX2ZIcd
	 AJKGN0xCnStrlDZ2z6rsSMNBO4sE4AC7X5lGULQiFizRSQAGdRl6LC2/HAy9phUfk/h5o
	 rgvwwx8dKN+a8daDprIbfxnuS/sFBnVYn7VD3/AoL41e1TH8dg/hSfOxG0+PkYW2MSt5Q
	 ZLBBM4YXxHrWUVAGmvizwCVf8SKMNPssruJoe3EsK8kq25/uliCa8tTQcatUBCvFvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049622;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=njJWFJWkE/NPa0DHGc2nH+3bZwMjdM60EmtmUGw28m8=;
	b=4TDQ8w+Ea74ngwRvZlwdmwoVhvzkvMneZcAszlfDrszCbrxgdAfSpEy8GJHz4ig/kuuu
	 gv03qSF5J6m76QAcTQUPwsskc+AV5hlIEuFYWuZ+CZWGpYAejMAu96FXC7tDA4y7KurLu
	 17bB3Hzu8NdadzVCCIv5byDkp7p4mZgk6lvIJxXKMEB/xJUu/3alzpXxwTOkjYaU7qd0j
	 lmuC8DpGkJc9l3DwKyLO+OAOYNYU6wZ2+wkiLPztPwiMLbhb+EvZk1hJkI9KR4fW2kOul
	 MkMoI0LZ5QMkMIQJttdV2zg2YLhDGD3FPY/h/tDqTIstvdZcploTQ2lI1IOYCI8J9jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YHlHfMXm;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A931606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A931606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YHlHfMXm
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1238399a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049621; x=1795654421;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=njJWFJWkE/NPa0DHGc2nH+3bZwMjdM60EmtmUGw28m8=;
        b=od2WkLFCyzk731OFbBTxUx+bzr8k0EFc9V2qvIG/jnLlL+ULgIg1naLu9JuUZP0ADg
         Sa+bGGC3xvHWv6IBhFZObZ9xRqCPiiVmzgKvJC8LM3o8hmLVzEsUR6GWy/F+f0YTd6EH
         RQU+SYKNGLI1ZI/jzuGC78oPiTRMUsjc65T11smr5t38Ii1DomRhDEqySNj+X29N95Oa
         jRIuoNtfBmZf9e5JyuBCZ1YrkMPRNM7Qxt+ufSd5DjdY10GNJWHLdmGN1dJgy1k07n0t
         iZtHb3Fl9z/T99B4T4VekAiQfbtzkatA9f+S9Z634ThJCQvEiAx+QbIwNMy36h2zHwqL
         v85g==
X-Forwarded-Encrypted: i=1; AL+hErH8jBYES8l1ea4Xu98VmNK8fsKWdfpVXVE6h1Yw/NFwVfraamX2T8uzInGTjAPH2GNx5aQ4FB6JbkODJTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/vb5DJk4A3qEkImq2WfWNW0uPvHPO6D9Cz6PqMYnrRRXRqZ1u
	uTN+Qe8Q3tPF5jrOoFQYxsQ0IAKx8Tx7DbO7Fgn8GG/nDZEoaMfZugVF/67+KKefYVUZ+mq4qax
	67e133RNxfOl8jPlp5yjBlTH+6Nw6GbUGHa/PTCkIfnKbqap/VZEcEkWFyFl1kxj32atP0p2Jcu
	5UB9kWu+GCBFn2to5TLe/W+iYXEUizkBDGE6qyQc7RvxdMMRLyot/z/OpDXn7OhxbUsQUjZ8PcW
	CwXCAa6K6Yw792TgaKFCtJJ
X-Gm-Gg: AZFdTZfIflaCCXxjnGOn56xq8x37OaP3TcmutxsL2gTI1DjfLwiz/TbqogU7loYbE54
	dGPWo1Aauk7YMKwoKcdBacsmOcotGCCsrXO829gfcbjidhUdSX4PqrAFWxt+Q2KWUVO4b2xYZ6o
	xzW6lQt7wDscN84cTZuz7LLhkvJfVocNgzYGfE6thJYCpS5O5km9xnPaantXaT6gpEMEzMIEJXd
	EFbXZOs3rKfjDROMJWCQi13BIn9SuvtWLbaH3t8/GI23VsaZlRQeIwpV3FlMIPxJUkJlR3qU4nn
	39Wy5zhF1e29Eim26Sg1Qr6zI2qn3BfRA6KlcR2QS0JdiX7vfBh6VCCE5WHDfLEp64T0pocjKGR
	26V3f2bYWicm+IhedNGs0TK8yHK/dsMHiH5Ih2NHasGXgjl9/hJb6N5sys1rEWPBM7i480fEiJ1
	SyZStOCwwlNdRHGdvSLagULwv2VF3wmZ2TNbmJkJcr
X-Received: by 2002:a17:90b:39a6:b0:3b3:c04e:4b6f with SMTP id 98e67ed59e1d1-3b3d07c8412mr4202056a91.55.1795049621439;
        Wed, 18 Nov 2026 16:53:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40280397fsm46793a91.2.2026.11.18.16.53.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:53:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so437177685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049619; x=1795654419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njJWFJWkE/NPa0DHGc2nH+3bZwMjdM60EmtmUGw28m8=;
        b=YHlHfMXm1gCcK9Xjn2VKmBN/Uh5g/LqMHtKiajoXM04yhXJC7ddY3n0wfX2ohiuIfD
         icGaQNkfP7neVm9vz6t7G78MhexfhUgzaDs4l29x9y5+tMl1ODKK75bfgvnf3ao1EXHz
         AUe49Kby8QYQzquf3uTpJA6qa+W/USqF4T/aY=
X-Forwarded-Encrypted: i=1; AL+hErEYE6368TQo0fi0Dnmn8X65a+3o3+0qqnExzr4s+YaIRNE0wsh+FkfD7mah2NMJ6JgknWqJkKhNZ22xumo=@vger.kernel.org
X-Received: by 2002:a05:620a:2a06:b0:949:6fd4:354d with SMTP id af79cd13be357-949994b40f7mr829486985a.8.1795049619263;
        Wed, 18 Nov 2026 16:53:39 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:949:6fd4:354d with SMTP id af79cd13be357-949994b40f7mr829483285a.8.1795049618678;
        Wed, 18 Nov 2026 16:53:38 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b774087sm313093585a.23.2026.11.18.16.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:53:38 -0800 (PST)
Message-ID: <4fd158ad-eafa-4627-b763-688aa9888132@broadcom.com>
Date: Wed, 18 Nov 2026 16:53:33 -0800
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
Subject: Re: [PATCH net-next v2 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261116213449.1682731-5-florian.fainelli@broadcom.com>
 <179504864758.3136.4762946821848645256@kernel.org>
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
In-Reply-To: <179504864758.3136.4762946821848645256@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 16:37, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new C45 sequence issues an ADDR frame followed by a
>    READ/WRITE frame through MDIO_CMD.

This was a real problem for wait_func implementations that return 0 
without the controller being idle (bcmgenet_mii_wait()). It is fixed in 
the next version: unimac_mdio_addr_c45() now polls MDIO_CMD for 
START_BUSY to clear after wait_func returns, so the READ/WRITE frame is 
never started while the ADDR frame is still on the wire.

> - [Medium] unimac_mdio_set_clause() (mdio-bcm-unimac.c:126-138) adds a
>    read-modify-write of MDIO_CFG to the MDIO access path, and that RMW is…

Also valid, and fixed in the next version: unimac_mdio_resume() now 
takes bus->mdio_lock around unimac_mdio_clk_set(), so the two MDIO_CFG 
read-modify-writes are serialized.

> - [Low] This patch changes behaviour for existing users of the non-DT
>    (ACPI) GENET path more than the commit message says.

The C45 scan does run there, since that instance does not mask any 
address. It only probes addresses that have no C22 device, so it cannot 
take the place of the C22 PHY that phy_find_first() returns on those 
systems. The commit message now says so. The scan is also cheaper than 
it was, since patch 1 now stops after a failing MMD and goes straight to 
the MMD 0 probe.

> - [Low] The comment above MDIO_POLL_DELAY_US/MDIO_POLL_TIMEOUT_US (mdio-
>    bcm-unimac.c:45-48: 'A C45 access is two frames, so a 1ms timeout…

Reworded in the next version, along with the comment in 
unimac_mdio_poll(), to say that the timeout applies to each frame.

> - [Low] The driver now enables C45 on every controller it binds.

AFAICT, all controller HW support C45 and have the definitions for the 
bits we are using.

pw-bot: cr
-- 
Florian

