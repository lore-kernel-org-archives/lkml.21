Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110335;
	b=aQGUJAKlZN+S3TzK4uziVmeHA3qMj5KoFPM8UBLJY2aVObR+OjM0S+0OvrztaBSZcrXT
	 rW8BgT+eCI1onSrD/5Kgq6DaHN79ADh6tA41RDMLtuxqI1BvbujQSe4eIe2cAtqD3Z+4w
	 xrDJmHob48iisWPyD0ynVGDASQLmT6f5pYi6q2hy9oC6FWOzA3HvoQIECFs9KQxMRjVoG
	 BSvSuuaq39dXQKN6YMV0vJt1jwsE6UsYyaWjAh+V3xK5GG2j4TqsX3aeZXfltzV2X82hJ
	 FtAP0LE8EqEyVexuuEngKeZPW30WdkASQo9UIDj8d3s+tEjpcCa+SJ2DrD5c6ZGJKmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110335;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=/VO7S31FkGAoSUmTbp7Ige4PXGLZF962QvOeKjSO+ug=;
	b=uURfhB1qMFDTCEFYDmS2ir0eA9oKsphMDhivT81J+f4aBQfsieZKAVVW0ou4b8CF7s18
	 Lsl8zFWM/JyQwRNy5ad4E2U1iNbOE58d3G3goHmfn0brCY20Ovc8FB9qwC8WCR71cyXUb
	 BDblj5mtXQzQWGETfjyuM8yWGLJvosWmAlYVL27pTURl0QgoVBbATZTYOvZqOC5BOdF54
	 /JeXOfxcNcElkLpQLOndSIpWKT/S3dV9qCthec3XbvZ8sA1ZsgbgLHzrKX/gCQjQ9dvee
	 0A43vCVdQXckvmRzuFbGlq4CGHOoyW6ySuafdxHhJWx3Js/j7M1HuiFXe6XiXvNTRLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=by7CaCeT;
	arc=none smtp.remote-ip=209.85.222.97
Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB84606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=by7CaCeT
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso9849241.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110334; x=1795715134;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/VO7S31FkGAoSUmTbp7Ige4PXGLZF962QvOeKjSO+ug=;
        b=rq0UAXQ/PmTi6K98JE0tIUK+cYW47cMyIM5VRLftrv1HQhiu6tq1CR+ANxjWfpEsLw
         H0uyz52HNhhzq6ChOKY78YP0RZphiJt7ytZbvooNTxcO5HkXkPOVBohif7r8XupUuNnB
         cgRYSSXvgLpE/H+MMpqzAMxUvks1IpUi6tr4sFfXyykQ28OK0D2Ah+FajhTE3ejyIVcf
         LS7Kd70ldbUZlP0UItOcCrhDEpaIpd0VkAZNvNen6NtJU82BzPBoL608L9q9CdTBqtjH
         x1IZiIFGOuk74Xk+WYit/U7ERsNCxbNbfE5E53dD0OKllP0UZjJu1UENyJPFA0IAp+Ba
         oU0Q==
X-Gm-Message-State: APuU4Z+CnY9Ua04CU6HK+Knca8kLDf1Qzwiyl0ibhToZKQr4bYECJTNy
	X0P6NQ9JhczZ+T8xLxtyKhZYOQmlNSv9fXJHFqHYGk94hyOWU5x77eLXNH2MFbE1capCmHSNty4
	VFGJ9tvfkdmsnRapXKn4GfX/yXXvSIjlLVbtZ/gfsH6KRUuHDLfIgkSXFTAo2DDBjNzN1zGwMBp
	may3swpoSxjxDnS78/Hox7w/3Q0zGvhG6JW7EyZgxUk+NxDL2K32EkdhsfkTK7GSzFPy2iMHwuv
	czcc6jIWFEFy5bD3ZUWULTt
X-Gm-Gg: AYBFou37vr95jWbg5oUdUieB4bQacFq3Gjg7RyRzjeCuuPtK4NU9NfW4WOB4+x4Sg18
	uLUvwct5KCMYZsIYUeTSuaXDVX0ymYFAR9x4ei5z3XQvBYCataXNQBfbqANZL901TQL1AEHbpko
	Uf2vN5wjLQCFsa6HbXOBlDEiCNI8pgSIVRcQtPaVT/0qE1iIdhGTmnaPlAe2fAsLAWl6Yv+tfmt
	Fb/fHhqrHLxzaHRvbLTTq4SmC5tMRRiMehjt36dvyT3sZaCjl/ynp+NlCx12Lptw9C2DZTtOJ4P
	Zawu8Htl1yt6qinRvYjtvoIJrrpAxGKPnTt4nGBlqiIGXGE5mXaPWSlemOr0/VdbwhovxIgd4pj
	yIchFdOJUzz9Gc3jrsaIdQFOckpvm8+LYdnEqzCHzQX+O6moxuA0wVPIkf/JIF43mD+26bMbF2i
	X5kvvMg1gsEoZpEzMf67AaBNAeJtqAUMytAmPAmwFX
X-Received: by 2002:a05:6102:5811:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d7393c88e2mr92774137.9.1795110333817;
        Thu, 19 Nov 2026 09:45:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e1c08acsm57422241.20.2026.11.19.09.45.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:45:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d3232fso5787885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795110333; x=1795715133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/VO7S31FkGAoSUmTbp7Ige4PXGLZF962QvOeKjSO+ug=;
        b=by7CaCeTprJVkImu3ONyasvW84c1RXHkaofbv8hihSL1ymJXwasmsOPqIz+cqfPdbl
         /rKu+SUPjRVzqfbRr9TRYla9rie5yH+K0BzVf106Vgpuos516Aq93qcq2pWBa6BYzo9L
         NIT8YrMLcixajw9WN2MymqgsgSnJkJeMEC+S0=
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr48356485a.72.1795110333121;
        Thu, 19 Nov 2026 09:45:33 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr48350585a.72.1795110332689;
        Thu, 19 Nov 2026 09:45:32 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm9585485a.35.2026.11.19.09.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:45:32 -0800 (PST)
Message-ID: <5c639eb3-f986-48c6-8a09-65d523b79535@broadcom.com>
Date: Thu, 19 Nov 2026 09:45:29 -0800
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
Subject: Re: [PATCH net-next] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
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
In-Reply-To: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 08:37, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 19 Nov 2026 17:30:09 +0100
> 
> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
