Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134851;
	b=k0b+yTiNdXxUz4kfGQH+AhtQX7sT1upiwEifU34X9QM/PM95kgAwrVdE1XFYsvJ3mB/G
	 yxeudi7OMfJhz/Ff0oNP5zwPIF6xlX2tlUtU4Aeb4xgHp6FSsmHqZplYAChKsARRrD0hm
	 1qtQ4KCNAydeStMIdm+7RxSZXEbycXyQDhNJFA3KtxTPs+InybLty4YRbSdfoRLIkgfLa
	 uxEcXuAeBZbYpyZxb7UnRwqXGZw1MMtf2zfIT6lNrnp5JVYTzO5575y2e1WrQRSc8528I
	 PtOSzRpySz0Pkzndoy//h5VQz1iIDn7g4yMDOLUrmN2c6nS6AuInpnGVCCBIQvs95UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134851;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qz5U4mGwLh00qUqrf5BWVDZJUydXMatPPBc7EQnerEw=;
	b=IzcW44xzsH+XsBx1mosL/VZyAbUX0k/PQsSEKih5QNVa7GlagDrbRENWhHcnscpOASiQ
	 TwHwbOr4EsqcxS7s7sC8g/8n0jVEwU0ewFZY5SF70FOmQXksSLQ/TbDkIbw5W2oXhOCjO
	 7lb4Gc0vwYkbtlS/T3oqpuAg4YfwNFQ0dqyeWJhjoaoWE7ANH0G5p/SKucUfCEMZan3H/
	 WMcF3DxAqiihQU2p8XP613BIsxpT4Ckrlv38LZlxeBlAI7Jfb/+FK/kKGXoFNaSrmceGx
	 7khalWTIjXfWn2J40FS2JBVWA8glENcwtWlfw5+Cksl5gZiwlLwTp8Ys8wyhes4zhtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=J1sHKXZl;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B2606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=J1sHKXZl
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cddc597d062so191937a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134850; x=1795739650;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qz5U4mGwLh00qUqrf5BWVDZJUydXMatPPBc7EQnerEw=;
        b=pGTBxToPYaGW7IDeeg91zlrihha26XEjNgDdxnwse9aknh3N21/21aDKzaVmB2tp7m
         ymQvxE0YdygVVl8ftCOEQD9WAwvtqvS9fAbw18Rrxz44njXnwXD2B++NYCouSkDkMo5F
         MzF2pEXc7EPEeL/K2EYE+FNjaNNu507lRNyzJ4Ul66PqQKBahNG7fcmRwnVn6vsvittY
         2I0S/k9apgW8Vp83l7HPU8vsmd/ci3NNhyymUiqu3xc+DPTfzXpwFMQIHVgG2b7NAuk9
         vPmZyHLPucPTN9Rj4fWAz/gYMKJyfEkSz6VK9POh9omslw9ummeYa9JB1jmuWV1RFFt1
         5ixA==
X-Forwarded-Encrypted: i=1; AL+hErEn4WKKL/Wd2He0V9yvYTtz9l0d3tZDViD6jPBQ0lMxulTsArvnnqMJkF13kG6s3U+uoE3g8mpCaj69YBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HxoEJvujeeyWDP+EBcFhs5aTpwb5zQgDfVJ1IjjQxRIvCRIXE
	FXpqk2JLgJk+WScXq1wKu1DWW1zz3f7TQzTqkcI7DEFQLIzhH3enEl7/Iv1nvS/2ci1lUvCr/Wz
	xPPtZBt4sX3zUOTdVydwLyymhT1ZIvSa4siRh7GkFazHGKZdu/SgT0sYU75WXYDOZyFAIaPSWaX
	ibM4NT1pV1f36Jos1G6Zf4jcx5jSp3++QPwO/amk4UA65LFex1zijGza9aWqSrpwOFTPqs+k81F
	7pLORKG3zv/YRIsK/IcK+LC
X-Gm-Gg: AZFdTZeE9m+Vw9OTfw98qGy4uqriVnRSU8dBP7d4Dtm6LcOJrRNukjTZxDhEGQ8Xl6d
	H5/03ZsODs6Rsmgtl3Tvm/ZbNeS0lvbt9QVnLOMcAvH6SmTU4g9wkNEGCTIK8YzAj3zC7A7WMWE
	qwfqy5QqimD7dUn9Sn2kNM/63DtP+jo+qSltmYEeW96GTczkZXa6XQpZK6/Dp754z6WXCPzyKM3
	wJ+EvqpUwrUWj/3OXDg2whR/RCYhnZabde+oldRYnB6gyX02EaXd/s1aZaCBebOgIeXZAi1K9lR
	gzW8CHyqxvnryATg6+DMBPLHrWO+5/o/ZXkRyISSH5UNyo6cDd3WCNzvwWINfADdQnKbTnpCE+C
	iluTz7JshdMlaNmH0DD7SRFJrFWX+idHpmoAMBzUxGZJkdOSIic8jo1d9cdFSrL+ueaggDk3CTz
	w+uWDndtY4P+15vnrm4d55GdU4Btt6IYyRsz5GFZemCTg=
X-Received: by 2002:a17:90b:3b52:b0:3b3:b9e4:e3f5 with SMTP id 98e67ed59e1d1-3b41c92a524mr996566a91.30.1795134850003;
        Thu, 19 Nov 2026 16:34:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm312857a91.2.2026.11.19.16.34.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:34:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso802680eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795134848; x=1795739648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qz5U4mGwLh00qUqrf5BWVDZJUydXMatPPBc7EQnerEw=;
        b=J1sHKXZl6P5SrmOJD7HkI1+EncTJ67m+hzwu2dZF2Y+xFofY8VaETkiyJ8g7Ow7gXd
         KBslTz0HebEg1W6KHM37J5DhDSpsb0nyNn1S1BbtcxmYXvlqrUhviPy2tK4k0CDVQc1v
         5/mGPoqAXB6lusK2XU5KOqWc2ObzMM7aQNfms=
X-Forwarded-Encrypted: i=1; AL+hErF09DoqS62+zdR8JWcLjOWsr9W3Dva+UBsBgYO5hExPtLBJvS4l4wrorv3GbsUM9dHLhOvVZbElf9VlSVg=@vger.kernel.org
X-Received: by 2002:a05:7301:6582:b0:374:e25e:a533 with SMTP id 5a478bee46e88-38570154017mr1680208eec.35.1795134848146;
        Thu, 19 Nov 2026 16:34:08 -0800 (PST)
X-Received: by 2002:a05:7301:6582:b0:374:e25e:a533 with SMTP id 5a478bee46e88-38570154017mr1680164eec.35.1795134847415;
        Thu, 19 Nov 2026 16:34:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385675c9a3asm1867163eec.19.2026.11.19.16.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:34:06 -0800 (PST)
Message-ID: <8c5327de-5765-4f58-8ef3-2d09e1841048@broadcom.com>
Date: Thu, 19 Nov 2026 16:34:05 -0800
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
Subject: Re: [PATCH net] net: bgmac: unregister the fixed PHY on probe failure
 and removal
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, rosenp@gmail.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
References: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
 <179513476984.3291.1559548469790216407@kernel.org>
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
In-Reply-To: <179513476984.3291.1559548469790216407@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 16:32, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.

This was discovered by a LLM as part of the larger review of the flow 
accelerator support. It was not triggered because it affects an error 
path and the driver unbind/removal path which is hardly ever exercised.
-- 
Florian
