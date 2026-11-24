Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539414;
	b=fH2VvenSSukvGumdawFtEGEfW3Te8grjeqAjJ5iVMSt52Fgi/8W1fkiqCk6KKSCBaozq
	 SxhaILJdURbcDmzMIM7qPhoSiAcY/GAei6QOCnplGbK72j1+elKlbg0MJjG/h8wVD6rmw
	 BKbicnukx+04H00l3GILehSSKL8xwcmlInfwYiDDifsPSyiX2y7OOm7nMkPuZ4pZe/a9D
	 wNH7jtEL11kKmmCEvwjqFnTJsmIzr/3h3rSPccfnVCERZ8SOznGSNr6IgCNflN7lw+sY9
	 2iGgcunFpc3z2EWa9jNBfPr5UaEselyMN5BdHkeFzsmSmwJE1D7jjOpXIiuz0dYmkEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539414;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=DQc8iAXrOWCo5dkpL4sta6QbqPzTZAceFHRxm6U10hQ=;
	b=vilMASicQTnvesZuL6kj01CTUoGZiMqn/JgCGaYLIm6XK0onF9RZi1ddw9WBujDqgDMF
	 nGt/jR78q7xiHhMiU7/YdOcX5csl+JnazSTzcGenTIHFRHRkX5m5zKZpoeCmTT6wksq+M
	 FYdfkJ9lkBojU5ag4k/1rf+NPHYVAaqvhHzsXaByFmpTfi3kpNTtCBQp6mHwpQBizWrd9
	 rK6ZjFv89zbaEtFKX4KF5ArxLenn12qlv211CK0iPW0v13nMYwsAUMn5tj9ivC+LgAyfK
	 UPyx7GMtBMwcTbksGF+fxXS5ULMpGGTmC2OjkRvkyABxMZdKyQnzi/yxzT5unZFH6NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6LU+EVk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DA606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6LU+EVk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1931F000CA;
	Tue, 24 Nov 2026 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539413;
	bh=DQc8iAXrOWCo5dkpL4sta6QbqPzTZAceFHRxm6U10hQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=U6LU+EVkaQDm+64Z4ftbA66Y+KAU40+11CYgmER/NhuyjebuKqOtatstiSlFMbxvk
	 ru9xT3H0k1Gu+cMFsfPhFm+ActlHtUasCBeW+7Z7eL3bFiXpDJtFhPvHm5tQWfdsKy
	 FzaIyfukq7U7dBfP6JKM4YAIC6fBR/AcxaK+2iH4XYRR9bDch5ELsgeW5p3ZLCRVsd
	 +hGbnGmsGcJ05hItJZlSsz1pmQVi8rhf/7GXUY1ewWbnIL5sgo5MxoOa8YsIlBAvKv
	 Zmcj43Pn0m9Kd9zXIux0waf1D9EUhwqlW9KkBfbT9/ZWFAYd6e2NBd2rxuTgBJzZQ0
	 OnNU6BGRJGZFw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Andrew Morton <akpm@linux-foundation.org>,
  kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memfd_luo: don't use memfd_pin_folios()
In-Reply-To: <awWx1YnA0PcB2RaB@kernel.org> (Mike Rapoport's message of "Tue,
	24 Nov 2026 17:48:37 +0200")
References: <20261123130115.4021199-1-pratyush@kernel.org>
	<179546369651.425130.14155931836758567682.b4-review@b4>
	<2vxzo6bez3hs.fsf@kernel.org> <awWx1YnA0PcB2RaB@kernel.org>
Date: Tue, 24 Nov 2026 16:56:50 +0000
Message-ID: <2vxztsl6xj59.fsf@kernel.org>
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

On Tue, Nov 24 2026, Mike Rapoport wrote:

> On Tue, Nov 24, 2026 at 02:51:59PM +0000, Pratyush Yadav wrote:
>> On Mon, Nov 23 2026, Mike Rapoport wrote:
[...]
> v2 was better I think, but it still had that
>
> 		if (err == -EBUSY && ++busy_retries < MEMFD_LUO_MIGRATE_RETRIES)
> 			continue;
> 		if (err)
> 			return err;
>
> which I don't really like.
>
> I came up with a variant below that IMHO makes things more explicit:
>
> static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
> 			       struct folio **foliop)
> {
> 	int err, retries = 0;
> 	struct folio *folio;
>
> 	for (;;) {
> 		if (retries > MEMFD_LUO_MIGRATE_RETRIES)
> 			return -EBUSY;
>
> 		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
> 		if (err)
> 			return err;
>
> 		if (likely(folio_is_longterm_pinnable(folio)))
> 			break;
>
> 		folio_unlock(folio);
> 		err = memfd_luo_migrate_folio(folio);
> 		if (err) {
> 			if (err != -EBUSY)
> 				return err;
> 			retries++;
> 		}
> 	}

This has a super theoretical corner case where the migration can
succeed, then the folio can migrate back to CMA by the time we do
shmem_get_folio(). So we can loop infinitely.

I think the if (retries > MEMFD_LUO_MIGRATE_RETRIES) should be after the
folio_is_longterm_pinnable() check and retries should increment after
every migration, not only failed ones.

Apart from that, your variant looks nicer.

Does that sound good?

>
> 	*foliop = folio;
> 	return 0;
> }
>
> It does an iteration more than v2 with the same MEMFD_LUO_MIGRATE_RETRIES,
> but that's not really important.
>
> Your call really, I can live with either of them.

-- 
Regards,
Pratyush Yadav
