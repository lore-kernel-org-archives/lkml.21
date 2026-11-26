Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696791;
	b=S52A6tT3JJAppL8D6yBQXBEppZfY6JZJ/XDOXjZj7BhtisIpIMZFWyILqpPisw3NLZxt
	 xjm8f9RaFPtBW1jH5EwCfywwwx9y8rXWNaRK71tilDJ7XInPkc6NdQPxRcBIv/v474Ne0
	 KA2OmS46MLq7ls0Ok7p2QQWpU3g2Y1GhH4PHrZT4cNti4VG/pYS/023Mfkz3OyVk3oyeF
	 tTGc/tdBBg7Q5F+iJ/aUsjkl4n5SQQiwnURCtpniYVwJp9EkPxfBKb7yfj4T0+AUGeP+r
	 2wdOpqGzn4UlJAPkyYUto5/Rx/DOwXUBwUtJaIIs4zEH6T91HuepvyFLuD2MNj33PCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696791;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e3Vrgu8a6DhnD5x0zdlXCxiwJd6p3spzYZMPi3rDJIo=;
	b=lu5wkjP0EwJcshS1ApmIzEwTPl0YpHMGhvTM/Ohcxr5msPk/42gxsuYKkOtvRKnRuMhU
	 QFRQLKe5EqV4IqpVvOiWLy+Tw6390h2gWy5e4VMAv7r1gOVuU219sa5eOHGrH51LxfuzR
	 lmdU2CSN6gmnI+eDepcRkNn1VDgrcXKTsZUu70maeb2hm5SMD9FHNdWvvX6wJfZQQ7BHk
	 F4rEQqBJLVEu34e//vH4BmVfB0LJXA9u/Ngtb5yTdcsYP/9d8nOYoDEghSYRsn9JJufj9
	 VbIgLQSyVhhjpPokqS4mG07oo+A3qzP+2R56jxTRdvDPQyR0pL8lZZkoS7ZLXiJXAag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KR3A9L0V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26BD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KR3A9L0V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37BB1F000C0;
	Thu, 26 Nov 2026 12:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696791;
	bh=e3Vrgu8a6DhnD5x0zdlXCxiwJd6p3spzYZMPi3rDJIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KR3A9L0VZpKALooXFfJGBXBBHfYTm+/7kiZ8wlFcFuRXBWdBSbnZOIZVH5T6CHoa1
	 9io65Zms5anLjDPNI76lA/eFbZj5ZGRqdJdpqC9TyvMzMB/fNJBbFapBfnofiJnIq5
	 e82/+f61DkNp9WkroWudGo633awrt70wUvlcYtrrJrUDJcEVVNcrtwoSnnJJYMRGDq
	 8d4zS0k+WKA333Hr5nZmKhucdABm68ygQr1qNDIJ/D3bCD5ztXi7vnOGIU3bgnIcjq
	 idFd3omvBztPAhx5ho29H3sQ5Hs9PFSXYLejD40KvsxrHJ/TRjG2i2AOUwuYP4l2sR
	 ABJLoA2w3siAQ==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Chris Down <chris@chrisdown.name>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 0/2] memfd_luo: keep memfd frozen until finish
Date: Thu, 26 Nov 2026 14:39:44 +0200
Message-ID: <179569676808.4123145.16669613485216005083.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123130509.4032642-1-pratyush@kernel.org>
References: <20261123130509.4032642-1-pratyush@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Mon, 23 Nov 2026 13:05:06 +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Hi,
> 
> This series keeps a retrieved memfd frozen until finish. The main
> motivation is to let dependents like iommufd have a chance to acquire a
> reference. It also fits conceptually: finish is the point when the file
> should be back to "normal".
> 
> [...]

Applied to next branch of liveupdate/linux.git tree, thanks!

[1/2] liveupdate: luo_file: allow keeping private_data from retrieve until finish
      commit: 407c72e5a9c329e169c5132557c905913116f04d
[2/2] mm/memfd_luo: keep memfd frozen until finish
      commit: a89b83c7a9571dacb10e757d9a7400a886b11bc8

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: next

--
Sincerely yours,
Mike.

