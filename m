Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201862;
	b=16AcdSufZv2EDhmtiPcBc8n5uRdCMZURBpmuMTgQt/tB8Pqi6YgxXANCZw1Sgt73RX7B
	 eK85yxNl1ZDcZvQnzwYBae0FyWW6v9OUs/pqnM/p8v5H3ldQlLIUva9INo847tovjuYFU
	 4xOWD1/2FtpIQnx1WysPkenNYgbFFI+TtOtbEBDrLtjqeeZldMHjRkmevVu7xVDZodMIY
	 arbcIiWM+//SvcOXwvxYEo74nvxOT7kZhos9/gLauFjS3zJZG5Uquc/suLua70R34l7nb
	 EaxJ26l88qEU7aOhZuyS6nSDHI+/5t4EhXMLKIYAGyf7Ck+Hlvhhcr62ewCCIq3z4rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=R8eWA3MZ0eEFDvLHaBWtEpinN3qOx1VnZpieDpTE5ys=;
	b=w6K1l97YfXs20zzkxti0d/QFzEbO0SWc8p8LA6wumtRT6uV1vtozjXPZHA/BSzE55HFA
	 0d3mgM/1m9ShgCWUosFK7ZAxGOtv3O/+mbSrKTAwi8cgqeo00pC5sGbo0ITzxP46OB1mM
	 gH+poZurfsHwdanEHOhwUWVOn/4FEvxFmi47pr8mUHWMabmjuc0E4QrJfDG+c3U2/S5FD
	 VjUNSaPfmoQZRpFFlE5iVXPWnLAqCYF/WpYU7GwLue8BvIqMgUqc9Qg7JWG2laJfx/wwQ
	 2tme/U03ABJ2qEQdNY8VA59W/fQn9tQqTW3adNvOk0GuAxeNRD82OwKFr2h8UU0LyKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P1GXsIfW;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB660A2626
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EBB660A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P1GXsIfW
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-ccca948203aso1414805a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201860; x=1795806660;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R8eWA3MZ0eEFDvLHaBWtEpinN3qOx1VnZpieDpTE5ys=;
        b=GkLFBvV/zTWsvzWuwgv7EJyWE+KFzEzfdBxLCKTTgYS+iYpPYn5GKzkxlb4IEiAqWO
         xXNMz0TrowWjEb3Cd4qBYgzZZnEuo3FhXpR3v4ciH1bmQSY0tBlta+DqrFQKT+eKYL9O
         +Umkzg7pW1u5z0s+HkaBmCJK9cxrlW8z16Kl5rUrKgiN2iTtj606ppeHiPwsbf9OGAuk
         Ybkkt6l7GfkGNClRw2oezPF4WDqan1pE/HuaDHzHpHAYDFM5f/T9NVPfAJGRQXIbJZZX
         8oLHbInTpZkgw5wjpe25UfgWywpfXu21x8CL5Z/a+QNMNMXROTtjq0MKevSlzddtJEBB
         bBgw==
X-Forwarded-Encrypted: i=1; AL+hErEPFaqHHrfCbPMy0/ibumZDKBmLqiyE5K1vB5/b9e3DHa1hQZ+NmaL5hcrlN7xb9CwqZOWX198jNRIRzEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AYq3LY9uJg5sU4eSLccyXghUYDNGTDm4DumG/fGNS6b4JRDvj
	GY+RQWjgonsM3gMYFlrZgRz2dRRAVnyt8etm6UsZBPqFT5std7SuabvBsgkimL6EeGA7BkQLj33
	N4um4qENi91c0+BfGke6VJm6BWQrp4NhIS1I1gJHCvRN71sHTPR8Si+3IBa2OxFG4IaDcATSCpl
	H6CGNOITr/Dyl5wRXaas1xRn8Umf1Ecj7tAbf5I7jZFP8qslEH9gwgaLeZuZk7hUb0WkEg8Go2q
	Vic+FPKdlzcwPrqC+7OsdHq
X-Gm-Gg: AZFdTZdYfib6dbQSbbtWZVHbLkFXHo2qEFbgPTN2ISk3nU03GU4XElIh4Rt+V2Pvd0A
	IrrC3Lu6JSMsCdVi9eQJBnZkH3FXs+7HeAJ0nrMEJDY/sec17Td1ic2sQdW19YWJHa5GgpqNx4n
	IrR2BNNAJ+2+2wldgqByAyZ8Opqr26JkaYw3VfB3NAesk+Q5347JOKRQhNlvY2zroHiVcaEziU5
	hsR5Gd2BZKgDg9Cd3GjKbbMzIgbowQfxX6CZI4xpDNYKxHfQ6UWRQzEOuZz4oS9i3XYocYIL/6L
	USea4ATdfiN+tSbvjwJPqenILej+5ml7Xb8sH+5M+D6ELVafoqx3mNYJ6EkdGulgL/lbsJLyhA3
	E4vz4xO0txaDrPAfDIhfc7p+o1ToLy6CMIR1i3wAwTx8gUlurS8rczTK4tBYSIedkK905er6gQQ
	TlvHeg2mMgG16NyLtNxf/QOpoiuPFN5nEg3OW9kFRCz9o=
X-Received: by 2002:a17:90b:39a7:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b41c961e33mr3550140a91.39.1795201860293;
        Fri, 20 Nov 2026 11:11:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062aa58dsm3592906a91.5.2026.11.20.11.10.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:11:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso236115985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795201859; x=1795806659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8eWA3MZ0eEFDvLHaBWtEpinN3qOx1VnZpieDpTE5ys=;
        b=P1GXsIfW2byvL/pIY0MoTb5D2/1V7/kxdLovQRQY4O+uFL+kJeL7shNHvv1Q5rgOY+
         RwYM5JHxvgBZjx9bM3UNL/BFViT6U+EznQ1JXpx85/mChB78jjVaCm3OBXYXoSLUVcXO
         e7CJZLh5WKkLGgztMR890OlqFbHE9RntuAKXQ=
X-Forwarded-Encrypted: i=1; AL+hErFuEtzix3bMjiniu2ScPfJJIlHYc1wyu/5QO1XqoQXMb8Ede2VsE+JKM+/4JJJe2KEDun0wlyFNTUvIWyk=@vger.kernel.org
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr692203585a.5.1795201858854;
        Fri, 20 Nov 2026 11:10:58 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr692198185a.5.1795201858397;
        Fri, 20 Nov 2026 11:10:58 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm261924985a.15.2026.11.20.11.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:10:57 -0800 (PST)
Message-ID: <53f8b30a-99d4-47cd-9838-85aaa4da6df1@broadcom.com>
Date: Fri, 20 Nov 2026 11:10:55 -0800
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
Subject: Re: [PATCH net-next v4 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261119005943.999981-5-florian.fainelli@broadcom.com>
 <179515311151.3136.11984816802162340674@kernel.org>
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
In-Reply-To: <179515311151.3136.11984816802162340674@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 21:38, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] unimac_mdio_probe() now sets bus->read_c45/bus->write_c45 for
>    every instance, including the one GENET creates from platform data.

Your analysis is correct: without a DT node nothing is masked, and 
bcmgenet_mii_wait() sleeps for a timeout per frame since irq0 is only 
requested in bcmgenet_open(). I'd rather not special-case that path:

- it only affects GENET probed without a DT node (ACPI/UEFI), and it is 
an one-off cost at probe time, bounded to two failed C45 reads per address

- the C22 scan on that path already pays the same per-frame sleep, so 
this slows an existing slow path rather than creating a new one

- C45 support is a property of the MDIO controller, not of how the 
platform device was instantiated, and gating it on DT or on pdata would 
make the driver's behavior depend on the firmware interface.

The commit message now says that this scan runs there and why it is 
slower. If the probe time turns out to matter, the fix belongs in 
bcmgenet_mii_wait(), which should poll while the interrupt is not 
registered yet. That would speed up the C22 scan as well and I'd rather 
send it as a separate GENET patch.


> - [Medium] The patch's own comment in unimac_mdio_addr_c45() says
>    bcmgenet_mii_wait() can return 0 after timing out with MDIO_START_BUSY…

Agreed. v5 adds unimac_mdio_wait(), which calls wait_func() and then 
polls MDIO_START_BUSY. Every cycle goes through it: the ADDR frame, the 
RD_C45/WR_C45 data frame and the C22 read and write. MDIO_CFG is 
therefore never rewritten while a frame is in flight, and the read data 
is never fetched before the frame completes. The commit message explains 
this.

> - [Low] unimac_mdio_resume() now takes priv->mii_bus->mdio_lock around
>    unimac_mdio_clk_set(), so system resume now serializes against, and…

The commit message already said that resume takes the bus lock around 
unimac_mdio_clk_set(). v5 also says that resume may now wait for an 
in-flight MDIO access.

pw-bot: cr
-- 
Florian
