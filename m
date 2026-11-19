Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129288;
	b=gFote6K+f3mOaZphZHYuoVFXlaNa8Gc5vXTv2jUmN3WRLNTszhFrNl3LT+gXi7zaFOnN
	 tPWUD+76mQyjqJN+OnoId+f8uUx0SrjA+SIR/2+YXAVOOb3CDLdouBI7BNcpLsCYsJ9JJ
	 +npLeOR6c0Bgzcv4mMKyMrY5YwlJ8Vup7x4CeFHj4yrswYUwyZBsUm1Pg044dj1e6j/nq
	 1G5JVw55r2k5kreHUef3DgJvFns3DPrxJ7HktfHl3Nx38aIGhm3KYI64CN6O/0KKeYtWM
	 xIAb1ckAzvAlu8EagafrK75gBInOwtPDMkSqgFmmzluR8Us3ylP4Ag1nnoG8EvElkrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129288;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=vjyYtMSPE+kcnbHoooBRR6sQV68igKkNjdsU2w4Af7o=;
	b=0OvKdFXqe08kBMHfJuo/wbe1bYK0XvOdy8KKvvYG/9qsAEYRZQZy5JBfDAxXotOPp9KF
	 PmdsrvU/3qcPremmKXmQBvbh0N3MdQi68Dhn7exBPbU7+xuJI7cYjYwyzn7oreIW/WbhL
	 nN42bJ6poaJuB4w+qoDdJjwemnQt8xulP4NxQXcNSXOgcPrbf/QLL/Q9Hz/+Bp4KpkYXN
	 EOCOUzWNcG6Hn794cI9GbeUALeMb71SyQn4ipZzY9qKMX4Lp6ZWwcNi5RBVwJsCtrjdOq
	 BR9cqDy4L1KVK5+eHqPS+xUxrPDd2WLInDnQVHb5DF/eiSEF1w7okBpkBqLy8gxie0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Sb2FzH1d;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B285606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B285606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Sb2FzH1d
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-949589c1495so31077585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795129287; x=1795734087;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vjyYtMSPE+kcnbHoooBRR6sQV68igKkNjdsU2w4Af7o=;
        b=ur4my4qEBStmLR99Lz0XQqV4TKEplho3nakYyJ8tjtNLWak10663Y89u5/27tYjLfC
         Qc2Sr+omURSldHQLwBt1F/GjA/wI8KJBYDYkcAkRmL3AaPxB2huDNQHZcgDtIDATq5bl
         GhEgqzQ+S93/EGmStNzbeKj08n3UC7PJgCcnCZADtkePdyWV7ypK6lxvwcOHAzGIQMoG
         Zn90WL/k1HsE2k/kWhUSv+xfNNpS+Q6sleYubg5MHHEHiReBbEZK3H8XwVSvTJGrKa4C
         srnDDYswmr2aRvmsbYW8AR+5h31Q3XVCeRFoFxa3BNSEy0hPtlrLYmcFXQ8ktiM8mAnH
         MWUw==
X-Forwarded-Encrypted: i=1; AL+hErHH5HvQHy9fbtmCedLtol33py3ZrUWfH+MeZWKKV5YQ9gUoMpUmnWM6tRAy82KmH8v6vbmmx4MzXDMB1eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IEIh+ererCiDgb1giisI044TB7NfGXFos74RJWq5gV/DgspOp
	8saqu2jHU8oGWyNIvJIGdgFf0UG/KQ1xXQpAo34Glach1XVGz2Lml5wkFuiO1ESxRbkoKoEnhXy
	mho3ZRbZQTdkxOBfw5jEi5R/+L8RYO+uw7xsnRl8LQO2/o88A5CPZMTq2m+iAzn0Lxj00Kx8ZQU
	hPikOaoJK++7eTtsoba5mmEYSQ6p3BoL+Ha5aUpf3RcPc0CKIvJXcdQRWZA3zjF+q6qalco/6sk
	8AneAB38mALEbb+jD7MRwze
X-Gm-Gg: AYBFou1TDthmog79I26NbzPi5faBToCCDGdWqVvOFv4rvaWJvrhbMBIrPtMaCi6t4ob
	yNa4CwHb0Z+vgrqJX4MVgPMelYGejCsr9181GQXGdy9GLtQvaLwSlxpfW7VkExWoO6g5sK64bSD
	62itdXYsrh/pVgIuKuGAH+zVygDJ5p7oIbcqlg8JpO9W1ihNiYLtjXxwNi2yGsJZ0m3QXZWS9kX
	GYYj1aXXefsHMUYpEwdmG/RNi4Ic7runpLU5IO2QYmsJCTx9w9ne3MVjFQvafOuMNGEvt+lL56Z
	mw8S6eQwyFGbbri0Y1cxJ+IgfEPtDJi4uKY36YJjDMBs7cp+Dj2stie1Zb8EmYqkID+/ThBp/RX
	AKPxFehPOqvY69fgSZ+Ii8KyiW622usx+YvrjSOAwV+BzHlwfNJIcjIwGZLJsvb4jAELwYu79tg
	GBvAA8OzH7g8RWQ3fDNrrO+0cysEJZZ4/A3h97xVtyDuY=
X-Received: by 2002:a05:620a:4550:b0:93f:3f86:c4e9 with SMTP id af79cd13be357-949bab735c8mr208210285a.79.1795129286919;
        Thu, 19 Nov 2026 15:01:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3d0897sm6938085a.16.2026.11.19.15.01.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 15:01:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b3030bd581so4705587b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795129286; x=1795734086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjyYtMSPE+kcnbHoooBRR6sQV68igKkNjdsU2w4Af7o=;
        b=Sb2FzH1dr+bfol4JSZn8npfzL1ejJoWQnQ4d3n9vIg1w7obSsiQCGhBkOEk3hv6K3D
         hA2NHI6kjc998xFll4SQoWn8/od9fu6tqpzum8FlJxWtEMZz4q6WQ701UcpsfJgLyJFE
         tNrjcZJUkHKTerFX7qKUZ3HiTq/iVeibLX2Ek=
X-Forwarded-Encrypted: i=1; AL+hErHtG/q1HL2ZRL4HXA0Nxi8uKvqYMDKCjkYc+V+nkU8ng0Wo+rVUou8mDpO30wWU/xbwy23ye61AVMAo9f4=@vger.kernel.org
X-Received: by 2002:a05:690c:b1b:b0:8b0:a8f8:a12c with SMTP id 00721157ae682-8b520518663mr5353957b3.100.1795129286148;
        Thu, 19 Nov 2026 15:01:26 -0800 (PST)
X-Received: by 2002:a05:690c:b1b:b0:8b0:a8f8:a12c with SMTP id 00721157ae682-8b520518663mr5353677b3.100.1795129285587;
        Thu, 19 Nov 2026 15:01:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm63564185a.39.2026.11.19.15.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 15:01:25 -0800 (PST)
Message-ID: <358ff773-050e-44ca-90a7-a2510fdba288@broadcom.com>
Date: Thu, 19 Nov 2026 15:01:23 -0800
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

Applied to drivers/next, thanks!
-- 
Florian
