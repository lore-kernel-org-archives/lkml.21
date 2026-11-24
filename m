Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523932;
	b=xgnqY45Grrv3NZ9H3GoBmiWWzDjI4rFdUe7sCEzeKH0PTg3gHB4JWXOHm4l+oFLcOCXx
	 zGxCejAzBPBg32RLIj0l4Dyvjdx7xApfMsQwpFKCv3mfqp4v6l8KLSsUUQ+SALPjQWDjO
	 zlZPFDVVLb2cWNXaR3/jb+qAvedPg2InKNxqcGxjKWk21+ow2wfxmQiSR6ENOvyJE/kp3
	 9JkAkB6AzXihPkBsV1lPnk16HzNvw3YmFuZ2h4W7yBJQKniWjhS7B5n2KQgLYYbhxzGSy
	 mUIDrJJo4FVzKpPRJxpkZG4jeuhu3XIHhB945NFfw/URWttOURMWcXipfA2Gi9re69g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523932;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=eJCmBSYolN8SoZoYUvJwCwebOumcXhSHA0DzyLMAWlg=;
	b=ba8ljI1hkKklX/CV+hzx4QewSN8NlYuXbc2s2o5o/5qj5GQPerUz1zZVFB9uXTQZ+exu
	 ncgEwzNFsccKF8v68Q/0jA9jUm9OdJp/xyY7QtVx2fzr98CSyQUqzG5qhEIK1TsZIX285
	 fKQUfg0NKLXMvPt2Knxu6EAA1bEIQ1/zYc+4PTZl+V3irNq/ROvI3KiEehfYJUygKP1oq
	 F0tWjc5Fapv5+zi8zqCcCCxY19F4IzXwf5kOzLD66ROwrDR7++J/mEdRfmBn3BlaeQPKX
	 6uSGpsktLIPOy4U3UNHZpO7gAbYjGUqKGF/GsT8N5tKpvynF0p7HMGWAOdWS4FTIAwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="k/0qqZma";
	arc=none smtp.remote-ip=185.70.43.25
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F19606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F19606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=k/0qqZma
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795523929; x=1795783129;
	bh=eJCmBSYolN8SoZoYUvJwCwebOumcXhSHA0DzyLMAWlg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k/0qqZmacAwl8oMRPyyWCJrzsZvmztwbgamFRCEwUx2HWJ3RD0p2tC5zxUNy7nbPu
	 C4p1/ZjBIVNzvSC98ZYV17MhuPbAuR4bz09ll3Yv7cFkHj2TeiFSU/F4kNaMfvxoSo
	 0Rf8jI5kCNi3D12ZGXng1LJJCEfJDN8o0k5mQjuzjHRyFCNwaUFm9ZpufRmomHkpqy
	 3EEw3dBp+n/oPN5fvlSrPgrQh9MfbkV24JAxOC0S63N38rAFOhJrQN2e2ve1AbJr6v
	 XVQ2aLhkkYgASz8bS+xLbGMZr9ciwE/VnJlocCmeLDwLgieWsTTtAIKYBZMQ81rEnn
	 nnGYfgpeQctDw==
Date: Tue, 24 Nov 2026 12:38:44 +0000
To: Hyunchul Lee <hyc.lee@gmail.com>
From: Ernest Borowski <ernest.borowski.git@proton.me>
Cc: ernest.borowski.git@proton.me, Namjae Jeon <linkinjeon@kernel.org>, Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng1024@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] ntfs: release delalloc reservations cut off by truncate
Message-ID: <179552391645.2429893.14069187088819363568.b4-reply@b4>
In-Reply-To: <awOh8Zxdmg_-wKPg@hyunchul-PC02>
References: <20261122-b4-ntfs-delalloc-fixes-v1-0-0726f0dce403@proton.me> <20261122-b4-ntfs-delalloc-fixes-v1-1-0726f0dce403@proton.me> <awOh8Zxdmg_-wKPg@hyunchul-PC02>
Feedback-ID: 236360163:user:proton
X-Pm-Message-ID: c84d250e94fba5c9ad7d33e5c64ed591b75f76a7
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

On Mon, Nov 23, 2026 at 11:16:17AM +0900, Hyunchul Lee wrote:
> If ntfs_cluster_alloc() succeeds for a LCN_DEALLOC run but the
> subsequent kmemdup() in ntfs_attr_map_cluster() fails, the reservation
> has already been substracted from dirty_clusters but LCN_DELLOC run
> remains.
>
> Is this planned to be addressed in part 2?

Yes.  This is pre-existing (ntfs-next has the same path), and the first
patch of part 2, "ntfs: keep delalloc reservations when a cluster
allocation fails", fixes it.  When the runlist copy (kmemdup()), the
runlist merge or the mapping pairs update fails after the allocator has
taken a delalloc reservation, ntfs_attr_map_cluster() restores the
reservation before freeing the clusters.  The same patch stops
ntfs_cluster_alloc() from setting vol->dirty_clusters to 0 when it fails
after the free space check.  A fail-nth reproducer covers these paths.

If you would rather have it here, I can move it into v2 of this series.

Thanks,
Ernest

