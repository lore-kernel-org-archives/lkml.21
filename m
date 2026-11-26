Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706229;
	b=d1YsGdrWeTdFthS5ofTlxf2yLpYWn2hmmzmtDPtlYEa682RO7ysula8XpTZPO+ocWovN
	 ynQPMT5gADcktG61uvWzmoS+fesypBeFG9Dwk6ARKvhJ/KgIYrpCg6b6h8VT6q80hJKtT
	 j0SIuJYV8p5emgZMIChgRqwEJL0hfRixnmPg9H1wLkRQD2Pp9wa04xay5ADHNQF5MgGi5
	 2Ghj+Zmg9JpEQu0BCFGXrc5LYULzSbQgL5D598D48ql/gpE89EjZX16y9zau0IPuagXwk
	 Ek8YkAh5C8tCuP2KQlEHPCvq4revPau0WmlulXXwnXffRohWgIVtWT3WA7jobywCYeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gzjKwk0Le2x/UkisX7hnImUaEzdnPPlkkivbYquJqUY=;
	b=sSI0M3d7+K56Ii4BNTIK26qYUQTSbLnX+AkP2GATy69EWmNWq2unD7BodzSu/8Q9OGMN
	 DB4vtUCCbyKlZAeflbpJE5v1tIQgFutNsp3KBf315Tre3bTEG5zrch6WVgFl/lhNJJVfz
	 kcrIltaL2kU/MbAhZCOkZxQE/PGqfzXpggzVUymkf1xpn+icEAn4OgvBjDz95alPVA8Dv
	 5L/7avyXc2lGmFj3gnmpYct2+x0ZDx8jWLqfHT40Ly2tKiFs5i2TynEHf/nrCM4+cAkRQ
	 g2grZ0hX7KtsjeflpbuyOr1+NwhxSWXsBnCvKvUxEjqBx5tJ1qcuxr1CAcYVtx2yVUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWToAaGd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F7606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449F7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWToAaGd
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4e04eda5aso53143847b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706228; cv=none;
        d=google.com; s=arc-20260327;
        b=FxozDNxZHhDi9AM/pn+7NU+qRwlMsdPoRoeqvwEY7jke4C9t74/QX7Sn85N/3kJ01w
         IH7kRBtY0QqacJna9pMDLjO0wKVFFFBWbDzVxpKu4IsXa1wxunIbUqPK5Y6CVoTq5ShE
         sih4/dzUXYQqwFjvJNyiBi/lesRAK1CmW1P6t+07OvgN0TugvBp1KRsfhliefb7IPaWR
         l/IHtLXx13dxc370mO4i66WqjmoBCCBSXbr4RHPEXftyKPNjkD2zO4bmAtflx/DarLst
         4dqs655PzMnj63+fZHflbWmSgEfZHO0x1nlqeuo8xYb3cDZX4FdF2TPZ5dbgHsLOUuLZ
         3k8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzjKwk0Le2x/UkisX7hnImUaEzdnPPlkkivbYquJqUY=;
        fh=vNOdJzPhzsYNiiRTxygLvW/okezap+5olrH4KR2gj3s=;
        b=SWmu2HEfapmmh0oaCN70x/dUhCOi7FFjh/jC4SBcx+RTocvGVf8eZyfFB3uDCuTdAG
         QAFFdKH8ORu006/PuOBNgUqKPnh39PBJuiYoVLSOYTWo4MLKXSKX0s8Klx4j+2OZ7NIE
         0M27K/NbyQ+quSV6OGNFuoL3lu8oibBPoDuwW0w3cehhAY0etJMUCF5q75C1NX+Cse8o
         V6Oz+kai88pS+3b8FtTG538qqdnPjBO7Qm+m3f5VSPLC3lOEp3c74AL01qamBQQAYTnq
         TQyymCGVJGTl844Nh+R2lhnRAeo3OmDoTZ7ok15iRupCyVwGer3Ei4hjUR3b5xwAfQLI
         QFJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706228; x=1796311028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzjKwk0Le2x/UkisX7hnImUaEzdnPPlkkivbYquJqUY=;
        b=XWToAaGdKGHLCuFtCgcK8eh7NMFVJxgBPTg8++G1vD0QU3ky0WCrIDe4J3iYn6sK7X
         hU6xsSc9gfLDr6qEyiCXM1isij98iW+8Ghny46DD8H8ZtuezozJooTzne29ORYiZYoVu
         2F7zGfAo3B9WMacM8b3V0DCIJC03FFxm4/g993yjcCnrJJ+6JJLJpM6QCGtQLELc1XAd
         rtLKcJ7AF/cQF5VRw0skj2Ugnl6FqCjGwUGbzpVnQMBo8Ma1MJi7asywupXt8rfeoH45
         cGF/odPKZxVpLwem2R1FNlUdL+IE9t2WZIR7zI/muYEFYIvsvDKKiJHmbagq7whgz73A
         oTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706228; x=1796311028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzjKwk0Le2x/UkisX7hnImUaEzdnPPlkkivbYquJqUY=;
        b=fRwWP0F241Zwx3B+5p7buvQcMOyZJ9gI+5rYR2JXX5FOKYgQPWB4FjeZRIZzXMp+97
         Oj4k0rmZMndsYo8OKg3gZNr09zo7uoF4MvFZ5Lb4Lqq8UZk8aABS654GMYkm5tCGi+7Q
         g5F9552b5CkwAZkf/I2f2oaddb3epv/jxT0e1tajV9sdZMWDDg09jl5HIKn8ufRLcbra
         n1T6tQ/sxdkZuuxaKnF6hzbkSsbP0YiA+zWnPstvUUf9ZlN2jA8RF518O3vZjhpA8AIZ
         wD1m2WJoIQv4lAs8w2eqYtuoVIb6XdbgWqTDsHhPeMetc0fthE8DDYtLRmM2UgKr+aSA
         bnmA==
X-Forwarded-Encrypted: i=1; AL+hErHGYTDRnO8dS6438Vqzm1dUljjZnUQ8DPOLXZE84c9NGe+p+3P+t2/YxhYWgs3FG4loBDNTVyABwhOy9zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CO/jLS/FizZuGcbs84kYlt6yZJncx9hjbHXzMX35eErQSyJoQ
	jtbRJRTMlbBhB9fTKFfnYFSQUuPnynud+cKrOO2tXafkhYzDcIoo32SSNT/QJZMn38pRTEIJP/t
	LcUZkSBr5Qif+7/RIXJc/L9OBmpjQ4Lc=
X-Gm-Gg: AZFdTZcVN0EUjtIcSXMbQ+RmS/CRGHGJYULqYVrzpwNoAb8kB+8vW4+jgMuvLI3Ff6L
	JvTYXKCYT3RI4SJYOkHfzLcfvYgu6W0+iVrX4L3gHvP2kEQQD5zyZxmrmW/C/6DEB+yTkC6mnQ2
	cGdj3I/zJ1Lv0U44Z48tZtTLqUTPkoGFT2xlUKBpA6s0761JQOtd8HaUkmXc2E37X64sYDsguh/
	wXQofidMEZXw2UFB1/pZYnlXpmdpNY+TcMz4g4iBzOzlF1tE2FmR4UF87kcQ77P8wE5KN98Dolh
	fHmAfG6GWmHilotdtG7/v+RjVbeNP0b0TxAyNXUmDL05aXCTnPJfKJg6gxWSpO3j2XXjmz9SsfV
	Zr3iy7QP1PvX2rzxHSPc1Yxz7FKW/iwz+sa+0phQYOAcf2/qtzWSUGZBnWW9lZ1DiQw==
X-Received: by 2002:a05:690e:d50:b0:67d:a3f0:7d98 with SMTP id
 956f58d0204a3-67df4487e2amr8033601d50.81.1795706228153; Thu, 26 Nov 2026
 07:17:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125155108.24098-1-ekffu200098@gmail.com> <1b0242ef-49ad-4d7d-820e-d1e6569eacf8@linux.dev>
 <931acd3e-0689-4517-bbd2-d06109ac4a6e@kernel.org>
In-Reply-To: <931acd3e-0689-4517-bbd2-d06109ac4a6e@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 27 Nov 2026 00:16:56 +0900
X-Gm-Features: Aa3M54onaw8MJYDddQT_3nYWVFohYsmtAwqNoqMbydwkYedoY5CvfFd6KJvm8zY
Message-ID: <CABFDxMGzXM2iQjv9hLVnrDTrXfxhJ5NHkXiiucciHo8eMGn2ag@mail.gmail.com>
Subject: Re: [PATCH] mm/cma: reject long-term pins of HugeTLB folios
 overlapping crashkernel CMA
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Frank van der Linden <fvdl@google.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Jiri Bohac <jbohac@suse.cz>, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Usama, David, Michal

2026=EB=85=84 11=EC=9B=94 26=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 10:07,=
 David Hildenbrand (Arm) <david@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 11/25/26 22:49, Usama Arif wrote:
> >
> >
> > On 25/11/2026 07:51, Sang-Heon Jeon wrote:
> >> crashkernel=3Dsize,cma uses existing hugetlb_cma memory, so
> >> crashk_cma_ranges[] may contain HugeTLB folios. HugeTLB folios allocat=
ed
> >> from hugetlb_cma can be long-term pinned without being migrated.
> >>
> >> After a crash, the crash kernel uses the memory in crashk_cma_ranges[]=
,
> >> but a device can still write to a long-term pinned folio.
> >>
> >> So reject long-term pins of HugeTLB folios overlapping
> >> crashk_cma_ranges[].
> >>
> >
> > Is spending the workload to protect the dump the right way round for th=
is
> > option?  kdump.rst describes it as
> >
> >       This reservation method is intended for systems that can't afford=
 to
> >       sacrifice enough memory for standard crashkernel reservation and =
where
> >       less reliable and possibly incomplete kdump is preferable to no k=
dump at
> >       all.
> >
> > so the dump is the part the admin has already agreed to give up.
>
> We have in there:
>
> "This option increases the risk of a kdump failure: DMA transfers configu=
red by
> the first kernel may end up corrupting the second kernel's memory."
>
> ... but I recall some discussions about short-term vs. long-term vs. cma
> discussions.
>
> Ah: https://lore.kernel.org/all/ZWJllXCN0SDIELrX@dwarf.suse.cz/
>
> "User pages for RDMA, should be pinned with FOLL_LONGTERM and that
> would migrate them away from the CMA area.
>
> But you're right that DMA to user pages pinned without
> FOLL_LONGTERM would still be possible. Would this be a problem in
> practice? Do you see any way around it?
> "
>
> And later (me):
>
> https://lore.kernel.org/all/04904e86-5b5f-4aa1-a120-428dac119189@redhat.c=
om/
>
> "What does "short" mean? At least in theory, long-term pinning is
> forbidden for MIGRATE_CMA, so we should not have such pages mapped into
> an iommu where DMA can happily keep going on for quite a while.
>
> But that assumes that our old kernel is not buggy, and doesn't end up
> mapping these pages into an IOMMU where DMA will just continue. I recall
> that DRM might currently be a problem, described here [1]."
>
>
> And in the end, we settled for the 10s wait, crossing our fingers that it=
 will
> be alright :)

Thanks for the explanation. So, the possibility of corruption of
CMA-based crashkernel is already well known, and should be taken care
of by administrators. I also agree that saving memory by reusing
hugetlb cma could be very helpful, and it's not a good idea to block
that.

Feel free to drop this patch. Sorry for the noise.

Best regards,
Sang-Heon Jeon

> --
> Cheers,
>
> David
