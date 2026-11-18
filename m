Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960409;
	b=bIsZJC/URPd39pJgRm8zup/dnWmxir7uIpJC4TqYaE5t46cw/Fx07QNBh4zuQDC0yDkF
	 FQZ0p5xkPL158iVQCXySKc3e3fD7k+IZzS6lIlr2bIG/Yng6j67flcUjKSVJbTJ00WyiJ
	 4WBJYA0SsWbFWDDwdmEBxDuzoi+GOoxnyuc0x49uxBjpEHK5dNFG8eNX94bVX7+xiv584
	 S+0UElhguLe0UmuEnDPrlNaBzDUofPuBjej5maDZZ38rY+svUsF2eDz/N/bZZeEwjgK8B
	 bpB2IIUZG/B89zHpzNv89L/+OzOi8SWszPpEwYsjeV4TnZNzGrZGuswJZJUxhPMs+Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
	b=5o/+Izmy70DBxwbGlWXeeRD4BPxuRJjx+a2+WAb+GvJTmoLyMQ6lHBku65DkXmBas/OT
	 He3+KF8tQ5HM0JvR7I+bxeMp7e/gvNP66CtJqV8YOJ7yTBgw9OaqC8D6Dg6x8xk81FNZ8
	 IHGKkX5xU0o2m76OimyHgHqval/msEA/Qe3YYyqzlFpbFhdDzVcSzQnhntLpsdy2E+B3O
	 0eFtXRLcK+MeB+FC675h5qQf7SDkuvK3dYy4o0ZDJFu40Tvo/hFRK0RzBxuLFsFjdLPvM
	 UYspe9ULUhQf7lKCgw1ZpIhJ3gg7xJEAHjgRWLNiskvi5AQFhMuwnkXVgdFyZn5jIyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eAsU4TNW;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8B9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eAsU4TNW
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so851591eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794960408; x=1795565208; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
        b=eAsU4TNWIHz8OfqBu5aEzcROnzrPvipyADCOhrzGhwgQQw1Txs+jHpwGPT6Z7o9OTM
         ZZOEXiyOOAvysqBsgy7PNXNTNA4foSUU9eMcGDlyAv9ct1onJOWjMfC8UpgrPehe1CqD
         eIjOkZP+h7S+cErV/MUnJXyU9irDYiA8/yr7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960408; x=1795565208;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
        b=vCk7lTBtXlIWO44v5dRgYQ3AzLO4G+5NZ7TgTUXRY1/M6aCl6Hs8va/wzT4RJ8hxB6
         HJ54mwcd8Ih9Jg90jQ/3JKCTFcvZ76RaApiZEyv512tVnsa45NnFEyXVgh+KQ/1DYI+N
         LAQViqcw6oQCeTkiHWrmeMvwaLgUZaH2SU67wZ7Nbzor3WeMcZLRPFp4dMa7iyiIxmv1
         nVa6u2e82YG4YCZZzb3VaKWGGYtQdRLLnuA5gJzZJzP4AkMXLGNSLmhbkUE8eX169U55
         gxmxEV4PjJ/PbGkvAc9sSJJeKKQesEU0R2jqX1D36i9ysmytGaIbobQEnDbxEqm8X0l9
         sQnw==
X-Forwarded-Encrypted: i=1; AL+hErHekhSETHUfL9a65eD5vsk+zpPPV9k+1mhkWQLMY2Jzv3KD7f3FOiY3jQExiow1OM2P7j80CRy4z4ES4ms=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8MFI3Vy6Y93KHENxcrs9nbFwv/WT/kFThBYn139bYEqZJUbSQ
	WojaN9qtyfOa+yGcCyfldID1m9y3qbhoM8fRxBb0U5xOevgy3mpiqx2YKsO228Tx03U=
X-Gm-Gg: AZFdTZetrjyuosSRtn8EH/YhNCZEZx9/PAZZSotANEav6ElfZjsnGoH7jeM8VMVg91Q
	rt/Bc8noE9umX9EdunwDjAVf5t5QnFChfnV53cAbiZ2QtROxq938piKIeWTj6ZBvEsyRNFIR/I5
	lEaynFOkUA0/Fztj9NgH5ooIaB26BKj5MJ7HHlcwS7B+zAp8uYE9cOpocSKBWiukQpjDwvIDgzD
	CgYG5gUbT7chRJ5VncakCZWvTB/SHMwr9o0y4oV9LUYdcjhIFiPpzCL1zLeSkMJFZXNikzqoETQ
	8jeESitQ1Lnu6UcGbOQQ+0MG7shQNdy7ccO0xM/nZUjD+UnLqNRJ6Zb8WGNVShUQn1AjiSP2J7g
	UeNLsMY9pB3BVzJo/T1iOh3Rf0OaBRAJgRJVD96PRXlbhgVL/XpHEEGiPFhb3GL+xFioLNH/NKd
	9Dh82rsnca9Gf0uJLhuQe6KqFbMHiNXWQ8AkqLJxti4zD0XkHgBnggnbFCCE/8+sYzKGM60ymSp
	t672rzZVelUuR+LqQMDjDluEtkM2h+mp7bf/CwEWEPdCa7qrRxtIQXHfThVvzLk9cgzlANhIvgt
	89I2gvFqIK9r6jiPDDBvyB9MFip8bz52NueRmjca4k+Prs/It3Ws+picYjUaqAh7a+UhkCMknBS
	KLCGtpwmB2opO9DB8vrvww9KBbRiGH9ahuyJGYa1junT8RKR0EAk7Mnqv2KUw8TX0oCnOO5jaIX
	sI03qeMvmd7VpzVJm3/hHqBixOrH/NSem24GyhpThqeWStxf2Kg9jVFSAWsLUtPCPU
X-Received: by 2002:a05:7301:618b:20b0:380:f32e:d257 with SMTP id 5a478bee46e88-3827f98bff7mr824254eec.13.1794960407817;
        Tue, 17 Nov 2026 16:06:47 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm1714896eec.11.2026.11.17.16.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:47 -0800 (PST)
Date: Tue, 17 Nov 2026 16:06:43 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/7] KMSAN: Move per-page metadata out of struct page
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avzsE5wGnXji5u6-@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Thanks! The changes look great, thanks for working on this.

I think patch 5 still has some issues and have replied there, but for patches
1-4, 6, and 7, feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
