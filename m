Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124282;
	b=CYeBchIVN0Ykr16irmehXHOOltih+1gTafmXX28lVAwmZrwoEvxJ/Cj24DcJvgZ8x0gM
	 rzYVPg9g+KvLa+TP/dA9iMcaV5yoadYCXDczOwleV0Ev5oKKdUkcqWWKJLOMQAbBODA9u
	 v2GbMIrj1Cluxp5uo50xyInZiqueE4MuwFVh3XVo8uV3EiOfOOhg7xlDnm1Ig/Y36wIlC
	 5tNfPIe/Wi0ZY9JaOUKiGAbVZH93NbcrDkVwbWm2uEe7qH8izC0IVZ5SuH46/BOUqb1/T
	 vQcxhKnH1ugJaIrNMfCDcq2RlAPKVf54rdj1d6B9VzAbVNR2eYIioOFaq3aYnGZjmIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124282;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+tXZIEcXVKBOgmJAGg+yO4C/ghlngG3VTAuvxGSGieQ=;
	b=gqFAfxM6dwyBawjgFOiVWfVqOYdyCHkuaaZu++8wuFe8PJ5M7uHerap24poOEM/OOMI6
	 z7PHxoOjVaM4TOmz17NmGUOD6JCyQzL8nypYhGA11GVqUwwPxr1Zht+FQUwQsr8fWbHDf
	 xTFfTdZ66BDhWCO0OdcRhSlffzY4tw6wan7so6quCC3f9JaK21UygEBewiuIlhF+Ltd9g
	 /1qiQcNJg8c5TFsQ1Ew+WUJ79VaJN8ZZ0Kf6AvL6u+NX4QFmMJOvUWMJtFrjpV/kRqfFv
	 7GrlhjE4KloUDmDj5/ezRAMFnJH39Sg/ZH/Tqeile34XfjfSuvbILaGkzuoMkQDcFDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD3606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BD3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so260920a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124282; x=1795729082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+tXZIEcXVKBOgmJAGg+yO4C/ghlngG3VTAuvxGSGieQ=;
        b=M4niC/FdQcXJshkxg51ZQ8OFH4234gSLy8bS+glIExhgFk1nyly8FvoE49DVWXhrlo
         5ek+HERuiiElQjB5Cm+dptz8neyiSqt2HRrR2vxNhyZvwhKb5IE737sHKwvUjtrQ/1Ke
         ZW/27S8233qRSZmdL4CLuZqVCQ8bIB0Kqwwpmcg6RVpbIKt4znzgRPRns4H7IMdAFxE4
         eLTsEhexFbjYhNvLOTdJv6lhuTBgnjvJRU9zHxxLgm1UCA2sH0N0nIzkMJo3TFBm4/OA
         7p7IAdePIlTstX24WGF/pPDiCGGdhmeJtdqrWsHZVJCBLdDGF+0YTtl+wE6XU2pVrk/O
         +AIw==
X-Forwarded-Encrypted: i=1; AL+hErEFb/LFxr/jtauKPYxbVIU0/9kLB9E1AGcxV3nzC4xpr+VwmkffFqnFOGmFiXyk0N2ppcjKXedoF8qGzAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xpNHCdh8XHdbQHCu/bPgqoVjmLRvLxMK7alMIgYutJVT3ZIWD
	GCb+CxywIuqFiG4RVLslDAPPib6g1WDwAbbowmAF+EjaL+4ThtmA0eCoAbo092hI
X-Gm-Gg: AZFdTZdBy1EISbvu05J/25fIhaLrPS4VQnUcFxfDUw0DkGYz1JQgamtbQfijLd15HnO
	IRaACiUIz5ceRnG11C+4Xh+EAbM2rqRoy88qYEVU4kPIM/y7XMSJVEiOmBxkWtG/O98dK/51oT2
	jVgbkiHlyifZdVekRwHRp5bVW2BycaDJAnldmrZqGZnbwPu19P5FPQ8hXEf3NBrfJ09QhZ9FIQF
	icc6+oIuHqBosD6SGAUh9cZcPdac6JXLawBYsxoffKnjaJBdYAR/PXmLNYW5bZGuu8pnuYcWB5c
	0WhWGEKNgdIwYA4/OXZ3+kcbqhD6HpX2Xb0bVstwCHDjB6uf4GNVzcGA5ZAvXf88ZSqVzJkp+/V
	nnMXua3mHcV3U5+YbtAnCLGSxz1TPM/OPxoCi6vn3ghz8XO9m+yQwTUR8IthepSOvmXERvLMQff
	pMmE3o7gCnP/R9bzIqOkCg+Hu8D8gg7p/EBLaBCX9exA+HzIzaPX328af5iPvu/OfTtnoY8CAsX
	/waUtLu2wMaaFuLXpasiErUx2AYHJgC0AytFZjXzS8lRViSzIRzKoezUy1UVco9guYQXizISE08
	9Hn3nijaOaBsOXSE9pRyan0ND/y5R7jTlFHEU8fN89LFHfs+YiGoQiD1uQZ+FyHicVt2D2Zjrtr
	WljdI9q1106IbPWtK0hPRLhjqlGdFtujWxG3aGu7jWvCbwr30fITqy9QeG/ErOXQbqg==
X-Received: by 2002:a17:90b:2688:b0:3b3:cde6:d8c8 with SMTP id 98e67ed59e1d1-3b41c955b9dmr585998a91.46.1795124281627;
        Thu, 19 Nov 2026 13:38:01 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ff251b0sm114591a91.1.2026.11.19.13.38.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:38:00 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so469613eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:38:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEIhzfuHJen7DriIrg43m388+AZYeTN6dV8c+0WDRvCyuU6cKUIobC05PTwR1gLb4lf0R1C+iYRwSlskn0=@vger.kernel.org
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id
 5a478bee46e88-3856f859121mr685420eec.27.1795124280020; Thu, 19 Nov 2026
 13:38:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-b53-bpdu-mirror-v2-1-c39ab745730f@telaak.dev> <179512384634.3136.13428964502385964682@kernel.org>
In-Reply-To: <179512384634.3136.13428964502385964682@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 19 Nov 2026 16:37:49 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ53Cqu49fBk7qTU3uBSpJNM4zsfxozxse4Oi9fjU2-sAw@mail.gmail.com>
X-Gm-Features: AclHuK-2Q-gMJH4IlkEn1ipFjhxqZCbUaVAiID_5MLwXbdcal8bh219EYACPfj8
Message-ID: <CAPY4CJ53Cqu49fBk7qTU3uBSpJNM4zsfxozxse4Oi9fjU2-sAw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: b53: mirror CPU-bound frames to
 port 5 when port 8 is unused
To: netdev-bot+sashiko@kernel.org
Cc: florian.fainelli@broadcom.com, jonas.gorski@gmail.com, andrew@lunn.ch, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can dsa_is_unused_port() tell such a board apart from one where port 8
> is wired inside the SoC and only disabled in DT?

No. On 5301x and 58xx port 8 is wired to gmac2, and boards that use
port 5 disable port 8 in DT, so v2 would enable it and force its link
up toward that MAC. v3 will set the mirror up only on the external
531x5 switches, and add Fixes: 4227ea91e265 for the standalone traffic.

pw-bot: cr
