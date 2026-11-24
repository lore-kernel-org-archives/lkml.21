Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520571;
	b=XoXFxgXeBsKJuc7LTSHCBiQ3r5TJUP3FMEHC7fUKQ/dhD58l3yp4PGtOr65g6HPrySHv
	 gLaVLdRaq/b3UUsh6Qg7FK+y6NG9BcS9dy+jVDIyN6UomOCqoOmTe8q9PVJg+Rhz3qubM
	 N9oUEGQaYTxjqx0CC6eellMfPhOr4TUxKIIJ1CN/TIkoIdvdrfJtRm3s6/kyZo8xnnQ7I
	 dVmymScmtXmYVoahMvIcZNQPxF2ydUj3ouo52Du4uc96AdAfotrLTFgek8PsddpsIBWgL
	 YToijpKppnmq1cLGqt2cPg2tB2DROp1Q8LG7j/d+Q9ei2ftTJcDzZV8JwJIwKRJLVdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/z5ch5pLpPdbk1BmHD/hwwHu03qByQafwYZQeBV/lWk=;
	b=LXBufiGARtDkFKGsp9Ozwlv51fEUail+e243uCE2aU+V5ikvddMTIVf70MlMZO+Pdb4A
	 MbdY3ikAcsBkoe/1GYgFxNmwTsMyjjLTrRIkFgtWBe7sX/a5UefH66pwxSH8LLVoaYYYD
	 z83mP4dgm7M4UmoAErE6tqjQ2dMxVhn8m1d5RXGWhMQPI05kMIg1udTPzBec3XWiKR9U1
	 lc43EDoTADWvAY9QDl8KkKbNAV+yVMcT3Kh2OBySVfkwmD9x9jiOcF2ue8syGwKAS2O1e
	 WT1Z/WFqmWnJvhjesYu3/JZmN3aDIAPTwEYRZb5C6IUqBDyB4HliOglFoCReupqzr9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq2R+zD1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78145606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78145606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq2R+zD1
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c518cb79197so183297966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795520570; cv=none;
        d=google.com; s=arc-20260327;
        b=JdUQsFW9vb0ZJ61tBi6yyp87GLBvF6Nz1rliP7xRbY8efHiTaJFXR+gbzYfLhy3YLg
         ItXG50Hk1oMnxES0NlqsqUfHu7rWLODXZVisYIsCJ9dBffzcx0Pd7IvfTT4Ll/3xNE2K
         3fykHY5xwQTm+fzJyrFNm/56ac/F06JFgssUIzk1QJ7+SurmMMHhJDEee4y0y1nu2ANv
         M1ObtVIsDet6D0ph8KzKp1tPQ7S4uOOio9YHejCrRZ7fH3zTAZuhDOU9f+PbVusde8ee
         ggdTvJWfjEG1EvvJFl0tbtbtNbyrYj79fBChDvpH4CfZ9gb15ZECjsS5rWbjbIGIyRNl
         c8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/z5ch5pLpPdbk1BmHD/hwwHu03qByQafwYZQeBV/lWk=;
        fh=e7GgUUBYp44lXdph5jw9sTtjDv2pAEJaz+gPVZo1DlI=;
        b=p8mrvMrYpu+wXnhSL39WcOWZNQq9tnHmWVG2l2FYP6uudI1z5bTFl5nMKWIUCN58OR
         C/Pqna0jroE3KZ8YjsfWzFiAforYFSp2Q9yLpXi9AkfsHh92efNhWaJS89KF1Grm3uu2
         4EVY2b06wIH4gYKtMWu5Oppxjl7MH1omBPgITAge2RCXBIk+cCo27zZqRRZQ8/gfIf/+
         vHIRz370K9Dyhx8k1ZNVCgc3m/QfrYNKr1ycDoqEg1obcePcDYDqw+lZbAk1fUfCoq5X
         7w1MyJ8Xj5MUMNY7XWNwuDGuwNL/HmBfDzkB+SY2k8U1TRzxxJuu0/oYCn1Jrwpjsnsl
         DcuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795520570; x=1796125370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/z5ch5pLpPdbk1BmHD/hwwHu03qByQafwYZQeBV/lWk=;
        b=xq2R+zD1p5RXUgEpNuhoK8xg7y7NVsHGKr0JxP3zhBiQsU4buKR1kPpzJ/h+RQqvIc
         K55ISJpK52O/lqUCD5pfVaavDjp36RTFXuUvgSOG1ZLmbK/9pg9kLToRaik2nhslMcSw
         f8N0rFjHECKAxVeGwTTUI4YuQcWm+aY7w0dKOqzF8x1QwWuKu5HsvTINBxEXBxWwc95U
         UT6yrwDt4LNX1XlVFwwn0ahcfAe+N8X0MLHch7P4VkP+5Omm+nrwg3OwKrRdP9DBDa80
         fnCWgJRXNa0BguDlQChN0Qc1ponkNx6AtmdYdcRuTKZCxjhv3NFRe8n00Nvq4C4MwGs6
         e/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520570; x=1796125370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/z5ch5pLpPdbk1BmHD/hwwHu03qByQafwYZQeBV/lWk=;
        b=jU2Cp38I/Lb5jaIwFw6Y5MEqaY5rLpe/m+r9QxKbyBjhz03zbEFPY9TvULvedNMmq9
         YxGu4lJQVTdfGH1mtpffb1Of1pLO13O3kXK8bwOKX4SQjall+O9LIfHcAO8I4u8Wkeqr
         PVq7FfiwNEnsH9mqhLiGVF5S50qTMsxVjRKPUcixjIxjWJ9I40r/JhI/h63QSnlRASxg
         +eJGJZT6RGIhP7NTK/WLqMI+Czbt+xA/wDnZ+6HcZd/+OquaEKvGrL3KoBmWjv9FwPf6
         gwekq0Tfakc7KYZVJXKViVILJ+I9NNaEDOac16RhsUvPJeH97xc8Mq07lXk96gHmq5pO
         cQrw==
X-Forwarded-Encrypted: i=1; AL+hErHRQV02VWptwl9SStlIw6BNA5TZur50RXJ5+RCiUfwg+Aan+bd9TuVwgD8pYQ/2JbauBZi6W5kx4E78pQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tfJHsMYmb3c5XR8g5BQgJWS7CRIPcypAaiIn5vfsLruwLGlVX
	DZFOKr0wIYi/Oxg3V20iCuHBBv2ORXUvZAAtuIT+X6hQwAA/OBcMEnYFgdCvUmgTK1FbIUiInop
	nGoClKWSiRwrbPX+/87bs75eCeyJZrCeYgL5eZ1M=
X-Gm-Gg: AZFdTZePggt28uGHXF5tNCfJIEPkjltyK+RUk2DcbEWh+O7ncoaIZQi2z5XR0uLD9xQ
	1oWVUfeoKY/pBzuoshKpAwiSJOHlS76GwfLRqNiMpqrBTnZ0E42df+7dTx4CUijtMkrAhrCknnX
	DGSSKVOj2HOhxFtIdvOiolVsWa+gKNIN148N6wTtBc/UBAmW9r9VU+DthbYzx4BsYbKCXS2jzuN
	DOm+1X7usLubZhQxAnZC/hdlU9F2j5bGjga+2eg1j1FBEcaX2+mHX8wDJ6w5006cyMHSOhCbSae
	z3iSMnun0dPaoo0+9ovG3aYvt+J14Dy5ur2G9O3s+bGhkscXmY7a9LTgW5Kf7xf2myey8tVlHj2
	tUfDBm9A95KZ1QMnbA9n3ORcMOP9JG1xRDoOI
X-Received: by 2002:a17:906:1255:b0:c2e:378c:8ceb with SMTP id
 a640c23a62f3a-c513ab2f292mr893283466b.36.1795520569665; Tue, 24 Nov 2026
 03:42:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120095559.429515-1-xavier.qyxia@gmail.com> <awBN9VvV6yM6Cjut@casper.infradead.org>
In-Reply-To: <awBN9VvV6yM6Cjut@casper.infradead.org>
From: Xavier Xia <xavier.qyxia@gmail.com>
Date: Tue, 24 Nov 2026 19:42:38 +0800
X-Gm-Features: Aa3M54qQ26PffOi-ROWCmcVbedXfEWG_6O8l67P-4AZYWdcQV7atuYSopUWOUaU
Message-ID: <CAEmg6AVjtaiq9Q8rC_V5TcgAxQ386CsDtiXO7A6UzC+FzNdGTw@mail.gmail.com>
Subject: Re: [PATCH] mm: batch per-task lruvec stat updates on the writeback path
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, shakeel.butt@linux.dev, 
	mhocko@kernel.org, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	jack@suse.cz, david@kernel.org, brauner@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Willy,

Thanks for the feedback. That's a fair concern.

The original fio benchmark uses 4K buffered writes with fsync at
the end of each job, rather than after every write. The improvement
is reproducible in that setup, but it is a synthetic workload.

I also tested extracting a tar archive and copying a tree of small
files on ext4 backed by a ramdisk. Initial runs showed 4.3% and 3.5%
reductions in wall time, respectively. However, these improvements
were not consistent across independent boots, so I don't have
convincing evidence of a real-world benefit that justifies the
added complexity.

Further testing also uncovered correctness issues in the patch.
Deferred NR_WRITEBACK increments can temporarily be missing from
the counters while completion decrements are applied immediately,
potentially affecting dirty throttling. I also reproduced 8-12 KiB
of stale file_dirty accounting after fsync in a non-root memcg with
periodic writeback disabled.

I explored a writeback-local alternative without modifying
task_struct. Although it passed the correctness tests I ran, it
did not demonstrate a reproducible end-to-end performance
improvement.

Given these findings, I don't think the current patch is suitable
for merging. Please consider it withdrawn.

Thanks,
Xavier



On Fri, Nov 20, 2026 at 9:41=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Nov 20, 2026 at 05:55:58PM +0800, Xavier Xia wrote:
> > The writeback path updates two lruvec stats per folio through the memcg
> > rstat machinery: NR_FILE_DIRTY when a folio is dirtied and again when
> > writeback clears it, and NR_WRITEBACK when writeback starts on it.
> > Consecutive folios almost always share a lruvec, so the same counters
> > are updated over and over.  On a 4k buffered write + fsync workload
> > __mod_memcg_lruvec_state() is about 8% of the profile.
>
> Is this a realistic benchmark?  Does it represent some real life workload=
,
> or did you just choose it because it shows the best benefit of this patch=
?
> This is a fairly significant chunk of extra code, and it'd be nice to
> know that it benefits a real-world use-case before applying it.
>
> If the real world usecase is more "there's some pretty high overhead
> when flushing accumulated megabytes of dirtied page cache", then there
> are simpler solutions that don't involve messing with task_struct.
