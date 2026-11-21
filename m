Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220382;
	b=Rp9VqdhMMkNkXUcnb0+r8C+T/+Ca9W6C74BvWTmovbDJj/ltPmHQAHgLAdrxsDftAz85
	 aj2gLTNIi1mfiNv7kz6ZFJQsQC2MnSoN2qHJEKocdqNdBYR1ofN12OgiZ/+MJDXr3HU25
	 TTZwwAnvhXBGMJG/cJ9haxmBq70cBbFvEQ4odOmaW6wSO1kyU7V3xcu8CAzNU9iZ9gTth
	 /o/izEUvYZ82FYqzF/InRp0JmSb27yfYAY08Ceyw+07IXkslrtgN/iWKsB7Py2aT6dn/I
	 uIcuULv6Mg11IO8fXDOnQqALw7TihmemeWZovp0xM08gRatoZxyB4uWMcVdcBYlDnwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220382;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=x+k6bU8ujxu0vZUZ0ntTqhRxVofGERsYGcj7keUCzB4=;
	b=i7SqoSSfNvWZoc9TgEvzJwkgeZbv1F/Ttzo05URORrCFMpT1H2Iyu5jVPUc1GJI3X3wm
	 iuKi/f9Gfw7NXUB0GmHD9vUA6u9uOLkZ6UNjPmtzSepYlylczoEJwGn4Il6kRqaY12plP
	 ZtF9GOQxkLtXzugZ2H948/m60MM1iyzq3j366+6EjsQyhAc+xCFxUpJpXCu6MMxXABzdl
	 Rv3iDxCLwbYbgKsmz6fGrC6w/cWH3Gf9ckfxAcxZKfZsMwTN7MPGcZnxGTvbsn4oOKzia
	 B1e1/mBCB+m2KQH5tbuidJ0i3oot4vST1nXQvdmdJcWxp0WelSGu6RC9hXOYPxxlIxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WmzJNeQm;
	arc=none smtp.remote-ip=74.125.82.98
Received: from mail-dl1-f98.google.com (mail-dl1-f98.google.com [74.125.82.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E673606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E673606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WmzJNeQm
Received: by mail-dl1-f98.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1264395c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220380; x=1795825180;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x+k6bU8ujxu0vZUZ0ntTqhRxVofGERsYGcj7keUCzB4=;
        b=HBVxXnK3YjLm1WLYJeZXMf/2b8LcLm6gSNAnMRA6fJIr3EiWbrIzkisyOf9RH02Uqq
         kPFhq6LgQVz0GndWoHeHzVVwSeZnbM+n63l/QcIHvrc0FPbRY0nmLeq+y5I34fYk+VhL
         vg2aYrUY80IIRlqCLxcgqppaakihU0Puip2aWe1o4iZglAuZZ8ny7cskPJsp4/FYEG9U
         1OddaIeCCOl+PCcCsztphUdWmvEZqDzjOosST93NPboIw6xBUc5uhStCfLHNzfjnzXSV
         Xogc6021fVpMHLmIZEWByk3mwzxtG//Pvw/pLRsiJbM3nRs/xqNjhzN6GSNnRgOHMJq1
         aiCw==
X-Forwarded-Encrypted: i=1; AL+hErFPZnJPCoq9O+vJR6VmEc+MniE0t4SRPL3p4B15Aii7Xrqh8Et0F+crEegWsbUb/IF9WrMSDCsjUAkmLqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GFvlwQhH3Ydh/nlJQ52gQ1ZRUJvs5+2JAqCrRJPY8qI1FzagC
	uo7lAz72mPKwwyZVeIHgA2mlmYTu0p2brSm/IfRxu0j35SAh/BbYP1Cy5eZBpMMj6jQxjk0tStZ
	OmQgaEUR35ATT8cgUUNEO5DlMDLJXOleWoLmN/+Q8AMlJ4d49PmzDgZNweV9nq/qVqZkUuck8Hb
	5lLaDNO5+tr1MoFFgXu3pPNndypFtVwn9cW9wnFpvs9oSCi9DsT1tlcN1CzNYiFjm1C2o0xyunC
	vrY1sdAwbq6M0Hnb8j/Q9W9
X-Gm-Gg: AYBFou0I+jO5BcaIwR6ABTDN7e3B9Y/GutMzKO6gagxeXOJiYar4Kz9abXiYOccKknE
	TLT277DE3gMRKRmQHhkKpAIjmrgX0Ujad5ipZ3LIbxUJGEhuEeUtrLDaAQkvGb23I3AcOOzyqLf
	KuWg/YSRD8eFJRhDpqZRMxDKgFyZ4+AzfnaSpGiNLC2HpvVXRte+iDS4Fhwzv9j2BOjnM63yvx9
	ii/IY7LYEStYrPUSz7FbZxYsgEH+iyk4E9qSBYoD/e2AS4/Lc8ox4MarRD6sORtyXVdBNwf47r6
	m6n5RLBahInjQZX+z7HYe3bMqFwculzHXLw1CqcFo5mm9gKHOPxrfAfwPQQouAcJgtkt9Os0/8/
	53ZcbetR2jbKod0O4vmQliU8fJ09r1O5z/hBVzk9dFaPD+s0aQa2R/WanuBKg3v9FTM/fqBkE+l
	KTIxe+z/vNx2MPU0CB1MdI85i8w31P54yiybEhYs1Pgcw=
X-Received: by 2002:a05:7023:b18:b0:168:3243:c937 with SMTP id a92af1059eb24-1b5568bcb9amr5128730c88.16.1795220380000;
        Fri, 20 Nov 2026 16:19:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38566cd605dsm360491eec.12.2026.11.20.16.19.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:19:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso1634732eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795220378; x=1795825178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+k6bU8ujxu0vZUZ0ntTqhRxVofGERsYGcj7keUCzB4=;
        b=WmzJNeQmdyfsssVVFQlwZeJlx388Ct18rfCFiIhJ8+EsHyMG/TYow1Ye2OuExnyLh6
         k9n61ECxEHijWIoHitdzHMYmfa7TA0GVOaPbvfqQxdOlSkHI1HL1jp41su2VxaV9UV2U
         16attZ9ryJ6fMrhd18YXJbWOjrr6OCYj6zSEw=
X-Forwarded-Encrypted: i=1; AL+hErGpwZqdao3v1e9zFAFP9xAsIc9onqGDkW3NhdDkJv3u6B0Bzp6dxZH0Vgb7bnOzHJwz6jQrmQUMLPVMw54=@vger.kernel.org
X-Received: by 2002:a05:7301:7e07:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-38570e23830mr4338946eec.30.1795220378268;
        Fri, 20 Nov 2026 16:19:38 -0800 (PST)
X-Received: by 2002:a05:7301:7e07:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-38570e23830mr4338914eec.30.1795220377609;
        Fri, 20 Nov 2026 16:19:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm11314248eec.9.2026.11.20.16.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:19:37 -0800 (PST)
Message-ID: <de8e6289-9c2d-4c99-8f20-680e05397929@broadcom.com>
Date: Fri, 20 Nov 2026 16:19:35 -0800
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
Subject: Re: [PATCH net v2 1/5] net: bcmgenet: keep DIM from getting stuck
 after close or suspend
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Petri Gynther <pgynther@google.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
 <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
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
In-Reply-To: <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/20/26 14:42, Nicolai Buchwitz wrote:
> A close or WoL suspend cancels the pending profile work and can leave
> DIM in DIM_APPLY_NEW_PROFILE, where net_dim() does nothing. Adaptive
> coalescing then stays stuck after the next open or resume, and the
> profile index no longer matches the hardware. The poll also calls
> net_dim() after napi_complete_done(), so it can queue new work after
> napi_disable() has returned.
> 
> Run net_dim() before completing NAPI and flush the work instead of
> cancelling it, so the pending profile gets applied. Also reset the DIM
> state on ring init and start from the default profile, which is what
> bcmgenet_init_rx_coalesce() programs.
> 
> Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
