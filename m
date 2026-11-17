Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794956262;
	b=zyeDZTvmTwFrQ4lvQiQw28YUoBvzRNDZg2YzXFzA3LP47ZGN6g7ZxLCA3WCWImXVg0EY
	 U+orw+marZ1TZEKAIv1zr7dgdIWdB8rfqLR8oVu7oFys+G2aO5MblKKWCHs59LKBcdsdX
	 160Egq/5Z9zEGwdHMnxaWPEyH3W8k0um2XQt7APWUhqOjYGm7vEXMXN2e+9iKDgs9KHMB
	 SpxbFQCT+mq++Ck8w8uCIhHAyGcxr85dCxtVOiIKB56KXn5Nm0Jk4mFzDgeC+FZ2rNR/K
	 +VStvKMuXKQBlX1mdLDuu7TotaujVwXs3+sthZpYCuP8C8AlmBIHJcohajk/48f9VXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FsqJbwkV/uU/DSRZoNtapIdLtn+SA2yH6t5SZIf1Yv4=;
	b=WOWATIZC1CHS+L//87ZndVMSjlUSoP6JIU4gwZm84SHa1qJfkbV+wes3EwE8iYUAXGiv
	 FtAKjDaOstrW132RyTpPhc6+EiVXAr/XC4hDsIZPODVtxvuN+2Atl5ZWVhGjWCTJb6y7x
	 9g+5arQBFfDqQkbGFpBV3e4lVlHRDpzf3zFnYaaZ4XgxJVpajAofOfnO7fbkoS4PTW+AI
	 t4tj5yJHvWGEksSY6wrU/CrpayjOjO2vqjrABwIYVzaGKYvDrEx7hh0tB/YB19FBbK6SS
	 ZuO6ynM6/iJYxfS0g8YguCsO0raLMvjrx42CTEyGjq288L7u8hyrAJY5VrEemtg5p+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z727BfMb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D965A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D965A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z727BfMb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so4633215e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:57:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956260; cv=none;
        d=google.com; s=arc-20260327;
        b=f5/DiApYIhQcpMetOf6c9venjDjzgN7v5DieZhHBpzZ0JOLkIdSwXSyQ5Ug1tewdQu
         ib4gFOFpRmLd3f5nt4ekPYy+xzq216u6iPl01/yH5DPRR8S33cAKTSwoUvz6XXY/rhsD
         5jj/a8QIKYA2gxOBgROyxFewmwdMJGi7k2v4VCG5yeCOHeN8GuZsHQBe5y7zZMNd1VdF
         Fpiw1RX8PPPwsSpFV1wHEA2/MuF4wECTOSpbvnvWm2743NXcZ5eCjqo4iptMMpEzQNQu
         bgmvdhsxyzd7U40PVYo3msAGPaviDyHto2ZYiDvTgWepRCvoiYlXz3X/NVvjgiGks9nz
         wolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FsqJbwkV/uU/DSRZoNtapIdLtn+SA2yH6t5SZIf1Yv4=;
        fh=1BZ3xzMrg1zmDvO3vTjz08HGkS9pJaJpNPwqA53EQOY=;
        b=G2yuksTpFPbJe/xoIWkjGUBp8PNCBN+27oFUUMtFySLPZBfpCiU2qWjgtoaprV+S9e
         0iipbbZz+ynDHxsrSr45YTkznRFTkHYVg1HZ0WrFMoqyTGZLs4l/4z6XLQUR50YXQzqX
         whkkHPtoi+g0NzdDzlT1VD9jQhziM6W3wHgijZ/EvESBoKo362bAmFebED9LmbVSl3ls
         H3V+danMcZYcKezqWlRw61H0qfuuGxtL37GrUjxCk6YDyCDXMtvcz01TvkxhndtawU+R
         Nhi0l7OiMXoM8iCLxLCbV7UJUjAppaTAwJDKVlB3982kzqwzNTOtcBpT+rAAZSpnypQk
         aOiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794956260; x=1795561060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FsqJbwkV/uU/DSRZoNtapIdLtn+SA2yH6t5SZIf1Yv4=;
        b=Z727BfMbH5q2nf+Kkim4q85WEKbR7887da4hCSXSULc0A7ZPMl6gBZ1oaNynswqKYR
         xhTZIUWSVK+b+pmzo8QV7z4dxNMwutFHK24B1LCPDTP0rxqZKTrBqnzZ+P4F/IDXdiYq
         css0vDCgIzzxw9E/L7ZZP23xJsEYrkjtS9D3g+RYU5NEHY6bJyNJrELN7d1WjR9wup8S
         OKHKxu5J9NwVi5rkL9sat8b9L7I4dzLurQgsgf3kPGKz2VDw2bloQsWKqjL99za+z9sC
         orhxTwWuxTYjBRyPpxhWHpz5tjeoVd80IqG7N+RCA/CPwLLvDdy4H1dPxLKkH8mXGAuZ
         MtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956260; x=1795561060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsqJbwkV/uU/DSRZoNtapIdLtn+SA2yH6t5SZIf1Yv4=;
        b=Vy01tZQsfeOT6LIO3oOmL9i/EVxCGPibabMbbbi3aGJf8cW5ByQniwsg7TKu60cTzX
         wZXLrFuwZZUysKpwGpKbatgTXSRe+vcESUos3YHLULrp6YtyaWonmKuDh6csz2i90LfH
         ssy8s2WtFes2e8CSz16I9jUw74WTDIXiktww/AiatIRRppVlJ0gvQb64ZDHU95GUsARi
         8V04MDl/1vGQVSLtVU3ncLZi8BuH1nIyK6XWEM/5kFcfColsH0k2J/MYt8Np82MFh/sS
         bgp1jRfVQd6zl9bVIQBzkV5eCozxWkiqTrAUeoN/BedPthiDAjyRS2hJTePps/HCip0s
         Y75g==
X-Forwarded-Encrypted: i=1; AL+hErENR7qDtOfKJHZLUKemTQClFbGaug26DKC2wUf3U3Kj+HZnmd6/JmmzrX2L+8Fw8ROj5RDGa1S3r9aHQMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z98SKSd79Aa+g+oV8XeaT7sz6P0k6et4VVz+3IWmRV9feLg4I6l
	TVAXHXmBiDeX9X/oyhiT3bSevBVqV3yuln0RXkYGAu71OUltxRc8Lqny6uHPasMGzT6/Zi6LP55
	a9foeZv5qwYt3asWoE3q2AdAS5xcf2ew=
X-Gm-Gg: AYBFou2J1Zovqk3YVd52J5RZNA2O5FksujacaELsQfHWrD9RNZFs1ktZTtgR92t5ZmK
	xj41RiAnIWCDg+9TpRKJjzAWvFTv40ZyEj8g1IZAoh7tYfmwOri89QMp6H2Mhe+8K8lW3LbQiQO
	AP5m7Ek+7EZ75iLcAp+u8tunHD4rzNLzP9agne5y92K4WZyhzTVkUIjZJQ7w1LXUpTZq7T2Iv/L
	/iXxqzVgxpCti2RCxt/l2cmJeteZOQ5spw5s8SD4nlREDORD2fcGCzuwf3mSPgXRGwh2GGvDWci
	YBUvb3/pneJwQObzsIIOF39717f2mn3RE1pwKytI3T2bPNa8+toCCFE7CJEG1WZjpndgjX+RRA/
	tSuL1kw7ZYhRdGz8imW8szF9OvSkZeuozpoB15XGgNKmGc2ebusJm54sbIgqC84vwJ7K9jN8KgV
	2sMcJEcn8ZwjZ2vIGjS86aX4oTN2bNrYPMymY7zdcRCggSLKxYrad7kIGz+lp7HowwmCB3FQ==
X-Received: by 2002:a05:600c:1d06:b0:4bb:6a5a:783d with SMTP id
 5b1f17b1804b1-4bb7da25158mr12547015e9.18.1794956260090; Tue, 17 Nov 2026
 14:57:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKEwX=M64ZmMLBRiAQ6FiiP8f=jkA4m=HM8rgQo-cir2SENPnw@mail.gmail.com>
 <20261117161028.475891-1-nakixii@gmail.com>
In-Reply-To: <20261117161028.475891-1-nakixii@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 17 Nov 2026 14:57:28 -0800
X-Gm-Features: Aa3M54rLZoi7B6oMnsab_DhD6F5mz6P2afScumNTEptyJQeY10XdZ8aO4kmMqJY
Message-ID: <CAKEwX=O3qkG0pt3qVsRTDDfP9sC2AuG2c-t3Xaudquw0xKwa4g@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] mm: add in-memory compression of reclaimed pages
To: nakixii <nakixii@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Yosry Ahmed <yosry@kernel.org>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Barry Song <baohua@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:12=E2=80=AFAM nakixii <nakixii@gmail.com> wrote:
>
> On Mon, Nov 16, 2026 at 06:13:46AM -0800, Nhat Pham wrote:
> > What's the motivation of this line of work?
>
> It started as an attempt to get something like the Darwin memory
> compressor on Linux: keep reclaimed pages compressed in RAM, fault
> them back directly, and push cold data to disk only when needed.

Ohhh I see.

>
> Honestly, your virtual swap series already covers the core of that
> (zswap without a backing swapfile, no PTE walks when moving between
> backends), so I don't think a separate subsystem is justified.
>
> The parts I still think are worth looking at are restoring directly
> from the pool without going through the swap cache, and packing
> several compressed objects into one swap slot on writeback. Do you
> think the latter would fit as another backend type in vswap, or should
> it stay inside zswap writeback?

Ah interesting! In the future you should include the motivation in the
cover letter - either new use case your work will enable, or
performance improvements, or overhead reduction etc.

And yes, compressed writeback would be a good thing to explore! I was
thinking about compressed writeback sometimes ago, and I came up with
a slot-packing mechanism that is very similar to what you are
proposing here (IIUC). It gives you both LRU-ish ordering and good
storage density. Something along this line:

1. An in-memory staging area of "buffer(s)", where we pack slots to be
written-back (by LRU order).

2. Once the buffer is full, we can writeback the entire buffer.

3. Refault of any written-back buffer brings it back to the staging
area. We can use the same mechanism for defrag, compaction, etc.

(I'm not 100% sure how close this is to your idea - yours might be
vastly smarter. I'd need to spend time reading yours...)

But the challenge is the synchronization mechanism. Right now we rely
on the swap cache + folio lock as synchronization. We can't use that
here, as the whole point is we want to avoid decompression. We'd have
to add a backend lock *somewhere*.

Ideally I want this to be decoupled from zswap, i.e as a vswap
backend) We'd have to re-introduce a bit lock (almost similar to
SWAP_HAS_CACHE) - I don't know if it's ideal (Kairui, what do you
think?). Or maybe we can add a backend-specific lock, which pagefault
can block on at swap_read_folio() time...

The other option is we can re-use zsmalloc's internal synchronization.
We already move slots around for internal and external compaction. But
that would blow up zsmalloc - you'd have to implement the stuff above
inside of zsmalloc. And we might have to go for the pool_lock, which
is effectively a global lock...

>
> The numbers in the cover letter are from 6.12 and don't compare
> against vswap, so they don't say much about this yet. I'll redo them
> on a current tree first.

Yeah let's focus on compressed writeback. It's a concrete problem to solve =
:)
