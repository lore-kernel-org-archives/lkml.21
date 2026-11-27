Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771599;
	b=YdSj03fkWyvsmCDBcfF89EymBfdfuDxmG9Fa/DxCwzxHdJbXottpKfDJbHcfrxf9/kWp
	 CEFKm/Fa1XVNgSGT5vITNcX5aCw2BUZZd1K6BdeKT8hi/aRpW/LBRbRpVBmBuK6Gslh1X
	 ymvej8uevjbrtnUjIuO9+uWyjls4okwQ+6VsSOAiKtXCpVB6BJK/4vaCEIciMHQIb2h+o
	 7b+CwJqd7I0cK/YjxOCMJrCxI65Nm5A61/wMHLtONhiAywvZ+Q8RnnabX11n6HqdOxvEd
	 c4iT1P59t/lIKYed2gF1T/IKvGlbppEgFiTRY+/rL7UVos08e0gsdluZGR1ADNKZ/6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hoxVon0gybDyq4RET65wbSko4AYZRSn5g8mIkbvH3EY=;
	b=zL4V0E8gsorkFOIKC/viTQegj/Za+IWyXZXSku5OxdUyUzuahONZ17SPnh6vwaJV/klp
	 oP0NpYNLGyCuTS36DaSX1IBfjZA0xAKv7m5hTzIiA+F/y95zuZspGOku/u0b5Of058XnU
	 rpvhXtQl3ExM1dkZmf7OkSZ40/KUqx96HTNLHtIWUgRJXjh1KViLymtZ1Q57Drp90m6qW
	 4JsHmjUY2c82eeuHn5EJ++0+puJY4bezpw6IS4MiGHM4BUzfr4VBU1LKdjBIKKd2sQQ3d
	 j35ESnTh5oO0nOHqy4cm3L/Z49ptqDk5yZs3i2NDygWsBNGBUvRASdWeS/XJ7jrGMQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vir8602Q;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EAC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vir8602Q
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so83360215e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795771598; x=1796376398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoxVon0gybDyq4RET65wbSko4AYZRSn5g8mIkbvH3EY=;
        b=Vir8602QHCY48d/5HTYyW2E758IaVdN7MLnibn3ir1cJWZggbX2KVToMsfPGsh7pGH
         uVifU8phq/aN6ngKAepiCcDCApwHqptT+9947BVDpB9JDCGrNUO5roI3BaFwvFJPLZMb
         AQyrYQpnFsdckYnvvhPZW8ZXtQhubCiYIHiKhNnp/NFIYhqiDPhGX87HyiYxlODjBJOD
         S1kGzSpdaDYnu7u8c2WCKaiHj31BSDwUli7/seZyzP/JEG1PoeJPVJ7FzD1bU7J51N7H
         t9FQ+k3RLVI0qUN2/qRN3wFxmAMjVS9p0a9IBtakY94L4RiiL2dGtevWcQWAVe212VLE
         JBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771598; x=1796376398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoxVon0gybDyq4RET65wbSko4AYZRSn5g8mIkbvH3EY=;
        b=LBslnWSOTaxUOwdDCKGdG8D7DhwHajcQWWzWVUk+uTKa14cRWNBpLncbRNMjItbVap
         AnbiXZ15kAqdxhvPF4QiWJaPc7KKZ5EH2aWSXVxPQ9x7mFLhr/jIovB51SPGtG8NYxYf
         IMk/fdxsU3MpDp1ao/50k5JoIOAGf8v9VXGg005u9dKHQriLi2VFl+mxCftJEbaCnxVA
         zMFRJpNdMvy+ec6f44sTlm+wkKHmiYdBs2WaSSKIhZQPy74e/3zbRNhLcYd71YwxCkor
         WuEkFMeiEYjKcG/xZ0QCBixWe38+GyL5Qr4HMV9gl1xLv/8RUZNl1XgsmjZ3e6+CoAbG
         oqZA==
X-Forwarded-Encrypted: i=1; AL+hErE+d6JQqh+U2iyQnkPEm1Pxv9LZvDMbwgKgl3tHRii0wsuhetUB0W3FT6yaSfcLY7Hv1VBJgle6k2KeIzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TWynYO1bMEk+b2QHmZwbtlEn8WVSPUR6lFyWipEr9EOVsIfCn
	gBnhRvn2g2n7S9625wMgDYMicxLRwRJMc7Ua2JZ+Kktr0bUExmFB7WoUBf8ql/KXhC4=
X-Gm-Gg: AZFdTZdTufda4HAJDr0QQCocHiAfrVt7rOVyitcreyYx8zr6ea+IGKWM6mdw1kc6Rbm
	S5izglDxUBYCCZ7XvvAL25bkm2vZONi2aCXuXrYk/VEfmFJ6KCkxbNTR0/vrfsCPc/+Ha1nSmh9
	CdBoGwTpkfDxCu/m7TXzYLryq3LXGwlEiuSE2hMp7TIeNC70lK9GyQne84WhVzUJ3NthHh6MI8G
	iVVkeGHyE/5IpCeCESWmHaCGU+O+eUVGMRYU9GbP/dWXrsoFt8dA4ewe6/IlC943GkAcrtbT1y2
	DyV2cp7tISjk5L9ILsTpjk/RlXOYz0rzLObhRDouuAbla00pEed/Wm3tuD+8TjTVdskLa/e9ssM
	H6XoBshjc3Zcj/RnWW9erVu11Q0H9LYICallml2QdhCJg8NQK5Utm93J5H4f0oaPO26+5CBWKPn
	Axpvevy9GrwVz9zsAFIP3JEGlpaG7dwGLSKmtPzrRDC8eJ4DTHuz/fIdxxsHEbTXABzMw3MTn81
	6p/gLrLpxZYN5SVvsPgDvp4/N+klNbF401r4iHt7EKx1qewwuyNU035gLJ6192fvEp5GTsTMiZD
	TdrvzYOe6bKevxh+42izH8/q4p6ScKpg8myWe0HV
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr537393335e9.10.1795771597616;
        Fri, 27 Nov 2026 01:26:37 -0800 (PST)
Received: from localhost (109-81-21-11.rct.o2.cz. [109.81.21.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm44430440f8f.6.2026.11.27.01.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:26:37 -0800 (PST)
Date: Fri, 27 Nov 2026 10:26:36 +0100
From: Michal Hocko <mhocko@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Greg Thelen <gthelen@google.com>, Greg KH <greg@kroah.com>,
	Ming Lei <tom.leiming@gmail.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mm/vmscan: Fix legacy memcg reclaim deadlock
 against filesystem freeze
Message-ID: <awlMzHMo6_Vj7gmq@tiehlicka>
References: <17d0d1395c0237d201a1abb2473d51f5@kernel.org>
 <f188775aea9580f9ab2b477788503434@kernel.org>
 <20261126180228.9b672a945d480e3d3f301985@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126180228.9b672a945d480e3d3f301985@linux-foundation.org>

On Thu 26-11-26 18:02:28, Andrew Morton wrote:
> On Thu, 26 Nov 2026 02:17:38 -1000 Tejun Heo <tj@kernel.org> wrote:
> 
> > Hello, Andrew.
> > 
> > Your follow-up, "mm/vmscan: scope freeze writeback skip to the reclaim
> > target", applies on top of this patch and tests fine here.
> 
> Cool, thanks.  I'd forgotten about that ;) It was a hastily slop-coded
> "maybe you'd like to include something like this in your patch" thing.
> 
> Can people please take a look and suggest whether it should be a
> standalone patch, or just fold it into this patch, "mm/vmscan: Fix
> legacy memcg reclaim deadlock against filesystem freeze"?

standalone patch. And quite honestly I am not convinced we need this.
Let's see what other memcg maintainers think but I would keep the global
thing as this is a global situation.

-- 
Michal Hocko
SUSE Labs
