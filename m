Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428033;
	b=BJbc71CYDsyAdc5rByDCMTU60pHY1zJ9UUen6t9OOAUf5pG2TEXnDw0xgJYzFTdVBdiF
	 U8Z4S5U3F1PdT27rVqhOlQwxAIQIKO9gZJXcUExMkdA2QS19nhtcew3485DbzvegiNGur
	 dXDO+9eATiA+PBtiBYFLYPtAM0LMVNKngjCF1rSsv1rGWhQGglDqqvdgkQ+87vdKM08UX
	 /mrEF18WQaYu0G487sCR2n6zVLiQZs0Xrmr6oT51oABBWiKroWWOK2JTY6Fb4BY6PHgVw
	 CYFgqkMkjUfETAB9ZOu4DxQYDTSSdKhzmzzwUs/McUgjLXr/9r8DSMfHc6DvtdzFG2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
	b=dpfFe6zABdbYtwFPmtR9wwPWc068aj2R1JROE4+LD4SEwTxmwt07rW9Nup1/THV84vo6
	 k8mHW/Byfsn3YHzm/U35axIenDSfv9+wwwS2bx2PusZQJfJEko0jIP1drHFYqkCy51yQ4
	 uJFGnwZ7odclHlt982LWrAPqMAi8OnR3kctGY/1I9ugjqX5m+9XvGPLmXrBbb6jztVQLu
	 tp5EB1/sjRamkf/4pY+0QX/9pvRpB6HG+Bs6q2+iug4WRFCSGACARXmauEuejhhxE7e8Y
	 LeAB9WPEMLYb/ZV40cKz1GTB8gwdvlIyXzqP0zlCnKP056QDIGVSUg/tjyE9cTpqGHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=T+WOyYce;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0E9606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0E9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=T+WOyYce
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso20733641fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795428031; x=1796032831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
        b=T+WOyYceTAVbFlKECWT6WhONtRWVbafedKvFNN5EVsU19bdSBMmz1TLlii4nzDlrmE
         FoXvTiD4ZC6w1MC+mR8s1lwnzh9+ch96qkXZ5crHLMwdX/TrcHcWSH1IKMHbzd1x/+6F
         bXMOZS9bjkwE9knSNyffUMCeaZYte7F3GHuF6DdXnnrKw50mzxsUR9KMSsR3xHyPaKkt
         Xt1eHCfYpAP47AAR5tptR3WbXXWh3silLdfMPpfX4pUPawaXmWdXxG6uYX4EEASVn++/
         NhurnIgfMb1MwJd8vB1fbTwJey0V0CCWf4BrOg3MsEKL1gZ+9Qr1+XZytChByQZtdhK7
         +QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428031; x=1796032831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioLPxMZsdXVtNjF4X3XpUO0MvO8y1Qo+sZ5Zt0M6bnA=;
        b=D3s3t0m795tuUVpqeK0g0667FvfcM2Lw/9J77KC/tD9XjaVqC+cAauviFmyNzNu7OP
         yjp7mXMExph/kh8VzpL8YNvz7ZXuK/BO4nWEjptVb405OMdrmyyL05l9rYQ8jYDbb6lK
         Gf43C23b9lqxdjyRqadCyN9biGMPkcAijhpj/AtLAG7KbKs5G+iqGGqp26bAv77q39WC
         wr2eW8VbeTmdnFeho0PDi4FGVyNu3a+e6VMT+JeKLJaC4Bzr6wpcA3+fbLWEH6HXgZe4
         +fN9nWFtVbwNPpw/+RwV4rIRwfzLdXNcGMwSP7Jn4nnKw3dt78YxhJp4O/Mo4nXJ0Ffd
         0T4g==
X-Forwarded-Encrypted: i=1; AL+hErFpHATsIu8urjihpzJQICbcINl0ZX7v27PrPc0ENH2n5D5cJoTLSErleTfvpsg8fRhgiAaMaCF6ZfJXmgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B/b7nQ9GBQoBbl51CPDwt+ACPiJpz/J2pDCp9nlayZzBaNTJa
	JwTrYqgJbKm4S7yoG7IoZcIJsZmNm4Y2P+HOiViUVqAqA1ywevM6hgyywBsRnTpWrTI=
X-Gm-Gg: AZFdTZdSQDXve2MU6vH546ieTIEHw/ZYDlL9kRCjGSAVV2G7i7GVdb0qH1/GpHNYR8V
	I8ev0oY5vb8zd274E91RKnIlDWvQBSr5oJteXptfMy0gsu7zIW1TVoa1tsirhEexFuINDsyPPxc
	VSkuSefR/eVtU4uy3vvDqcHecqSG7v+YwAAIT9aqV+1KzI1odRSVQCBanCgLkbu2Jk5bN/6ZNz/
	JZ8jUnTY0ZGveSifRr41OcMfwOyQud8vH8qaKggbRv3+anw5pf8xKOljza3I+9yRSNCgYgyuazv
	kj2SdIKyV4YaYJRX4tIgjazIy04lvathDevrADQy3pH93AsVLjzH00XZ9vJiUo3KzzsgCuUz/9J
	h6c2EFuHm+E3N+R9OlPZFE5SYxbiimSWDbjc1BX9eii3ZaRp1g4KABkR2GCiyNSat1R7tDSBwTB
	XOphUB3muCNAmDujF/snHIg/LPmEjXvZXthjYHXLzRKS9dJDsF8L2EaDo7TuD2sFEopXLiX9W86
	EDI9ouLWwd6v09u74PHCqahZIhiMYlF1pvdmU6C5wPiChnXEuLqPRy+bSUMaCcvjMGKK0EM8XuQ
	CEDLcCBnv5e8KpBboZFh1d1mkjlzANrXAo2kimE=
X-Received: by 2002:a2e:a886:0:b0:3a9:79d6:c792 with SMTP id 38308e7fff4ca-3ae7f9a0f16mr31993241fa.5.1795428031182;
        Mon, 23 Nov 2026 02:00:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8052992esm31044491fa.24.2026.11.23.02.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:00:30 -0800 (PST)
Message-ID: <d1fbf535-62e3-49af-8eea-eaa5649f8977@tuxon.dev>
Date: Mon, 23 Nov 2026 12:00:27 +0200
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
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
 "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
 <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
 <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYYPR01MB6603558B6F19CAC31748204486452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 11/23/26 11:46, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: 23 November 2026 08:07
>> Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and critical resets for
>> s2idle
>>
>> Hi, Geert,
>>
>> Gentle ping.
>>
>> Thank you,
>> Claudiu
>>
>> On 10/19/26 15:25, Claudiu Beznea wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> When the system suspends to s2idle, any of the IP blocks may be in the
>>> wakeup path. For a device in the wakeup path, the generic PM domain
>>> (genpd) does not disable/enable its clocks across suspend/resume.
>>> Re-initializing the MSTOP bits for such a device leads to synchronous
>>> aborts when its registers are accessed for the first time after resume.
>>>
>>> In a suspend mode that is not controlled by firmware, power to the SoC
>>> is not lost, so the MSTOP and critical reset state is retained and
>>> does not need re-initialization in the first place. Skip it when
>>> pm_suspend_via_firmware() reports such a mode.
> 
> 
> Looks like a bug in clk driver. MSTOP is controlled by clk reference count.
> If clk ref count is 0, then MSTOP turned off.

Have you read the patch description? Here it is:

When the system suspends to s2idle, any of the IP blocks may be in the
wakeup path. For a device in the wakeup path, the generic PM domain (genpd)
does not disable/enable its clocks across suspend/resume. Re-initializing
the MSTOP bits for such a device leads to synchronous aborts when its
registers are accessed for the first time after resume.

> 
> Suspend to idle. Critical clk is on, so there is no way critical clk ref count is 0
> and corresponding MSTOP is always in stand by state.

Didn't we already had this discussion here: 
https://lore.kernel.org/all/TY3PR01MB113460224F0225E29A7C5097C86982@TY3PR01MB11346.jpnprd01.prod.outlook.com/ 
?

Thank you,
Claudiu
