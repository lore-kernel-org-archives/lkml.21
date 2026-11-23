Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462335;
	b=U8X29X8dBEJxNaPcN6+G4qt5RRT8xhK8IDpr8qVC7SZVwq1eUcDaGLuOdeaczS9dM7BX
	 756h4MRYpJGhp300wPQGJk7gp6J5rsEoF1NiqHHq7rQESPJlIuUUo6+7+D2EP2EbC2N5c
	 sWaRSYbaGWW/+X9V0nyHEJSAQ5kwJzwjlegGJKTuFngloMMGwecBjPMRiaaoDTQWecqYS
	 9ke5suzbzWcU5DSbIf8swk1jAQ6zTe1hJYpGUPQIxBbGziEsbYuSSHgH4NbKlSCgRcHd/
	 SRrkfPcGx3jDUfmjz/x19oJI8nF2J0j4FaPLcz+OD6/6wpge48k8Fo7BWzzlx9paRUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462335;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ZhoRZJWv5WDLgSJ4NW+wzm1D4iqQUFLyqGAdX1OGoBc=;
	b=E5GxoeltOv6scA4wU+gp5za/GZeDI3JjKJbpLo7lbtDtVc5DECPeAfJwsEoUHbYTvPmH
	 3hEzf3PfXNzIWEzFNW0n2I82nt9OcFvOJxBPCDLomZ5+D/RPKRFLhMisw6xxSD7di/HqC
	 wPtvjTNSNZpSWIvekXAv7PTYc/ZWO7IHsC8WYsj3Rc2TlxetuEgbEuuIU/Hn7VzOBN32C
	 Hoii9IeHJhcaj9s22RKU8Z7B9yEOILsf5CgrvJtUg/aYHBQ1XHwAo3W2RpbLzCVzqX8w+
	 ZGAtBGdDe/wDs24ozcxkEX+ZMLYZaUoROuBjqSS/q/GBRx/zo2E5XyUxT0KUOz75vmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D8IR7l22;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30BC606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30BC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D8IR7l22
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so2099487a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462334; x=1796067134;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZhoRZJWv5WDLgSJ4NW+wzm1D4iqQUFLyqGAdX1OGoBc=;
        b=zjfJ6vxueZpQ7zy1u5er+IkK+LP9dEQK6aA4jS790/fZIMyQto5rtZGBkeiz6kqO6j
         fjtOvOCkQ8sUyL+7neG3DuEDD2386fv+3cQtVpDpe5FC0v754bg3CehCzbNMYxxLks6u
         JA7CgGXYF8Xal/wpLqzD7Vi764RNx7UewRluWEYXBoY4cF31TubgCN4P5A/7ISxl9fbD
         HKKhEhlVBM7nnrPPl8v6UPTQHlbadK5e9kHzLtoxiCI+hDvbKZM7uuNxihoRHky1khKj
         VrlJEpcf3DGOW+H8YJzl5WVbAq0ZcKan8Yw8j5gxA3QcLgRlVMN8AxAloVdnjLEhu/m5
         Rqvg==
X-Forwarded-Encrypted: i=1; AL+hErG4pgWQarT2X0ADgrCf79XdhfrWvyBnwxYtTdItEPkpJG37zpcSDEKcRS6hOzwsiB/oWaMpxek/NFFWQOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HQlDoxksOFC7xTjTlKA63K4rRdDnS6d8BFFZaczhPRD2WxMgv
	lcMuYYowX0iKlYIkFQpice4Zd1UpOlF8Pza9AeiBAMN3ZVAkhWnYOinrK2Frtdr3IbjYMY/lXBu
	QSWgpT0YnQ4+uoxf5NgMSXg1HZVqnlCC8PbslMQJicErmCmRdkaUYMnhsk4kRAoO1KYT+9MZJtn
	zE4mUvBzpHlSt9DZGWrm+pZ75XfPVBcOWKyzj/JzZrUbGAm4XOxCdwmf0TWHxbnkD11iKjAfgCo
	+/sRW6IYiBL+xXOhRAKK+Xx
X-Gm-Gg: AZFdTZdNZFsptGQwRY1plQ+iYH+2lybSQ67xLtMJQyDQ1hJjtAhJJLHAICsUoCszPRA
	cwCr5UzX8R0uoA8QuBOd+SKFD1rGwwa38t+pEt4L5L3lxYGJrPncPLphUtgLEgvUg8NLlUVG7Rq
	v69eh1pyz6z6soN8gldhRN+xVuWVKw1aovVRCofdbDkDaE6+zf3zM/KGMi4uZYJN6GLHPfeKw75
	ZNSkygDE9tU1zOpri43JW8oj4BLzNd7VZHliy/5r+uuykcDvsgqg5mDsmDvolI1zMF9hIGGkHq7
	cJ1MD4H7m8mYMy0IFaYEhsjVU/GwkDguUzH6WDESbkxJGT7g5P3wICaRoWsHRPwBRKa9U/e3/TD
	6MZGYzQqmbe4Opy9Tq0SItwztj74+StaiT8Q0uW8otbviimuAm956HXEJP6b4cTCWp6smcgoZj3
	TQ6UkRGwvAHttB3Aa+S+x+SqAlQ9QKLSSislj52y6fl5c=
X-Received: by 2002:a17:90a:d2cf:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b41c8e0507mr7673361a91.8.1795462334418;
        Mon, 23 Nov 2026 11:32:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm8739016a91.3.2026.11.23.11.32.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:32:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso4542604eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795462332; x=1796067132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhoRZJWv5WDLgSJ4NW+wzm1D4iqQUFLyqGAdX1OGoBc=;
        b=D8IR7l226jkbPt2XLGzFEHKpeTcJaBjbSqQsPqZ4b+DQwih2VLzrUFRMbRraJLMovl
         HQiaquV5UJtPt5sWGhLWFQKjTH1xYDbOJ9fl76z0bqCCbgp/epo72Jc1kJY/iT4nkJj4
         bltyeyFPizUCr+Qnt1NacASIfizPqZyw+2iWY=
X-Forwarded-Encrypted: i=1; AL+hErGvYprb9b9fn5CU7AF8LVCSpYeDIeL5cSGZdXRzf6VwTRE+NFmYgRYF1Oab315EmDd/KoNm1iJPmYjjZkc=@vger.kernel.org
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr12630852c88.5.1795462331708;
        Mon, 23 Nov 2026 11:32:11 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr12630821c88.5.1795462330903;
        Mon, 23 Nov 2026 11:32:10 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm42340205c88.14.2026.11.23.11.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:32:10 -0800 (PST)
Message-ID: <60b6bd4a-c508-44e2-ae22-3f8bcc594457@broadcom.com>
Date: Mon, 23 Nov 2026 11:31:49 -0800
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
Subject: Re: [PATCH 13/13] mmc: sdhci-brcmstb: Handle absent optional
 sdio_freq clock in probe
To: Lee Jones <lee@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ulf Hansson <ulfh@kernel.org>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261123191703.179283-1-lee@kernel.org>
 <20261123191703.179283-14-lee@kernel.org>
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
In-Reply-To: <20261123191703.179283-14-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/23/2026 11:15 AM, Lee Jones wrote:
> Standard MMC Device Tree nodes may specify "clock-frequency" on SoCs
> that do not provide the optional 72116B0 "sdio_freq" clock, in which
> case devm_clk_get_optional() legitimately returns NULL.  However,
> sdhci_brcmstb_probe() only checks IS_ERR(base_clk): when base_clk is
> NULL, clk_get_rate(base_clk) evaluates to 0 and overwrites
> SDHCI_CLOCK_V3_BASE_MASK in host->caps with 0 MHz while leaving
> priv->base_freq_hz non-zero for system resume.
> 
> Check IS_ERR_OR_NULL(base_clk) and clear priv->base_freq_hz on the
> fallback path before jumping to add_host.
> 
> Fixes: 97904a59855c ("mmc: sdhci-brcmstb: Add ability to increase max clock rate for 72116b0")
> Closes: https://sashiko.dev/#/bug/linux-88799a75-1ece-4f9d-bdab-eeb713627ab2
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Not sure this deserves a Fixes: tag.
-- 
Florian

