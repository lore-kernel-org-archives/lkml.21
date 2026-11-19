Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093384;
	b=cDATJDPeBWdJxEe81PRiBWoHdbStWMBvzYzbYNpp4GQ4cpKfYg0r013ZwdJ9qlcy+93l
	 JrvEHk4DF4fde1dNhtniUKqusjntj6SSMUk9ygITBrdWCS2RA5+eID1iHl7WNClRr82dl
	 QbZARBRytf9csbNk7rs6wGZFW6+F40uZv4+kDbmTqK78+OOhHx4uV4sOOFKrLjL6dxSv3
	 UfZA6yTtHilaNiMjicFb7ui//t8OuB59WKns2AmpbRPPJbYR8KJF7Td/rAOLAyK+uXUca
	 4OVpjJ8SFaVXMtBqO5jNHledZVnGspBe1JJSbcN/Z0wh+en0uz5mbMr5tdwMLGzd79w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093384;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tpueo6za2OUrPssLdFfnbgW5k1yEpFXa9JhmFHYTJmg=;
	b=yiPV3SXrU62W5DoKrFkNq7ynd5rz/Q7kilUt12f2wjc9PQBuGel6OnRBCs7ItWf57+zZ
	 Fx9YAu7EijMJ4DHv59q0WHbBYp5OOY/lyISaHCN8Hs4kHoiZ/hHWau6TvQrpdXfh8/VZk
	 Iz8Bc8JG3E3ckuBpEHG0ba5mn/dBILJxaqlMGRcklYBc7o8floUWtzuzlh90Nk59fyNfJ
	 HVYwbqjscjY2HwpzVUOj37jiIDxpBElCiem/uSuIOska9fmW4OgXBMQHiEHmFaLBLmQBX
	 y1nfMN81J+c/9mNkUYMliwUIG+6JErftFJTkhUsXS1xLKbcxq6BwS0zFLIdlQkhIkJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kH42Q5e5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0AB606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kH42Q5e5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692B61F000C5;
	Thu, 19 Nov 2026 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093384;
	bh=tpueo6za2OUrPssLdFfnbgW5k1yEpFXa9JhmFHYTJmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kH42Q5e5TZsCmxL1DOvZ6JIWNknWattnRoXewif+LBtl19k1Xi+wyy1JfoKWfU6k5
	 RZDnZdvvFGe+YY5yX0v5VxUK0UiPkCgAviL+XkMLER9+d98hanJW0Aea19UTf7o8X6
	 5YBIBt/4+bRfUhBLIQidp/KA5a2HLqz4tcq3QEnCiWBSQLEl15a3pUcEO/QR7jVMw/
	 9ONoXHMk3ilEYSNqhztcQ1A5SkXoqHA8oxepVWmll475pwpyMDFipqlQ2FdcJGEj3U
	 bjc3I2bs7LNuSa9OADxA09szFwrV/cTcrVzyRO/Tc/+PJAUksTJYQg551b4KxNkOH/
	 jIIQInIe1SFVA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Chris Mason <mason@kernel.org>
Subject: Re: [PATCH] mm/mm_init: don't subtract managed CMA pages twice
Date: Thu, 19 Nov 2026 15:02:58 +0200
Message-ID: <179509335923.408839.14979518473770204141.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119-cma_managed-v1-1-385751505e24@kernel.org>
References: <20261119-cma_managed-v1-1-385751505e24@kernel.org>
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

On Thu, 19 Nov 2026 12:19:06 +0100, David Hildenbrand (Arm) wrote:
> With hugetlb_cma_only, the "reserved" value in the "Memory:" boot message
> can be wrong (small or underflowed).
> 
> When mem_init_print_info() calculates the reserved memory, it assumes that
> no CMA pages are managed yet. However, some CMA pages from hugetlb might
> already be managed at that point, so we end up subtracting them twice.
> 
> [...]

Applied to for-next branch of memblock.git tree, thanks!

[1/1] mm/mm_init: don't subtract managed CMA pages twice
      commit: 3a348bd13cd3bc5ae6d1f564473f40166cc2009d

tree: https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock
branch: for-next

--
Sincerely yours,
Mike.

