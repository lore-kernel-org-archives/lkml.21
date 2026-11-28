Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795870049;
	b=wTlptqCzLpuSNmyBiTMmP3OLXsUGm6axNCQwvCAAxq6LGEsvjWuJiCKwQcaJGSJB3eZH
	 VNIt82S7QKH0hnOCpr6eSq9uuvi0wm4077EXaalt6bIg3W7u9k1Dy9WJcjwc1e99/72IM
	 qbaOgV6gB38/gE1zXjaiIsqGBmYI3zhqEKrgZcZ/zqCnsUqQbarVGJvor4RIgtj575ll+
	 xmMRLTaL5RfX4R9+NQz0C51zvD/a28xDiJgi9QmW2zvK3/NzkHrrAImV3ZKcSRUUCkUZz
	 TgAsl4JG/hNkMS8Cs0L6jTxr7xRp7JIdD8mGT5H/wSwxq+VcPpAaWjvdcI4clH1PJbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
	b=fcLDDHSmweJ18guUidBdIxWoknxZ/xHC2fymuIlSENOvaMYsTcHEWe/B1wwYLbdt9ygS
	 DTrnkJwED0y+wmWJGPMuuGmS3Suj/G/3Hl37tkztAoXf4VYp69SlG13uR9U0LhR/zBAvM
	 3EwRVwWnb4pIvCH/EDiY51jTvl0CsSjCB5XU0SF7Uzh7ZU3gyBjjwZrSg+1NPmsI5xUiy
	 SQTWxuhvM/eGc/PaGIyM4agCZngCGPnQK1p6O71JzaXygkZftW6sN+IpylkQWMmfd/91L
	 k2BDX9jtAOcaS+Vt7VC+7PEW8jYMRzvttI9ykVsIZG1rSHJVdiZFbGbPp24Y99NQTmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWTHYpLR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83927606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83927606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWTHYpLR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso82839755e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795870048; cv=none;
        d=google.com; s=arc-20260327;
        b=iaytnMdGToQvRkLrNGE5cKJpjQgSi4Hb1uXqlRPsg+nyV/HltAAx7lNpwKZFRFKXi1
         A2jJTz8+BL+CWGFXYv8yQUVL4J1OZR2KlsdKWZnTeRoOTqQ7R+BMmgtGV6qyZEtLQiSo
         SxsyoNz6FfiGg0M2pvx8+uDDgXh1mJJJLWP0R62H0Opgm0+DeS9SXb/r8AyyAHjn/Ncz
         1qOBUQvYYI1xG858mwDdAN1XgPwscrJ6Flt3ftgHHVHkyOM4gZUmE3XXW8Eys1i3rlEl
         4Rrrmc6auy8mnAQB1aRnY/SxPPkelhs025Xm5vUT7OQQRdeWIyuPa8jV2J1NBnbXbQzx
         dnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
        fh=xzxs5qxAwyTkkhn13LIlsPTxewKVS1/Lw2/PtRdSqNg=;
        b=mHpLSHwV1AD/3L4P0pC4WATBg/YcyKdEAhtwK4yLL9g/ISrDm9PlpfIfRfeBTrzyll
         sQ570E0qn7c8ZAvAyLlzITd0IWYFE+qCU69LxfOi//r/HvuaxZyaxF6qILnzTBNH1xoF
         a7i6aBUmOmZ3FlAHtGgbwAJHCNF0XwZbT2jEJeEAnmoWSIyU9hwpCBvEGx3AdJR0UOOi
         uxIeI8YZvavyy4ChLWp0Dl0OfywVFZY5NiGk8kcQxxuJsDDmrJXo4o/mEvKOTWtAX4bq
         NVTCLc2zdfEaFs7rZ+wCZ6Rgwe9boo+KXbUfWB+CuAN7mU5g8Qj5zOAHRWyJ5yrsQVXA
         3+tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795870048; x=1796474848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
        b=IWTHYpLRVilbZbTG6IWjaAeWqjgP+sIuMzicPDehF2Wq5ifxICQvgjljBm8aZsWWu5
         P1q8lKSZZ+QzG675XjXJfggQKDEueR72g6RudWpuixtEeQZw1LXddzEnj6SQ8n2BH7iB
         9IwGSfvyQzfs18CQQg1fwaPXLb9YvFHO4LhDP0wsIPcHPfDXlJ8B0dkg6X1O/mmnPbeA
         BbNcH5SUZezaJyVEFk5BiFxs6Wd2DNbE3olZsiu8CWmqOzjeSSH9+jYRi0I1V+aWXNeW
         MgqAY996GuJs1ONySZ6+Uc4vhosEiZ6vU+6xgLhoy5iOGx2+an5sUBNpf9lj+1snfvM2
         UQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870048; x=1796474848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
        b=RJiA+XwXWO4O2duTsTH6h1bxTOcTgsi2e+JyPE9SN2LoROdD1F+TROzjnlo73CFWxa
         +ZUtct8ZwqOAKw4wEIEYnVnfv6jBYf+cA4ayvZAOuSLTtC42L+XqAZOqbwpUunob2a1u
         aAUdpsFE55PwGNnHhwQXsb6Yo4ea+k6yGOl7tnWftKKs7UQEtRGkEXJlh44A9kwjs7kD
         uIHVZeiX8VQQ+M6bCNGtItey9ahvqF+DAuSSqcd6kISEHNamNcAr7mksHfBpOB4B/mSV
         4JjvsNXYjmTYbWGwQW3M7cQybacqlteoK9ngIMfdXG+m6XEXD9itMysDeu84AG5vGClp
         oY8A==
X-Forwarded-Encrypted: i=1; AL+hErFOJtz1BBKXyMgoRKny65mQ/u/UZctbLl00Jaa68ae8e6bj99s/o/eyt9+5AZp/YUsh3YTyLcvINpvldfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j5rtiz7v2R3SrbcTUaor/1Oy1yjV2OJmSB8jxbju45ngeeyRV
	n9wDCnP/KBURa/mIhj+vSnbtxL3SKaVHtxp2PYgThY3eFFhkQjW+cHzTMnlevyhlDUgcxWLoyC6
	EfwLQsd0cjzyylBYT0BeaPuozVgTj82c=
X-Gm-Gg: AZFdTZc7yfwLMR3Yz+37tXrVi2CiS8P/uiF01OIlpToxfGuboHw51VMFBfF8+JPLlQk
	95tdJ7DBEEj3EucOJNr7z+HTA3kASVhqHO5z+W/Ic9DO5I+C0xQqIoDo1ZctlYjxXlC51dBFqvQ
	DzshtzTq+ytqZWIui5qHVVgw5hxi9MGnRMUZ8cc+svs9qlHX/UzaXZfpIFkUBpPEHG4G4USK/4E
	NhTWUz73oy1iCVThW7V5NgO8RKQAK2sjGQN9JhxW7In/KgEkG3EzWNjDhwnXGN4oxhN8E/VAqPC
	4y0seo5pB36cYwlggfmM7WCjbPmGNOoBkPsVZHOJqbhO6PrFvBRkMEa5r/EUax2JREapw7qZtzv
	5mCqRmMcVv18O0a5g/xMUPdolQpZQ4ybclr5OCmPCx7UwsnvBwQmbVqVMxn1znNUsvJmLtYyizH
	8ibvUDH1qlu+duf16Vu+ne9j+3qUBFhKcgSE17Fm5i
X-Received: by 2002:a05:600c:45d4:b0:4bb:6994:abf0 with SMTP id
 5b1f17b1804b1-4bb88817d91mr585296145e9.23.1795870047116; Sat, 28 Nov 2026
 04:47:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-8-8ffea39934a6@tencent.com> <e85a2666-9722-420b-9a60-9d4251fc3d4c@kernel.org>
 <awa30hwg6x82REoo@KASONG-MC4> <8ec3f3e2-5d3a-4bed-a571-88f7ba473b00@linux.dev>
 <CAMgjq7Ayu9H85wurRAUdmXEPWYi9BdLJW13BhK+LMYoBX_7fuw@mail.gmail.com>
 <CAMgjq7DwCNbke2G25Bxfj3bi5aRp3_qkGeYmCTGVGv+Y5XzKTw@mail.gmail.com>
 <60e890bf-d5c4-44db-9f90-ae7970b5de32@linux.dev> <CAMgjq7B9r17gQrOfxffRBiTSepitThjLAUbnraFFjze35t2P6w@mail.gmail.com>
In-Reply-To: <CAMgjq7B9r17gQrOfxffRBiTSepitThjLAUbnraFFjze35t2P6w@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 28 Nov 2026 20:47:14 +0800
X-Gm-Features: Aa3M54oCldtT2Qc6Xyokk6e6N_BkN7eNxmqD5B8ZoTIPwfqT_iCVOdBBMSKp3p8
Message-ID: <CAN_Opa-fUhr5cFDP8vr_47Zb3WOUnSX03LQyNo5c1uQtpyfBHw@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] mm/mglru: make folio lru referenced times count
 a generic API
To: Kairui Song <ryncsn@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org, 
	Tianyi Chen <hi@tychen.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 3:41=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Nov 27, 2026 at 11:33=E2=80=AFAM Ridong Chen <ridong.chen@linux.d=
ev> wrote:
> > Thinking about it more, the header move is not urgent, while this
> > series has been iterated for a long time and fixes real problems, e.g.
> > the swappiness 200 regression you mentioned. Making it depend on a
> > code shuffle would only delay it.
>
> I also prefer to land the FG series first. It's not just a feature &
> optimization, it covers several "bug"-level issues for MGLRU and fixes
> regressions, which are hard to solve without a rework like this.
>

I'd also like to see FG go in first, with the header split as a
follow-up.

Thanks,
Kunwu

> > So if David doesn't object, I would suggest landing MGLRU-FG first,
> > and doing the mm_inline.h split as a follow-up on top of it. That also
> > avoids rebasing this large series onto a moving header. I am happy to
> > work on the follow-up then, keeping the folio refs helpers in a public
> > header for the fs users as you said.
>
> Let's see how others think about this :)
>
> > David, would that work for you?
> >
> > --
> > Best regards
> > Ridong
> >
