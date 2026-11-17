Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942733;
	b=shYINIXT+uwmf8HTAobmKbZyJwyGWx+Fa05wjr11rXpxUYtfr3jAQEBFI8e7sm5e6A77
	 lCEh3uShVt2Pek51vgkckMUWevJlyufu0OfrezlTw5NYcDoHrWRHH/bSi3V3jYcR2jPJa
	 deuoD10TQW7i2gCPjgaFxsWoqUhwulbGJksMTBvZ+osY9UP5XB+eMMNOYqzYxx3iv0vjo
	 Ncl9yNpo+VoUnH6MEkeJFF7p5UzOdGdcdReRRCfr9rDHen0vH184FJ3m7arN7TDvBkj8j
	 Zs+uvoodJhHnvrElTDMclvpdVxK3sYMVQJoTQv9N1XRBOEaPMuCnaRAPjLA4HaFzb8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SoGTYtJjdTBlgzzjEp2BKIQvSbp+BHYyIKXNcsaV2lA=;
	b=bieGuwaZoaZlTUXnmTLgpwXTQyNVSx+s94iOzyhn8+dWnrzHuKT5EhphWzPwuAyXT2Nl
	 KrMJFAZeTVz8VNBoIGzIsW03CuBTPi3twixxr6JYu28MoHraf/7M7iv4X4ulY3ufV6r94
	 m98K2PPuDRXHWLTJEEw4U+3bQR+aCInfDVsuNoM3XF9cp4bNne1ejDGMt7oLd7xj+OIZ/
	 o2owGM54WP1sHUNrYA6C/j3sMwvhqnurtyvjP2U4N9rsxZrX4tatPG70osSNtcksGEiM6
	 jHc3B3OHuqf5qANOhu/61TZL6LeNhkglZqT4GndWUrlH1Lr6Evuo1GLQzJzaCKG0pAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2vQuJGZ;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019C606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5019C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2vQuJGZ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so272160c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942732; x=1795547532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoGTYtJjdTBlgzzjEp2BKIQvSbp+BHYyIKXNcsaV2lA=;
        b=x2vQuJGZ54C9oxn43e2SKTDVrCHxnZsTb2Nz+4rjP8P9AWZSWaINhFdHQjLy9qWy05
         slxVXMlS/vbaX3wotLMGWguEUeHvTmWRu00mRMuGYIRSTFnmB7+yb9QaZv6dZ30pGUu2
         /tNoZfltefDP2TDHvV8ReLDpXOgaEJa1gvelSfXMya+O1kYnRep/nOKRIB0h32ptZJej
         mM9r/eyLpEOO7h6oMowvj1Q5GsEoi7hmDgr5zVZxLRdIqNc9/NLhNthqRzvOp2SyJ+Ge
         uufeu2ePceUjr+rNPTT6PaQCpZRr2V/TnuxRYPwITWmlhqGt+fbxvbilfrMAGIqZLrvK
         gDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942732; x=1795547532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoGTYtJjdTBlgzzjEp2BKIQvSbp+BHYyIKXNcsaV2lA=;
        b=ntPO6MASc1bL+7knv/k9H7+2Wp6p0aaRHgpQ6a9X42qQX9z0nw8Len+mdv9JpwynJ/
         wX9X5+HI7yNMrlabCXOJXDc+jUcmHQxaRpC68usgneCTan118dvkGfav/nn6gEHMKsj8
         lhmVy2uhxuzzk1wjkMakZkyFfOtsgqYnDiv3vvR5gGI6QhksXE0FPCzZ4YMcifIyZfgE
         IkUbRtXq32q0DkqsVL3h9CeL28rJpFRl+KNLGo9ftYoBMuAGodLbSflSN09yABN2rnyt
         2rF1j9rEn8diFadC2uIfxalAG5ojFecBY5dl49NSl6LB1XsAPx3q2yaWRqRzofH3pDSF
         65JQ==
X-Forwarded-Encrypted: i=1; AL+hErHi1p8QT0rLsoRXKVmfgj62td4p27ADinvO17NzhNF2UMpeIGlhQgVRj73FGRv6qDmtxZ5WgJPhFbCIIJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fhbKs+vaDmbaL0v7pdbHvZ+DU5jXmdbVSKHtGUElU6jsYcpNR
	syS2hi8tf6abJ0vhGvclaAiXREWtSiNq+UhdQhz01jwsrfb+7aoOgDxm
X-Gm-Gg: AYBFou11IPu/DewlE4HK/rhUKqL/+TTX6CX8TvhzMxhwu0yL5uN6WQ9InCYOt14KEI2
	nP2mLJH/fiQV1XPmgM4TCpDHTP3472qRwEsBBd6oESWbrnRejM2GFVko4EkU6IeX9fCqTFndi7+
	fICbRpwanH3tWubnHA8COL0yUj5A+MWwgr1LOSoZsACNzrtJ3QiGdeu34a4ZCeFysTx8MBAslc6
	dVATb6Dits3Vicv3LLIjt5Ycpslx4GT9TFMTB0dCowPieXcuf2Zh533TWMMXyz+nVq18bfXiOdS
	BtgXCmVDvBJg9W5+kjEjwFbJo+SaOxezXtV8bERE5Za9dFWTO8tZPvZ9pLc2kk7DwhYH4Ga3CIQ
	N7Hzl6uO3uRGTYaOoev984FYQR20OKTxMfVMRLYwbPIODVAge5rRk5pMmO1ndwyIpcGo/eo8Fga
	UilLTsfI+CGQ1ohNJJ4DzNnqXPna18KjX2T7YVLecY2bO4jrvx7jAsvw9z5ea3Jttbv2bmwf7kz
	e4tubncVq5BywO6J6Kc+smbAqWwbQoe7TvX/HA7ps5lzlEbLy9H566GCaVUBTE9mgbBPDTThyeX
	3+lecSUkLTr9BDM9fcBT2BZDJKBj0T2U98chFSU9aVYTKxA=
X-Received: by 2002:a05:701b:2718:b0:1b2:6a1d:bf58 with SMTP id a92af1059eb24-1b543d4b410mr474902c88.38.1794942732411;
        Tue, 17 Nov 2026 11:12:12 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5b02sm211610c88.6.2026.11.17.11.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:12:11 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH 00/16] mm: add in-memory compression of reclaimed pages
Date: Wed, 18 Nov 2026 03:10:04 +0800
Message-ID: <20261117191004.1289281-1-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMgjq7B=F7grQqhUP1wGPG5uYHL44QNS023Lg4Zw0ycQEr_C0A@mail.gmail.com>
References: <CAMgjq7B=F7grQqhUP1wGPG5uYHL44QNS023Lg4Zw0ycQEr_C0A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kairui,

On Wed, Nov 18, 2026 at 12:27:51AM +0800, Kairui Song wrote:
> Posting a mega-sized chunk of LLM generated unreviewable code is not
> helpful for anyone.

Yeah, that was a mistake. Sorry for the noise.

> So in mainline, the win you measured is no longer there.

Thanks for actually testing it and posting numbers, that helps a lot.
I'll drop this series.

> you didn't bypass swap, you just re-invented it.

Fair enough, that's a better way to put it.

> One thing to keep though: patch 1 (UFFDIO_MOVE exclusivity) seem
> valid?

Yes, mm-unstable still has it. I reproduced it in a VM (fork, child
exits, parent write-faults one page of a 64K folio, then moving that
page gets -EBUSY), and the fix makes it work. Will send it separately.

The part I still want to try is packing several compressed objects
into one swap slot on zswap writeback, so writeback doesn't need to
decompress. If I do, it'll be a small series on mm-unstable, with
numbers under sustained pressure. Any concerns with doing that on top
of the swap table?

Thanks,
nakixii
