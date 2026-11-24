Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483291;
	b=0yqe7QbRZnXJ4wkm0WcpXa9TEThxVDkN84GdqNC9umz3ZHxgcV7zPYtGMl4Glhu7SQZd
	 3fDQpipbKk5N0arNfu9Lbt4EytNOmAaTyFM9qGVLJQb17CsRV7s159xQSwuMVG+h9/gIR
	 4/aVMfdR0oC7RCUjqK/i17y+EwTcJ38p9IpL8so39Re1CXt8JbKcZM6IinJzWSQP9QNQm
	 s23y2/Re62+9iw5UlgKPrmfPxZ6YDnyWmxhl+yELIzeJBslOqjCxTfchTVXQn0XyURtcS
	 3OIpjso43NCTtnz3oJRVGJyucAMN9ZaNUGzuZwCyEpz8b9ViLw5hVZ0uch1hF/WoCtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483291;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IAXmygWx+MtzlQfD/THE5tctNVDaMp12YBsy1SVW570=;
	b=lfUmCejqCTfZZsWKrCHa3WcVznM0eRQzL9BUhypDca0BjzfqWGvAK7hR2bGt1lub46dn
	 GeSKtnpGxo8JwYrXgw0zNVpJiabK5zizxx856+XYTSGslyVAnhXeQRrXprS5T4grjJ/bO
	 QL+SL1p061+VQdXhPAyhUd3EHkz+iLTVHSkOedwO27sIt8QALC3jGH1jvKaXy2my087TJ
	 rZ+9YtfXhku5u8jqmLp9RTRxDrJoKhFrUpiCMdzscxDfwZpc1BL0KVRsxzcQH+pgpbI3z
	 HRemeIcxOq1SRaChGvxMrgTTMr1hyG7LqzLKHRKkgvHNpIYSsVx6HX1lWRaenFcOdcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+s2Utow;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E8606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+s2Utow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B627A1F000ED;
	Tue, 24 Nov 2026 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483291;
	bh=IAXmygWx+MtzlQfD/THE5tctNVDaMp12YBsy1SVW570=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f+s2UtowwOrLJ3ihcP60KU1bKjQQFLBXgytIHqewml1nnZ/HXEb2s/OJgGTPNUsnv
	 HuWJPxNI1i2G8yyC01UzU2ozv2+3qWjD+NGmRloMEMGoFDTvUKpckLtSDJagu9MLEU
	 UjKsLgHhJs/iEmx85YvcgISXLJGW4E9ZZ019YNeOj5dcmla6Ic4xAr2ipUXfGU2ih2
	 PTSz9wnth/XnpLl5mspXgWCpgSiU1Dbhd9UgubzqNAzsNYSIoajJQxRjzlRjOK7cjT
	 mPmAqxbhJQVL5DBqbMHEcWEJiFEDm6jgoRaGk9bUl564Eh00hQqEVubLpeMpA/Gchq
	 1xO+wQ1jTTDEg==
From: SJ Park <sj@kernel.org>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	chengming.zhou@linux.dev,
	yosry@kernel.org,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: zswap: remove dead length check in zswap_store_page()
Date: Mon, 23 Nov 2026 17:21:22 -0800
Message-ID: <20261124012123.94517-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123032512.6119-1-raizudeen.kerneldev@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 23 Nov 2026 08:55:12 +0530 Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:

> zswap_compress() never succeeds with entry->length == 0, so the
> condition is always true. Remove it.

Makes sense to me.

> 
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
