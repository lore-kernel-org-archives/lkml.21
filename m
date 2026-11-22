Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367790;
	b=ZQKilo0TduAKwquio7SlmItjPwP4vhzVnO7pzWOhJUL16hk0slyLgz/ZpD7Sb3Dhccr7
	 Nm94ZNhpsknlLkrbw+aQj+pM+icx5DLtxJzl7yFhdRElB/zYvNSwqZjdiMNtxVkd7LBz1
	 UwIURiFv86SZoRDAy9fZsodi2KqlkhhWySvZHJJb1c0/WJFWXuOD27qRT3lcz52wL0B4b
	 1ah2vSZNibgEJT/DK3b+Rl9DMbbQFJEkZOr/6nUI/SCnsVfeT1o7DW5grg7rhOBb3K5+X
	 EYUyqIlzR3Eb2I/KAgBNWk0XYAwhUlVzztO6Ck7Ta5vTv3M6r9iTkOUcLq/IP1sI8rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367790;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=8U1bFnTXuoJQsqWekFfKi+X2o/ZJhZ4F/U+nC/6Gs+0=;
	b=zJftz3GtRBU1UTy9i1d5YaZJNdUAjvB3LrmVGMApfMg3xXcEmt5j1hCgfXSl7cNPTZNE
	 /Ysjhsxj0ucujVLWq/R9redocNDR9Cd92WlPjFexDB629k4dXybWTHLF73j1PZJu3QH4y
	 SMCG91yOoK2ht1vF5A7UyMssljoRWwnaFuJyj5bUqQOl3p4/Y3HFxU02JVsoLrQ0vnTEZ
	 1sYXV9UATm1S8+lhCTxBM3F+nC9c13Q3N0IsWyRiFYOWhZR3H6I4tcgIeUTHph69jloDh
	 lVodzgQaABcmu2Mdsm5dKS2kwQDsmRO6WaFnSAfNn4oLQ+FEuviVJm9Hqg8i1ohefUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=RzaeP9QG;
	arc=none smtp.remote-ip=79.135.106.100
Received: from mail-106100.protonmail.ch (mail-106100.protonmail.ch [79.135.106.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B489606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B489606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=RzaeP9QG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795367786; x=1795626986;
	bh=8U1bFnTXuoJQsqWekFfKi+X2o/ZJhZ4F/U+nC/6Gs+0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RzaeP9QGXINabKpuBuVOYYZrLOcCkDmifkK2PITQiW/9AGuzfSuzstUUSTusoPgXm
	 QAh1K3Ct4uWvuOK75ssSNwYkaKgsSBH74W0m9IyG4SSx1kvLs69XktcyATVeoW7RFG
	 fX/numcrBRXD+4K967hWMslFCg3HaxY17EE4PuXRXLK3KeYWW19dfhbG/newEXcKBh
	 dzDCK+T5zbV7xbvmDtXyHGaquoE2JnM3EY0m++dTulXeuAQfqRu6o5odB6C4nMIYvB
	 JScyAReanQuTXc/FpGq9fTqfS6fHfUHCnN5nsZxqiud4DHwN21sGfLF/R9o9tC3Od8
	 /6gfC98mqzXJw==
Date: Sun, 22 Nov 2026 17:16:23 +0000
To: linux-btrfs@vger.kernel.org
From: Miroslav Cimerman <mc@raidlab.org>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: zoned: activate RAID1 data block groups on degraded mounts
Message-ID: <foe6F1aU4e8wzAQ9xutXb9e9aI54SvpmBRPq-wMsmOGq-QvfrROq0xD0dkgCzGqKd0nChQHuZdQ7n8xUfdH6uzBVi9Lg1YMsWDh1BiaaZ_w=@raidlab.org>
In-Reply-To: <20261121205657.1108500-1-mc@raidlab.org>
References: <20261121205657.1108500-1-mc@raidlab.org>
Feedback-ID: 232820807:user:proton
X-Pm-Message-ID: 4105ca408a15a6f809241b5d4e84395802daa46b
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miroslav Cimerman <mc@raidlab.org> wrote:
> The last copy of a
> mirrored write is a zone append write. On for-next, the other copies are
> regular writes: btrfs_submit_mirrored_bio() sets them up with
> btrfs_bio_init(), which clears can_use_append.
[...]
> I will send a fix for that separately.

The fix for the regular writes is patch 1/2 of this series:
https://lore.kernel.org/linux-btrfs/20261122034826.2333981-1-mc@raidlab.org=
/

Miroslav
