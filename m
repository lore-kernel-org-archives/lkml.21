Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629656;
	b=cMqLWsLQI0Z07Bmm7YfTEBzgIH2rcpDPSH8gK1iqDblAmo0QQ5vNOPb4EhsM66vOkQF/
	 JRSbHD7NelWu0mD1bDuWAJf4HfAXaJ7JvxTrJmyJf1QRgd2N3mffOxp2lvfzIBaU1CTaY
	 HBBMzR6vtzHCd2Cg9GQsJ3yNnKfjchKiJHsf9JrEJQ3igvmKr7xIPvfDXeIT27GGG/pNR
	 aFneF8xqopfPAZrlgvStBTtKxzEW5Qun/eu3xnw8nhluqgEB8fS1V2H99DAD++90/FYkA
	 QWrYvZVb3G25qJRyC1owNbCmb8bjuby9Y0plSACMMxBVQK20pQmJ+eX4Fc/pBOqGSQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
	b=Cf0MExyw3CCQGPem/YYQNRfu+eBoA6tZdNxQtdhyvYdFrdEY6nHXvDgwb9Y0ByaCE46F
	 AZHsSp7c/2nWyTuHSrDXEkPEbQutEjNMXy4rIcO191l42tMltsoPqLxC0oMKHPH+2a6Gg
	 eTcroK+82XSmG6RlhDYRURntq4T/aBZAa58B91lkDCLzMsUDJXEp0U6y9Lj5+WLiMMkc0
	 sZG2TeZawvHLaOXeFHISJfqrTlv34sEjdRJ9QxSd9L+4Klgrp3F9aTITU9yjJvrbp7Ncs
	 iZoCs3K8DJoTVTZm0NtDAMiRCOvuDqvS/WVcrH+3JhSs16xXGprh5lMrVjUALazGIxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRD1AUsF;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D4D606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D4D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRD1AUsF
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4313506f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795629654; x=1796234454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
        b=fRD1AUsF9tDJYuYwbxPXkXtu9zWYe1dpFtJfe5CMETSrWtAvc7JRl9O38Gp3o9pp1t
         QbIbT2epeGAm5UWKqdTuGmzg+vfYvcc34ptXmjq1nLAZlxSoE+twsoTjgEqM2CHV8X92
         ErOHBP7xppVVaiIrTyUZ0OuVs4ClYR7gHoexH1JG2QVkw61I+agAq00XIMbhBEpk/ji3
         jzNL2XRFVuKQWvftdF+Vr0Ivz62I0vpcq7MELZzeGy9DZvI9Oa9b3oWsB/K4N7YX9Rdq
         F0hkUL5uv7spyKVe1rFn8YXeD68SNgPjeGBD4+gFaUEADGraUl4rw6AksglWABMDH9ha
         BhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629654; x=1796234454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqgjZ4bObBFYGMg9svOARa160u3iYZw8bzMn7IXfRCw=;
        b=jvgPt5tD0xqTCtiKyOKhFhavOceQ46jWD/BgH5Kve0JCNM6HVg+NYHDp+ZKmeiBzD0
         lwe95MvUzW/C1kiQC5zzi9sg7uGactMZITRqLgIA2SmmeNVfgYt4m3vlSM0Znsmq5tnO
         pVQhFqjsyxkwjTgFeSETg7pMjkysX+NY0+I8Siltn25In6ZwAbA9vZmeTVNSt2qS94+q
         gF/ZmR+We4o0UY0ggTRi+d2+QkgSluK0sq0cwP3c1puhITruNaIfJ5O5Gvvb/6ZT8GJL
         b3DHdRZvsQRT72cGxod7U525n4S7V3UMsXgrlREg5RQ1R216A5KE+Bnp2RYMJNOGdYm9
         bAzg==
X-Forwarded-Encrypted: i=1; AL+hErFew/4pw0RFDbUeKkQ8Bx4LYEJL/UoNccn6+x3fz7qI7XJxpflakZHcIEktCfRtFHMhpqU3/y363HUHDK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8MjgCXz2EgMLv3xkKere8s+VeBx5H1ZWeBKSKFXf1q1V7tK5L
	z2yiNWGVhOZ/jH7ynJTKTO/oeu1mKSSzE3rRG0E8X9tIrueigXztIOhK
X-Gm-Gg: AZFdTZev2pzGHRkAzGZ5ShKSLBxGxWDqk6W+f6QN6lFn8mu7wrwggKxnUQ4ArZBlKCf
	xzp0RyLtvTFE4ieHrnkGllhKKwsm3qdQ8hCcvNN5255KvVcyHluJTPZx7oWn3IBy+7WNJng9RLr
	YT6dm7vDSV+VfVcJyXKl3b+bnTd/9KwxkiXpmnbWEu00rmov4GEVf+sO70e+IVVHX2Y4C8h1xlH
	rlDyIK1AeIw8r+ggbw5iWTL/Z7SVyeaqzxSuoGIDJLlQW4uyYrCN+a7IsN/GTuiCCEYnrrSmBsi
	6XHEeci+K6i4mBts/N8AGfMexLUkc7rd8BTGwrJXz55QzR5Tigeosx4m5XdeW7xa1BkSe0nRE9c
	Je7aBZlmTgQJ3R1C02rbsucL5ZxQEM5nFLs6d4NAJa/Bm4GNx0UsC0++9lduqfANO4u0ns9z3Ap
	3LQajJhl4xh9wNO8k+qQ4ZwgBZtd1ziV2xt1GLJj9bRLPTPXe0p/jK9AMDe56HV2kj4K506GdP9
	ixobA0FGV1TBVrSzHLvAsiqD36Q2Nbe+fuG906c08woJqAf2eVS5VljMUg2qmkJYeFcxvptb9c4
	YalYljKShC9a7hbQ56EKh448Cil9CLlcPchqLqxZ00trIaMV5k6JbWUGXRxAn8wU3aTI5spTxFk
	I3hSU2YQKS1I=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr393055345e9.29.1795629654223;
        Wed, 25 Nov 2026 10:00:54 -0800 (PST)
Received: from [192.168.0.69] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm759477515e9.13.2026.11.25.10.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:00:53 -0800 (PST)
Message-ID: <3d1cc139-77a0-49aa-86c8-a723cd29b992@gmail.com>
Date: Wed, 25 Nov 2026 18:00:52 +0000
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
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
 <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
 <20261125145207.GH191152@black.igk.intel.com>
 <d05aa4e7-5c58-4311-a85e-6bfe9c31c62c@gmail.com>
 <20261125153300.GI191152@black.igk.intel.com>
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125153300.GI191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Understood, thanks. I'll withdraw patch 1/2 and respin patch 2/2 
(atlantic) as a standalone single-patch submission to netdev. I'll also 
keep investigating the Linux-side runtime-PM gaps on this hardware 
separately — your pointer to runtime-idle S0ix was the correct direction 
regardless of whether a thunderbolt patch gets involved.

Thank you for the detailed review.


On 25/11/2026 15:33, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 03:16:26PM +0000, Tobias Heath wrote:
>> Mika,
>>
>> That's clarifying, thank you — I hadn't understood the two-paths
>> distinction. The behaviour I want on lid-close is Path 2 (runtime-idle S0ix
>> / Modern Standby), not Path 1 with the TB fabric preserved. My patch is a
>> workaround that patches Path 1 to behave like Path 2, rather than using Path
>> 2.
>>
>> On AMD Ryzen AI 9 HX 370, I'll inspect amd_pmc debugfs (I assume the AMD
>> counterpart of pmc_core) to confirm whether runtime S0ix is entered when the
>> system is idle, and whether any particular device is preventing it. If Path
>> 2 can be made to work on this hardware, the TB patch is probably not needed.
>> I'll drop it in that case and keep only the atlantic fix.
> Yea, it's not exactly trivial to get all the ingredients right but distros
> typically have all the drivers + firmwares shipped so that may be good
> starting point and just see what is missing (if anything).
>
>> Would you prefer I withdraw PATCH 1/2 now and respin as a single-patch
>> atlantic submission, or leave the series open while I investigate?
> I would leave the TB patch out of it because in that shape it's not
> something I'm comfortably taking as is anyway.
