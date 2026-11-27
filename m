Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795808514;
	b=EMOPaEdw4U5BlRh7R1x54UvEA9P82FxjM961QHPb0/Ht4XWJLTxelPEuMU2oFqh93bUK
	 Y9zSxJO72r4EanU6RG98JMD0IzwEk6kz2hrC7XdGzlsXN/tR21D7Djp30duIAIg45C/pY
	 0RdshsU13zBnTlV6v+8AdNJFMzG+lDLnCPVgPf9uxxZuJx+CSlGs/g8Vz0Od47gpHXlSp
	 NWLOM9+000GpjrjYohF7JDIIR4XFfuHR4K2y6QbzDa9FPbwhOp+9ARXsyiu2UCxJKqVmZ
	 Y7oWa4Wh635A0I9HSxCpRk6DSf8ClWDlQt//HESdznEpgkb91HzKU/PA9fhKwShysPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
	b=JpzkoX3XdNwKBRKOACl3ecBFuU1mBW3UR0pIJOyBo+/SsdlHU6fFzGMmfG796w6tRELI
	 H/Quv2LRGa9L6ZqCb7yPMYH9jOohpnve2bIKk0KFCi3xTGoa0MM/mw9oC3ivuGj+ESlnm
	 cMyswME6MxI19HzNHANmGx2pGX+yi5NbyvEMl/BvYtwVhs9z4+87AvblEsTBuGQvytLVy
	 Nr1eC3JAjUq1viMhvvdW4q07bl1D+LqpgRzvF+p6CmmYVTJUPHV4C+FXXWjQzIeF+7H/W
	 X8oR9Hrx0NRX0yTjhnChFM+RsBT9XsbkaYmczJbqaKT695l99NCrT+X/NZfxHPuIYuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQeZQVwz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C3B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQeZQVwz
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5126505cb3so1109088566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795808512; cv=none;
        d=google.com; s=arc-20260327;
        b=I+s9NLpysNhZuvVl5dfre5UyRcrQrrV+epjEsk4ROqVM0CDZf0wCQ0jD2v5+JYjXuO
         BFWXHEVtP+kvJUCd8Y3ZTc/PFQI1K6DgHefN8oWjSfvRxYS2+OC2/TbJz29HJaVA0M6D
         SxFQQ0GcqFuBW5h03dZXOCnDy+aliWIbnaQekTXN7zCg49ET4CbyOWUY1ziizoumQ/NC
         8fm1yLXo+7KmPLI1qXJ0IpkaJ0MgAB7mGaYVONFtjcb9uMojRCzdfdcKld/NmU3fDo+M
         elkCyPVn1TMN+SV794WCxk2JmwXuomvn5DuAd6XcMt8wAymf3Skqw8UOiID1gS0bJqQE
         q60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
        fh=t1gd55BgPPbHrof3B4TrnwdDOc/G8cyG7MZkSAt7IEQ=;
        b=bLYAkYBsKjbS/NTvY5dCxL7fJLyl7aZqXpcjhrK9gQPsH4GA69ADlhf96R/Yyxt2lA
         qB6x/YI+NqxkcPM6BKuVKjVmu/JoUIVFwAlVTigubTvdgAtR7lo6V13sl6eZByDo2pxM
         XNne4LnxslqihS4EaqTLsMH0/V94Sb4rUna9BTF8SlvCO6ufC8NJWu7oo+dVkoliCIiA
         WplNpSoAr9E1vH7kKY+WdcBJN6WeO7xb0wAWYWm9TatDmXh8XRVDDZE//Pq7Ienk55dL
         yEKEDV31Nc6dqq7zQQ47r+SGlybIES2BWdh8mFtFsbfZy1ps662Iedd1uwT/8HtMARCx
         E4zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795808512; x=1796413312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
        b=nQeZQVwzoNwIOmsp7E8zNRbM/ov7Ad5OI5Yt0HPNQ0Nw4Yp/NH3tyj+hDmKisTquOj
         TiY/3N8KLBj2wdz+up69Y1jrIcK4u5FKwuyGbKNd2oqGJ54Wa58TConqwqf04aL5pIs+
         xnpaJ3GxWqeJBlygJxol5O9UaE6qWhFw+brwykOBnLcW4ulte5apcPVRiyqmtzzVz2hW
         ikTDzjABQw0ss6jFdwcwSSnWkt5JC0ukU1SsibCM1einr2k1tym+q0j5t4dhzNJKFuCb
         y81x0qsycwIJ3QTl5addiAW/7hj8qWsA0IVd3kstpQ0qjg5nsNjN2qM2hgBIfBfPvCOh
         Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808512; x=1796413312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
        b=w80osnvInj9aMqGyfJkQywhziYf4CA3CnX8MtnrykKakzF6E8tev8Z4ADX90+hfhPY
         BSIv2k3LocEskgiZnIiIZ6XsHY8274sKhF0XuuOpQkFTpPwAlfYha9IuJyZh5B2oYoKM
         24zfpbkcP4ZUGb5c8JurunTJHx1sKeo/sG482QgEYFOF0R3Vn01x8qxqG74gRvAqDwwu
         4NwFbDCcp8ay5n9u5fZHP+zddoGei1jG16gFGCap97WjlOLXfb8QtuvYDZd45W5grfYt
         NkHr6+r/HB4Esm+U8wkGFL1zM4NPZU7b7yHkRn0g+NPJrsvkOISakFKMvF2eh/Nd2KrS
         os4A==
X-Forwarded-Encrypted: i=1; AL+hErEe2HyhP8/dCOA9a8uDrgoRstXA6Wh4Xf0ZULORsNLkJ1Lb4LgPqp3oEnXD48O84U+5Zd4ih2UjlA1ht6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JClh94oyo8oYp1GVFqlztTEpmo5mVIefH+lEjaINmDXyfAdVh
	iTXiJgbsYt+NKkz7yQStBqqpb1EJ1WIKrXKQ9uEPJEDNIU/79fSx4H3mIf99wt1Xs37FyKEOdES
	SS13fX2KC3vNoxP2aHajwDyi/Ta3wk3E=
X-Gm-Gg: AZFdTZft2iigEaHgG8HuI5YCFqrBk/Z7hNh+8Ai5zHFCESbZY9z2l8Fm7aofIe+Rx+U
	uIu1KadMOcnHwDZJHkt7p5KXrIkJ3AJBycD2tNdh87+Crb1zs5B58DQgcT/1VGGhyaeZsaiCiMU
	Zy8NOLKxplA1LhCRspdAYeobPZ4HZnmCnQYU9lVnzgpp1pdn+OpnsriaIc+A/EVCXIHapKPmPTf
	vtff4trweoIlQbqselTsFisAfoToebjrhVt0DbMLW1uNt3LL5jDXkzrYmzNP8mAeblhMRfKt6VC
	Vo1eyx5MWEyM6kJhG51cOMC3ri3cIyUatVdo9tF0zoJhUDV83fvsk9wT5dr2SSmw/4YvI8gQbP1
	cHpW4wvARwpPdELKasp9/L8GNGIm+4/w2rlORFNpHc6Khl2h0xZZI0D9k1NEoexqQ1BxlaA==
X-Received: by 2002:a17:907:7b9b:b0:c4d:3208:5781 with SMTP id
 a640c23a62f3a-c513a4b1c1fmr2320437166b.1.1795808512384; Fri, 27 Nov 2026
 11:41:52 -0800 (PST)
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
 <CAMgjq7DwCNbke2G25Bxfj3bi5aRp3_qkGeYmCTGVGv+Y5XzKTw@mail.gmail.com> <60e890bf-d5c4-44db-9f90-ae7970b5de32@linux.dev>
In-Reply-To: <60e890bf-d5c4-44db-9f90-ae7970b5de32@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 28 Nov 2026 03:41:16 +0800
X-Gm-Features: Aa3M54q0GwKlgENV-fDrHnc1e8ZIFsqPaG2vdLKK-3H09a0TbqTlTAM4SzLkpj0
Message-ID: <CAMgjq7B9r17gQrOfxffRBiTSepitThjLAUbnraFFjze35t2P6w@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] mm/mglru: make folio lru referenced times count
 a generic API
To: "David Hildenbrand (Arm)" <david@kernel.org>, Ridong Chen <ridong.chen@linux.dev>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
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
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 11:33=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev=
> wrote:
> Thinking about it more, the header move is not urgent, while this
> series has been iterated for a long time and fixes real problems, e.g.
> the swappiness 200 regression you mentioned. Making it depend on a
> code shuffle would only delay it.

I also prefer to land the FG series first. It's not just a feature &
optimization, it covers several "bug"-level issues for MGLRU and fixes
regressions, which are hard to solve without a rework like this.

> So if David doesn't object, I would suggest landing MGLRU-FG first,
> and doing the mm_inline.h split as a follow-up on top of it. That also
> avoids rebasing this large series onto a moving header. I am happy to
> work on the follow-up then, keeping the folio refs helpers in a public
> header for the fs users as you said.

Let's see how others think about this :)

> David, would that work for you?
>
> --
> Best regards
> Ridong
>
