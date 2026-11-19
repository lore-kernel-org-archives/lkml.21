Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124986;
	b=LSHdlyjuWrhkFuwTOpI/Ldzow1pjlQZ0h5Kvu5aicG8eSyP8G072nl6BiiLq51bMAg76
	 X8gVuB8KBVqTA0CBqpyRGJc2UrYHEA3o4n1IGUmp4uowmf4aNIqCSEMjBYO3Nsr5SabN7
	 c87E9UyiEa1+w+IBhPZwvNkHsV6JkzsfDJ92yRz6Je8VNNK/u8sXfGV+6bJbrCGBfNBx5
	 syAFKGc4j1KwOIjKxKsjCe+JAiKs900f4XfGe/11u3+WIsK9xE2+KXCsUpY2k35RqqWkZ
	 DTNx9zFxlCGX3wE6/T50mIxyBn/KmVL6y1b86WWwAnx9slWF77NNgtQVnRYdYl+ZfMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124986;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZAsp8o+ynrr3BC2YZbImkbNaima4A13tiAKYgfOb+hw=;
	b=Iqr9coSbSn2PanBR6p+1i9RMlVgUwfLh2WBusE6zMd+1kcvpizR+Axiul9BiNDCkouve
	 JPkW85zqJi4CfaY2f4Eb78fsKtgUK02L9H3gQV49bfcfeoeDXjvrc5s5ikfaIJ5eA2Mck
	 i46qL4jk9GE3jZVQm5fwiAMHhJBCnuz7K7XjJaF/eDHok+Z/2x9gqEwg8xvU71mZIxSO9
	 GU40N1qOfHQpQk2TD6RY1QERsd6sKyiHqT9bvc7XOOAeTnA8KQzn2C4ysMbqxCKFsdlWP
	 gBmdcCt/D9YnOotTpWYE4LWS3jX/LJaQFUo+8GV2rxRBdgK+rVvD3jfF1uNQrtv1DNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raidlab.org;
	spf=pass smtp.mailfrom=raidlab.org;
	dkim=pass header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=lbPWpnA5;
	arc=none smtp.remote-ip=109.224.244.22
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6B8606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6B8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raidlab.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raidlab.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raidlab.org header.i=@raidlab.org header.a=rsa-sha256 header.s=protonmail header.b=lbPWpnA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=raidlab.org;
	s=protonmail; t=1795124983; x=1795384183;
	bh=ZAsp8o+ynrr3BC2YZbImkbNaima4A13tiAKYgfOb+hw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lbPWpnA5vlrHLVjDlYN7RRu5detF1r4wG3FT8vY6eLM/GBPGFyS7x7RmIAYi+7q2/
	 DaUWlafOvUbLwkYxOyNGOPBnsvu83kKmomWVQqeJ4L5T9HMTCB73xyG7cJJWM8l1JW
	 O5tNKcmdbwHewhguyc9U6X4FJu7k14gIY97ueF8ARAS+Nw4CizAVvW6BQwdj8Qbe2h
	 GbnZaPTYKaFK17MktXEpIAJEHYc2DEuyLoZDkJm91bF0TuVkfECHm+d2xBBWWBtlXz
	 oYAhe5U2t1lQtgJ4D4/6BJz1CQXrDgTIrVOssVSDboaF4nes+eOht6w6kg7/lpFocQ
	 nuEf/xd9O6nBw==
Date: Thu, 19 Nov 2026 21:49:38 +0000
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
From: Miroslav Cimerman <mc@raidlab.org>
Cc: Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org, David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: scrub: don't count zoned repairs as corrected on a degraded mount
Message-ID: <RSMUZ1EIRwrw4g1uzc9_4FR9RoxzCzSBf9_b06-ovgxC7CsQ5GfC-E6b2vyTIE5l_FTRt-s8hlvskCD_gaf4UQePuf2tR6x011MGUO9nJO8=@raidlab.org>
In-Reply-To: <f944d77c-4c66-4dec-acb8-985d4288afc6@gmx.com>
References: <20261118175637.60283-1-mc@raidlab.org> <ee3cc2d0-6991-4d7a-bbd6-a84972d44b37@suse.com> <HLy1GbxoNDmZhdhuxdyatdLIiWG6jabGJiSOxke3u7mRd-njBgBiRytg1IKO1S2E6xNXQw75eH4SPWLLXC6TC0BNXXcz0SV3FsdSOQUQLdg=@raidlab.org> <f944d77c-4c66-4dec-acb8-985d4288afc6@gmx.com>
Feedback-ID: 232820807:user:proton
X-Pm-Message-ID: 09b4463a3e0c245ec73256ed82c69dfc50255016
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

Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
> If it's a workaround for the well known new-SINGLE chunks during
> degraded writes, it may be a little over-killed.

True, balance and block group reclaim already relocate block groups on
degraded mounts with no such check.

> I'm more concerned if it's some extra requirement for zoned RAID
> profiles, e.g. to keep the writer pointers in sync etc.

None that the repair would break: a regular mount needs equal write
pointers, but a missing device falls behind on every degraded write
anyway, not only on a repair. The problem is when that device comes
back stale: two days ago my tester found that a degraded mount could
then allocate over committed extents, which aborted the transaction or
crashed. The series "btrfs: zoned: RAID1 block groups with missing or
stale stripes" fixes that:
https://lore.kernel.org/linux-btrfs/20261119213835.103131-1-mc@raidlab.org/

In testing with the skip removed, the relocation with a device really
missing works: RAID1 on three devices stays RAID1, RAID1C3 on three
devices gets single block groups, a second scrub is clean, and the
missing device mounts normally when it comes back.

One thing it needs: without the skip, a degraded mount that reads a bad
copy starts the relocation during mount. In testing, it raced with the
mount, which failed and hit the uncommitted transaction ASSERT on its
error path. "btrfs: zoned: wait for the relocating repair kthread
during unmount" prevents that: with it, no repair starts before
BTRFS_FS_OPEN is set:
https://lore.kernel.org/linux-btrfs/20261118004808.201460-1-mc@raidlab.org/

> And I'd prefer if you can get some helper to know if this block group
> can be repaired, so that no duplicated checks between repair and scrub.

With that repair kthread patch, the skip can be dropped completely,
so no check is left to share, and scrub needs no change for degraded
mounts. It still counts errors as corrected when a repair is not
started, e.g. while another one runs, just as on a regular mount.

In testing, with the series and the repair kthread patch applied and
the skip removed, a stale device came back. A few scrubs on the
degraded mount relocated the block groups it was behind on, and then a
regular mount worked again, without a balance. Only a block group where
scrub finds no error still needs a balance, e.g. when the missed range
holds only nodatasum data.

One downside: when fewer devices are left than the profile needs, the
repair relocates the block group as single, without the missing
device's copy. A RAID1C3 or RAID1C4 block group then keeps one copy
until a balance. Without the repair, it would get its copies back when
the device returns.

Are you OK with a v2 that drops the skip completely, on top of that
repair kthread patch?

Thanks,
Miroslav
