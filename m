Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642523;
	b=2UZugk2LDbfuupk3hz5GawUhlL7wuEnlXPzudueepgS40NIKeW0XTo+RG+X7DejT+WzD
	 t1+s+cyC0xIk7bEnHh/q0zzap1u3rBIARKGv3H8v+ryqlNL8BbHu8OSccq1tQCdZbvf/U
	 a8hzwaP5pJdq5AyXfbk7xwBaGukXUdW+YAMo4s7Zj/oWkoXgLVq2MisYSOud5tV84Aj3B
	 gxgLe+vc0EjhcacM5XMDmSCBEGMQUD5kkB0PyLE40It1vB5OKBwPaekeeI/jlRI5CdMGC
	 rVJpxrBemN7XXNN/Ow16a7SMgxL6VU/wmMEM6Bk6KtbTo9U3GY36Huag5MkcgGS15XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642523;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5DT2gV6MaM+tF8dMnUSxLFbt3tl2B/cDE7HAdk58XGk=;
	b=HCTlb/V+OiDayCp8TPdruR61Obm4WsiPhtsBjJeAnCma0he/wSKB7/xqey7UABP7as5p
	 hfkwgx5L+NNDrJjx61CpNrGELiF0CTfmJ2EAiKDRQM3rFasepAtp27oxTX/fTPoppCs9I
	 SixHiQAt1RPPdg0OA8LjYdRKtVfy7rFsM0ForlNMaC+XfYT9Dij9/c0dFcVcXDbZf2EMr
	 KfhFuzYQYss6u69yrRPx6vaXM04E5mqUMDqArXAN9Wo3IFdNQGxo34Nrz4UgovW25kD7A
	 4wYTE0EZp9bxq3Ul2f4AGHRvuwedPxTmuXEO3uUeLXjGx/drmCwinP20oqHTsYZDqyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQ7UQmBA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C403606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQ7UQmBA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6B61F000D3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795642523;
	bh=5DT2gV6MaM+tF8dMnUSxLFbt3tl2B/cDE7HAdk58XGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cQ7UQmBACZimGfW+iREEhX79jlZWKHRN9TaV5A9hrIeItvnl3NpZRApLGq1cn13hN
	 BzevCHG2zBPY1eqJu2zzO5zsOke4gjuYTyKJmBzmiiN5yhO23NyhZdKUKd/3O4fKO1
	 5PRif6vVTR4ugwAjUniaJcm+fsTAGflnR4/fJn9qag3OFYJQ1BdEzGdWbgLeSKjf5r
	 APVLdujkIfrJ8OHAiya3R+q4sixrvhBUOR9Mf0tydOTa9329tQAvglSyHaY012wWJY
	 MFPz2L368H+sMz/zs8SjchYXvYunVHu/vwxtb5OIar5qruljOxWkdmXkSrOYHy4nNu
	 3YRz6Wbm/od2g==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c515319dd89so148566166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:35:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHko7WsP8ZPh3alW3hbyhN5lfAfkk/iPxAw2FfMADsjz4+pghJLURJL5mXR7nZ7OftseYVFbS9rXIYYQiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LdlIu1UghrL6WlvAvPCQnQTxEvcDiT33oKkpq0XPAp8L+zluJ
	JcDfOa3810seTaDX8iMpO9nAke1sv4yVrjFBnZPc/7J/j+yo6om+Db2zKX7DfrNA9bAqpWbmYQT
	Tez5Yi8fNGcxUfWK2opGAOZu1DiiU84g=
X-Received: by 2002:a17:907:584:b0:c46:c3ad:e1ca with SMTP id
 a640c23a62f3a-c513a84dcf9mr1208760766b.9.1795642521937; Wed, 25 Nov 2026
 13:35:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117210934.7765-1-seanjc@google.com> <20261117210934.7765-3-seanjc@google.com>
In-Reply-To: <20261117210934.7765-3-seanjc@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 25 Nov 2026 13:35:09 -0800
X-Gmail-Original-Message-ID: <CAO9r8zOBvYsOyZLoKKTVfomKKoH+4S3KPYVJ_70p_7CJQrdzSA@mail.gmail.com>
X-Gm-Features: Aa3M54onVOC7uzSKfhzckkF_0xlFJe0eUYkk7FL4UqOts70dNltmqRJ0FRmKC3A
Message-ID: <CAO9r8zOBvYsOyZLoKKTVfomKKoH+4S3KPYVJ_70p_7CJQrdzSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] KVM: nVMX/nSVM: check unconditionally whether CR3
 is valid
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	syzbot@syzkaller.appspotmail.com, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:09=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> nested_vmcb_check_save() checks CR3 legality only if long mode is active,
> but it really needs to be checked in all cases - the check uses must be
> zero bits of the host, and indeed nested_svm_load_cr3() later will
> reject illegal CR3 in every mode.  Move the check earlier, and thus out
> of nested_svm_load_cr3().
>
> Likewise for nested_vmx_load_cr3() and nested_vmx_check_guest_state().

The code looks good, but I think the changelog needs to clarify two things:

1. That nested_vmx_load_cr3() is also used for host_cr3, but that is
already checked on nested VM-Enter and cannot change in the meantime.
2. That nested_svm_load_cr3() also checks L2's CR3 in the restore
path, but that is already checked in svm_set_nested_state() (i.e. in
patch 1).

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Tested-by: syzbot@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> [sean: tag for stable]
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
