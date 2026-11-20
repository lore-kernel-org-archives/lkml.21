Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189475;
	b=sb9hHsLnKacuchD28SCo6Fz2pF70T7dtmebC63hq5EEsWtUwKmXyazJKPl7gAPCtrLne
	 rOF7oiDnQz8x/h0fAE/YrLNe/AKID7wfCDEr3+0h9XjMH1FcByiDS9+YtQwzsDPvpupSv
	 XZxa0DLmnCaFtJydFqPQ00TjWhJyv4FJ1ScXP0NWxYre0Ay9IvRwp2aaAOmAlwrZcFxmb
	 8E0jrS4owpWmVFQXfv6aW4ypFI5GUotSx0lnMtv6AJ315cIXSrbtAohbf9BKCX3p4/OX8
	 ux90ojd0jOloyxa+yyEfWa+bDTftr75Fd31XHxVoHG1ajcz2MZ78aDGYGwSj0L/NjNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189475;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=NGj0qVuLIFFATf6LyggXZB3De6ZTU5Fq7s/WOWKevVw=;
	b=YOz2w8eRjqgxNJjmeA/h4VHib/bVugHG/tEZI6vCpVsQxgRpJVWI/c1EigQU6h9bC2SJ
	 cH612WI7XL/lVzaDxtkT8XZUBW1x60ZcyIK0ubd+/w1lqKwieBJZT4Fkzdp62P3wL6ia5
	 UEbfW4EDCmNX+AnV24q4GIEKOrPZduSVC53cbe0Bdhw+FYQPwOfLtVPIVF3YsoaKt5N9E
	 mCcFj/RTPLiW9tAaYMm67V1fDRIpl1QV+rVUA9Oni4mIMQ46tZeRZyLKNGGWhEIf0HFoU
	 kO98Q/YaTeKfLsTlYxmvCf7fwZ9UVxlRNiGE2l7WCc586kC6Q2ULEhxosqjADItvyCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmeJ271N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8911606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmeJ271N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B4D1F000CF;
	Fri, 20 Nov 2026 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189475;
	bh=NGj0qVuLIFFATf6LyggXZB3De6ZTU5Fq7s/WOWKevVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mmeJ271N5f02C0B1RJgXSd6hkgBzr5xSxlMsyenlDXMd0wCPGTa7FRYam0L+pK+Nd
	 2nDwSnDOv012h1FYqMdYNMO6bs1iHUSB9PaeWSr6tD3E999ON/i1nZJrZlbyopx/zH
	 1WOxAslRKxAb9EIJj4yAqjf8N6R6HgMZS6aqktcvJIpdXVTkB3T81w8/pracVLAw5I
	 wSJIVpaYPJpzClqE6eNqFKYfrkrqP4tYZGjR6OqUAdtKVVC5HgrjgK71tSO2C0h5E2
	 +yEM8XVc3jF9BMQI6AHMNt7a5VhqmQ68piHOjE1DJhS6l88PoRjNwWQFZutTDw4942
	 yHBaa6mbzgwGw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,  Andrew
 Morton <akpm@linux-foundation.org>,  Samiullah Khawaja
 <skhawaja@google.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] mm/memfd_luo: keep memfd frozen until finish
In-Reply-To: <20261114220528.f7d9874a014dbb5d@chrisdown.name> (Chris Down's
	message of "Sat, 14 Nov 2026 22:05:28 -0800")
References: <20261110175855.2437084-1-pratyush@kernel.org>
	<20261110175855.2437084-3-pratyush@kernel.org>
	<20261114220528.f7d9874a014dbb5d@chrisdown.name>
Date: Fri, 20 Nov 2026 15:44:31 +0000
Message-ID: <2vxzcxrz1p9c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Nov 14 2026, Chris Down wrote:

> Hi Pratyush,
>
> Pratyush Yadav writes:
>>+ * Restrictions
>>+ * ============
>>+ *
>>+ * While a memfd is preserved, and after it is retrieved until the session is
>>+ * finished, its size can't be changed and holes can't be punched in it.
>>+ * Operations that would do so (``ftruncate()``, ``fallocate()``, writes past
>>+ * the end of the file) fail.
>
> Not a big deal, but there's one more thing that fails in this window and
> isn't listed here. Adding F_SEAL_WRITE to a retrieved memfd before finish
> now waits about 150ms and then fails with EBUSY. That's because
> memfd_wait_for_pins() sees the reference kept from kho_restore_folio() as
> an extra reference on every folio. Once the session is finished it
> succeeds straight away. The same already happens while the memfd is
> preserved in the old kernel, so maybe it's worth mentioning here for both?
>
> Also, fallocate() fails with EPERM in every mode while the file is frozen.
> That includes FALLOC_FL_KEEP_SIZE inside i_size, which neither changes the
> size nor punches a hole. "Operations that would do so" makes it sound like
> only some fallocate() calls fail.
>
> Otherwise I've tested this across a kexec and it works well.
>
> Once those are fixed, please feel free to add:
>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

Thanks! I'll fixup the two documentation things and send out a v3.

-- 
Regards,
Pratyush Yadav
