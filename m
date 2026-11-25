Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614725;
	b=o8G+254DWEVG8QKBtoNCnf7vrgkK7qlVA6k4DqNUx9aCv+ohg3VBTy1iX4+GVQqubuAv
	 cco8PI8/waNY8LyQaetFZK+qad7T6YLmxvrJJund3R1nGR6IoRooAKRNy9o+bgM/5ANSe
	 qNGnpmg0qUkuSGFA8BHKKICE3FIJLCOhjBrLTUdvijqc6fPaQ1gcpyWQC55FRsdCmpRgN
	 m8HXrJP0WmJ2SIUxJCbmGqmWdbyKEfTde1IQsKNI6cXHsE+h1BsLyGvUsKDvJz6zdVBOY
	 PhTD4pWT03FAJe3rb8o7q/P7bsjdvrd/i6+u7U6Y2Q2aidHEcWV8tGRuD7qXdg7FvUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
	b=d8U0C6GZWzAKFleb6i0T1LLimCSlexAsFA+897slWMVC7gr7DcM3GWcrowbt/3gsA7W5
	 mGdmDdPPQMS1rPH+g26lPB8Zp1NM7cZqU5+2IVEC3+1WBIhvbxxdB12SE1DFUuGshrb+w
	 U1cxiMPb4kIFDXt5J9Vxy4vUaMYl43GZeBU2PsRaQduHYaVOqL/b/hkm2Kv+Y2iHidlPr
	 z4eqhMhgsEljJutbUNd2DH2WiMpENlqnHGuJ6NndrFZyD8olwyS8AW7J0bCBHPJRcZOCX
	 FHQpf9zLEsNSP4IV/3qZW8hLy5iSZnJI6TfYcS6OIzjszFwdr1YhjjSCu5RQwp9DQIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwkFDPU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F5606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94F5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwkFDPU4
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so6980545a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614723; cv=none;
        d=google.com; s=arc-20260327;
        b=tDd3/5dLeIjiewv1IJW5EGjQ2xIywgFoBndyjeP0880z+y3CAF2vmNoeNPDwWzs1GV
         fqVbVAd+4CcmbU961+WG22fMpQf8A2xmZaMPBdcDwCvvhmnKwr+dlPHsRyeUStHlbpae
         MUep83tFmwkXT+lcLMVQfkl9igyLN+qS8crhs5GQYqeM5VV35kxHak1Ght8io+ZjMnuV
         j5WClZxlmadrN1oCOSjUhBzjY8Vy9o97jQ8dA2xdVqSyuuOnpc2VnSoMa1p0VWuGB1jk
         NwKkKzavPbrwE8tfqVto0Kc+JSzsF81o7SERwl3BIU6VZHI68g6JrI/XovEtEGuBLVxo
         1NOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
        fh=Ix4vGqT7HRvxTU/bWsBJMkTWOU3GZJnV6B5HNgxkc0I=;
        b=PoKSunuNOYI6+BOWWbg6INzuseg8fkFSPdeLQ93v92PJtb2oMbqNJsLoODoZIL02Xx
         CIJ3p+umRq1AcCi9W/MOmXjCzX+ga6Ow0lXe1+68S2EokF+ZvxemefisACkrb5/QRatl
         hS4JOxmddS7sxNAqw4Cyq679cw5uIJZKt64d09K+HjgnzgshTt+npmDfthYOlZZqqK+x
         vQcWYp9d7nSp1cNTZaVv7jkrDAxv8uaqM6cqTG4v6K8ehdPfHzTWzCNuG2A3H3ZewXim
         +0jUU2Ir09gqoUDhYen9iSK5QKa5EM7n8hbbmPY6NB5SyxC3g0F5k2JBgncDuvcRZETr
         Yqzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614723; x=1796219523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
        b=JwkFDPU45Sp3/AywUmLqgV3lywr76lk0RnG3gcP1mly4Olo3y6hY7ZegU+d/6ZQ2i3
         TtgALDD9Imyj6UufUTO48LeWksg3vbIhAWHgCJEXWJOPwz3VSHoVuU/Z9bQUzEtGp89Z
         E6X8fc6zNkv1c/xM0Z/N9I0sdHl9ISo7T63ZuvEHCYYGYpNASf2PHwafYmuJEdMr+xq1
         jlPSRB3bazLcPMifdD8NB4gxWGIJrstTwJT4mhbt0MCfSupZ3/LMJnJCYQ2WYrzeua2S
         2C5siQ32aULczJ5TJAaldRgY2hcjizrGQQbbtfWi/TvBUI8zpMZVDqLr98G91rZWdZca
         ik3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614723; x=1796219523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
        b=k9bhBLBkrtV0J/Hp9/SpwTZHMDY5EX7a6Ull4Q5HJFaVSv78ZE8qWj/mZhFEL3raSx
         5BjWWBZQTw3RkYJBIZQAHw+3MiyVoeWuDGhzbi9XiHyOuvFo/hm8A/tDy9Ur5TJhs93n
         CrQ3YTQUicMDw/WK41npd2wQez7N0eJuRYc6Mva8B5h5+0kVxYWyANMfq1wjxbsb1BmR
         EjJTtNWSSPqz00CDoLIrSVlDsDHc7gLftceWX32z4u812D5RRJw/k3Aui8ElJeLzzlqF
         QfMWicXDSjuqqWzEkFvCMTIT0G4I3nPUpa6sdAWIFk7JU1dH/+CsJQvav5nZTLAHQCfU
         QKtA==
X-Forwarded-Encrypted: i=1; AL+hErFM5kZeYrxdvOg48NWC3EBviJ6qQ4Oie6b8W3K7CMm5za3SBgqqVoZuRRqK4rHTcwvnc3fW6C4rHwFWzLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8At6qEY/YoNkFmB+Fa5vKphdiWnfdtNT5SeGBvD+JOGql5r33y
	2RemHFy6Z0zEY5FvgbTIlaCT0mRfY3fXRZacduPWuviNL/RSEMew1Oii+YAl63r26y3wYvMriB6
	kwtwany+RCn3pBFBt0+6geGaSb/cSBJQ=
X-Gm-Gg: AZFdTZcRomb1T75joGNL82TluqksribkJrtBB5SGCxIN9JXt10ydWErdqqh5OG1Xhsz
	n22obywvXnvNuCh9Pk8CrRWVnnMleZWgoMeM6Z+yVcqlE69X/sBLr6Xcjl9lpiVXunYZBm1UIed
	RQmPzwsyZL4VAtb1sP+eMo55a8RO95g3SYxsz5bdwnnzb/SvJLVW4vNoKtdp9z1oMD1oUHgaRv5
	dAVNSF+xcqiXkH3vIHjXUGj1gZ/wG4J3gAeIl/wNkHxjhhLxdxbyXAWzc/5ZHFcUuRpngzwm2MA
	caPF2kjAiwbjZdMkYTnaFhEYA4eu8URtywkOBm96N8JTjzoWvjSsq8oW0WXvkBWWKmI6iqAeKYr
	9YBDJnrtsH3XGYH7V0M8LKNdMVdwX5cmbBqJSpyq9xMm7kwRTFZK+2Kpw0bHEFUCO1Gm7lQ==
X-Received: by 2002:aa7:d355:0:b0:6ba:3867:42c8 with SMTP id
 4fb4d7f45d1cf-6ba38674444mr9425076a12.30.1795614722953; Wed, 25 Nov 2026
 05:52:02 -0800 (PST)
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
 <20261124-mglru-fg-v6-13-8ffea39934a6@tencent.com> <43abc7c4-c435-48a9-8dc2-616095105d45@kernel.org>
In-Reply-To: <43abc7c4-c435-48a9-8dc2-616095105d45@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 25 Nov 2026 21:51:25 +0800
X-Gm-Features: Aa3M54qvnrtyAcMz5ZXrISSFgrUyQOGr2UM6VAg_EqnvxKpfk2xtM5m2ePfgGd4
Message-ID: <CAMgjq7CQkhA94QxVcdHzq=DD-6LCihA+psL1n-K05sxCffBOVg@mail.gmail.com>
Subject: Re: [PATCH v6 13/18] mm/khugepaged: convert to LRU refs based
 operations for MGLRU
To: "David Hildenbrand (Arm)" <david@kernel.org>
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
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 6:11=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/23/26 19:53, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > For MGLRU, PG_referenced is only the lowest bit of the folio LRU refs
> > count, so folios with nonzero even refs no longer have the bit set.
> > folio_pte_referenced() testing the raw bit misses hot folios at
> > refs 2, 4 or 6, under-counting the referenced folios of a candidate ran=
ge
> > and aborting otherwise good collapses with SCAN_LACK_REFERENCED_PAGE.
> >
> > Test the refs count directly when MGLRU is enabled, mirroring the
> > smaps conversion.  The classical LRU keeps the plain bit test.
> >
> > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Tested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/khugepaged.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 2dc4245814df..5e768481ac22 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -579,7 +579,9 @@ static bool folio_pte_referenced(struct folio *foli=
o,
> >               struct vm_area_struct *vma, unsigned long addr, pte_t pte=
val)
> >  {
> >       /* The folio was referenced previously ... */
> > -     if (folio_test_young(folio) || folio_test_referenced(folio))
> > +     if (folio_test_young(folio))
> > +             return true;
> > +     if (folio_check_lru_refs(folio))
> >               return true;
>
> Why separate lines?

I thought separating them would make the git log easier to track if we
changed one of them again in the future. I can change it back if it's
not helpful.

> Also, is there some way to abstract this that core-mm has to worry less a=
bout
> the details?

Let's just move folio_test_young into folio_check_lru_refs() then,
PG_young is page idles's hint for LRU, so doing that makes sense.

And with FG, I think we will soon be able to retire PG_young
completely, page idle's feed back can just call
folio_inc_lru_refs(folio, LRU_REF_MAPPED), save one page flag. But
can't do that yet, need to cover the CLRU case.
