Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188148;
	b=djuUnisPaBN4YVkGLBGu0ek42g7yMZzzs9WBPRk5coB2lTyToY1FT90s+0jqWzXSUHRF
	 QzMUTIC37RIhI0xYXl+915mC/Sjlu0CzAaIWAsUCwQzjFGAKG601nw3w3d1N/rdiiD3p2
	 RTaUx4eYNQGuUgNU51KJ6h+Z06e6Zje0tXIDD2mG2jznkVfAUtEi06w4ZiPmkFEK3KcEJ
	 MJ84jgTS6GiuHevEzWNYFCWkV2KdSgEkwUtmLHpS0jt0dDxSjQi1wRUlE3+E67nYk0Ap4
	 WXnJA/vt90bhDY0LEIfSwqsewi8gmEEcrN11q3TsKSRaYgkxWiI067w/sxrGkqfYSMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aRHH+sAtRFUypl15sibM2v7nfDTia829ulQs8c+9bZs=;
	b=zqiPjLiPHp+rBhc/sLUliZ87Cxv5Swg5FvhTU4cg4EjZsw1R6J3Ju5sfB0wrYL7Hw8s3
	 77DbKySTOSOTIiHO/i47odJs6uFlnDGheRitlnbjvy04qohsPmQn+kskVU/iIVc4vq3nQ
	 CzHMez2TxYDA+c+HcIFBeBYFtp7hBHKabbBbh9HcD3TDz+RWTGOa54NHbJyj8sVpqn3jl
	 v9VgiGWpaTx6Gq67WDn0IkKlQt1PBjYO7JBSxSQ/Hgh6xjAIbbSZoO0xzJvWgRKp18bj3
	 QVEY/irHr58H7JMqpY9bSxFBgDuz9DbFMzm+XSDEGrwf5YAk3KaW7KzwwgLOtAPK4bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FU/l/RoA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B775606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B775606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FU/l/RoA
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c506a231b88so155130566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188146; cv=none;
        d=google.com; s=arc-20260327;
        b=lUvwIi7Lp1HZVDr54LpPdZyR3G60lv+dW26O2TuPvclEzvBvyp8ankgmKvtnF5McAM
         tMQD7lSpDtRbb5ASlD6AgcjOM+H95gfqvG09PcAru4HRHprw0j/T/QbtTb5G7AL2apsJ
         lNkThY5iETDVqdVLz5ho7ppj5p00syWNr9YRA8T+kXyM/wTbteDUO/d+CE6yc0PgOzm5
         uw4uXXMSed+tsO7vajYMSK4TEmpw7fVYxAdVVw+l9s6o8NKAVZJzzvWBQ2oeBR34z8J/
         UbhfPNK5HusefkutDvKc1qAFwmcAFPvAu5vs5gO+uEnphp52+KayGK3+8DddmlYzBN8j
         bY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aRHH+sAtRFUypl15sibM2v7nfDTia829ulQs8c+9bZs=;
        fh=LV65eCOmkngo1mm3oFpPBD6FjuuzbSRkiZ0O4QJaqek=;
        b=C78Sz3N9VI6QPOd2EJFHlUMTMQB4UtzLmPWbUs7j2Ao9/cYpiSvdYhga19QgL1wySB
         96RWXAS16aAs+09M5ghUZP10alYjVmKpLU0zR1vD9q0f/fatc0FJ1oY1EmgCyAY9TVHV
         eeBkrYyhJTnCxgyrjbydVtJZ3zRsKo+fihTyaq39+iXRa7bUR0ZPmzNrbzllgpOSHqVi
         461TvYQv6pNPk385a5YN5plLo7GheUCxl/RKNgEucN6kXSZKRL6BfmBc5JRpb/aBzCqB
         L4iM0FzECLselRaS8YsyK1U4m9ZP27zENPattNX1IOyxd1hdXIjvI7caHNZIsBYmcV1B
         OUvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188146; x=1795792946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRHH+sAtRFUypl15sibM2v7nfDTia829ulQs8c+9bZs=;
        b=FU/l/RoAoWDKjurGzHV0S82CrGWKJZfvIMbBRgy/tmq+AZb0ALnq9BIKoqMlnrrcAa
         QUd3SiHftioWtiySyzxN/d7NaZXboTumLy5fQz64NRlQmmueUcok3vmX05U67c0n4P+q
         5SMWYoxqJSCkIwcL9JnUu/jsKbdpg860DjHuljLlOaXW37LYAAn6EdjQqPir2NQkDSlw
         ZruZT+gIQulvTtJJDRm/Mn9em9zIVyjmZpXiaPAu3WmULyvmwEkH/DfFp3e16KS1FFVC
         oRuQdrBuVKhChWkIPTir+05CyNHjDFstcx+kW3iv2sh/92NUv89MBtJVJ1fGks/I4Wg6
         frNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188146; x=1795792946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aRHH+sAtRFUypl15sibM2v7nfDTia829ulQs8c+9bZs=;
        b=F1WUjU+KY/NvZoHn5gtRM0jxQHW+EOU99nHPq2R24cXqVmbNRDqoeXq0fkI3g2O4tY
         7oJLo39fu4JsVAroqiRzuWxhVAJYnyh5+06i2eu9JH27/EDI3c1O2gvdMHAcTSXfdhty
         xO1e++kBFohoqC+ntKAd8nE8Wf2neSDNNQngqR8nPeT+xVQpHVTEGBeM30zUk1tBtfjS
         CNijZP/q7TsZ83npRzLKYSwv1PmvJSZhzODJkBH1aDoy436yho68zhSlvcE61ZIR+n9/
         F19xRYF3fq73i07Ufhr/vWuySi2nnF6xquOGwHFFoDmeihmXI+sGBTY07xi92E2+S1nU
         ifPA==
X-Forwarded-Encrypted: i=1; AL+hErEG8oo1Jtr/+PKhd6k6Y5jDhYOH0s19ebO3b8y+aE7E8glg7uemVZzVSj99Wctmgwh9+teUDS11Z8RT9AU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OgdjjduiXd95qoF84dZgTVpVuXSsWgyb5Ll8+NLBL68lah32R
	Pkpx0f6TX6hEYhmuYUslwu8fI/x71qJxyqnjwb8tJZQZ5y4zh/KQiqPiVUt/JoFbNVuP6gk5G9k
	IMmUKAouYi2po70NmvvrVGaQ/T9L4lEM=
X-Gm-Gg: AZFdTZcTYO+WljLq2YNCywDLAEFjaQzrJEKtgf+6sPjSEWUesTA3iwXTOeATMJFY2xv
	Jggxo9aoOL/tFeX/YXA/oX1qDKgBs0XPCR9I+HatzVSd03WnPaYGt0FjL8AKvW7LWCslhq3qQD8
	rt7xKKsa/WBQ4y9uaPHgv1dHBUiOiHpCunwmBNdcdyk005823xxCNtKjUc6P/pmgebw1DouAp20
	RREgRB2ZYt6/ha0G2d4fuv20z3dpaQn3qwyuf+UrqhVyYYo0xa/9dflzaoQGvcWxE3ueFeCjp7/
	/1cP8RbjOAt7EdvODEfX/Cb3sFmUPrf/lf27Q9+RlmM3NdFLMLigE3YRvSnykEmHDLmbhI7m00G
	4qozXlrQzFGOCPBwAiOnggjL7ir4D9Ct5U6X6zmi8SEItIZGPSZRednWrEPQ=
X-Received: by 2002:a17:906:9fd0:b0:c50:a2f1:f200 with SMTP id
 a640c23a62f3a-c513a5da8e7mr358445866b.16.1795188146447; Fri, 20 Nov 2026
 07:22:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261120131146eucas1p2d05549af0404d6af77ce3e9385e91fa7@eucas1p2.samsung.com>
 <20261120-upstream2-swiotlb-rmem-kvzalloc-v1-1-1c5f9b503223@gmail.com> <7cfe91c5-4053-44bb-8c18-612fcda90e4d@samsung.com>
In-Reply-To: <7cfe91c5-4053-44bb-8c18-612fcda90e4d@samsung.com>
From: yzddMr6 <yzddmr6@gmail.com>
Date: Fri, 20 Nov 2026 23:22:14 +0800
X-Gm-Features: Aa3M54rK5DMeMpHLCfSfWl_qJSt25BT20Yvx5W-0uuT9RvDVQDOYBPvqh2JYtGI
Message-ID: <CAB63uaFw9QjjN131UjiJvpp6qHM+xw+-9wEcujuNoYVzhmXtOQ@mail.gmail.com>
Subject: Re: [PATCH] dma: swiotlb: Allocate the restricted DMA pool slot array
 with kvzalloc()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 20.11.2026 15:18, Marek Szyprowski wrote:
> The change looks fine, but according to kernel rules, the patch must be
> signed with a real developer name. 'yzddMr6' doesn't look like a real name.

Hi Marek,

Thanks for looking at it.

yzddMr6 is the name I use consistently for my kernel work, and mail to
the address in the From: and Signed-off-by: lines reaches me. Since
commit d4563201f33a ("Documentation: simplify and clarify DCO
contribution example language"), submitting-patches.rst asks for a
known identity rather than a legal name, and that commit notes that
nicknames have always been accepted. Mark Brown applied a patch of mine
under this name to the sound tree earlier this week (bd6e011c8121).

If you still need a legal name in the sign-off, mine is Zhendong Liu;
let me know and I will send a v2 signed off as
"Zhendong Liu <yzddmr6@gmail.com>".

Thanks,
yzddMr6
