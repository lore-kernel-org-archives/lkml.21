Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478074;
	b=Dk5jraysNQ7XTzDzIpwVOKgXKjjUiS1AG1Uvsg0DpWSwNJZm+mFar6wKXP4AiUG5ZnHM
	 BAF3txV1GRZTndzUx+ovsobKhw7SAzGDJbVMmPa8X9ztjpBwzufqsWcGf90me4Aq7ZhBO
	 FbAMMAutngPlfalyXOhtM+i3bVbb8G1dKP6JFHGeADsv+HW+uAkAQWxItQlV/pUg57n+5
	 HMax8F+5aMo685lJsaXj6zTBQaEQv73n3NUummZuG1yWwGpyjfKmhlTwoQXy9tkgerLCM
	 2LyUNPT4GsrxOb9K2y2b/o5B3YAq4oc2/gOwRu8FTxsOrpfovZw2d92RYAVM05MU2zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478074;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/JZE+jNohkInERFx58saqI79Ie1dOM5maHUUrsyW+WI=;
	b=lHWlGKOuXIOuWEb0YrlwaGg3PwHTEAnXGo13RdpEW4TsR0b3MeXlAZwaVc0/tOhXU580
	 Af/Un3YYYoB8Z32VST/esgIdNRaWBA5ra68gpH5SI7i95gOkNymfMgWf7/Ut+uxO7SiaS
	 O+6pJCrtiGJ+aAoKyRXC8hZnJJnY37bj63LJRkkir3ugj4u6GTxrtrL/iQPDXl2kGXea4
	 xyc4rwc9SmGqb52YeJ1rzK3SRkwd2NUvio8ZTnQ6p0xWoFK2JIjGWvqIT5JCmR8Nt78aU
	 uxCILZ2ywa8t7WNu/e9nFoxL6oy3SenvNSW089mP9Km8cGjgXBazHMoZjIhtdlfHZsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ikS5wAMB;
	arc=none smtp.remote-ip=79.135.106.101
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F92606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F92606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ikS5wAMB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795478070; x=1795737270;
	bh=/JZE+jNohkInERFx58saqI79Ie1dOM5maHUUrsyW+WI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ikS5wAMBYG05Ly+fA4oxjJY3xo3wToFQ3+IvH7hIE6+5VjgRqkfycKcEAgXPdcJDa
	 QGf87gv4tyP7v/HYG8LpHsoucO+gYf93EsRr5FXCh6EY9rsUJ2BVi4fic2bSHUB2FW
	 HHJCeFS6XRYXZn71iROwfjlTIlHuVHjINiGgxrvhy34ZEMEwC/bfOUaYRamivurRUt
	 xiof8Sg1og2bdycuHLuC1//zR4cuk6un6rI+LmBWUgjtcffFf54mgg6gEQSHOcYkcU
	 hEYkatJ5XYdoAUyZ2fhODQkWbBjwhPqy/0KkotiWE4fBS3/HrykczL1d+LP7NwPnAe
	 2AGkLmjAbW8fA==
Date: Mon, 23 Nov 2026 23:54:23 +0000
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, linkinjeon@kernel.org, hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v8] ntfs: trim the sizes after a short write
Message-ID: <179547805030.310041.12915861227663551141.b4-reply@b4>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: 9245e69bdf6c1448ec74262349090775748c6683
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

Hi Zhan,

On Mon, Nov 23, 2026 at 11:09:54AM +0800, Zhan Xusheng wrote:
> I'd like to fold the diff into v9 as it is.  Can I add your
> Co-developed-by and Signed-off-by for it?

Yes, please:

Co-developed-by: Ernest Borowski <ernest.borowski.git@proton.me>
Signed-off-by: Ernest Borowski <ernest.borowski.git@proton.me>

> They zero through different paths: the one in patch 7 calls
> ntfs_zero_range(), whose ntfs_iomap_valid() only accepts delalloc
> mappings, while v8 zeroes allocated clusters past the initialized
> size.  A shared helper would need the zeroing function passed in.

That is how ntfs-next does it, but patch 6 of the same series removes
that delalloc-only ntfs_iomap_valid() and ntfs_zero_read_iomap_next().
After it, ntfs_zero_range() is

=09iomap_zero_range(inode, offset, length, NULL,
=09=09=09 ntfs_seek_iomap_next, &ntfs_iomap_folio_ops, NULL);

which is the call in the diff, so both helpers zero the same way and
the one that lands second can drop its copy.  It only matters for the
order of merging; v9 is fine with its own copy.

Thanks,
Ernest

