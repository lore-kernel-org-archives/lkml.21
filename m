Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013782;
	b=hyfF70JNqMhAFsR4TYcU8ht761BcmFP94jA4pinnS7lw3w4Qp77LZuFNi0ETDoVJFkW1
	 ETwyVzTSlpBwUnBM6BhG3hq7OeUOEf/kXXmoXT4Z8rtYqaCbTTown4N4lcx8VrjaBQ+ix
	 5IC4NAsFa2l+Olp6O05ZPf32N/f1c6wUi/ldfXN/z1lCZjEISs99v0gUeLfD6XpCB1+58
	 S3CMIIaSyUmodqsIi7avhdZlK7XDEemRwWAOW7yFMJXYjiTOFXRSmwOkeNk/sH8mz+fHt
	 TS2tYVFSFGKvQrouNrkWKmw3BjpKuImDq4rsJ9lTUKCz40UIwW1XMmKL6JNVRc3tjNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013782;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=adL7jX6Yj0zfzxNXCqGjb+oq/ba6DVUeZOr2j2Db+wc=;
	b=zMzP8Z5G9gG0rTabk4o/8YDF26FlrdsSNENPLl5UNJGKeyP22AFalYZUqsY7l6kYu9BC
	 +NQT5929ByLqBXNvqXt+cDlpfsVe4ZqPGyQGGWkeWGtbpq1X76r7AsV6mKMdJDEc0+E6W
	 bCbuRL92z09FN62WnQLzXMilGCLZqh/0S2Tc6X8lpdcdrJXLh1xb3SwRA4FE9+KU2gt0i
	 EraKDWEtyuhyx1RAeCrpXk0Wx/w8duoM4qM6Lc+MqaLW8j/xHnA578fadKmEnVM+flbWr
	 TDcI3DqA1zzIKc4IvdaOApD9b+3MsI5kz7F8WG/pqTERNt1dYYlW+GbKctEJ5IY3Myw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVUdI3GB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVUdI3GB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CAE1F000C4;
	Wed, 18 Nov 2026 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013781;
	bh=adL7jX6Yj0zfzxNXCqGjb+oq/ba6DVUeZOr2j2Db+wc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dVUdI3GBPeIX5A4sxo1sodZL/BJP/U1IngusWrZbMa/dLnX8gGi9pZQkRGLNN+mYy
	 vNJBO1FJgg3LyUPMBfZI+MWsWAdltM4aGMdqv5bRM9/PbSn4z2w3Zz99fWoPapahCg
	 5jd/xFqF+o47NFgRJ1OkXNgvAtTiAWrILVEdu2bFlOf/t3cc4eDi+yBjiD16xSCWYL
	 74cv0lIsmrQAg6gHZ0ZhMI+WmVQRGBK4kPocSy5PA4P/q5GkprGW4QpDh4P7qHpI0v
	 ibXVyi3ABfcbjYGr+aPwXZqMIUAQNHp7wHVdG89ztZIj8zmwx8X3mA3e/Ha7k+6znI
	 KbceUgizfo6dA==
From: David Hildenbrand <david@kernel.org>
To: akpm@linux-foundation.org, david@kernel.org, 
 Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>, 
 Kaitao Cheng <kaitao.cheng@linux.dev>, "Garg, Shivank" <shivankg@amd.com>, 
 vbabka@kernel.org, ljs@kernel.org, liam@infradead.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, linmiaohe@huawei.com, 
 nao.horiguchi@gmail.com, ziy@nvidia.com, wangkefeng.wang@huawei.com, 
 tujinjiang@huawei.com, mgorman@techsingularity.net, chengkaitao@kylinos.cn, 
 muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
References: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
Subject: Re: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
Message-Id: <179501377550.5042.12629270943219413525.b4-ty@b4>
Date: Wed, 18 Nov 2026 15:56:15 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 10 Nov 2026 19:26:41 +0800, Yuanhe Shu wrote:
> The !copy_mc fallbacks of copy_mc_user_highpage() and
> copy_mc_highpage() return 0 after a plain copy.  With PG_hwpoison
> set while the data stays readable, there is no fault to recover
> from: the copy completes, the destination folio carries no poison
> marker, and the poison is consumed silently.
> 
> Check the source page with is_page_hwpoison() in both fallbacks,
> before the copy, and return PAGE_SIZE, the not-copied-bytes
> convention of the real copy_mc paths, so the callers take their
> existing error paths.  On archs with copy_mc this code does not
> compile.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
      https://git.kernel.org/mm/core/c/35c0195e

-- 
Cheers,

David

