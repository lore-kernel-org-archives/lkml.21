Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544865;
	b=lAM3LqizgGS8fXXXXMTccLtaDIUEEc5Lh6Ppne4fNK13psgkSqk+4Nt/nd/ojkJQ6vr7
	 vj+Dt+/NODp49ZKJKGUpAYkNbKsDNHLvInYiHCwPda3rtJXgkqOMdP3SP5XdnoPqb2aCr
	 koG6fk+k4ty+XmwhiE4jiGuaREg7vNYuLuE1xTGLOmXJMrdvac3ahaGa8vD3QooYkuwAP
	 kxslRrKHsrtJtdlFVxQstipmDREH9YaG/O3h5+a8jR59M+zFncIy9rEzxtOa2wAhbEoAm
	 MNHcdjA29HbheUTnDQZk/SvAaYUFJuc+tXUmWfNaLB1wqRQxIRtPtN4YH29TYMdeD7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544865;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=6NnSt+5MgSPrSh5hGTfh0N0vas814GEFyC4NmY/aZJQ=;
	b=K78bWBRPQOZyiWt0Wjg00J8n3SfM6bng9BFPRmoXCkXqrTqYjAZMUcN8DlB485IGEaJo
	 y5h1AeCSRtHkEQVlnfSaLbLpPZX5/AcKl8Q6xkTEUM7fjm5Cugghu1ImBuvcHJ3AgsPGw
	 M9MdV0WnWfyio80aybw1oA/T9dgcjeCAQrfMmWxUM2xC3ZTykBa7HFg97tshf/zbhokPM
	 6Lv4qyKDmJn2O661CsjVqAFMJE1terhQuZnv5CGkOQcLO7Y+OF2zoq9FaB06hHbBBtuX2
	 5VmXQqtNoJQwJQXehH/xZWNP9dJ2B0tkI+UOud3j86WKRBrPjfDSvbXL+YE+TZwX8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4Z3pRyA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C1F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4Z3pRyA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03821F000C6;
	Tue, 24 Nov 2026 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544864;
	bh=6NnSt+5MgSPrSh5hGTfh0N0vas814GEFyC4NmY/aZJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=W4Z3pRyAGAKenXsQ8RQhpNCCOYrOv8BxiWZ059qbalZp3zlzhDwlm97UbaFSmAHN8
	 cIUGceHwJ1I8J2bG6ficooY7fcSULumr8ZT+4oA4Xk0HQ2X1OLlFzKdbT5ModoUdcb
	 muxJWnfO555Leiz/emOtvnNZ8mSa583PNA2az5/S0f6UKPJYbPUpYHhlXuXccWorVQ
	 4M8ACH0rHD1+bhGKupIPBXO3Ph/EOdB6V87sOT32aPLDFF8cXff16GFwwXCeYohO1F
	 qOG3oTB5sP4VUHB1TPAZwAyjsD+z/Ep0NHeBmIkrw2GdhUpmhWq+tNrR6o58PekVw2
	 xIzQ6Vq4JkXvw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Andrew Morton <akpm@linux-foundation.org>,
  kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memfd_luo: don't use memfd_pin_folios()
In-Reply-To: <awXQ-sYNkY-TALqE@kernel.org> (Mike Rapoport's message of "Tue,
	24 Nov 2026 20:01:30 +0200")
References: <20261123130115.4021199-1-pratyush@kernel.org>
	<179546369651.425130.14155931836758567682.b4-review@b4>
	<2vxzo6bez3hs.fsf@kernel.org> <awWx1YnA0PcB2RaB@kernel.org>
	<2vxztsl6xj59.fsf@kernel.org> <awXQ-sYNkY-TALqE@kernel.org>
Date: Tue, 24 Nov 2026 18:27:41 +0000
Message-ID: <2vxzpkvuxexu.fsf@kernel.org>
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

> On Tue, Nov 24, 2026 at 04:56:50PM +0000, Pratyush Yadav wrote:
>> On Tue, Nov 24 2026, Mike Rapoport wrote:
>> 
>> > On Tue, Nov 24, 2026 at 02:51:59PM +0000, Pratyush Yadav wrote:
>> >> On Mon, Nov 23 2026, Mike Rapoport wrote:
>> [...]
>> > v2 was better I think, but it still had that
>> >
>> > 		if (err == -EBUSY && ++busy_retries < MEMFD_LUO_MIGRATE_RETRIES)
>> > 			continue;
>> > 		if (err)
>> > 			return err;
>> >
>> > which I don't really like.
>> >
>> > I came up with a variant below that IMHO makes things more explicit:
>> >
>> > static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
>> > 			       struct folio **foliop)
>> > {
>> > 	int err, retries = 0;
>> > 	struct folio *folio;
>> >
>> > 	for (;;) {
>> > 		if (retries > MEMFD_LUO_MIGRATE_RETRIES)
>> > 			return -EBUSY;
>> >
>> > 		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
>> > 		if (err)
>> > 			return err;
>> >
>> > 		if (likely(folio_is_longterm_pinnable(folio)))
>> > 			break;
>> >
>> > 		folio_unlock(folio);
>> > 		err = memfd_luo_migrate_folio(folio);
>> > 		if (err) {
>> > 			if (err != -EBUSY)
>> > 				return err;
>> > 			retries++;
>> > 		}
>> > 	}
>> 
>> This has a super theoretical corner case where the migration can
>> succeed, then the folio can migrate back to CMA by the time we do
>> shmem_get_folio(). So we can loop infinitely.
>
> Oops :)
>  
>> I think the if (retries > MEMFD_LUO_MIGRATE_RETRIES) should be after the
>> folio_is_longterm_pinnable() check and retries should increment after
>
> Maybe after folio_unlock() then?

Right. Sounds good.

>
>> every migration, not only failed ones.
>> 
>> Apart from that, your variant looks nicer.
>> 
>> Does that sound good?
[...]

-- 
Regards,
Pratyush Yadav
