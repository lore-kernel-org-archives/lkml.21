Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604662;
	b=2l89zdO2AOUjoT/h3zSz36oB8avE7OsHD7qVk5QwQ3i7n94HK2KnqNb87feNmIy6HBWR
	 AhsleQ+tzz9iPRuPiJylo5jIcDzYyChN2IIK+lZ7AdoF81BHjZRbuykhcBx2tkWXcbXnX
	 4+dZS+H1waXbMXUImewgSNTff6Km8gNWE7lPlnhN6eMxh5WoUfZiNo0KXwCQxfAASLPIS
	 JoyOWIjhXL7snNUwJd1jv/UGeD99vd9bXQ8uv2ff4PVhYtUU0SXpuSU8+oBUB/FB6hajF
	 rsJQumNXMyrhvbRyTH+SJM7RDCBtJAYD7i0yl2+SmokbniKGEcLS4CLV2iS+s02vzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604662;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bUA/rTYvpBA7QiSm2QIxyI9jS2aZK3LguZKch6uReEA=;
	b=ConuNuys7cQkInB8xCai3h0SAgDI1Pe1BKK+Dj1s60KK/2odw26phKHfG3+zh+MjueWS
	 t5oQWOPgBLWs8o39vt6MT9ufbXUrbtVg0Kfhqlg/c23A4cxKZ5aC+tQZpeu8D0V3RadvR
	 AIHNBFRRJU4MIcZjua7qu8/tdk5HAcgQywPepDAJAOXf/nhtyc6po/98UWo0KUUKmey2D
	 9JSQtjjHkBxeAnKBvL5CAItpJ2JwIWwKCOXMOX9MxS8sIlz8CAwDP6uVuG9TmeHJI0WhH
	 rIHLxbHNkuP+5iMmI7qle53UAIQSp5je6UUfBIXjhDj+sB2nLTBPwjldtyDkyFS0kNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/u5PWkt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F99B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/u5PWkt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0131F000D0;
	Wed, 25 Nov 2026 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604661;
	bh=bUA/rTYvpBA7QiSm2QIxyI9jS2aZK3LguZKch6uReEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E/u5PWktp5kUyRuHcHkzj7sus+CpW2DeTbpNjtCetpIBLPYILSCpknyVhQtRr/DQt
	 aR38ubzw67fB+4RezvtuWdE/zgzAATh1emQrSrjFGeo3cinGGBMUPHaQs/DR01O2/o
	 C65jl9qlrrOcqGL02Tml+K/yS1E9kS3r/qDFRsQ6yx3aECBA5KFA+eeeXte2XXXT8P
	 RcI+5bK3PCFM5k4gig/bFtgdcnCCTTCUVrYzBCyr+DKoNvTnyjsTf/T36oT54BPSue
	 37usOl3yRSyKlP3ho4RxisxiECRsr4ydlSMegvN5j4y64D4aD+/lhzEa/b9yijPxFy
	 QhlOAO6sLV34A==
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4] mm/memfd_luo: don't use memfd_pin_folios()
Date: Wed, 25 Nov 2026 13:04:15 +0200
Message-ID: <179560454433.2878567.12692470017046498393.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124184042.1823277-1-pratyush@kernel.org>
References: <20261124184042.1823277-1-pratyush@kernel.org>
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

On Tue, 24 Nov 2026 18:40:41 +0000, Pratyush Yadav wrote:
> memfd_luo takes a snapshot of the folios in the file's mapping. To make
> sure the snapshot does not go out of sync, it pins the folios in the
> file via memfd_pin_folios(). The pinning also migrates the folios out of
> MIGRATE_MOVABLE to make sure doesn't land in KHO boot memory or in a CMA
> region.
> 
> memfd_pin_folios() does not lock the folios. So it can race with
> shmem_writeout(). A folio returned by memfd_pin_folios() might already
> be in swap cache. This happens to work but is fragile. memfd_luo looks
> at folio flags and index on a folio that isn't in the memfd's page
> cache.
> 
> [...]

Applied to liveupdate-7.5 branch of liveupdate/linux.git tree, thanks!

[1/1] mm/memfd_luo: don't use memfd_pin_folios()
      commit: da08a6d97880dcda906bce04539ab25c98b0fb73

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: liveupdate-7.5

--
Sincerely yours,
Mike.

