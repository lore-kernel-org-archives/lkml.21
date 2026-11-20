Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201528;
	b=V1Ogydg4bkOaUaNy6GoezcSzQDcyJ6QNqS8LJLm1ckAJDWFzAEDvA6j1ef2TwA+1aZoV
	 eHDN0Q/ymFwRYoLB/nZ0WhiUOKZY2e1tlAoWPIhjJ/BFHwN9knR/+/e7pueRKnR4nPQVy
	 4Z78fnKOaHmilrsWAs8E/Mepa1K/mc4QJWtMIeVKBSq+Lk8C1QVdI9dToFfaT7aUFBKqG
	 +o+RfUCF3fqUoG6MPmYuKXNwAQc8JkBjGlxLWjkJH9m3t0vXDAFL2RjlB2R8ptHV1E9F/
	 EZg7/n3qUOtbanDvXE5O/LP3EsjA9mORaFLe8sz/SbNabxaw+BPn5yd9g3RzQdL4m/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X2bBvR1QxOsCaUt0RYJzY4W8RFF0dAdEhClCcOQk3Dk=;
	b=qWbxY615U5rUrcc+rpi5GF1e/jO+hnfFmlPmtFsIzKDzovPpR1QslwoCh5hYuVhbuKRE
	 p+BLlwaCRWpqrqakaEFTjJ7VUTwQM+8hX92E4SEd8n2tcU5vxhbU9eB7pMFFPINbXkBVn
	 /+FEVnwWl44WmubH3lW0YTGgdxdEwo3rJIPdbMhKc5pTHCNi6/5nOto053Em8St8wiw9h
	 6FVNdd6BKAFBrGgbiilW26U6xDw0N1gpp3V+TXFAxEUi/f52WyZBMMMfX9YbReo//hqH6
	 CBX6KfVY7EX5A7QAvpTyHik4HrVFWKaR5alQCrEIDdeHGdQ1DQntkAsCyAdXuRQJW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MIfreRE2;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361460A263F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E361460A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MIfreRE2
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-92130d3ee15so13610856d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795201527; x=1795806327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2bBvR1QxOsCaUt0RYJzY4W8RFF0dAdEhClCcOQk3Dk=;
        b=MIfreRE2J8AwfTzPZk2IdSi2L5hHh75Xpae6ylFFyqVQxm2ucQK00S4dQ2JYBLHXMl
         RRYr/AynNCmJNMbYBNPF/kT6bZIFfXDH3cTo6eoia0eP7y8y6YPLYFAhwjSbpxGTMHb5
         BS+CfnMv6C1FVW5JMYmfRZCY0+bQPa08rQtT3v1HWWd4Az4baFbKahnyya9YIhJoYbkx
         Y0KswDV19BZzolnSFr6TUbKYxcLUjXex1Gszr4uSs80cHUUiGL2+DRj+UPbvTbS81fQS
         XmBWJm882ur5qa1MK2eHJ9zdRj03+csacZi74KumzJjVWtiwBIDWuBoCjO3jSsKbeexf
         y/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201527; x=1795806327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2bBvR1QxOsCaUt0RYJzY4W8RFF0dAdEhClCcOQk3Dk=;
        b=sMrjr3YSZrAd/9CFdNJPjuVUqL3mdZElEbukJ1nfiX+QJCHuHSgG2MC+KlzktIQYT3
         YkmOjMa6ckMoj8xpAge2PuPhKvb2i44rGOc9He0ZMLPdBEKII13GPwHSfGEV4+Vee+/z
         IbqsSrBx3DrNfJ42asnvMKET/j1MfbxYZiked8DPepe1im8gvZo62SYC+nmc99lDre8M
         mq72B4MWyFTgyq5yJhqEJPPOtjrqPuRAtQuetVY9+YuoedAb1tG1GhfrjvX49QSFieH+
         O2Db061OWZlhvNGAfR2CTGHRyGoK/Xu7qgexHkiKfMOPMafoUq4sHwWrXZx6eQL59IHg
         2gpw==
X-Forwarded-Encrypted: i=1; AL+hErHTjQm7trsORhSlvMJO5+TSyIWTLJ8VM26gkceGU11Ys7XXvaXsWFOiFmL43iQh6LQDcqQf/RZe3tO5QGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OlojLn1Yy8iTSD9QzbZwli5kyBJy8Q3TPccK4LqSq6rv9oTg2
	9otlXJZQEnVcroy9ZKvhPAUJ6RI1nA//CY2DIr/ibyZfhDSkDUyhjbwOqj0MaAV+6aw=
X-Gm-Gg: AZFdTZeGqIYqVNKnKOUa1hVeX8KFf682Jr9T7l9YN/72Qmp5VtzxRX/HTZpYUaLP+eD
	e14/uVEXzNOuXj+ucZ7Y/131aHWDKxhhS9nmFiCgt/NfwrzVmn0QNkP4Z9woTuipY29Uiw9a1BU
	vfJ1fqHWtc1Vv7vshhdZof8vmhetU5okNA16GYIDezTjdGhL007X2BuU0xJxZ59FLUOY8hBRD72
	xgv/OMOmF2HL+hHrwEBJ0UHwudUeEqn9198TAfASRTDy6lb5laVZwO3nW/5hgNLtRKQWuOXLFD5
	Ik4UMWVuulMPXnOv+F+EttegoT3fS9g47Da3mRt4R8KYSeMiqG1UEBe/0M2490VZfa2nRhHN4cM
	jayoiD5TLVAAY5eakmpiyB1YT4uBHq1j7POCsp89M/yq2r49t8lyytxJ9GV+RThwFl/XGoH4rdE
	Ale/1bhXnGPdywuuYkRuaGaiYv/8gMgpuGPkktgvuH10Q6U58J47JhKSXz+qnLxFszzLISh/tvh
	hio4s4E7TI9AuF/baTKRUai87Mo4Mjy6Hz6OWh/6EykbKqHxS46zjYtCTiXjopMHIii1lu94WqZ
	JjMLiGOO05PyM08qcKTbk0T8+aOq
X-Received: by 2002:a05:6214:acf:b0:921:231f:b614 with SMTP id 6a1803df08f44-92134b5bac0mr71317106d6.39.1795201526852;
        Fri, 20 Nov 2026 11:05:26 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm32999036d6.44.2026.11.20.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:05:26 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTvJ-00000004nGK-2Csw;
	Fri, 20 Nov 2026 15:05:25 -0400
Date: Fri, 20 Nov 2026 15:05:25 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Message-ID: <20261120190525.GC1133597@ziepe.ca>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
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
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>

On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> arm64 platforms with FEAT_D128 enabled will now have two different memory
> translation systems i.e VMSAv8-64 and VMSAv9-128.

Please don't forget to update arm_smmu_sva_supported()

Jason
