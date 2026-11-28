Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853660;
	b=n9JyBfZLTsSZXj0PbY8gHTdJjY6bc3UzRCWcsUacm4SzXQ34MkSVqIxL0u+fCwVCbHny
	 qFTL07fmtWyz5y+GD8FOe1ev4pQDSKB40UF7GJYow/MLMBiY85WV6mCL4wTxTVh8SnaVB
	 VHWQJvASF70nG3lgCQCnC91UOjMzOuHHkGAIxXLOeEnpEY7HShq50MwjbXVZXu2PcQ20P
	 cbGeD8WVPGoSsF6lTFNWACcfGqr+svQAW40adee2drMphj9kVYkyYoMYxTP+wGkPC4rT/
	 Hz9bAFlpey2vcCSIxTRTc0f5S3bWGs5mTC4llHSfC0k5uc0Az7sHGiDeP8eYOvsHerg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i5cs8AaJOdV3ZQpL9gyqbXhUnUJiadTuA1kMgyOem6I=;
	b=KC2DC7+nujwb0mPodxxzv2q+soFIgSV8yE0KBDOu8HGl/twurAueoWAHz0wl9ImZfuvg
	 PqEc4yzbYBrl4NPlg8/69gTPjgyfnWEiOfQJbBc7MRUzNrQ+0RdpQdwphOla4bH6+telD
	 nDHf2pTwJyvHEg4Ogw25PNwARNzQElRy7TJHviPUsycxRG1cgBTl4/kh8lTInK/gjuySu
	 prUZT0fKuMCadnprOUYd5wTEOA0RzlGP2NV5Hb0fESSD+8M/JCWy9vMJg/zScICQLHEVY
	 6cqwuZJesD8ov9838G3L7RGl7YGAILOg5izrlwRmgAzC8AVKCwKDMOE6LHpzUSSEmiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4gxVgT9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C5F606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4gxVgT9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386cf1041cdso6437702eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853659; x=1796458459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5cs8AaJOdV3ZQpL9gyqbXhUnUJiadTuA1kMgyOem6I=;
        b=o4gxVgT9PASOZ3CuHwluBC9eGkWtpSj9r2tVuYhYhTvpVVktc5ZN0eF+5aKR5sTR61
         S9/h6Z0rVfa7AC/F/l7b1zjgAe+HScJR+iGTRFT/1AnTib0rpd8l7uBlCzi39tG6oN/o
         D/nnCR2sOqc4nNusEDkqjvS7rMibTIP6t7xF4ID8Pni32Jcd+F89yUISlcLhjxYkr74k
         wXvBtFXjhhSM2nGXR5oVDaVvB2Jpqy/uUdap0QTb5esD8tug/xUgCi4km4ChChd5dMqF
         09E9hd8vmEbEBkAM4kd6MT7+RN0hV+hrItnkg2F/IBOwaz98kODuGDqZJBtgsyoBnAZv
         tKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853659; x=1796458459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5cs8AaJOdV3ZQpL9gyqbXhUnUJiadTuA1kMgyOem6I=;
        b=XHKm935fGaesh32d5n59+Rrt58HLm46gQNnQQqtk+g9K2QjAnbc6jWlAOzgpvHt0iM
         N/LBWNSszN593TKKJ41Fd9E1Axm3zQWnxJRShzKxC1QmeZ9r3FuW6DW3wOGL/He3uSUe
         R5M/ml3vrUSRSXe7x16T3JGpC7dboAvsCgMpmcm5hwixg/Ughy416Br1SuR7Y2GiKwLI
         gYusXPmHCtp1gBl/YNkph8XPn3dgS1rCFb5MryObh3zSntSn7k4ZcXZh49tb6a/+Bf2F
         2wm25SqjCCfMs/R+tUjhzPmWcVCrakelqbSut181o5obPIxZM0jiAn3/goeBEMTTjaQk
         64MA==
X-Forwarded-Encrypted: i=1; AL+hErHyanI7sQCLgHG9T1syJwtCS/yuiPdgHnVmmH+nMEsRSwchlae58lvdoYPVePd/sA82Iecmcgvw92d3MKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A43pY8xIgQ39EHyKDvZie6p2L0E8wA/nqO6Mh80QKaRFWkswJ
	yH9bOYRk1q8Ubuqu2Myp+53GEUbl+T9H/UzWWx6NAgxEocvUjc6TDvfD
X-Gm-Gg: AZFdTZe9p1u7bvvtH+A7QpFNRvht/lnek5DrLFUSnkxzX3N4zazfkzU5ih/Y8T0qFiV
	2XmLQsR5/EWAtPGf2/tVIZMeW6NHF3ZM1XrD5Hw9yiG3hKJpPYbTjzww4csU2HZQF0Yj2/iA5mu
	yChqUqoIIHQdM8liszvGfaFFEvceVsh1cGR2g6JgpLVCuKAZOa7nLskAGfu17nG0b+PLc+V1cJG
	wdLgtxqrEqNqvfv6Ip12CQio/e/o0auLPz9wl+KkmiXTHxHeQ98K29Ne2boSBw3tD6S2EGNOoPz
	gdjURJoejtk20AYzj6/W0Kk34wNH7MBLFMACv5zql6OV3W2Fhc5waJsiqSlWoKzbcVMC4sz0Ra4
	x+VQ9O3XOjKMGJmbeMzZ2yi89wn07tpfVWV2u9vYrZ9Xmjdv+lroXqBsqdwQhfiizdsLmeNFIzM
	GiBa9gRDM+xrFtIX6N2Yf0davfb+8T1GR6AzwTwWabrwNcgZ+BPVf4KGwjAA1F9B0Db7Nq9I21O
	MTHzViA/eL+WbxLJq2hdw+Dg6GorbA2fWe1rwJVFBwUOvZk3CVViqKnqLRT5gGWoRQlOs1r9oAC
	wRRtzHTqPV2vx2VqzRp0vPVarbNy4p6/WRfuZDOQhlL9nG1d2Emr7sodEEoEBdYpaT2N/Ohl3jA
	IU8GhMynzvaee8Q==
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr23638515eec.40.1795853659296;
        Sat, 28 Nov 2026 00:14:19 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386f6651e2asm5676959eec.27.2026.11.28.00.14.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 00:14:19 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 10/19] mm/swap: mask the off-list bit when checking whether swap is full
Date: Sat, 28 Nov 2026 16:13:48 +0800
Message-ID: <20261128081400.38292-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbWk-TK+VtiD_0ByM_pxXzyHhZiW=C0LB_mH2FtBXH99FQ@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <0d61898075921b05c626accfa34a60e16472b556.1795439990.git.lianux.mm@gmail.com> <CACePvbWk-TK+VtiD_0ByM_pxXzyHhZiW=C0LB_mH2FtBXH99FQ@mail.gmail.com>
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

On Thu, 26 Nov 2026 12:09:23 -0800 Chris Li <chrisl@kernel.org> wrote:

> Acked-by: Chris Li <chrisl@kernel.org>

Thanks for the careful review, Chris.

Lian
