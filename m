Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681273;
	b=TTQS2DwrS+PeGNpySBwX0VH85s/4Rqi+4k16IBxtZYtHhf90faNj5nJmLM9cu1mVlLDR
	 8Z7s8+H1oVgkiPkDoTmu6Sd4Fb9hCScr/k5Y7ewMY47blUfCCwuc/BvnAGXZcKwV4Qeui
	 3GpJHORHxSDRrMIpg+1d+ROIndcHvhpwu6OxynzFnGQoXTZDeL+t0pDUWmXqvIwIKHMwZ
	 jByANUKCD5/ZfBqgU/gbLkokNc+iXEtiGWnuper/356MjYZbY0O5DDiJHMPeT7YE+qHmZ
	 9HQD8nQyy+nr7gGYm13cAeDFTFergGxwhabx2Bl/QOgHgxCJ4VH0Dh61K1XE/84jMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5XMVDmbH25df5MhEApmqQitq30RsFa91wwEAJ21DK2s=;
	b=swZiWBNqubYC/xoNOQZmjYFW/ZJF8BrkKVKjUVPI52CI1YjMZqHJy4+ifu7IBk0uhM7D
	 w1Xtrgm5518ymmc62hWomhcj0qS4sGWVQVthk+ods+MuG3w1lvcTUGXRt+OQ5BUIIw+Vt
	 JNa3MaG6XDx4ne5HQ5UM9Y+hMEHshHSu7Z4TI4gV9KUxTs3k6HfL1JAFjwX55W+TlGFl8
	 hU+4+DUWFySRcsXonr4RM0Ncx/uxHAeMaUVPU7wXOUV8tAzX5nuOc2MqFJDz5I8VDXn6m
	 0B4UHVIRlyxj4NGt5ptryQsJecLbbnybIY2Lezwp7cfirIrlCuKSsuDSRJeaMRtq4lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DJ8t0SLC;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B4606A331
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738B4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DJ8t0SLC
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5577712f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795681267; x=1796286067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5XMVDmbH25df5MhEApmqQitq30RsFa91wwEAJ21DK2s=;
        b=DJ8t0SLCgFImFQXcU96u57Fhr83JOGGv1xHJQ9KgyZgR6t/ApNuWbcR8ZwTfR0Ebo7
         9tAzX4M8WnOfj+fcuylj36UftFwTzVSJJaBI10A8jn6b1qfZp8XNgh6HFH7vLzv1xatb
         O/lXzaaGJMHhWEXuOA/VIp+SpNYE4AxcyFTt6Kl6ehzUlyjn4O+CsBTuT3xF+2xq8lhX
         Qw7t+SEO8Pi9zfNBTmTo/JGVU2YpVi4Nu2X2H713y8H1J/2FOaueDgKVJY6pXY5jofZk
         J+RPUfKA3zekdcYs8ja5dS4XzOtJFtuNdub6d/WiYYO37qD+x4ZRHqlpO8Nzr8EVsMd+
         tNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681267; x=1796286067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XMVDmbH25df5MhEApmqQitq30RsFa91wwEAJ21DK2s=;
        b=Gz0qPxw+BzKOxVECPvrphG953128xS7kJLg/7pDVxI4pCE6KlgMxTemdqyvgGWlAT4
         K3yOzayugB3EABELO/8f+1sG0QIoj4FAIl1KDJhjfXgwzyiBV/i+HIJAxhbU+d+tAums
         Dl5vWjeXFDo1iE4q4+DxOEGwtj2vuqSSZnAxO68+X/exI1xwXEhJ6b4TZVfnIkx04JlZ
         Xyxr1Mz90csDMZN0Dp1b3Ei83MuFHZ8vDoSO0eW3tMkZTjwVSLFgn0KkfMtBXX/CduDQ
         vSO5gWu+vVZuu3W+GLEBUqPgGZ+66ng/O3/UvI7TpzdVMM+f2KKGQ/nYrSTC0srQzlN3
         yeUw==
X-Forwarded-Encrypted: i=1; AL+hErH8g1ZkHArpHtU8p9+XOK/VjYS7NJWAVmMWTAn1tzZf+3qSrD0zSruhrq/9Ts1MN+Pg1LIZwHTuzGuvmys=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fSD+fFsfG4QVuqoxI5ynZ1PWCXlvStx+VnNpyh47isW+6wRN+
	AEww7E9mVjbO6s1c3agcjAqRhPLGJxKJJikWwS0xhMCnyU39pFzVfBESDRh1v3Mcv2U=
X-Gm-Gg: AZFdTZfjfcFxMqvDTAhANQIDw4x1NQDuhgzkd6x933DovlOlFGOVYNknoYcZY6lgiJc
	iwcPWgaFNsmw6gwCAMx9zLQJDT98B8aAHZ5cBg+kXboA5Rjn82jyAEaAFNerRXti1oE81uwmSOc
	XDt9CVwn/3j0MBVNPJSAAX+5bClpkDeutakAdRFk4JHR9Pbo3ORZ9dbJTTkJoUWXuC5eioSs1MX
	gJEPrvP6Puu9QwQ7P9WnU2dCkrLeiHXiAHownUgYsxufx+iVw6hsDidsBLJjuHJQC73kXMhcFU8
	vwWiR4SRxnGN9oywLakWXKdnOKgr+NEPiuIZAs0YgK8dVzl09tpZ6hz6lNe3ckF06KxRPMxOgFt
	zOTlMxHHzy9gMeScJ2790/JKZD9MY6etWCunJhrOFUuPAFziJnrDasNoASel4WkEP4OLq5p+dvV
	zaq1H+SO3RKQXHPrx8fYjCJ7XfpD/hCzY8rGV8KAsxrLyp8jmjGVUMhnaZZ/2G6Y9KRh2wQEohM
	Cfycxp3xS6rMHzbKtezq+2KurJ7haI2NFDodk5X0ggxULYj4KF2SAXYfew3Vb2sx3+uPFEuemhw
	v9obT4E+CVDlEqy5aFgjSGwtr9jlNnrufbVwC6TZEBRCM24/2lo/1Ryfs5bwNQ==
X-Received: by 2002:a5d:6f08:0:b0:4b7:7b8d:6b20 with SMTP id ffacd0b85a97d-4b77b8d6b73mr12609058f8f.46.1795681266888;
        Thu, 26 Nov 2026 00:21:06 -0800 (PST)
Received: from localhost (109-81-21-11.rct.o2.cz. [109.81.21.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm36108136f8f.25.2026.11.26.00.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:21:06 -0800 (PST)
Date: Thu, 26 Nov 2026 09:21:05 +0100
From: Michal Hocko <mhocko@suse.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Usama Arif <usama.arif@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Frank van der Linden <fvdl@google.com>,
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, Jiri Bohac <jbohac@suse.cz>,
	kexec@lists.infradead.org
Subject: Re: [PATCH] mm/cma: reject long-term pins of HugeTLB folios
 overlapping crashkernel CMA
Message-ID: <awfr8bnK7PQa6cyD@tiehlicka>
References: <20261125155108.24098-1-ekffu200098@gmail.com>
 <f79014e3-3c81-4b2b-87f6-df0c2d946357@kernel.org>
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
In-Reply-To: <f79014e3-3c81-4b2b-87f6-df0c2d946357@kernel.org>

On Wed 25-11-26 23:43:40, David Hildenbrand wrote:
> On 11/25/26 16:51, Sang-Heon Jeon wrote:
> > crashkernel=size,cma uses existing hugetlb_cma memory, so
> > crashk_cma_ranges[] may contain HugeTLB folios. HugeTLB folios allocated
> > from hugetlb_cma can be long-term pinned without being migrated.
> > 
> > After a crash, the crash kernel uses the memory in crashk_cma_ranges[],
> > but a device can still write to a long-term pinned folio.
> > 
> > So reject long-term pins of HugeTLB folios overlapping
> > crashk_cma_ranges[].
> > 
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> > The above scenario is only possible with the two patches below applied.
> > Currently only linux-next, which is targeting v7.5, has both of them.
> > 
> >   "mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory" (kexec-next)
> 
> I think that's a real problem with this thing.
> 
> The solution is not to disallow long-term pinning. :/

Yes, I would tend to agree. While there is a risk of stale writes from
RDMA on long term pinned pages on the crash kernel I would simply advise
admins to not use cma backing for crash kernel on those setups unless
they are willing to live with unreliable dumping.

I can see how reusing hugetlb cmas might be really helpful for
crashkernel as this can consume a lot of memory and you rarely care
about the content in the crash kernel - same as any other userspace
memory.
-- 
Michal Hocko
SUSE Labs
