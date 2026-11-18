Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965346;
	b=M42p2Ay0U/uZLs41XEewoSarpHOcxLvBY0aplg7Q3I9Lapx5Hk++jDF8F7NJTCtkT/gH
	 2Imi45Vcw9WWWVGZtJbGdx/tjZk5n4IGe4QTzZa9jcSmoKnUGISxw7l0QqgrOfy7LEoqa
	 mDPhVVNd9EJ/hP4msKbnzE+WgWkabZ0v/15zzekrLSq5EFQA0mEi3UaxaWX8lnDJQUpFt
	 j01JqoM8Ecoygs8gBMEUDNYMlsoXjbH4Awv2bWauJM80TtiyKK+ClXEQZwANIEUDiPce5
	 iN9Ea1iG7mvtoyehwdi9H/o9lkaOShhANj+p3lVVZW0Evh0pidEYb+WevwY6IY4I5lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9QrBc0w3KV6ChVNAVMzB1hWL9AMrXve7Stq4IEHc3B0=;
	b=MtsG6gsYxexJ0RbKpm690nBfgtg+IxMzCUUcSMNL2jKF5kpOkam9BVnMUAOmk7bjUsh/
	 Pgx6yqh3RaWmmoc0XdKHHss8aO19CKjEKv+MrdMT83130XDbZlaL7LwrgI8w7E9LAR3Cj
	 b34UCcwE3Pl1voOOisDGpY1wG+zf/jjiarYVcxpCWBe9lejbljZBSn7NYIUJKNDJLrpdw
	 qdoVn9FIqaqgkYG8D48m0hnkDEsJRaAmwtQBW1ita6t/jss0OxaC2ai7fNr0Eevq4gQ7J
	 3jnVaWCb6udDOI7nduYJYJ44/8tnRzeZGmPb1CE5jQtlQHkczTJ9ASh7MBKUCc5Tr0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H1AWSx2s;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5D606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E5D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H1AWSx2s
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b147e50af1so27948a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794965345; x=1795570145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9QrBc0w3KV6ChVNAVMzB1hWL9AMrXve7Stq4IEHc3B0=;
        b=H1AWSx2s6yA5CZ4Kphq2OZbv2w2xBgnzcUeDJNakKtwKJr6At3ZCbGY3hZkAUsj/yp
         b5eUHT+IBOFEmxJxWhffm3Hlml2THIgqdS86xaG1IYJpNQXva7wATT2dVNqb6auf9kHq
         Hf8xzqkAwAP9npo0A8KFtaAQ+dIAC/LDfvn9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965345; x=1795570145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9QrBc0w3KV6ChVNAVMzB1hWL9AMrXve7Stq4IEHc3B0=;
        b=a4NcF1xMz+85dUAWbz1TJzQ9vJv/8xZ8Rwpo6jL7tNn/VpkmSuqL2q9RWSVH7D8xgU
         DwL8qclcjWJZCJpV96qQcRfu2v6UegkUOTy3DXCnRvPyEJePWnBZtZj0NcVQLeQTaBZ2
         CYPMIOynHEAXzkey8aY0t4sQTKmuBpLQPDWG8s0YcaLtIh4q3sEggxrUv8LaomGAFReN
         PNEJ1GJ8bGQJw3ZbBP9eIepWves2icEbQXzKBMk4HAJzhgahoH235LIV2OaAGbbhWk8e
         YpfM3Nt7qlH8T2g78lACMBtJFr2W0ewh26G8ry5mMaIMsRBPM8roQdvkgfNtWEhgsu40
         s4BQ==
X-Forwarded-Encrypted: i=1; AL+hErF93Myd2VgMqS5GZ+RmDTXE7sn87N2jmw1kuurkrV1lVXt49jIuljc9+lZ208cyRhQ2xDQJ6iQaHxAoW2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+YlfwfP5sCvtCMf5GWgiObx2T6vgdd45bIUnC7oqdt13HVpXB
	FdoIQKMxl5IKW/85zg/LkDP/qNazYnwdMHIWWUdiL94w2tZDZ/PO2SFxT2ucZlth3A==
X-Gm-Gg: AZFdTZcUBn+xf5CQN02aXI3jQZGolpA5jETKpRJL0AVp+3GOpNRyEJREt89T7VGjxy9
	Djmqnx/4D6RJKNYZat356cpuWgarwId39xX4y8VRCgu8ngv6MrCXH91E5ERwgw/iATnj1OqsOCV
	5RsRbkLExlZg0ePeHTYLQ6oF4eaJ8kB3XXamIwSZkh84esKBSdbWgXaE+QqgIVvR0iKO5GeejXA
	Ns+KNBoX+ZKsk5PapzD2DOh+geVVrYZSxRrE2cMWmnOYuJe+k/vqwM1PZyrexlGL2tgydj3uRPA
	JhoDxj/Qxj4L3koKT1DOKLCSnoD3kc3YvKyGPzHz9n3L4SJbbftgvuZVcH2akT7lqiQDL9HdSpI
	OZj1Q3zoVjdUStjYZtFc6BawaE+0tTCthj10ZjyfK8vrofGTYITQSOJ8A8kvVWI/Z49z3jWz629
	U74TTamNYjRg1ZsZkENtO4hUe43serqAwSlfArD/2AAnyItm905z4TSJ+2IfbgNnTlwgoydyZvb
	3OCs8R2VzwGNy/LfwmsmCX9CJOZlfwIlCiIS39dt1TUbx0dDa80Wkrhj0k8+HbGSkMO7UCzuM6R
	t9V2iwPZ+Lfjd80XFZQV3wpa33fPQbQNYJpGqYYA20JTzyGnthXSDkMo2jRoSDH3dFSg6aU=
X-Received: by 2002:a17:90b:5390:b0:3ac:a11a:7c88 with SMTP id 98e67ed59e1d1-3b3d07af9f8mr1892178a91.3.1794965345247;
        Tue, 17 Nov 2026 17:29:05 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde3b98c75bsm243073a12.10.2026.11.17.17.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 17:29:04 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 17 Nov 2026 17:28:58 -0800
Message-ID: <20261118012858.289236-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
In-Reply-To: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org> <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 17, 2026 at 11:11 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Nov 17, 2026 at 7:10 PM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > I really don't want us to spread KASAN-related GFP flags in the kernel.
> >
> > There must be a proper way to abstract this.
> >
> > Why is GFP_HIGHUSER not sufficient? We were already told that this is memory to
> > be mapped into user space. Placing data structure on it and handing out pointers
> > to that would already be a bit questionable.
> >
> > So what are the ways to avoid GFP_HIGHUSER_KASAN?
>
> I think the idea behind GFP_HIGHUSER_KASAN is to make it possible to
> skip KASAN for GFP_HIGHUSER by default (for most of its users), but
> keep it for some of the users which today use GFP_HIGHUSER for their
> memory allocations, but could benefit from the added security. As per
> the other patches in the series:
>
>   pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
>   kexec: use GFP_HIGHUSER_KASAN for segment pages
>   net/rds: use GFP_HIGHUSER_KASAN for message pages
>
> That said, I'm not familiar with any of the code mentioned by those
> patches, so I can't really tell how much they would benefit from KASAN
> or if their choice of GFP_HIGHUSER to begin with is correct.

Thanks David and Tomasz for the feedback.

Tomasz is right about why I added GFP_HIGHUSER_KASAN in v1: out of
caution, I audited existing GFP_HIGHUSER callers to find any that never
map the pages to userspace and instead fill/drain them in the kernel via
kmap_local_page() (pipe, FUSE, kexec, rds). Since this series intends to
improve KASAN performance while preserving its security aspects, and the
performance impact on pipe/FUSE/kexec/rds was negligible in my testing,
v1 was optimized for minimum behavioral change.

Looking closer at both of your questions, I agree that the security
benefit of keeping those 4 under KASAN is minimal -- e.g., only linear
overflows out of the pipe/FUSE/kexec/rds page, since none of them store
kernel structures or pointers. That is the exact same trade-off we
already make for GFP_HIGHUSER_MOVABLE.

To avoid introducing GFP_HIGHUSER_KASAN, I see two options:

1) Simply keep those 4 cases under GFP_HIGHUSER (drop patches 1-4 and
   7), reducing the series to just the GFP_HIGHUSER change and its KUnit
   test.

2) Switch those 4 callers to GFP_USER. Since CONFIG_KASAN_HW_TAGS is
   64-bit arm64 only (!CONFIG_HIGHMEM), GFP_USER is identical to today's
   GFP_HIGHUSER on arm64 and all other 64-bit builds (and if 32-bit
   CONFIG_HIGHMEM=y builds still need ZONE_HIGHMEM, that could be gated
   on CONFIG_HIGHMEM, though that feels ugly at call sites).

(1) seems much cleaner to me. David, would (1) work for you?

Thanks,
Jeff
