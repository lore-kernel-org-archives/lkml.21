Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965374;
	b=SUam6JbZJInRtiYLoFJ/hIBe4d47P/p9lzfZEheDvs8/c6IhUH76sc4IjxJ4CikuXIrP
	 jtrvniX2ytbz9XSmSKYtULhiqu+Zjp80FZ1ouJIhLpbXWawYPiiH71/eL9Cp49tCQcs7o
	 spaoxJxn+IXGxmEX8FPcHze4Ft1dq5A9ZArzp+43fC4FodlJoJ/nNfhm08omgMJ0b6W0f
	 9ifeqphwMOBJV30NZlsHDZgePW0EPoV5gQPbGo3W0pi7qUEdbB0rgExb46pZVwev12ggF
	 B/OuxOIDtxvmKp8XI9SpFCSXsGXquFVzKHi6nsx/q/4kyrbZY4uDGinp/g0A9aw19xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
	b=KDwX0fNismUXzgkEup+A4wW0d3GvkV4L7n7WK8BdyqiV7jZt3KSDifRTON1ZxfI2nA4x
	 OUACkJv9ilYwUH+mXnOZuqZVwfUtPMY1grh+Cj004S/+OwRzkZuJMzQNmoPX5pxIUedu5
	 ZdEfXutZEMLBUccLFOqbR9Ce08Esh+VfINZjD2//y+1fMX1IizPwSmFeecmUg0e1vW/nP
	 IRTLwFfA6PJ5EQk/tFJ80bC0wG1uCkgDdWMDUU6fJTCCdvzJfyyW9CNlZgkZimW0indsj
	 a4L1BI7h05Lu8qfbdHUnFU79QNjL8w0g42L5m0c/NdvkR1WWpeF+RLnIVt442UB8Dxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O9DHBRIP;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DEC606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DEC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O9DHBRIP
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc785ed8aacso9848a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794965374; x=1795570174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
        b=O9DHBRIPmjIqt6AhONYCYYyAxWEJ+jwHuEmk99wwjzt2Nc0YnZQ+dKRQk4BcX4Tx3/
         EAwCsCIjOfij+kfDzFdvTyjQb7+AGv+8efMSQO+env5URswiaB4hGUmHq/mLnQ/2rVeR
         InpfSAF+62jlzeryXe/PJ2gNlX/ew/8siqlyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965374; x=1795570174;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3JSCXNwcogBu1PJnd6LhkuPj4w6tsB9fs1YwGA31yI=;
        b=shtBsz52tNDIAWCFtCs5xCv7vTnrEWr+SGQhquWOKwr7Cnp+612hNqYu/CaE3+Aug9
         CoLGkV7Fs5+VK1WC4XQ/rUkq4MeeRwFLdPeL9u6UHjIe9OdZWAZ97m9FDXm363Zs1Ls3
         KzevPQNJxQldgzcXCug26ZjnnhmGML631Es6wRWQ4igGjPw8A0CfQySh3iJmu3TG+8Yb
         BzcNVLadlaTkzY66ti0zraE3KuOQpwKXy+XtLQyjz1YUMUEOZ9IFErCB1I+2hc6+faVz
         YI60xjZS2hjXdz0TyZ4SHHcIsFb7sB/FB07UdGzOS7JT+fcNo+VGdFzhzoLuMtTdrmzR
         0XoQ==
X-Forwarded-Encrypted: i=1; AL+hErE19+0ByymzgzD80MMBHLGgjWMVe/zPPMBQsd9aay6S2my348yuWRwoYGpD2Goc/0qpRrZZARbX4t0/lp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U1ynFz0rn0eCdPzzD3IeZKKwiF+8x/ixrx6tHi/wNCqoIMhoG
	FL3lBVJ0AVvLMna8WiKBR9OUAykjpPACYkibbVEpozwFx7zxHDWC6gqLlrbEq11Z+w==
X-Gm-Gg: AZFdTZd0d3mnWomF11r35GDgHVk4QM2VVXXBixayknKKuSj/x+8XrT4qexT77J9gzFe
	3dcPkFm++uHZDWKFkub/UiAv4S86LOEOY59SxL7387Sdo/+K5hWdFD1wK0Jc9+SGoxzRzAy19/g
	qtHHxRLDmrbUMeog0PGK0T1y4O6dJaS43k2G35ukFYfjPN6lRBLm3Nv6KE/MYI5Adj/tbvuEepL
	sZWzN2+jXEINngKik6xBStyUC1nOf8OHVkRtNWdZlySyt7DpsO4ExiGWjobHejiYTC7q13yLiHl
	4Yd7uKK6LKYPniyw+6RiEvQQyf86J7YzBQQwbjsXJFM0b3hbUkysCOBq0TRV0AH2TXIXTsnknw7
	8raPFpsbfVU57tEGFRbmG7Mxt8nzS6uOD50zaLsj2kqcZ6Zup8TsoiM2Z6k+6EaqHuG+AV5dAA/
	4YfQPHZHa/Gnkt45jKJvOOAUGZnS/7gJ0W+C2vAwp3nWHxpi2P6TyDv+ekoMZUX9pL31lfDz5Z5
	go4leLwnk2ADwNSjgY09sAEPDJMU/GOEvcxz+rEakCSH+gLxqDKjR7nXYdLYif6bjPUNdgxbn5M
	+zc4OnY7PqpOR+6zPQp5IGzsOc0UHJZNvuUv6S93V8E10iZdvlvwJTFPFEsQsCZTRIIYNEFexm1
	FKyHY2TcuvCTn3DPU
X-Received: by 2002:a17:903:3bd0:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2eff6f86b0emr15976975ad.0.1794965373725;
        Tue, 17 Nov 2026 17:29:33 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2eff5ed09b4sm4409835ad.9.2026.11.17.17.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 17:29:33 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
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
Subject: Re: [PATCH v1 5/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Tue, 17 Nov 2026 17:29:29 -0800
Message-ID: <20261118012929.290499-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
In-Reply-To: <avwp1ZpVudiT1Gux@gremlin>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <20261116230627.3537051-6-jeffxu@chromium.org> <avwp1ZpVudiT1Gux@gremlin>
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

On Tue, Nov 17, 2026 at 10:21 AM Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> This commit message is just inscrutable. It's like reading Finnegan's Wake :)
> LLMs are obscenely terrible at this stuff unfortunately.
>
> You seem to have rewritten commit messages for the other patches, could you do
> the same for this one? Thanks.
>
> > Link: https://lore.kernel.org/r/20260519-panthor-kasan-v2-1-b7384458f076@gmail.com/ [1]
> > Link: https://lore.kernel.org/r/20260521105148.5497c281@fedora/ [2]
> > Assisted-by: LLM
>
> This tag isn't used any longer! Thanks for acking LLM usage though, we prefer
> you disclose it but in the commit message or the cover letter etc.

Fair point -- looking at patch 5 again, it is way too wordy. I will
rewrite it concisely from scratch for v2, and drop the Assisted-by:
tags (keeping the note in the cover letter).

Thanks for the review!
Jeff
