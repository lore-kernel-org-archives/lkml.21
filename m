Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426829;
	b=AZHVXMop/N5rxHbyy5Wc/HLyBpRotg3TPQvNJn5OX67QMHiwIUSfw8M1gon3HINxty3j
	 i6fF9U32K5ywNxhsN4C9cySqskoNrnEJ+HGZn/N0UizAdR8X1LhJBzUL3cP8iJ+5AKCjz
	 4wNXTPYgI1eQLt5npa4tJfdGCDNNQ0inO2QhS8cuTwtdo6GpuvMSw6Ssz8dhLV2YgdMSu
	 b5WdDJSUkLhV4Ugvd+7cfNEyYbBJxELz386lgQpx0Z2fSm1i8Fin/FpeHgDY/OProJKIx
	 U87pro1ja67wqHVw3zEdH2OfGrE6SIUqlyxDhdY1q7Z4SbYD2w4KOaaWWKh0qqgACwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=thx09sK5axuy1Mqno0O+zJDzS2jXR+z5TmxbMTktwk0=;
	b=n8x6Pu8GQH4pKYhI4LrBBWxATORfA477A+KeFhEw/aMkoAkM2g2aNq9aMDCEyK2MWpnf
	 nY+ppohxhOwJL0incaWh9hAy7HtRFQbcCfauDSlAfpoS3vxob6g2A01XJ/lgQBN0ggBkD
	 ADDOIC5HsYpzcS9tD60ZXjcxXPfAI6/A2qC27gt+K9uW023pv4TGbc02Bga20TnHfQpJT
	 7geinoTMVE8HNpNH/ozob2m7hfTmDjjrtX8+g0dZECYlEYa2GYCHGYg6xkmmvsTjZiZNT
	 ghOysxXpQkriRQeupCF1TyvgtD+QaErzLWRH3A46Gq/M+4Zg83hbU3fe+cAydR2OIoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="piDKX/x+";
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BED606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BED606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=piDKX/x+
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso3093742d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795426827; x=1796031627; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thx09sK5axuy1Mqno0O+zJDzS2jXR+z5TmxbMTktwk0=;
        b=piDKX/x+zSivG1JjCcMp0ylCzOK+uPgZfR8gWTDeVcnNbIjSW62b/6eBaPu+cMWWqt
         gZVrswxtbdBy9IVRKyGYvemM5nO7zzKrmbzjA9JouMA1+M0NsPR+0XbUbi5dRiBqU2Si
         hlt7jGC3ecvkfqTYPMEwNrHg9CUkTwgyjT2w/dbrDhsw9uzRYFaQ0tvFlOLMvULjofzH
         DWM5Fefly3gSdV+nraMLUYri7Yp/iCBXjiLvL40fOJs1qIvY05MSya4nAKjcGzSBDd/T
         QSG7C5S9MfDpIDJy1XVCxaUnN4bh3JOqlZuJ1582NshQshH+AFkpy86jJG6nrOGKyaWL
         6z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426827; x=1796031627;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thx09sK5axuy1Mqno0O+zJDzS2jXR+z5TmxbMTktwk0=;
        b=e000phvPjm2oJLVmH+A+wTHU98b36GfW8AjHtXEJrVh2QvjSnTVXKrsYtp9Tp+LlGw
         Ox6MJgzPLydGRpsPWVnOQ5YydcDL0mmmNL9TAqsj/ZjKVDEpkB2jZOaBbfCfgfSPeSs/
         3vBHwDxLnH6qcuhJyWnce73QUcRYktjvFg4JFYWFSJjua8ThEmxlNW/Nh5rY8UFGJ7Nz
         ZtBqMkrXTX+kpxNO60eZ4U8aoArrVNVDB+Iqy4zrs8n/J2L6x29xEkOQgsyYkqEneUnE
         xvP5oNsQorfY/twKNRhBU/8r+23/J5fhJlg8WL2mARuqrAaWGEaFgdLGXtWAQnOwSzBS
         XLPw==
X-Forwarded-Encrypted: i=1; AL+hErHVvpBlExkua3rtBCjp/rA1uimxI8y6IqMMzG2V4/hN2QMJ3K62fPZQ7Dj+xxIfidqB22wIVCOUpZgbcyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Guu772W/IjScINshqJOV8IApJVyr5fb2Wy0VprwlPnrcS+rRt
	r5i+pGq7hFUp+gvlD7KjNoMaGEOoW1BWBWGr0PPv3aNcY3NMNJHa8Rda/kUbzWy+7A==
X-Gm-Gg: AZFdTZfckqakyeshkTJloSosCYUJjLJl1xC+EUu8ygUzMG4heaMrTmu1CaPUBFJly30
	wSvV4J2Xn7OtId6QFIHu27zriXe3KViqgMoO7/GmkrQ5GAkCCHQLTBKD4JLFY9jTRdlp/jpdPBc
	pO6q0tNhCT9yPYjbJ1XiZFy9bRUYl0SFzyzdNp+eDSfpxzoU8b/8zKZZTHyOfA7YX8ixqgU9jbY
	nAj5SgWzyVw7hL5RrCCORXtTLhq3f1yJf35JUcr03HcfbGMh0jaQbWC5khnt+AE9C8UskWYn37m
	skl0XXG3zvR+wpQRs3ERpYI5A05kWZcQBc2Gb/iDRRp2M01zcXio4RaJFsPRATGOdu4OSQ13yXF
	bCWjY7w6t1Ue4aAkjm3vMSrjDroedH6nbKIUGdYVzlACyCa5Dl/pWFt+b69nj6fiKPqcaGi4kt1
	Z7h28wCUZ/Ut5UAQqe7ZTF20PpxoXhcHF0gHAsn3Rvk313s2IgySK0MB5agO5fG6Wdx2MWtC8RD
	1tj/ts/+m4nqSt50J36PbdTEoeZDhVYIMW6iAV4kMJrS4axC88r20FFpCscYcmW0PepAzBYNPCv
	fZbenrsSOjPh+X8UqU6cDDUDtuQH/hOu8FnKtq6kX/nwXVkf2ogJw/IwRBmfPmwNhdczaIEjGAc
	r9ub3SYMK842EvlbQOSn8/FKj
X-Received: by 2002:a05:690e:bc2:b0:67c:70cf:c90e with SMTP id 956f58d0204a3-67df443b020mr3503639d50.39.1795426826585;
        Mon, 23 Nov 2026 01:40:26 -0800 (PST)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33105fesm5150875d50.7.2026.11.23.01.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:40:25 -0800 (PST)
Date: Mon, 23 Nov 2026 01:40:09 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
To: Alen Karnil <alen.karnil@ideasonboard.com>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 00/26] mm/fbatch: drain lru_add_drain() and _all()
In-Reply-To: <179492383658.1554713.9260140415931487684.b4-review@b4>
Message-ID: <db50635f-5f02-73a2-83b3-8ec7dc980b56@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com> <179492383658.1554713.9260140415931487684.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Nov 2026, Alen Karnil wrote:
> On Wed, 09 Sep 2026 02:39:08 -0700, Hugh Dickins <hughd@google.com> wrote:
> > mm/fbatch: drain lru_add_drain() and _all()
> > 
> > [PATCH v2 00/26] mm/fbatch: drain lru_add_drain() and _all()
> > 
> > This series was prompted by lru_add_drain_all() appearing in watchdog
> > backtraces: not to blame, but blocked on an unresponsive CPU to run
> > its workqueue. lru_add_drain_all() is a heavyweight operation, which
> > we often hope to avoid by a much lighter lru_add_drain(); but even
> > those local drains can aggravate the lruvec lock contention which
> > per-cpu fbatches are intended to ease.
> > 
> > [...]
> 
> Tested-by: Alen Karnil <alen.karnil@ideasonboard.com>

Thank you, Alen, that's very encouraging and helpful - though I think
it would be too presumptuous of me to add your Tested-by tag to each
of the 26: I'll just add your Reviewed-bys to 01 and 02, thanks.

You may be wondering what became of the series: it's good, and I did
rebase it to 7.4-rc2, folding in JP Kobryn's fine improvement (thank you)
to __page_cache_release(), and Kiryl's !folio_test_unevictable() safety
in lru_add_del_folio().

But found there was already a conflict in folio_batch_move_lru() in
mm/core.git, which would make several of the rc2-based patches not
directly applicable there; then saw David's "MM: Firefighting mode"
mail, which confirmed what was becoming apparent, that it would be
more helpful not to repost the lru_add_drain() series this cycle,
but rather attempt to review the current fixing activity (I've tried,
but just cannot keep up with all that David, Lorenzo and others have
been achieving).

I intend to post again around 7.5-rc1 or -rc2: I'm probably naive
to hope that the fixing frenzy will be less by then, but I'd better
go ahead with a repost then, whatever the situation.

Hugh
