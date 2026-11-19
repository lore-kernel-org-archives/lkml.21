Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067220;
	b=lpoUWbvs1//WWpekQpvKSycbpaBQ8sLmH9xXMsh3zprdjAsbWKn8jQB5BUKs8lxcPkFp
	 DhczHpfaO4BeM3c8qEZ5Gw+tcObQi+7bvGGEvmkyGEIjGDOURyuJW+bnIgFllLBJDvHwj
	 sTe00UIyNxY4lytfbrs3RUrTy/HBpB61fOTUnIY8v7Ng8nAjwFzSE/NBbvFS7rdPtrxjm
	 tKMuv/NtlOPp5ag7r5CcuypeuMqxXelWtUMUGibfchiw+KC8LxxSNvqaIcWEO0DRelHI1
	 5ufEGeeCKwJ3+Oxse/F/sswhC/OOt0vlBGRZdg4a4A5UM2ONBaH+mKIMfJUx8rDL6Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067220;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gR/d3sVuSaw7bvm69LGQxAn6nDe+aBGt6oIrlYJdRPc=;
	b=gk9/JlXiRNoJwt9AUBowd0GB+FqRq+anpQ/LCaZqr6HgVsT7GlJM4+jRZiqEfWlYf/N+
	 xVwSuzrIxMW+oZICwI8dZ3GSvbqGFU4P3iLbAog9YA4q9S6adc5Dca754cLIi/hW8Fjag
	 909Fj5P5M9s38x7u9NmAbbMPLsiLhhMttmTh7BzzHv6UwrVA+93sfS+WUTn/EENiJPIw3
	 iWvZh4LK/fOHwzSZvj+aM8K2Z+PlDTmL+Fn5Ttl6WA963hlvvP1ecJmG9xmYYCritGQcr
	 cL7fkyhE14DgeKBGflF1UPHwQfCgjHX1LofoTPn/JKoUZu8F565YB2OCFB81533BjQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m083Z65m;
	arc=none smtp.remote-ip=91.218.175.197
Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C457606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C457606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m083Z65m
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gR/d3sVuSaw7bvm69LGQxAn6nDe+aBGt6oIrlYJdRPc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795067217; v=1; x=1795672017;
 b=m083Z65mRkbpRYxEOJcDV6p+IkhlkwB5N4s5NYctTVsxEiMQPyiv+WFOB9N6quFlaUEm8BFt
 NuyFpJyjuMlzD8+243OD0cd3wvQtBcZlH4VFgLEOa3XYCet0QXOJ7T9UiPnAL9rUzHGmQTmE+ey
 UuXYeIOm0UeNZmVAZaVoTbbo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 857f00a320d0ce5e;
	Thu, 19 Nov 2026 05:46:57 +0000
X-Mizu-Trace-ID: 857f00a320d0ce5e
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dm thin: stop waiting for grace periods when activating and removing thins
Date: Thu, 19 Nov 2026 00:46:50 -0500
Message-ID: <20261119054650.990874-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <av6IBa44Erp0gWBN@redhat.com>
References: <20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev> <av6IBa44Erp0gWBN@redhat.com>
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

On Thu, Nov 19, 2026 at 12:24:21AM -0500, Benjamin Marzinski wrote:
> I posted an alternate version of your [PATCH 2/2] that fixes the issue
> I mentioned. Can you verify that it works for you?
>
> I squashed it with your patch, since it your original patch did most of
> the work of fixing the issue, and it seemed easier to just have one
> patch to backport to fix it. I could refactor it into two patches: one
> the fixes the bug, and a second that just swaps the synchronize_rcu()
> for kfree_rcu(), if people would rather not mix the bug fix and feature.

Thanks. I had a v2 ready along the same lines and sent it before seeing
this:

https://lore.kernel.org/r/20261119-bug-dm-thin-rcu-gp-v2-0-055d627763c3@linux.dev

It carries the fix as its own patch 2/3, ahead of the kfree_rcu()
change in 3/3. It differs from your version in two places: it takes the
thin off the list in the thin_put() that drops the last reference,
under pool->lock, where yours does it in thin_dtr() after the
completion, which is simpler; and it does not skip dying thins in
requeue_bios() and error_retry_list_with_code(), which yours does.

Your Fixes tag is the right one. 17181fb7a0c3 moved list_del_rcu()
ahead of waiting for the references; v2 points at b10ebd34cccae, which
is wrong.

I have not run your version yet. I will run the KASAN reproducer and
the timing on it and report back.

Thanks,
Qiliang
