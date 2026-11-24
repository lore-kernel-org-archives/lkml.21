Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795546805;
	b=3V+C69XisRL/WTANQg9Qgu5nXGGf2VIWKp72zgZmmBBYJCom5AHC22EEMYCgpnbGzq5q
	 XncE3C1bwlqshFCUKyJm6EzabkBwOkcXq31YU00dmphPIJROuZ73gg+p6FVUtlIg1DmFT
	 ny4yDnvePcVI3MrAf1ud5mG7XdTmgT/yut6brcnhIl1thkg5CDFOJJFm6wRY/o78IIYDd
	 WVABosYCcnBG4sU0QmBIYR2PjuGAgc8FckRdn6uani6NanmE53HbmF9L1QwiKGKvOwC7/
	 RZRfS/FCmqk8WgT09bc8r9brNYZfPyr9g9H6MPGpIGDd/Q2AK8Am9dW/1yKha9I0TRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pI18bHQi+lJnh+lP+mc40mct9lRe+QxMEvK17p079oo=;
	b=O8jo/HXO8TeV8mzq3kOW3mt38SMuGpAkJc619/cBWlYelIbIhE/O9VGmRk34MuMNeRhc
	 InZ8pd6/0ALFiDIKwwhL46sYzSufVjmaT+XEusvprr4SjJrmznTU7fefUlApMeHro8BLG
	 EcHi+zggG20rK9dXd7qEld4frBahy6qElInnFQR+PsmzgLsaxy7ZblYumlv3ic9lDJzpj
	 t2ukBN1zm6NaIOVymVXw90wuibhDfMMIzv04M1lDezQ1JPUGodVp9WyeQZ+KrEzeEycds
	 /Zrvb9te+/SOwRtupAfBV/Z5tTp0cghCXdpx+HZl2eF+AzT+53FWVTJ4+Q52DyI+DkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BSHRGF8j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0570A606A692
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0570A606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BSHRGF8j
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so139225e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795546803; cv=none;
        d=google.com; s=arc-20260327;
        b=s4x590/d9RnNkUjURqc7BCu+8fvzA38aAPfiUtx9uxhhr4swBVl3cAwHv/XP1MhSnF
         rOMIlqXC+uN0b3j5DWlNJ4Da+AKPiCJBpksWAuODcuKVjAiYLOUWzuLNlFi0+O7aMqD9
         2Q4XHhKtIWZCyywZm3LYHKmZI9+tID3xve1R/Qo+axI9DrSxwC4F1J9lrgWmI8JKgRl6
         tDZ7H0LZvTUNkRCOnUuTwQ5WO4gLxu737b67mJNK0LZunRI7yooN5MTR4T4mgfHtyK23
         dNX5MKhbKp1n4jJfuzFxiF9q7yq/9lLKmyHW1uLxo9Z/2Ue3N0hXBcNk6xDjDAJKx0Yt
         AFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pI18bHQi+lJnh+lP+mc40mct9lRe+QxMEvK17p079oo=;
        fh=KeihRPsg3e/bY4RTw+VT2PenNc/lBeS5qqtLGME4opA=;
        b=K+AZlYTZqN+oTiS3yVOqgHixHKGE9pDxmYKaKWfAEgfIFEmhXRgEvmKzUL6rmSue6d
         0KvmQ4JAnDnhxX6MI01RZAxvjO3abLGga15j48Nq7+zeKlGgV43yon/g242kDSzZKwS1
         +xHs8xYTsIrIZnrPL0eQ4imOzLVkBdHFWaI8+9b/9ASKUlO4MfAq46FkoolMXrBPH7+p
         ArD2unLnLu6ZVen134jF564OpEaH6tTyTu7Qf32NPWb79R2aQZ7ajG/CM8afZ64E/9j5
         8ijTJLzFUw/ayIoJAQE3eFhySTx7CuMs9KKfOMNpvot6IZUnZMylBQsIWfGUG43gGZzR
         YgrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546803; x=1796151603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pI18bHQi+lJnh+lP+mc40mct9lRe+QxMEvK17p079oo=;
        b=BSHRGF8jOSIVT/X5yLBPZ5Px8eJI2o9bBmEJF/puKHGpS+UJEtovyL3ZhGpVb4Gbw9
         efrFX6XQ6m1PdozusC4S/B0UVGkabwZIsQF4hixK2+e424VWFxPpZraZBOvd+lQaHVTq
         APkzx4gIJ949uye76nUHu1oyaZ/f/mMBBawN7R+yATrPSRaY6WzUU4snJgAJ/aF85jeu
         iAjrhU0WXIpO7XxSla8ou6VpCJGEVxEytgNh6FE1+jV6ENTp+gDKT/FD9xEQu6QeUcZA
         14qPzrV1hOlB+5gTtzdmKsbyk27JmDFauvXS+R4Fvi4gPAufmjfiQH2CZe8jw69EsOft
         VHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546803; x=1796151603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pI18bHQi+lJnh+lP+mc40mct9lRe+QxMEvK17p079oo=;
        b=06c5KrYOqZoM0339l84ybSu4ZKKLS3UFLoWKknNk4PqBtRK2YDJQdVcsMKVMLLxvMh
         08Mm3iYT9C3TyBIFrBVf2u+uEpnfp9bi6qcNJ2RPMk9HRPZNbViRqsCQpCEYGn6WH2Ve
         UdYpYfOTxPCZmhQYFHziOUbYfklhiXkCGJ3GVpnCth6/7YrCx07ook9lmnSvnary0bC/
         Z7y+KQvnbpnphXsxRNHSRMrfwCu8WywZ33FB/nb9CU44q8HEpmASZWiqk1PayxYC8xOa
         /wGLVBhAiX8jWIdwlTK9CkG3rh/FD5x8b3qlPS5IEIJ19aPatJH4FvN9B8L6TbRXyWSz
         omLg==
X-Forwarded-Encrypted: i=1; AL+hErG/QLrpvqGEYcMYB7FUx2DO7xWT2Y1V7+2UQotD3lEz18nQ8RIvkHQFJWbQWpwQQTXQF44AXTnlpqHG290=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K9Fj9G/yrI7NBd7zWDtIyVpGxxtnjaEkPS0crCV0GSHA5/fsb
	mTY793wJtrWY6d5wzM8RV4iuJm1MxTRbDUocyaBsxONirMDCzGPdXwnPKqrIjDV/Hb+WVMkFN9d
	vReKZbAyoGm7EukD9begHFshGwDKT5rN4ReNgXtZd
X-Gm-Gg: AZFdTZfpq3OvQ9DgKllncGhi/iA5OwoIKxpH72Sxgx/mh/mkv4gDKtrmvU+kwedbOfb
	jfj5Z59x7RKaK2RkbLFKklGwnK29NB1m6G/1WOS/b8U0z/pynT/mS2HuSMue2DCMpvxNvoXFzIc
	BLlWSMwU0a29jEfaYuru7yOFhEHb5LIAi1G8wxfLeFXd8AHh6WGl0P3pD3jGMyzL8vl4dNnXZnu
	0L3HsZs568HFt3HRy9kCCnBGzrqB+TLU+XStPw7DbSOiPoi7ECxMw8XCQZmdt6PpZOFbgcMBFPk
	NgN38fsC4ZQHyYIuPQhjfGYoHTf7c4x2z3lKhoF5wFZ37il0f/9IFiH495lClTCDZm341VinPJS
	IeTPXaHTFws4KOVi9nNwrwhGK2B2rBqSmnpRhO+rw/ZGVQXAutC/m4Fs6A7hGukRnRLnJCRsrA1
	iOA6CdTb8TgBEWzoa/V3OKiAw=
X-Received: by 2002:a05:600c:4ba8:b0:4bb:5e6b:2dfc with SMTP id
 5b1f17b1804b1-4bb91646004mr2422425e9.13.1795546802578; Tue, 24 Nov 2026
 11:00:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org> <20261117-huge-pfnmap-fault-races-v2-4-276007e73bcb@kernel.org>
In-Reply-To: <20261117-huge-pfnmap-fault-races-v2-4-276007e73bcb@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 10:59:50 -0800
X-Gm-Features: Aa3M54o4WZZXMe5rkCzAWiCKTf4u9AcgtxpDdtwUOt0YCIX4IAOM1qzNi5J1mGI
Message-ID: <CABdmKX34z2s-7KE2+JwFSQRN3eGoTy8bs+KB_hWXw0YbF9msLg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mm/huge_memory: only compare PFNs of huge entries
 on huge fault insert
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>, 
	Roman Kisel <romank@linux.microsoft.com>, Saurabh Sengar <ssengar@linux.microsoft.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Michael Kelley <mhklinux@outlook.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Eliav Farber <farbere@amazon.com>, stable@vger.kernel.org, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, "Gregory Price (Meta)" <gourry@gourry.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> A driver that implements both ->fault and ->huge_fault must anticipate
> concurrent use of both.
>
> This can happen, for example, if a user calls prctl(PR_SET_THP_DISABLE)
> concurrent with faulting, as that only holds the mmap write lock and thus
> does not exclude faulting threads stabilised by VMA lock.
>
> insert_pmd() and insert_pud() have issues with this as they both assume
> that, if the page table entry being populated is not empty, it must be a
> present huge entry.
>
> This is problematic as if it is a write fault, it compares its PFN agains=
t
> the one being inserted, warning if they differ, on the assumption that th=
e
> entry is a huge leaf.
>
> Since the entry may be a page table, this is invalid and can result in
> spurious warnings.
>
> Equally, the entry might be non-present. Nothing can install such an entr=
y
> in the VMAs that reach this code today, but there is no reason to rely up=
on
> that.
>
> Therefore only examine the PFN if the entry is both present and huge, and
> otherwise simply return VM_FAULT_NOPAGE so the fault is retried and handl=
ed
> at the appropriate level.
>
> This is what already happens for a read fault, for which the existing ent=
ry
> is not examined at all.
>
> Target the commit which introduced the first driver which both mixes faul=
t
> orders and passes the write flag for the fix (since this commit, both
> drm_gem_shmem and panthor are prey to this issue).
>
> Reported-by: Eliav Farber <farbere@amazon.com>
> Closes: https://lore.kernel.org/all/20261112051440.16140-4-farbere@amazon=
.com/
> Fixes: 7bfe3b8ea6e3 ("Drivers: hv: Introduce mshv_vtl driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
