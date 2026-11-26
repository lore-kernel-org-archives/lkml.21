Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705312;
	b=XqV5Vr3nu2r42Ycy5m0NJYgwpjdLzx8Ej8s/e98QSvsLUMp9qBfDjlENziuJvQ2aArkn
	 dvIdwORqQUstJmj6gjTD47bXeeWdNLwfP4qqODJl1ldnb7omFtSSIb4C3OKchJJCAecb7
	 b2dsaqEIUp5xM0wrINm9gzppihQYSYkxyt2QEjUiNXN7ZZ95xpNxjVCkGZ4j/8ct5F24r
	 sjMCz6FgR6wdB8bCaG6MIz70BVzK52r51XzSkiTeka3UuGAolFbDrTk/+cNVcTUskee9b
	 hLVzyxiicFZb5KjkbKqxrd4euXeY9+umqlC+Vj3/QEnKR+wKPqbaHnBgs902EpQ5eFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CnA3zlb6+Q4MfV6Y5oL8cXYKHj+wdTkqxg32r451qEk=;
	b=VvOjTB4CHLTJLuEuQ6Na6zlRXlKE7H6QHIf97o7lxApS5r5N5kmIXsTx+007DfBQmP5i
	 wXcWUTlLXZIgvZRanB1qeDA3g887huoqo/gycvFVPp4/ggUpjVuwUiC8etlwlPe0A9RSs
	 AS0dQ8zbG+tzL4xnfxWvTntSPb4eqgAs/gOksvtvc97iCLp2fFO+IiN2yzd1xObl28909
	 EAW7INv3PsBevVdf4jh55IIz/SxVWU7A6T0gThNjVVE2VHKOVaNmFei8Qofd4CJjPuhbN
	 FIfqDoD585jfZHHInX66IRFZfcCyDW9T4VO75V0a/4wmeFtWZ/O7iFfvxt8JH8wda+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b3sZ+/K3";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A51606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A51606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3sZ+/K3
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f01f296937so54067885ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705311; x=1796310111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnA3zlb6+Q4MfV6Y5oL8cXYKHj+wdTkqxg32r451qEk=;
        b=b3sZ+/K3mFnawrjvx85flgmuT1zHOx3Wa6bQmig/FPG7IvWZnnPujUtt04UcCQm+tp
         YcbNqvBn72KW+GtFsj9T/6MBlkXuLF0S7bpw0gc6Bb8hhVQq2yHUIgIC2as1r1XxCewg
         55bEJ76AQOJHJlwW6zc2MZpJjZk4qgrzvXJmecel7U+zkoAjp/Fkh706tNW5xMLtzs5U
         Nz7YrwTQY15c4kchCoSiAdI7/oOsOEQHeRqHVF6CqoQntJEAghHEakYfz5f0vcztnUAD
         izPsxD9LCqUra0KUfUdOD/ui2YcGE6idNSNRt+CnZCHSV7AODbvljIuCrRBWKTVf0xNc
         X40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705311; x=1796310111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnA3zlb6+Q4MfV6Y5oL8cXYKHj+wdTkqxg32r451qEk=;
        b=YFSoI9dilv+fR8YfGQmqP7EHoNRypN4Cs6F1CRXfByWjwgYANMklLvO7PBMmT+Ws+0
         /vlh2S4y5KXtsc6CsZm85vY1sqs5HJx7jw7+VCYvYIuRTuPnRzQQ/LFgYXpREwzDf/5P
         2/4mazQIrl0pQX+Yv0ry+CZps7uLVCATEl2pZYhfE/hQfuuPoBYYbawsn7XcfYhjMplt
         NzGktUp3y5qxyPzvW1r1XRXMGDCgdA76OT0A8hxRVhkLSE0BVssFDJ8fhFcduAWwtleC
         Ct5sHdS/nD83eO+zcgOqCzkVuZ7MtmWRcUekyz/setHSIUHil0V9H41K9t43zYH6fab/
         r9Bg==
X-Forwarded-Encrypted: i=1; AL+hErEkt3wF+Wtxss4Q9G6d2rdn5tujmNnvPWIGkOJSr9RqCSZ/uo6IZUw7FepTd2zcSugDvjmNk/Y4O+sEnwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WNrRyFjrwmX9MYTLs4CaDkkM/9DchQBSjnZXsdbNGilPd8HA1
	d3i4AJf00B6gC4LTsbH8ezInkkzeBHY1TTXy9TPy15IlAze49crwpJ+m
X-Gm-Gg: AZFdTZceLNh4fmSfSn5NU2ai+G2sKTNVABL/gorYBD584KuPgIRffqZSzcmNF9hiCri
	0/0bfa5qQr6Vbj5jyPNcAVBtcihiOl94BQDaZ0iEIdRbynvN0Jv4fxicVZP+dHYEgDH5NSXOcGM
	kwCIPhhhvKQOE+ktnI+94NY9B2lFmJEUd4B6rX797WpclvQQDREYss1+tz7AszUiskQMlOxK0a+
	CKrox0Ip9+hJOjOjhZ+Pw3mQ5PlxRXWi8e+MnvCpfjp8cbnM4naFEF/TnqULI0rnKChOL62HEJl
	fAF5wbdbRdpdSX5437Kck7LDeYvMaDP4AW7PzZo1QjNX2RBtiMWRD7hv1zFdoRolO/o6IWnMguz
	iAF4WQTChUhw2LpylUrsZUFrUCCh4QCrbdIiAURKrCuts8kKFOdKdjBAccUAeN3KaJCY+22uYf7
	W8BOrFwBMr2uLplw64ZtKv7IiXZ5jJaqNA1AlTBkSLNDItNN9hXykW5bocfMFnI0mm8jq2Vw6bn
	rt7PmFcy1bWOLHNBx4YwHjdhy80pspJkwJmtqc/84vdsNijFt8s34ua8JFRDsiBgf+Ra2ubuqGY
	q+X2Y9isxk3mIJxK+KPySxEuUC7Ug+MlG3bPIGiRuhXc
X-Received: by 2002:a17:902:ec8a:b0:2ef:e25e:e13c with SMTP id d9443c01a7336-2f03efb015amr233195175ad.5.1795705310670;
        Thu, 26 Nov 2026 07:01:50 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm103299005ad.76.2026.11.26.07.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:01:50 -0800 (PST)
Date: Thu, 26 Nov 2026 23:01:33 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 10/18] mm/mglru, gup: mark folios referenced via a
 fast helper
Message-ID: <c37b9336-95ac-4787-8a7c-73f6ee9d17c2@gmail.com>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-10-8ffea39934a6@tencent.com>
 <6c3d32a9-3004-4a17-b854-7088e69f164a@gmail.com>
 <awfb-vGF62XvcX_F@KASONG-MC4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awfb-vGF62XvcX_F@KASONG-MC4>

On Thu, Nov 26, 2026 at 03:16:32PM +0800, Kairui Song wrote:
> On Wed, Nov 25, 2026 at 09:47:18PM +0800, Vernon Yang wrote:
> > On Tue, Nov 24, 2026 at 02:53:02AM +0800, Kairui Song via B4 Relay wrote:
> > > +/**
> > > + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> > > + * @folio: the folio
> > > + *
> > > + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> > > + * untouched. For a folio off the gen lists with MGLRU off, a plain
> > > + * PG_referenced set.
> > > + */
> > > +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> > > +{
> > > +	unsigned long new_flags, old_flags = READ_ONCE(*folio_flags(folio, 0));
> > > +	unsigned int refs;
> > > +
> > > +	do {
> > > +		refs = lru_get_refs_flags(old_flags);
> > > +		if (lru_get_gen_flags(old_flags) < 0 && !lru_gen_enabled()) {
> > > +			/* For CLRU, just do folio_set_referenced() */
> > > +			if (refs & LRU_REFS_REFERENCED)
> > > +				break;
> > > +			refs |= LRU_REFS_REFERENCED;
> > > +		} else {
> > > +			if (refs)
> > > +				break;
> > > +			refs = LRU_REFS_REFERENCED;
> > > +		}
> > > +		new_flags = old_flags;
> > > +		lru_set_refs_flags(&new_flags, refs);
> > > +	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
> > > +}
> >
> > The implementation code of this function looks a bit convoluted.
> > Would it be better to simplify it into the following code?
> >
> > 	do {
> > 		bool clru = !lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0;
> >
> > 		refs = lru_get_refs_flags(old_flags);
> > 		if (clru ? (refs & LRU_REFS_REFERENCED) : refs)
> > 			break;
> > 		new_flags = old_flags;
> > 		lru_set_refs_flags(&new_flags, refs | LRU_REFS_REFERENCED);
> > 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>
> Hello Vernon,
>
> That's very good suggestion!
>
> Only one thing here is that
> `!lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0` doesn't mean
> it's classical LRU, maybe it's just isolated. How about bool on_gen?
> Or bool has_gen?
>

Thank you for your explanation!

For has_gen, looks to me good.

For on_gen, it could be misunderstood as "whether MGLRU is enabled".
So I prefer has_gen personally.

--
Cheers,
Vernon
