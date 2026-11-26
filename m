Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795715700;
	b=SduwGU9jmlou7SalOL/lnJKPSFCobsng8JznFwnwA1mPY0PzrsljaFoftjVTSNy24BiA
	 hB7goNqGg9TKO0dMghx2nVC6L/vS0nykquWR6k3mmhGzGVKN/0m9jWqn+V07ACsfhP9Q1
	 yfq9AnkGIqgDOY2DkM5eWNDoX7SKG9/9FeH79heAGdOxEoWI1dF2gRC+hs9gH2R3Hst2O
	 Vam1ahMOOxb5jA7p2W0HMpM1xv+hRYnGkbp1UeW6oOM34rPuKnyGzEkcY2Ica5UT7KuFG
	 cbvsCYenZkEK9jv+LT12/eksXwqS6BGjIKOquupy55hz14+GO9hEQYC0FYlY3CHKgCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SdbryK6r7Z8TT5rN4VXUmz07ho9c9oC73ihA4weajeE=;
	b=HAsIn+WbIhRNdg22ssJEEz4s9KX0I6HMUq8p0SJvWH6jBB0iRl0qM1oXnNpfdfgoErTq
	 eYOpzBN0oGkBWVroNfosUIHurQlBxnhaUfVL5Rrs4uE7+m743ENwIVr6JKHtQUJjbORqj
	 fwt5DROVbbxoa5fGS9UmdzPIKjao+LxUH909/zpivQKRuxbBL0tMBLSH8bD85O4LRdWgo
	 HS/aFO9D0ZOo3oBztAA7a2is1MCmohChupPDAgrofDo69u/DlNIGm25TLUP8DJsjr0PiH
	 U77klNwgeeKZoowzvLzl4q2w+mlPzwZdj+Yu+alPwnw4+O4YAZfby7sqHqK1/BfIsCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JvFNTwKr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA7606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82AA7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JvFNTwKr
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so6804492f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795715699; cv=none;
        d=google.com; s=arc-20260327;
        b=JVj2a+cl6wXvZyZa0PiRBnc2e55AhFqry031YEsE6dT3eaxD9CtvLJQN3w//zpB3oZ
         Kn+B12CbbF71BbiLyJsVWyxVmyxdHoaHoR2JDzVKLYKiqVKf3VanPDZyLuSLWclMPUJX
         eYlc3uMcZUc4xNLm8nC6Z6JRL3LthBGVZ2rCPfMp4xAulJ95MJI6qZGBCHAhpveUpSOq
         8xr5/VZTh8kmDBhADe2LxSXaRmqmdcqfae5pIg0mJvmh83TBP31ajwnKw+GKFj+pjIyI
         mWdtOyB5NEWkB25FJ3MDeOHx9G9V3jTYL+oRfBPG2MSUG5xAlu6z15iZaeeknykBjHyM
         Ek1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SdbryK6r7Z8TT5rN4VXUmz07ho9c9oC73ihA4weajeE=;
        fh=rZzfhnXnfbObr966aUrxy2KXWnK37BAqN9RmP/Y6cWY=;
        b=YpRLzZ7S3t8U2On3bjCXXMGbAJkQ85vwflmSAzkpbXo0bJbQK7AkKgTLpEhnhEk7s8
         QYe2awaFYLsTv9iPApeLF6WjHrV/Sdt6I0OYwhAS3lroX0gAN4G5GvuCZS9LmCnswcIp
         ol0TlxnKfKazB90Gu5KWB8jx+P4R2BRCh9cMBxoHtBs5AqSsX+dPXnWv8/+3VyTJiNWV
         nqT2khpeKyW+aJFyzCaFo+KVXj+BoMboKldixw26oRNManf/2X6SRHRHI0STdl4uUBYm
         VCnMRYuHobqW7ND/2rnk98IZ+6Ri23P7icpCtIPN0nAtzJU30YeBG3Sbr9zOMfca6PeI
         UyZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795715699; x=1796320499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SdbryK6r7Z8TT5rN4VXUmz07ho9c9oC73ihA4weajeE=;
        b=JvFNTwKr70V3LNS16THS+slsJSzoB0FSC2LJfydUG7qwcvh0mAjdQv2EtI8gLE0y70
         Acfdw7uwUB0jTAiawTRz8RjSlRrEsRpEM7WCXDb0nR8uRuOxghcl24B2CM225E48jxrU
         0VQeYQ8Fo6+MBigPSqBjlWJYAck9p0gR0k1fHRvCE14nyuhTVg4GSJpqzDGi3FtiRVTz
         lkVZ2NpU53gCuB9KtVTOUqWjlXsFCS8H03pAMC8igIsk8BpG6NVmQNw7IP3Faa8h0AWO
         amCQMrtiYJGe8ixi4mIaMuB0ClSpGNogpbWez3ylLig9YPe3GysGlqZNA6vtptbyifb6
         563Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715699; x=1796320499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdbryK6r7Z8TT5rN4VXUmz07ho9c9oC73ihA4weajeE=;
        b=sAx+DfnjTaMV0RPS+/i1qAdaIbx7yTCK+BcybWhQbSPd3nNWIC8NjpTaIctWlDq/ib
         AcJlknnlvwYZuwA4AwNPNpXfsoK+AKLSqTXEnLaHbBuBH4vcF7vqlJfFmrltTdu0eI5z
         SuO0OxVY1oR4etHgPL9lHmsJ352/aNaj7nqYss7hSGi30SKXcH0UpXumYSOmTXUpBXOb
         Unm86JRovMivqBbiKEzh+GbXYNt1xqVqrhSpK7teedtEjfOA8bdTfoQMsmfV+2y5SZgj
         1rYg0nBOkiat0Ed7ITx0nuvBvfVjbJvehOkzfKy/Pbt/os4lwpZ/+s5vy+kWMUjiL2Ra
         bzGg==
X-Forwarded-Encrypted: i=1; AL+hErEvWrIRIaynwGVmxV4XdVQkcRIK7uRK19pUAH9+E0tg0HxyAxUEk4l5lNvxKYH0XmhWZwoJHld555pA5hI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xXn3mzrXwRfyweDeV0SV7ENq6EcTRkERgeSfaQwv11DhBeXSo
	+xMnCIKoRj1x8/ixK9o92dVGS3pIvP6svRmSrHpzo+cTs08oSk/zULwYiJzD78q1BXh7jFqfZ0F
	YwjytvpQYU1zpH/l4JNt60+xtTTkmNAA=
X-Gm-Gg: AZFdTZdfb0Dp2E4gsaw2vvCtvb2RtVFIkfrZSp+21U/GELTNvP5ixfdy53q4c2KrMA4
	1+B39VI5Ks9bN2jMkIt2Q1yKjbA5kJKc5rlh5e7oTIt/T+CRyTdmWRtOMpvN2vkFRy2DKtogG/S
	t3b6kv1J/XbYdrLUk02cic6g5lwypKuostRclZaT8GIMFN9x9+4YdYMqCiIT/RTyc9LvbNCbUas
	FxDQrcB69s3iCClnNjGERDzPh5aHZ6uRw8CKxChmV9YIYRzAFY+/jkGWhEK9JGEvE0Pbp/DM+BC
	BUZnkHdhJCMNR33oGZX7tdd/Z9ChrImGFRydpxg+jG/OE4h9Wo9uODraCLgR3eOdYl+e4Zw5GQn
	9DcLe+AoBACBfu+O+Cltss0rIvAWKAeKn2eFZr12dcVeOHWBlEndcnJvGJam2QZgX1A1Kic1pU5
	MZ5cwtI21W8EqMmYm75LsKUgtS3wq5ZIw767QPKZ7szubgLy8r74lX
X-Received: by 2002:a05:600c:5306:b0:4a2:5ca:767f with SMTP id
 5b1f17b1804b1-4bb887c9af4mr419667095e9.4.1795715698718; Thu, 26 Nov 2026
 09:54:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126094318.244973-1-alex@ghiti.fr> <98fecdf0-6409-4499-90e4-63996f33db90@kernel.org>
 <CAEmasaXWwWeuQnMbA+g8OyvNwe721Dro+1h+5pfTpzLuV6dx3g@mail.gmail.com> <0b7e81a8-d291-4cbf-8da0-e65e9a0b40a0@kernel.org>
In-Reply-To: <0b7e81a8-d291-4cbf-8da0-e65e9a0b40a0@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 26 Nov 2026 10:54:46 -0700
X-Gm-Features: Aa3M54qrITO3fdIud_o5bv_u9tR45TbGg9y25OYPa2Ghf3Ip3t8wAyWPaymBSKs
Message-ID: <CAKEwX=OHfC6gMBQ+DFPPRCvnj8QQbvEXg0SHvYqTjwrab-DjFA@mail.gmail.com>
Subject: Re: [PATCH] mm: free the swap slot of a dirty swapin folio
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alexandre Ghiti <alexghiti@meta.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <baoquan.he@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Youngjun Park <youngjun.park@lge.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 9:20=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/26/26 16:01, Alexandre Ghiti wrote:
> >
> >>
> >> But ... isn't this zswap specific? Why do we have zswap specific stuff=
 in this
> >> common code?
> >>
> >> The comment already gives away that something is not quite right here.
> >
> > I am mostly interested in the zswap benefits, but nothing is zswap
> > specific here: do_swap_page() can also find a dirty folio in the swap
> > cache when reclaim bailed out before writeout, or when the swap write
> > failed. In all those cases, the copy in the slot is stale, so the slot
> > only reserves swap space. zswap is simply the common case, since
> > zswap_load() dirties the folio.
> >
> > What do you think?
>
> If it's generic, then the comment shouldn't mention zswap in the comment =
:)

+1. Maybe mention zswap as an example of when this can happen rather
than the sole motivation. I suspect this is a generic problem, with
zswap being a common/easy to trigger case :)

In general, seems like the whole point of caching these slots
(especially after Kairui optimized the swap allocator) is just to
avoid repeating pageout work in subsequent reclaim attempts. In zswap
case (where we invalidate the fault after page-in), that trade-off is
not worth it.

FWIW, zram is also doing the same thing:

/*
 * Always try to free swap cache for SWP_SYNCHRONOUS_IO devices. Swap
 * cache can help save some IO or memory overhead, but these devices
 * are fast, and meanwhile, swap cache pinning the slot deferring the
 * release of metadata or fragmentation is a more critical issue.
 */
if (data_race(si->flags & SWP_SYNCHRONOUS_IO))
    return true;

so we kinda already have some backend-specific logic bled out to this
location. Maybe we can genericize this in the future :)

>
> And the patch description should be all about zswap.
>
> And we should measure the effect without zswap.
>
> So, folio dirty -> We'd need another writeback because the content on dis=
k is stale.
>
> If we reclaim swap, the next reclaim run will have to re-allocate one.
>
>
> But why is this "is dirty" linked to exclusive?

I don't think we need exclusive here at all yeah. folio_free_swap()
already does all the necessary safety checks.

>
> What if we did
>
> /*
>  * Free the swapcache if the folio is already dirty, or if we will dirty =
it
>  * immediately afterwards by writing to it.
>  */
> if (folio_test_dirty(folio))
>         return true;
> return (fault_flags & FAULT_FLAG_WRITE) && exclusive;

LGTM.
