Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186914;
	b=VeKXQJh8O0N/mJQiGq6ldRapCtE5oRrJlEHbOPsfz2vv0qGjjvXQYSzo9+clpd1KngBZ
	 KYPZZBEgBRvwzn41fX0m0z6PvRHPNy4Az47EBGAu/ghhH7RIZRf1twjSi3CDPrMMMzHoI
	 jTxY02o0EzqgR6wrtDlEvLeAtTBN4sCLMHiYtKC6jb25yo4AfnN4Cn6o3PBoJ/zuUUywW
	 PdFuq2OhANvegJVSLMw//xpjzZVAHpnZzxcCDldj7D+bg0Cp0aThcxDodBiSLIQcpkUBv
	 0PFUq4qK9DnoSH5k6uPnr/Nkx898KLxkKSW4/GNirBznOK1xDQcBBmD4iApd4+hv8Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jJEKPitTmspiZgBtv0fmRLCqGp7B3w2kyTO0lmVWhjs=;
	b=114eV0DEBJP2yl8wM14Z+4FQLDoYpkTQcMBm2EPrhypV9c29e8GU5I0xjUt2X8q3bAon
	 eVNFYfYlS0sRmyNXvFpbY8aXOAmda1xcejiZN5JzXqelYjD+mlhavZlqVyqhhdDvG6+LV
	 HPj1wIXFYr2WS5xribJUMemNka7k17Gg8wbzWztvuDCQHxy/ZQQ7Vo8tiA5QoVuOwAkXe
	 fGtlVh+FhVK8qEMeolMemtjB06dE0EMA8/bzYF0FAOJed6rdGKY3ctJmJv7IELHnUVJCp
	 VwfnKkCmQcRXqv4yJKJNvLcMuurSWvHaby1Tqea4zWcKUazLPtpAEjedRN3TMSzgcLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U4s8W1Jm;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0856606C84A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0856606C84A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=U4s8W1Jm
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso491122a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186913; x=1795791713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJEKPitTmspiZgBtv0fmRLCqGp7B3w2kyTO0lmVWhjs=;
        b=U4s8W1Jm3lFPfs5+wrNBLswuiF5CaYpfjnOxkfOInBFakmkhpYm0C9r/dy1VhXq1MO
         wdrWuDs/Mi96lfOYZFvrI4u1zIz5qwvc3TxAqyGS1wMcYe4XMvV4WIi00Z1lW/XLLn0J
         4t53eku5S4V0IDuURxyQofa7YrieQ8NQ+1mX/vKJtkpqaZXM31QTx25qfHENw7SHniuj
         7sUwMxR0LiudslXaIdockcUbtvPmsafW5FTn3C+pOSoPD3OTrZXcg0WQ7SCuPNl0qT7c
         B2Tr9bxR0ui+0N87wRF1bOsGkrYI1orBRgfj11SQX2kbWZsyEOTiTsxA1PogtHPpGBJK
         Uhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186913; x=1795791713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJEKPitTmspiZgBtv0fmRLCqGp7B3w2kyTO0lmVWhjs=;
        b=T25Db8v1mlAu1gY/kJ+ar9N1HD1k2U9IukWV1PH9Ionu+AGOOU2eIj19e9d2jnDagk
         ugZxT4owyfrttiWxu5JoOuDvkyxJYHNELPGbFRcd7m3CXO2QHLFdpssyhw/EThcyU7du
         AKPW3qgHz9pjGMvBP8E3KHMcuFCjOLI0OWb/3gtn40As/gEgE5vDWEES9ZG41QY3aJR1
         luf8wUGCeXBnEA5iXAeLovTYvzPkPTsMAMzYz/T4tv3+Mw7UMDTwzetE1YUBm3QNqf80
         pSOL+TKDt0f24B4Bs3Ki/ecCVUSDPNftCSvjkY+UPBDq+OT4I1a+qBp8uCYp3lE82k2u
         b/1w==
X-Forwarded-Encrypted: i=1; AL+hErF8hsfXH2IkiPqfnOVDAswZxtTZQ9fXvczn4/P6nlkuIVjzvjvhZ16R6zdXaQYbu82ZGtQa349Ye6cX3jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CQI0G01sJI9vIZy3PNXcj3FBVfEg7rtMJy4fc8CCuKGV9xntR
	74fnyBhCrzZNiVVmtmPJyoQlWeYMpqlrDhLtHvBISMyP/HzfsuYlStMLGrY0i1VKDHI=
X-Gm-Gg: AZFdTZcBT66GrRCXCcNnmqRkj21cCvYJ51AgBwiCbN4eoMHI7bdyTxvBDA98CaAP46g
	g7UflLXbIFPvCdVeuP01lR6OKCfcrDm+gUIeNKot1X9vd7G+3srAMxaKUc0yMWsqxXpm4vDpkIQ
	LL6UMzhstXWZ8xazQ81xJBimM2a/EaM0suYSpzwYlanQ21oBQnEyWR3pkOjMiqWcFlEbp/OE+/5
	uozSwZwdr16aLl9+vLuEyGPfkG6NDYwNIDARu0sqzO5N2rHag+rwnplu/vssFl6gbiaGork+89B
	+hRrScL8AoHVgG53Pw52fctHSQ/vOL9dIe88vQFvjKhtA+PzCrTBxJPInY6SNS5bBRzy2aaY88X
	OYm9hWpX9yW2wjSOcipT6+CzHO6Fq8RfFceLuktPcsvooFHLvsmUAyyK+Dd3JPvqM21o0ZnrOuE
	9MTaOQSBmhJiygAlQxKc3IfUDapWsDu4oSGVvO6kbhFNJy92SZXVMzfVMfQY79JYmTm4vRwrbWi
	TvcLMPXRpYJsas2xA+FgzY4WxvfTRV5QysUz3vH7geybMcRWrKCcC6KJfUjA1LbIMiJdTuBXFdW
	za7gG6FA91T3gB8NuKNP1SqhK7mMuqy24Dve4NV1vJCUqls6z0XHTxp4nx53LGShl4wt39G8ogb
	HcR542zssZOALF+I0JuuvrpDjJBirbKyUfStt
X-Received: by 2002:a17:90b:3d4d:b0:3b4:691:d073 with SMTP id 98e67ed59e1d1-3b41c95b0c2mr3210879a91.55.1795186913056;
        Fri, 20 Nov 2026 07:01:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm4733348a91.17.2026.11.20.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:52 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] usb: gadget: f_tcm: fix a short write infoleak and a completion-path sleep
Date: Sat, 21 Nov 2026 00:01:48 +0900
Message-ID: <20261120150148.3128435-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
References: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 13, 2026 at 03:21:27PM +0900, Yehyeong Lee wrote:
> Two fixes in the f_tcm BOT completion path, both reachable from a remote
> USB host.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
