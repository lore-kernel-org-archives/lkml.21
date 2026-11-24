Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545333;
	b=pLBoTthFt300O2w+PvBAC4BTb4IgFOOKk45uE/aYNwwmWGXWyAOOie++LlbnziCbS9XI
	 SlSMZPnrQga/hqbcS1kwgTSNKRffIgsX5bw5QhYsRSf1RUiLt97ijuggVOVoWoptioN34
	 TYhwZyWv4n5O7oAtVGDG69rylfyAXszG3JGW5Nq50ZYl6CVDSYo7SYOMnJqRt/a+m+0Pv
	 vwhoQxDOUSqR62TIJnbm0cbq1ShcsyO4h50Z8ybKbU5Nno0I3tj6JQpoIRqD8YhYPtC6p
	 VIBMFIJONj+g089dqprGxDyr+EO2KenHDuiKS/hhqrDWcGHMqWPsTJ9firuj4el7AYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545333;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Y0TFp2dmAnVbiSLgx1ekPegrqzqmAOaLT4jWECIME5s=;
	b=TYSaJDgb2xx3h20qdwXm3bspGl1kZxbWApUAj0iOYhUyYvixfEDQu1Au9e6wxCklCz2E
	 VAyq7fHTvXYHdWDZKsptAjjL6Fr6maDcFRZn0Zv5g4i4FSQq3k8X5hZLu8RrJJEoKxDWH
	 7s9cmqsSiVHKFD2q7XO3Ssea4LPVOxOYKl7ecnuNc2y3SUtMwwSWeT3eDoH5QdJNlSqm9
	 R733mK5Ks5/oTJCccYANXNZzqn+C+9AEJxQJG9zuadR5tLRelKt3fbgnzbPEuSgKE/Gm2
	 /o2CEFPiTN7Z31W2i7bvVCaajvZS66ugidfHtf49vBnGG4nuuQ8RQzRFcCq7PwUz/CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KALKw9Bm;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7386C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KALKw9Bm
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2f052ae3c86so26189755ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545333; x=1796150133;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y0TFp2dmAnVbiSLgx1ekPegrqzqmAOaLT4jWECIME5s=;
        b=KHDmn+FRLaE2aWi5RYwvTzBi1Aos+FBZ9363dFsM/S81ZQjq8r7al3b8qrJN/aGoo/
         0eT/dH3LHAMcC1YIfQKR1KeK6WMjTXDO5wg/opiK//fOcICHfTFU8B+2wRcUYgph0Urs
         zAEOdTDD+9xnf4c7ALnObxV3A9wKWfrQhs6OlwQlLiX1oLfqjclujZo6dY+nQVeNZ5SB
         IlvH+K+Stuj4Gvd6HIHgPYhno+jLnKFq3Ru/dpNb4mCTPR3VEmPrfHkSshTvl1JU4Whg
         AxT1DlxSn1m1xUZ5Nr6jfg+IFvDFo6W3qUCLZy6XHlFDaNGsykdflNE8fG7bd+YDmfXG
         xQSA==
X-Forwarded-Encrypted: i=1; AL+hErHjs91NcazuQNeUpALc/igb2P0tPudaN8gOplmoluQ3UZLIojVXCq2LRnKBSakqoBnpjxnXYhVN00Nh594=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oHr3ppqjJ+Vbbn/++EauEeoIDVKJ7nXRgFU82aVZTguQuvB0c
	+RPqLPfq9xScx34YBh36Li8/51L0vKZcPtDcfjv1YZDkywr5PzbJev9gnfSrhCwGBbzD99zZg/F
	N5H1MHByi5DOcExosyxO6oxYF3QtXyRFnWJMGGRV338zslJlbnhLlpD7D0as9lVL/iuW3/PWfYD
	kDCa5dVoGxkH4pNpZoDFEMHhnjsPX92cSaZ4jLeTiiQc/ysfq+v6D8Af0sKK4Gm67MQULaS9S0r
	jV1+vChY7rhcszYKVH+vqxV
X-Gm-Gg: AZFdTZeFFU6qQX+xWwzf+lM1nIvkm9gu0ld/U2iMD98DfLlzgKQVdkAM7EZR9GUbJDX
	sf/3KhnNc5T8xv1wlTaFCiX2DLVk5flJgEYTzy1nTmduN5OaTawllkOHhF0Z4Vv/LqUO27k/7Gv
	/BO/QUT4v0gFphFmoGH2tfPye6G4k9c/yioAdFyJP+dnD3HYq8T5bi5A7yXjLhOzIyNYHOtJSMa
	gYiFkCzzjzCQ0J7fLRbnD9Sd+AEEHm1GN8VIPM+QvtiiWoybxwzaa+Ule00c2y+4QYLvqELtgZi
	F/2GqUc9pj9CcuFhd/oQvmHtoXPhieGiqvuJBrd2u7SnvIgIC3v9s6uvZ5FH+hHp4rd/+BVgn9t
	phrrOZ4gXmdX8pNBtKXlR4HReQ44taOPvN1Na/6CZxhoWthvp2s+NszHMhdpDErpMwzTom1tqSd
	bakmHorssHBha69N02wDVutVPQGQc3IdKtUI3OeQUE
X-Received: by 2002:a17:903:291:b0:2e2:c8a1:ab63 with SMTP id d9443c01a7336-2f03f176fc9mr154266785ad.17.1795545332629;
        Tue, 24 Nov 2026 10:35:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f04ed97b5bsm1883625ad.22.2026.11.24.10.35.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:35:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so4356322eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795545331; x=1796150131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0TFp2dmAnVbiSLgx1ekPegrqzqmAOaLT4jWECIME5s=;
        b=KALKw9Bmu2xkkLM2a6fR127uHSKsLbVJ7cAZfeFKw13MzS0jo8XGL6hOphaliMl/vq
         +P4BPwqwyLPTB+kcyK1yZSbF5wi7m4Ec/gFrzk0Wqbh9VOL5oPTQRDczh5WzyyosMAZr
         tYeF7KdsTie+ABQKODaLnBeH8HluJT2qR1Owg=
X-Forwarded-Encrypted: i=1; AL+hErHc0bspV6hJpJQWXh+/gRhQNOQNkk1W8o33WQ/pgJBkL45Mr0yPVsf3uGF07GMvwRsieqS2eg7zToDucCU=@vger.kernel.org
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18497138eec.3.1795545330456;
        Tue, 24 Nov 2026 10:35:30 -0800 (PST)
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18497102eec.3.1795545329642;
        Tue, 24 Nov 2026 10:35:29 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm48741341eec.28.2026.11.24.10.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:35:29 -0800 (PST)
Message-ID: <188cf356-0757-4b4f-abf9-b12088046714@broadcom.com>
Date: Tue, 24 Nov 2026 10:35:26 -0800
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
Subject: Re: [PATCH net-next v6 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, nb@tipi-net.de, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261123164835.1733304-5-florian.fainelli@broadcom.com>
 <179553896749.3135.9852837290681703615@kernel.org>
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
In-Reply-To: <179553896749.3135.9852837290681703615@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/24/2026 8:49 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] On ACPI (non-DT) GENET systems, the new C45 scan can create a
>    phy_device that GENET then attaches to instead of the intended PHY.

No change planned. Providing read_c45/write_c45 unconditionally is the 
intended design and has been the same since v1; it is the only way to 
get Clause 45 support from the UniMAC block. The scenario requires 
something that answers C45 ID reads at an address below the real PHY. 
That is not the case on known boards, including the RPi4 BCM54213PE, and 
the C45 scan only runs on addresses that have no C22 device. Should a 
PHY ever ghost C45 frames, mdiobus_prevent_c45_scan() is the existing 
place to handle it.

> - [Low] Adding read_c45/write_c45 slows GENET probe on ACPI (non-DT)
>    systems by much more than the commit message says.

The commit message already documents the extra probe time on the 
unmasked non-DT GENET bus, and that it is the same trade-off the C22 
scan makes there. We do not plan to exclude that bus from the C45 scan.

Please do not flag this again in later revisions.
-- 
Florian

