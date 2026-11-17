Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957448;
	b=anDTcYLcZDBF9+nCMuKmy3W2IZXP/jxRA1f+ICrUHmaSzwLqOGZPjn4m2QlG5e0ioI6l
	 IX1yZQ8ZOMQGs3k0Q7wc7FZAV+zWvDNv/wxCSoFfRR0Zbqo4JONslVzGLLRaZnKP/FhqN
	 oWUG3JBY+DvCvMiYDh6rD2zL4O7Erst4B0d/shJV7padlRf761weklcb15nt9cGeHC4dW
	 LFwpZcqd4klaejpT7C4EkEjJcj7Z8+crkJH50MJOwmiELXNjlJS+H6lGQsDBf5EyyqW09
	 7eTY5Qg2H1wFJj9Q+ktCM87A4OnrUit/PfrJuH5ryZXlnzuX1tVbdki4Ll3vPMVNb8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957448;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=YN42KLvyZcy91IWqxlUOxZHph6z3eUCBXtgG5cXNtsc=;
	b=BuVubBR50vweFeH1eFn2sOZ+zPR7ZQGVq4xYLDB7h9lNieZsciEOB5aRREqLPjop7Gc2
	 COotEi3pApWAl+H7cA7mbeKCJX9wVC6p0JhxjucWhGjTI5XyrHqU4qptpmvIayWointQz
	 /SHlRSMssSKYzmVmTkteQgZr+INzyxbzUHHlwHxPU+IyHNsEgZJ61VqUkBfgYz4JzGzQB
	 oTp3mBGmO4hCpHiCSL6HQPtWCgZHTfsN2BetRvxZKoETcML3hdbZAvnNkdDFSLwk58qgQ
	 2jJtgdgahzOMyxR8hjpF2A+EAFrbbXXkf6VIFZ02mkycrnbot7DBHY7GZ5GgvF6qGWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="cHSe/7PF";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C95D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C95D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cHSe/7PF
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3bf3bef9aso259439a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957447; x=1795562247;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YN42KLvyZcy91IWqxlUOxZHph6z3eUCBXtgG5cXNtsc=;
        b=p6m+8+31TnBMEIRPf0UHkib0IChtytJsrGZxyen7W5JwpHpZyREM03sIS6ybAY6j0I
         4+EP3iWI5g+8Rp+1IJhujDPel7M6dJ2pQBcm7pcPLRBjpTe8fqrPFEyXD+2jncvPH1zV
         dF/BahIV8Fm0Kp5o7zpi2XXEb2W9qEP9af7Lcyyxrw7QeKsHUcPnbr7PxTF0Kw8owZyn
         mlB1gJ4Eoy9jVphAIk2pzWyNA2ZImYuuLdp7vY5r1Kiygc34ParoJPFGk7vldUqxL9ac
         cFqFuxk32PD/2uFyLZI2uBJEC9+ToxdVE/Nj/CVzTgV3WqEhuO6xYKN0OXE5X3iVr8T6
         MoyA==
X-Forwarded-Encrypted: i=1; AL+hErFS1tn5QLAqpp98F5zGQB+wxkzCANR3wMYAFZZc6HnD1jakCL0FCRNQ30KCauSikIzFNd8Gx29O4/bQj0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A5bduOPK/Kv4oLYT4Wslqk+zRNUNNczoKrZvyj74Y/c/IAOSg
	sQyfD4avPlgX1N+UtdjMqFdrskdBrxmFqqx1xAdmsiE+7/bVSlzDtIWOerlY/koPIWQxDiHtPwc
	O0bPX8rnEZ/AGfxFAUfN6R+nGRDOzXlgRWk9BP6ZBJ7AdPKVNzARSXM04QUXoJ4VDL/CTWotVj5
	y2+JiT7mNPziX+bv6VgwZyi0SeQxj+0BY2Mvq+T0hJhSgnGEYBWXmapnqLkWIgf9sQKyUHaWx+f
	Bb8MgYXltWAoZaTkF8Qm6iI
X-Gm-Gg: AZFdTZct8YHvGXxGkypuNFz9IAucigTZ5cJ0zAN+bvTABYBBcJYedHfADODNQA3qQi8
	SSaSqVcS5L5meDiKTFDu80t9dkG13/UKTqJ4leF0u5RBkBMe6hXCrY0cxFRmTnakecG9VP5ExoB
	snYuiTn0Xb9gq14BVMdhrePXwdcZjOtovzJ+CJht9pf+YbkbN+HXyXAR4wIQ7FwnV0LLbLGAnMy
	n4Sb/z0UOfIIvApj3PLLFz9oH0t1qszb4/C81kS65FcZpC51jro0o13e47f3VxC0/lFfJ7g2PZg
	poWokEoMGYrgT1TntGQFlPSCQz9cHOLpBv7IT/yZgipdTYq7YuiMrKAmIYM2cmGtsl+qkG7agZ+
	JhS3q4oyzeSpQ/EBYWaDA1x334R6wRPN5/RkK2nTlQV6IQmzz5wfnHhkQIdPoZD5n/MMXaPIU16
	PBMrk5wHDuRT23S0/F6I+PpAiNrmROuN2V87YLft3w
X-Received: by 2002:a17:90b:4410:b0:3b1:12ba:867e with SMTP id 98e67ed59e1d1-3b3d07a26dcmr992787a91.13.1794957447557;
        Tue, 17 Nov 2026 15:17:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d0eac5f4sm608908a91.1.2026.11.17.15.17.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:17:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so45092685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794957446; x=1795562246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YN42KLvyZcy91IWqxlUOxZHph6z3eUCBXtgG5cXNtsc=;
        b=cHSe/7PFvOnSeJuJJ5QZxyWK1Geu0R6QfU5sKTIJlv0pUIJ3BQHrZ5g7z0jucQNdGJ
         HvGFkv0x674WSpSahUolmXBX19n2fzkTo9Jyhk1w5TNUQyYco7J/JVEZUmfvoS/gj005
         o2tm922srLsBrVBM0ocR8zZwoizJkWv+YuVyU=
X-Forwarded-Encrypted: i=1; AL+hErHAoe0mXtrqRch10o7NySSde4wOSsNhxuTl81IfNBQUw5Ekq07uH0OT641cIrsqs0pi2yF5ksycJoYOAI4=@vger.kernel.org
X-Received: by 2002:a05:620a:6402:b0:949:3521:b627 with SMTP id af79cd13be357-949995d0479mr197202785a.38.1794957446255;
        Tue, 17 Nov 2026 15:17:26 -0800 (PST)
X-Received: by 2002:a05:620a:6402:b0:949:3521:b627 with SMTP id af79cd13be357-949995d0479mr197199385a.38.1794957445804;
        Tue, 17 Nov 2026 15:17:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b72055bsm41007085a.12.2026.11.17.15.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:17:25 -0800 (PST)
Message-ID: <2c3c20ae-5866-463a-9bff-607c38b16a8f@broadcom.com>
Date: Tue, 17 Nov 2026 15:17:22 -0800
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
Subject: Re: [PATCH net-next v2 0/4] net: mdio: Clause 45 support for
 mdio-bcm-unimac
To: netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 Mlody12 mlody12 <kudzo51@gmail.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 13:34, Florian Fainelli wrote:
> This patch series adds support for Clause 45 MDIO operations within the
> mdio-bcm-unimac driver. The series breaks things up in this way:
> 
> - make the C45 bus scan done by the MDIO core carry on when nothing
>    answers at an address, as the C22 scan already does
> - scope the existing defines to make it clear what is C22 vs. C45
>    specific
> - rework the polling completion loop to be a tighter loop
> - add support for clause 45 operations
> 
> Changes in v2:
> 
> - add patch 1, since providing read_c45/write_c45 makes the MDIO core scan
>    for C45 PHYs on all addresses that are not masked. On a bus registered
>    without a device tree node (e.g.: GENET with ACPI) a read from an empty
>    address fails with -EIO, which get_phy_c45_ids() passed up instead of
>    mapping it to -ENODEV, and made the whole bus registration fail. Reported
>    by Nicolai Buchwitz.
> - patches 2 and 3: collect Reviewed-by tags from Andrew Lunn and Nicolai
>    Buchwitz, no code changes
> - patch 4: no code changes
> 
> Florian Fainelli (4):
>    net: phy: Map C45 probe read errors to -ENODEV during bus scan
>    net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
>    net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
>    net: mdio: mdio-bcm-unimac: Add Clause 45 support
> 
>   drivers/net/mdio/mdio-bcm-unimac.c | 130 +++++++++++++++++++++++++----
>   drivers/net/phy/phy_device.c       |  24 ++++--
>   2 files changed, 134 insertions(+), 20 deletions(-)
> 

Sashiko pointed some valid issues commenting on v1, and has not reviewed 
v2 yet which does not incorporate all of the feedback. There will be a 
v3 submitted that incorporates the received feedback.

pw-bot: cr
-- 
Florian
