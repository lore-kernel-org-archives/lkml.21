Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550101;
	b=UQHwzCGk2gtEanrNKwn4EYHxA0YixX+KScuMmJA7Eh2lEVwKqtaev6lUYxW9gxbaNeIs
	 UgYElevRkSbBZwAzCiz02bzocwis0EBan10++4KBtyg57WjClr4aCixXLYev2kcNvRWj7
	 IL1BmF8fMQxsHCWOHLAMJED+HTmEbgwEbLoMp/5R37pXgGpMkC1zPNHvl2zNKEID7MsPE
	 BpVaIOjr6w6HSC8ZCa61eRCugaHhawJ8/JSlhHHDRW4bQdqMBZBhJKeFkvShfhIEO0e8K
	 jLF3WCFzQpLP+d7DyoECSbBxQAJpYUavGBmUzwEMwGjgNpa6djyczplS8gauTzRMcBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
	b=k8zmpB5o39t91up8gdRSgmrRTS2Nz23ui/BRdcvh3YzesTdC0LqFqeJRPLAJTHR2M8Gh
	 KzbsFIYH7rYf/fYApKMZIBPl+nR6vpSqxoZHT8hu+pGz5j2PYcXmeWyjmXMJgqZLrLGHl
	 5fbiAwdYApuwSyd9WfDTvmbGLMge98SgJUHhTV28H9r4I/tE+IqeR5RY+fFrgfc0/HSDY
	 xcorufou51ef+O/06YtLSh5C6UXVfDpTjgnULGabwzyCZXonlPBjDErzogG0IPRXyYwHg
	 kh+9PdB5UR05uZOyMpIC5BXTa/d1EpFbVrpHFNiUQE7y+V1c8+Hmil5bj/keXbHBN+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F8BWsB0n;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB79606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB79606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F8BWsB0n
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cde60d879e4so107867a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795550100; x=1796154900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
        b=F8BWsB0nCAqeb/AWcfO+HDVK8mZYlTd5OrAGXo+PDo4qNalYx0D3fOywTn36jlGI3o
         c+cNELy8fDLVUhaoRcT08PS33thK2uCkqwfG9C9YuYZMNa4hOWdKcnZwta+H9xQ9PyXj
         BerC9R4yihNnd8XXBnr17D3gJaZI3rr46c44Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550100; x=1796154900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IV7aCStFZdnFeaXhFPoQdGrpPnMKMt+5GDtnao0aM7M=;
        b=m9N93TpqIVdvM4jojEYpq9WF79W5kflXZDaCnWImJ1Xc5HsPKVlELE2Oj4gbxdd4DS
         CyGPmnCnrd4korNIiSM1XaQt/IoMFAUsxe3ObJ9oHo+Lam435aStQpuR10xSWCo4LiPY
         mTC9PQy0oBm44fPp0Jj5/Jpe4j8+LkSL/WZzboKP2k4NwWgdANX6c+hP68cvmOO/FtGZ
         FSICwGB/bcoTRG0P7u6dKz1JqsPe5jVzfrpme45A9h+6ExIseD55aiUFWlIRuGAvKKin
         2LIWNAnh1Mv5ll4+Oz2gwyzyTJ9Df7kFWfPCtnFaZqeXHTxaZ6dN5xg4pN1o97m4Pkuu
         Om7g==
X-Forwarded-Encrypted: i=1; AL+hErGTKjvJu/3727vVgU3QHaNuH1YDuoT2upELgvG3ZngIcyAUMfD1jNwTtNrru8xKG24BXtfujXrMYZqjBOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CBwlIixLosTZ/foI7tyLy0N2C8wH7cw1P1Fn7u+bNaxc+H33R
	Ol77eWupUZgE1cf0JR5d/SqL2zK74tB4ic6HRhUZ/MLJF2jCx+SWDfXPNGfbfauuIg==
X-Gm-Gg: AZFdTZeH25NnC/f9iHmvkMp4Geu6k8QnNNEQF+wh1EKnmxafiIxtl7WavFQq6i4AMff
	MIJuUxR8yAvWqbBSaHtsgF6ftf+mO/M4uOogjK7bBIlFTyxaxLr9WUCSTvaYM3/bYlgDNe2NM68
	pAj67G+nosJEKWoYYklHg8e/Ywj+uFaelzpBDzGOE/CGVeWaGL07ik6gcIq9VMfoy+yL7lxuSoD
	k8NJMXnVFpKLx0NPXQggGZ92yyni3qF9D5U56HgjAY1nVW0J06ObzqLlJCwTK5RG8GA/4O4qi01
	AwnPco6nptLZfyTJuAQAV3Gq3/jfwdWPXOUt3qR7RSF0kFpuvSA2IdWY+/BL8cUzi/7lTdh1W+5
	fBSNy/5fmVUv9NGTsQ2c9DDDbzSBlzXv1J3rrmog6xdU6glMtnHgJJmHvhE/AgT8atGHu7Q6ouB
	hxzKltNmv8E+UdXLrExqwci3lJkM77PWW8WsEPxkIqskNpBDpYqQIzMDfUN92lEXNLwb5/hvWnh
	7ixY+b4CA7Qi0yP5ptxBKc2KsZc4fYAEmiuY9LMWEh05V8znIXw6lWo5KI/ZP7e6difhOuUeLXv
	FwezJ+dHgHOjdeNc6sJDFZ8vr94QNY9FOUK6o5LwZqcVjuXQQYN5I1vJCvaBe/2lGAxD7A==
X-Received: by 2002:a17:903:4688:b0:2f0:7d6d:4a09 with SMTP id d9443c01a7336-2f07d6d4bc1mr137239435ad.1.1795550100419;
        Tue, 24 Nov 2026 11:55:00 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f142b8bsm72335435ad.70.2026.11.24.11.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:55:00 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>
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
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
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
Subject: Re: [PATCH v2 1/2] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 24 Nov 2026 11:54:55 -0800
Message-ID: <20261124195455.164425-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <7ed1f755-5759-4b5b-ae00-a814f16b7903@kernel.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org> <20261123033111.2349160-2-jeffxu@chromium.org> <7ed1f755-5759-4b5b-ae00-a814f16b7903@kernel.org>
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

On Tue, Nov 24, 2026 at 09:10:53AM +0100, David Hildenbrand (Arm) wrote:
> On 11/23/26 04:31, Jeff Xu wrote:
> > -#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
> > -#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
> > +#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM | __GFP_SKIP_KASAN)
> > +#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
>
> Can we please add a big fat comment above GFP_HIGHUSER, explaining why we use
> __GFP_SKIP_KASAN and which security impact this has?

Sure, I'll add a comment above GFP_HIGHUSER in v3:

/*
 * GFP_HIGHUSER (and GFP_HIGHUSER_MOVABLE derived from it) sets
 * __GFP_SKIP_KASAN to skip HW_TAGS tagging on allocation and poisoning on
 * free. These pages are meant for userspace data (e.g. anonymous and page
 * cache pages, DMA-BUF, GPU/DRM buffers) rather than kernel data structures,
 * and tagging every granule on allocation and free is expensive.
 *
 * Security impact: under CONFIG_KASAN_HW_TAGS, these pages carry the
 * match-all tag (0xff), so kernel accesses via page_address() or
 * kmap_local_page() lose HW_TAGS out-of-bounds and use-after-free
 * detection. Callers that store kernel data structures in these pages
 * should not use GFP_HIGHUSER. Generic and SW_TAGS KASAN are unaffected.
 */

Thanks,
Jeff
