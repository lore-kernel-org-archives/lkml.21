Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628280;
	b=KiX2PG+ptkI3MxnoHTvVNG3IIlaq2IxoO6WE7Gn4u7eeGU/u29dGgQRwdkAxaG6cmQpE
	 OAKnalbTuieM+eZnFrqarNnJxvN2AsrQzdcMO4Fiwpct+s6tsqYkMbynIvhcbiAzPviJ+
	 Flf9WYe1xM7akKa9WAmbY8wBllL2Jy4EMTGPss7q+p3K3hPV4jWGUvyYlCp+ay/M2FFLw
	 K+Gvhjy7ZfbhkPsYrXzKQ29UKl3c56SsMbvbYalgpy+iujnIlnRBFHNwuUalK56DXSeDS
	 vdLhQzF0VUVK1LZYTsDGJpDpmnl6t4BmsWNl+rgDclVTEGjuCjoUOjZUKg2+eWbQz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628280;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=bqtEuywigRCiQu572g7c/rDN1ly7jVe/6vIHEB00xIU=;
	b=wnRgQfwnVocb/XiiTFHuaoAM0bgDXpzHEySiD/9Ul3jPyYMsHKcsGnjxSFTbHDAiwa7S
	 QqlR3x4k4c/CdcU4CLe2JOMCULjSF/Pnc5YWZaSLiOc/JGv2QmHOflAeJtYfCUk7Qfx/P
	 +FgINa4BEt8YbmataWv2KqYmkEHNWja8k7trX/bG7oWrWppvSxQesIKTrjStEj+Q2Bxj2
	 xpgA5BW9NEaE5Ff8RYapK1ECzPpdUedd9zJjw+F71pZUZc2AXfKZIPn8XddAQ3BYtpSsF
	 TIpkl4tI0R1Zci62VU7FM3XMNH4HjRlWF9bUWAD37se5JBBenMLgDQkgRIS48GLgaMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RJrzaeMN;
	arc=none smtp.remote-ip=79.135.106.101
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CD9606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CD9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RJrzaeMN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795628272; x=1795887472;
	bh=bqtEuywigRCiQu572g7c/rDN1ly7jVe/6vIHEB00xIU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RJrzaeMNLC1SGalS/6cNPbO+mp3DASs2lNmMOU9VETU9FT8TNXHVwAPWr9zknfDPF
	 Nl6/nLaPcKKs2z4T+3Zfxh0+wy2IANfIpfGaUtvb3uGv69Oc2Lsh/yJfzzTQLgslYw
	 4g0J6u07s5KOC3+plxGZVbz54lwHmL0FS9vRkOPP8UClgB6I+miq6cfx/zOT6yobFZ
	 CzJQu9e+cpSQGo7+ek9RmD/wFsGAWNrJmuWJrUk7ygKsJjUFZyvOcvOQySJhut5HWR
	 LQwt+K66hRuoFKRgkto72ywSKK/PPVW9QzBF4qRILKfkgrvGMWGYlf+5S0gKl1uF1p
	 +NhSkrzaW8oDw==
Date: Wed, 25 Nov 2026 17:37:47 +0000
To: Christoph Hellwig <hch@lst.de>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin12138@163.com>, Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 01/11] iomap: punch out a run of clean blocks in one call
Message-ID: <179562825956.336440.5071696785639646225.b4-reply@b4>
In-Reply-To: <20261125054814.GA20604@lst.de>
References: <20261124-b4-ntfs-delalloc-fixes-v2-0-f394c800ec03@proton.me> <20261124-b4-ntfs-delalloc-fixes-v2-1-f394c800ec03@proton.me> <20261125054814.GA20604@lst.de>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: b32a1413ba774602f3725cc28f6d0b8c64ad1c5e
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

On Wed, Nov 25, 2026 at 06:48:14AM +0100, Christoph Hellwig wrote:
> On Tue, Nov 24, 2026 at 11:49:35PM +0100, Ernest Borowski via B4 Relay wr=
ote:
> > +=09=09unsigned int next_blk =3D ifs_next_dirty_block(folio,
> > +=09=09=09=09first_blk + 1, last_blk);
> > +
> >  =09=09punch(inode, folio_pos(folio) + (first_blk << blkbits),
> > -=09=09=09=091 << blkbits, iomap);
> > -=09=09first_blk++;
> > +=09=09=09=09(loff_t)(next_blk - first_blk) << blkbits, iomap);
>
> Overly long line.

Fixed for v3, with the position in a local variable:

=09=09loff_t pos =3D folio_pos(folio) + (first_blk << blkbits);
=09=09unsigned int next_blk;

=09=09next_blk =3D ifs_next_dirty_block(folio, first_blk + 1, last_blk);
=09=09punch(inode, pos, (loff_t)(next_blk - first_blk) << blkbits,
=09=09      iomap);
=09=09first_blk =3D next_blk;

> Otherwise this looks fine, but did you test this on ext4 and XFS?

I have now: fstests on ntfs-next with and without patches 1 and 2, on
XFS and on ext4 (mounted with buffered_iomap), each with 1k and 4k
blocks. The list was the quick tests in the rw, punch, prealloc, enospc,
mmap, quota, zero, collapse and insert groups, plus the fsx tests
generic/{075,091,112,127,263,469}.

Every test gave the same result on both kernels:

  section   pass  fail  not run
  xfs 1k     156     0       69
  xfs 4k     158     0       67
  ext4 1k     97     1       49
  ext4 4k     99     1       47

The ext4 failure is generic/223 ("Start block 33153 not multiple of
sunit 2"), which fails without the patches too. The test kernel did not
have CONFIG_XFS_DEBUG, so the XFS error injection tests did not run.

