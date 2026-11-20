Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201490;
	b=g8OYyaOPr9G8KyfDrroXm92Kukkb7PwnalISzEG/L6bP3pnPU8e6Q618jydGv45F3Yr2
	 0o8vdlVvTk7g7ybxPlfW4BYtN2/l+IbB2EfTLHtrMxuIGJODZ/FP/VH5nPqGNR96Xw/7Q
	 AWJofby/kl/9vK8aeLvmSu+xidsUPcmWEwwkDKxJThuBUo1HtXJsFosjnEyQUZRX6Vc65
	 n5ABuPL0m/A1KsmgdEFQwE/oYXw934eEwQZmOliNKXJh8Nxrt/mTT4Xqxpy8R+gO8x8GT
	 MsmQORGhSDYCogSLgtsbLcwr9SV0S2KZYyB2GYEVfeE1ORNqFhp6tr0cSRjLpj8Km7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201490;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=e8tx+aEQeIA2ywUDExvU1fOBJ1ZUFUsks4xrP3holok=;
	b=cCPE9wLcER7l1b46yQSl20gZ4YHx7KM9KpLsyuJSNkBHBz8sJthbJ/DRp1ZEzbfTI81e
	 iIdCAUg/Ckovs47xLagSAtJvuVGYRKN4OjjTGspqvUMV/jdk9LFWikKIbJeEKWRDNmTAQ
	 HzokMAWFc0MIKUOBAC9sUME/B8DBrbpWBcpNiLzvcKncXZYAEJoetFxV85p985uJvjoP1
	 rLbIutp2L7xuO+UWUseHTqRkppgeO+m2PWvMne8R+3OAoPksaPeP9FLHKl1OfCIrVmosd
	 AGQcU/4mAnwVR7C2xQsuA/1y+NnLRxro3Qv8IeynIY7qmm+tEjjeR/8kpz8ZqIT4aPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bK8fVwWV;
	arc=none smtp.remote-ip=209.85.160.228
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ED260A2615
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94ED260A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bK8fVwWV
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-55d6deecef6so12525761cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201488; x=1795806288;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e8tx+aEQeIA2ywUDExvU1fOBJ1ZUFUsks4xrP3holok=;
        b=RStAYv/XFMQgw4dCyS8aWussmUZZiFKxHWJtKX8K6FCOkgmjLdJ6vEFIXOdUhB2nPi
         PEggtrVeDYNcy6Zma1yr+1Cpd2rkqtUYUbCfaMXMm01w8dIbQWajgKt+Pj1H6wab4ho/
         0kevuJFdsXKAorCQe265Uf8yGJD83Nblagk3PTJG6LdL605F4VsUuzUofyr9ay6Smwpj
         KutbXUn/2H3o2F56jjqAygKkOaWyNFcBiIs7kzuGSr9XkwrjqhSlz+We7dNL9Nu3OoAQ
         8cMK52R/TN2UyqjWRaRfILaPkCyC2c849mQJFoFCcyWzUx0k0fTm/mO9tb9kKr2Z8M7O
         i40g==
X-Forwarded-Encrypted: i=1; AL+hErHS5pkxFpnIBBlRMNNvldE5KUww8FTdoeYBt6p72584mf05zOQBWc81BeQMfgfvcWBs8g6d5AtSJqBqKLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YLwe3kmnXiuBIebhYV4FySQxOO4KOo3IicV5c1FmBQpVNRw6N
	VGkLn6TQbfa67gBR5UxJfMX9lpOh1WFsQTDl7MmYApL3x7C5PdYv6Xgp8uT3O+zkXFBnTDFqhRs
	62vf/G2LSH0hicTmJu/mOW6AVtZOrT1Ac68wuZmRip8tHU0Hq+BZ14mW/Yar7/b1H4fkt1a0NjU
	pp/a8NZCgim3MIq3W39gn5A+DUyVROh2xbDwYQtKbS27OJgomNhRgV3frQv80lGSMQtRk3JJQ1B
	LbL+MqwoZwEVB97iTiNDlQk
X-Gm-Gg: AYBFou3wRbfv9MS+P0OT89wWs8rKkH9ivAbMIamFLnnX6PZu33rW0zJLn5XuUtQ9FwX
	hYTy7oK7W0Uodomo2PXbqhFEJQth34TsQg+6aTrCrkobFrW78wk4ehoQ5HPH8n5xI2xQrqUhdCk
	kI1nKipQw33Eo/9GJEadFkmanW07YJX8LaErrHBeCdZFkWsoNKSKJptK1aKLCqAbUKe1HOv5Waf
	Cpluos2SwjaWB/QcOCMT1yFQX+ywOijlpxc8zKBpbXsJR1TcMnez1GDeS6if/WecFOKt7C12LA6
	xDlW000XbM9vtUNbABNXkFg8U4Beffbd9oqOo+mZG1IkBi7hbhgCDuUb6BCYePoMSItnutvYGvu
	EAziO49VRYU7th3i8a8iiJWZf0p9gyGZmUK1U9sMqBma+RqWa4awgtfsGawStyxIW8fRHAFFlV/
	ZPVXzL+7+91LdGX5jsSao3iWgc7n56JDClZ1HBljfEszg=
X-Received: by 2002:ac8:5707:0:b0:55d:2c25:9c79 with SMTP id d75a77b69052e-55d76a87794mr72974861cf.50.1795201488449;
        Fri, 20 Nov 2026 11:04:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3fa5e0sm26687685a.19.2026.11.20.11.04.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:04:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so3345711eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795201486; x=1795806286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8tx+aEQeIA2ywUDExvU1fOBJ1ZUFUsks4xrP3holok=;
        b=bK8fVwWVzTFs9Nq/ua6o6dlslXK+GEmF2zyVXsniG139r/Cah5JZkiANrYGr9Vk7iu
         6qk+3ebabuiMB+0RocdQWMVTr/sN2IqCYsRMRwx3fxClLwpAIdZEVJZZxbsSR0v344y2
         zlmn5hT8UQMUV0/4TdTc9Xa5Pt4tj06JfFyLQ=
X-Forwarded-Encrypted: i=1; AL+hErH+DKTReqk7HIKxw3mJzEEbDQ7kttZlXzXZjFOOjJLkZHFBM8wwxVXf4H6m6glx2KzmoO4odSUeOPy/DrQ=@vger.kernel.org
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr3485185eec.30.1795201486338;
        Fri, 20 Nov 2026 11:04:46 -0800 (PST)
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr3485155eec.30.1795201485670;
        Fri, 20 Nov 2026 11:04:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm11364080eec.28.2026.11.20.11.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:04:44 -0800 (PST)
Message-ID: <47288660-1e56-455f-9686-ee58146bb865@broadcom.com>
Date: Fri, 20 Nov 2026 11:04:43 -0800
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
Subject: Re: [PATCH net-next v4 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261119005943.999981-2-florian.fainelli@broadcom.com>
 <179515311013.3136.13885466048757926038@kernel.org>
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
In-Reply-To: <179515311013.3136.13885466048757926038@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 21:38, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The -EIO/-ENODEV -> -ENODEV mapping in get_phy_c45_ids()
>    (drivers/net/phy/phy_device.c) applies to every caller, not only…

Agreed. The commit message now says that get_phy_c45_ids() is reached 
through get_phy_device(bus, addr, true) and phy_get_c45_ids(). It lists 
the effect on the other callers: of_mdio logs the missing device and 
registers the bus without it, sfp ends up with "no PHY detected" after 
the usual retries, and gpy_probe() now gets -ENODEV, which the driver 
core treats as a silent match rejection. This matches what C22 callers 
already get from get_phy_c22_id().

> - [Low] The commit message gives the UniMAC MDIO block (MDIO_READ_FAIL)
>    as its example of a controller whose read_c45() reports an empty…

The commit message now says that mdio-bcm-unimac does not provide 
read_c45() yet and that it is enabled by "net: mdio: mdio-bcm-unimac: 
Add Clause 45 support" later in the series.

> - [Low] The patch rewrites the kernel-doc of get_phy_c45_ids() (lines
>    826-828) and of the exported phy_get_c45_ids() (lines 1107-1109).

That call is intentionally left unmapped. It only runs once a device has
  answered, and mapping a bus error there to -ENODEV would make a PHY 
that fails midway disappear silently instead of failing the probe. I 
chose the second option you suggested and reworded the kernel-doc of 
both get_phy_c45_ids() and phy_get_c45_ids() to say "or a negative error 
code from a failed bus access otherwise (usually -EIO)". The commit 
message also states that the vendor MMD presence check and the 
identifier reads are not mapped.

pw-bot: cr
-- 
Florian
