Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129121;
	b=uWA0ymegeyvcbNm/scCYqKnn2I6JxybCpSTxxuj7Y9DquS6cA49e2TPJJ1hddeDczFmG
	 HHf+m+f0Vz1opkzqh63mB9W/1tyNY4dI1ULn6d+iTXkLh1cAdA2QfIxr0EIMVtsgl5iCk
	 QtP4ZtxC3g7raTKJPzcQKyZp0Aju/iBAtt+6xU69xiWgSRsfXbQ/LBhd0KcTYz3YtzNgd
	 WdS4pm76qSgpXeWnf59V+GDofoDt/qa1DrRkbCl2wq1xuh8SQO89WO4S/DDrWvi1u2Nqy
	 yoOgbb64/AbsqulIZfiSEuQYDwqpSBKogdgaOAxeE4LkEcaW6EG7+GMAwDXO+1Ix/dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129121;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=xOFGCuOuftk7Jm+H2Fz+MNE7pDCNEdYzVrRVgRwRnqA=;
	b=yCbxzDpGj55DUuBGgVD1v4L3r8xyzYUo6tpZcPS2BCH3keWUFzEfm5Ki1QNzB+j1pBcw
	 GT6/oOO6FCHGIqcK0aLk0lKARLrm1X51lvcWiu+0qExYpek+eKHwDzYYExPMfk5MDBGiG
	 OPcvDC5jlAeuasyh71F+roJcqAF9i9InH/VWL/oKNpfHI0kDEQQ63ZchonmFNRKQDT5my
	 tI+fsuOwloh11/f0GlPC5l8KRfERqivzOMFsneQtG9RQZ2seNpQNOBazF80DbXbAe7B0b
	 Vdi+de4z4PqmH9roe3Vv/m+ukSJD/DvDgcQu0rMczkknGOPghr0r+26Ezo178WRVJ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GnUxnjUF;
	arc=none smtp.remote-ip=74.125.82.100
Received: from mail-dl1-f100.google.com (mail-dl1-f100.google.com [74.125.82.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A8606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7A8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GnUxnjUF
Received: by mail-dl1-f100.google.com with SMTP id a92af1059eb24-14394530ec6so437389c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795129120; x=1795733920;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xOFGCuOuftk7Jm+H2Fz+MNE7pDCNEdYzVrRVgRwRnqA=;
        b=eGlJKla02B7otp99tvAWny6Y80jUDv2X5NfY7JbS7jTcZu/rfMh5PveXZhgs9Is73j
         YuWRFeU+i7PSwhI9oYA4SsdvJ07SKyXtTdGy4/oy0rwKqBAiF4m6xJoI+ZckfrGzDkMf
         1RDxsaWI+rNbZboGIk6+Lh91f1GT+NkvLQ8TlKAvXg69TMxxFqpkSyw5Pj8eIFT5hEBj
         IKDH0RcaMaROfemlMRRzlg2ROrorEyqrKomU5mmX4cAlc+oMxGVzBOyOO2PeItpTJaw3
         3zyeh47zItrWFgKXCbYkZJrlEx76fQGdvH6ENhzOI2sucmnmalXk1BeXs4CVdZz0sgMX
         rhRg==
X-Forwarded-Encrypted: i=1; AL+hErEjeRk6CSoMra7dgm5GEI4c01p7wP/1yMRBjBFYpcXO2GOoZhjuVcnk01P3XoMih6Rz2Y8zQDVTe6HLwlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uTcLUterPn4aBmzDvC6CrRRHyyqGDE7ru4IJ0+V0FpykeCdSp
	6LF7dQpDmWt7fHCanTl91Xk2Q6Mtl7YOL253wTDWWu+A8pPcW1TKGPbdw6JLt7QNInsliJnaqOi
	yBuMPLvLUC8DS/aYKzwOwhG+8vk3zixjukKNClG4cleSoYGQRvnEjWhGwmcueEHpkh04y/hWyrt
	vzitMHmfwqeAgi+uM7n/Tmi/jzq7cGdnmBcNcEYNcFxlf5C9WKc2QnE58NVQ/ZlWsMHC6rrJQy5
	HNAqP49nPN5V111twlO+fC3
X-Gm-Gg: AZFdTZdd5Qc+AfQYMaFaSma8/Npq4Fs2fAFta+UleZy+m+DgyYDJz8Yv8iAAYpzNc2A
	Eydxr99sqcKyD3lmG32l7KsGjjjifXkdGx8hLR0g0sKhgZA01dLt7XSLqIb0Ghv1eRPPK2jDaUC
	p3MJvGQtsqDoVPoM2A/hUaeHl2l1n7jlmMfFFS23sWXmUi1G2Yf5B5XxuOkN6kFC7ZWqjAG3F7m
	03SJK4aM/kvbRp51XuVYfMCMDXFhZ23u0S8rY4oAGQPnbRqdACfPxPtje/kg3/d26NUNE7/V+kY
	Ed+BW64VqxJBSBUNCbbwhpvnMKzwcOF3UZNTREk1K3jSc7XwZyUXDpKsV1ip8bjuYQGgachPg+2
	NKgYrHL9ciAtvmm8SteQpAE+aOBhmPsPfMRyQ1nAuezrfoAW2+PB2n1zcSOwcZO7iYBD1V7zsYl
	BvTLUrmjwDmoaYbfp6hvH4d+1S+vWt2Y+ov4UxklOydxg=
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr833893eec.12.1795129119574;
        Thu, 19 Nov 2026 14:58:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38567fa0a44sm69229eec.28.2026.11.19.14.58.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:58:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso72579485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795129118; x=1795733918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOFGCuOuftk7Jm+H2Fz+MNE7pDCNEdYzVrRVgRwRnqA=;
        b=GnUxnjUF+OfnWsagjhbol6lAuUSsagg7iGL6Tr5bTucc24cR2UhtNPNYhz9rKvPqO5
         0P1r1lco/mSoOnrl686vGZR8eCfMR3H446jNKq28NlOnn0s/c/s4STQAm+uZx4fGRgWm
         8e8FKItwyDux0c8/kOV4LOuOCFoJFcuaq7VjM=
X-Forwarded-Encrypted: i=1; AL+hErFEBZ9sfLW+GZYYtaEoyuDK4qNSOUnxi9W+eWmN1Vx7fD9A4jmEUeGWquaA6oaKeTXvdn1thOnWMiU5Rhw=@vger.kernel.org
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr196533885a.61.1795129118315;
        Thu, 19 Nov 2026 14:58:38 -0800 (PST)
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr196529585a.61.1795129117603;
        Thu, 19 Nov 2026 14:58:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3c2abesm63934585a.26.2026.11.19.14.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:58:37 -0800 (PST)
Message-ID: <9b20b5f9-5568-4ea2-abf2-f609d134cb92@broadcom.com>
Date: Thu, 19 Nov 2026 14:58:35 -0800
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
Subject: Re: [PATCH] bus: brcmstb_gisb: Check required IRQ lookup results
To: Alex Guo <alexguo1023@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
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
In-Reply-To: <CAAi4Z-fjR27iAXjb6VpovSVVObqLcLgurzuhCkDFqgGafyAaDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/14/26 06:22, Alex Guo wrote:
> platform_get_irq() can return a negative error code for the timeout
> or target abort interrupt. Passing it to devm_request_irq() can
> replace the lookup error with -EINVAL.
> 
> Check both lookup results and return the original error before
> requesting either interrupt.
> 
> A similar issue was fixed in commit 47c3e06ed95a
> ("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").
> 
> Fixes: 44127b771d9c ("bus: add Broadcom GISB bus arbiter timeout/error handler")
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> ---
> Build-tested the affected driver object with Clang 18 for ARM
> (multi_v7_defconfig). No hardware test was performed.

The patch is correct but I am not sure which tree you applied this to 
because in my tree (drivers/next) we have not moved to 
devm_kzalloc_obj() yet.
-- 
Florian
