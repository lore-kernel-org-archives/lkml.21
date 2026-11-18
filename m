Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032024;
	b=T9aRY33YD/JCxR1Jd+yB8yHVQ3FyfT+ku+0hpP6fLDJ6gqs7lPrckTJk1HnanLHn3iYu
	 ylc62AsNpXDMXxW/EPpqAj1ua2X/gYtJYph/i+ulIghHPmQb6SK+G84UX7Gzrm3/5Oo7k
	 NzM7nmnRm64wh3N9dq0q4TuHDcpIrYNXF9cJjC+unulL/7avnsOMIG4r9br7ypJNH4Ftf
	 dJxc3A5KYk9MbGyWBTfR2uD1oXChyriK1bfasnZDCHG4933XvPJ8wMaKWZYLUmLGF+Ehk
	 la95HvKS4atrNLmwVi59kbUdc8dWd34Tshr53KycY6xLFSgDgdnL5NAZENWf7cwunUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032024;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3Jj4nuf2sUT6oSX4n7x0n46QKII+p3USk6PoHh3RNPM=;
	b=u38oFkAQn0mrt7g3MYDWqtPzIe5o+p/YyUIIdbjoTEvGLAbNwM5q8KU6Hbh3sRTwVhy9
	 3UeiSnIpvNeU8BPZ6cC/TLwqLAmoDRaC2t3+G7+KQaPjvaUQNW7Hjfgc17rEa3T6eWYqO
	 p1qr34eCGldodGllhvWb1B9e6UevX1Wvls6WhxBRnBtkybsSU0l+uZmggQUUzDXHx1VNT
	 CZuPPSBILsBKb0vfPETqR68sD9f0wBUjw87VK00ALUfIMEoahr4uu3o/muU0JcwxzL1Un
	 Se0zQ2BWe9nZwodpjDyiRZftf5pZ95ZVAD/LW8vE407FiATEFgYgPDsNlcfMzCSrC7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VKPSQ8Ef;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23F606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A23F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VKPSQ8Ef
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-372bdb942dbso1920943eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032023; x=1795636823;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Jj4nuf2sUT6oSX4n7x0n46QKII+p3USk6PoHh3RNPM=;
        b=PbE+Ai8O+9tcXGJj1Gcqm7cqVji6StPl8yQT8G8ABg27Ae06DdOIN9TrMCHn3Aq2eD
         +6l9dcCDBtTQxWzHT5+zvbLTtMRDsrasiJZsuSmqxYL+fEcsZtQQF+v37mabwac0cENI
         dvE0RThuJXfc8np+Ah7dLIru2imWCnzjbU86bD9pmBmzFTECdKsXjf1zSA1LMsVKmheQ
         kfNYdwToXnMp2OvFF8+3jOoqu+FFjWjJhWVkLd1Sq3wbuyn+6X66cTexq1kyolt65MPk
         93OB7wFCP/x9f9j8dwPh7KDq+guNT0fByAULFzf1kuys1ni1ubgqciLeo8EdeJ6y9RoQ
         xDOQ==
X-Forwarded-Encrypted: i=1; AL+hErHfjhIp8hNKjDSX7dwPx/hrO3W0MtjaPKi4yxdAzUiLlCdg3m2kUJgPwrXncY88Zc08YBlRPEEJLm+JDq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t3/QRP8jEo0qszseYyDizMoSb1Lz/LzWbeqUMlKPNeSikGn+0
	1GF0GL+BunGkBpsL93ZXB35r1rXcV32+9+eHCfCkb7wruoWuObfXpPZ51mG2PXrSulV2eI2oPsD
	J37jpxDdoUttaUI3wym4wG2sQGOAaVXYXTqBrApGZJXAzw5szZJjmZ39JhZHD+kOPWH1qdF2clV
	ljJg3Hcdsh9zLKsC8YbAhSQsv5jPryPiV2Cbq+ay4DvX40Z7Nv9JoToD2s6SjA1fz0KibLiu19O
	oSA9VlmHhe6qHCcHNFqBTBs
X-Gm-Gg: AYBFou3uZS2u2mEZuEKFJwCdtggCQ9Q/HObEs86gpyOmGWJ6mTpJQjaCx0PeMNdU6g9
	ZM0B30RVy/6U30YviqKIjD91X/qtdRQKKeocGhJYuegJGEyGyoaQTietjeQzxFCboLv0K9oAPoN
	WMcgroqktVPLVU42GapBeMJFFgyy3Vc3wQa3TPaQCbw0NZjFOMAHXyTGgIlOG5hf31bT9w27WKw
	vUSWAfGwaYLOpSiqxeIL0XG7yjDRNLTmrjMFaOObdoUNUt7SlFcbBkNKua+lId5DrJNbVKUL+L2
	YFn57FJxg2+ZMW72g69odY8gKDx3Jnd2xd3++9XR6zwlwOIbR7EiB8YaHP0JuwdviKUNUimvv+8
	LW5gl0P4h9yuXd9vwtvge7WxFfqCMLlK9UpqDTFpnD2cGbgZZh8K5SBEokZL1TSl5os4s4fkc7G
	4waW0d5V4PwoSMVvogjBpDZZxaK4MtX4346Hzqm10d
X-Received: by 2002:a05:693c:880c:20b0:369:f961:ccf8 with SMTP id 5a478bee46e88-38281afc80bmr2953065eec.19.1795032022394;
        Wed, 18 Nov 2026 12:00:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-382a74da8c3sm133521eec.19.2026.11.18.12.00.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd769cc9deso778639a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032020; x=1795636820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Jj4nuf2sUT6oSX4n7x0n46QKII+p3USk6PoHh3RNPM=;
        b=VKPSQ8EftpMNvunM1XpeII69+MY4OsHbZbeeICKK2MOXyouIJXHJnQ0m9N63ZmNBNN
         rIAPOIU7VP75sH9rUpjKJYv3bbQxe64XKHLpwg+MIxkefQdBUyXJke79Fz7uchzgevCd
         v9FMoaysr0X51/i8RInxyAdVejn7tK31pnMV8=
X-Forwarded-Encrypted: i=1; AL+hErEmHt4SKncLf74E7DXaxxjj9GbSokEKSvwuFRwCUcebJ4352WaQpIiKFfN7RYutN/6FBNnypY9DyJoMUog=@vger.kernel.org
X-Received: by 2002:a17:90a:ec86:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b3d0759ae9mr3438180a91.12.1795032020300;
        Wed, 18 Nov 2026 12:00:20 -0800 (PST)
X-Received: by 2002:a17:90a:ec86:b0:3b1:7329:a121 with SMTP id 98e67ed59e1d1-3b3d0759ae9mr3438142a91.12.1795032019619;
        Wed, 18 Nov 2026 12:00:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6a94c8fsm734504a91.1.2026.11.18.12.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:00:19 -0800 (PST)
Message-ID: <1cc13fc0-b56b-4859-9364-f4cf7e3a04e4@broadcom.com>
Date: Wed, 18 Nov 2026 12:00:16 -0800
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
Subject: Re: [PATCH net 2/4] net: bcmgenet: restart DIM from the default
 profile on ring init
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
 <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
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
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/18/26 11:55, Nicolai Buchwitz wrote:
> A close can cancel the pending profile work and leave DIM in
> DIM_APPLY_NEW_PROFILE, where net_dim() does nothing. Adaptive coalescing
> then stays stuck after the next open.
> 
> Reset the DIM state on ring init and start from the default profile,
> which is what bcmgenet_init_rx_coalesce() programs.
> 
> Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

