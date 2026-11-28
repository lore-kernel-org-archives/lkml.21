Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795851924;
	b=w+4uVhB5zoDf6YVqXczW5m0sKz1DgLljkAaxBEJMp5GugSjrkjHRF3kjWNM/vDj8iGZp
	 5w9fxQmFB5jkp82nez1Lu7X5QHGC2kkoceWSKUOqmBzaz+sXaxS+F5XmMnqYmuPaqwswi
	 fgdF8FUtw24uI5skMi7DfZby1EBA9Q7u6fcPuodOVoNcAJ71QKuXugvlWReDsuikvwwor
	 Z1uMNmyebz+vNkmn/A9dIs1v9HY6lGGyYjqVTNTEDqvG9Bwmm9o+PKNRrGx9jTofB+Icf
	 dAmuWsx4RS04vXqT7aRNT27n9vU5msafULhCp4gX8vEUW2W30qaRlLjje5Dr4muwrSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795851924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PvDPwRq8GAh/t3oB1kQXSCGMwADwrNJEuUFh0I6qC50=;
	b=bjsxyRqUiBIBIpkbxrLzckWMOwLw9AcIKF0FgQWOBdDHRTXECK5V5ImsKYTTYvsqXke7
	 q6FomiCQ3eOzvZ10N4lMb1Cr5ZSkGTAuQy3b5ByA772CeW6m+8JT3tz+sjwONSBABE1Mc
	 rRGkgeLfMz1PUEBiMrszlNmkCoLJAaiKbpwykPZ26cQKj1DAwYqkDIT3CvpS85rf+g5/D
	 umvhfY8eYcOdG3tWZadbIxnobn4KpfHUxIMjNSD3qD+uqA+5dZQoBsWuno5WNESR/7UH5
	 RRLrCoqWTnBs641Y9IYRNanGp5H8lca0zIKpS7E8c0VhBKZz3Fjuy8ZvLj0JfnUCPcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="estmKI2/";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84E606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC84E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=estmKI2/
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385c497bf94so9684624eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795851923; x=1796456723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvDPwRq8GAh/t3oB1kQXSCGMwADwrNJEuUFh0I6qC50=;
        b=estmKI2/Je+0ZF5XWrFZEGp2YpgwykMpcxeX38GmVypCWFASEa9hoFypIvfmIJYSnw
         6smocHz5iokydiXWZXuE7530lM7lqt75TOpc1ryPDmWroBlWxLILPzewYIdyKZweAYtE
         KZy18phuqxMNPs82wDHzMR8QxKS7JBekWAYOuxovjgjmpZ3OU0CW0ctPxc4IYp66mLwv
         rLcZo13JREPJv4Ws7fHpWIZJAsZyDeH52grgCePfwvZ3LZYsWZyNd0u6YmvBeTGoZYmX
         PMczF4txpa4XBHkwCHvLrU+8mXw1YlzBNlhPr20Q/u00/7B0YEPEm65Af05nPxp/CoQt
         f4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795851923; x=1796456723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvDPwRq8GAh/t3oB1kQXSCGMwADwrNJEuUFh0I6qC50=;
        b=BW5XD2laTt6CpXcVXzG8BZtYrIGL4b3mexPztZcFjfk/+cke/oD7djOrhI/K+7u0O0
         RMDcnIigT30epMpATEVQbTS3OkjaVZp7D9cBcxmHvcYFHu2mq9mVSxcHzNAFxaOuc7fB
         GcostBxptbDhCsWs8zWYEx01LPlnRcpdVyeq4+i3hTGwamdInKNtBR0k2QaqitS4Ci/p
         HDq6iokUIkX9YQ4trO/FHQhItNqlNJtAVKaM/GIzFVTAFKe3+60qKd18VXp07v5MgKq2
         PGS/Okgloaj5sNeO1VIVgAmHiXkQfmDH8TMRBmtieG9VuWRqZu9WGhu4Ehg7xf178dib
         M7tw==
X-Forwarded-Encrypted: i=1; AL+hErE/EQtIY/W52+kGpmCj0oK8aUSofwZG9ycSwafoC1yFSuwbu4pZb9gIi9Yv7b2Vok723j7WURECb8DgB1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dylg9B46pCtfl8h75cV/gtcHgUzNkttv/zDVMB2m67p5hNlMc
	AZAy/Nb/Hn690F+iQGId2pyffMo/1i8PR8H9bOL7Ap225VZx4audkK15
X-Gm-Gg: AZFdTZeOE3ZjUYFTwUfFoS4CvFOwaFT9MxyZzIzQjdrkrvzI2n/2TmBgkFNdnaORp6P
	VD0ljXJQsy4weWQf65F7vqmBdLe1le9oI8PPk7XV3bT2KOioegQAQYzNF7MOuqcDh306turGPIJ
	H6WpwXR5PxUDbJJg37l1IVh1CieDbX6yPgN1oXlXZG7B/mnGI+xUh89V0mLhpxxiBxTbRmGw98r
	0xCitlfl6rXYKw38ExTx5GR4rAEXmAcRqfvQ3drSygAjfxVjO3bn+oc49vrjGCdZuB+6xibFrBO
	nIXzRv2ujxZpgzFM3NFmFL1/INmcEC6h1C38SSlLtBVFw6e7bk4sQ+4yRfX9vB+H+VWTw2IysLy
	KbBeeELy/xqZCpvsJknZJvoEBVCblWLDoHSbdmH0s4kOMvTwE9ySOybgLHCt0TymGsMoV7mBs0L
	0ONWt8kt8A+sTJx9YqTkIwdu3khfoSxR4TLt6B2Bmoy3V+kW9IPUoxTlg6G87HAdd64NNxnpHuZ
	hzZd27Pfn5qXZKxm2BYf0hF/VbJjkdAf+6SR/L3d2qp/Ao/aZNmeH0UjfVfAFTYlL2X8sXt1g57
	0rzScqjkQ+01u8ImO32IpDKiX5mNuLLYY20vL77EX6gHmGga+GlyuQ6nz8sBr4G/tRGJ
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr25637676eec.32.1795851922626;
        Fri, 27 Nov 2026 23:45:22 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm72104322eec.20.2026.11.27.23.45.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 23:45:22 -0800 (PST)
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
Subject: Re: [PATCH v5 06/19] mm/swap: serialize swap publication before removing swapon mutex
Date: Sat, 28 Nov 2026 15:44:47 +0800
Message-ID: <20261128074459.34838-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbUYHBD+To2CGe9b5_zWbYVrYU6Mv-pxzhXEgB7r1DJrdg@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <030796dcb2086484f87e2250d9cf9a04fccf54ab.1795439990.git.lianux.mm@gmail.com> <CACePvbUYHBD+To2CGe9b5_zWbYVrYU6Mv-pxzhXEgB7r1DJrdg@mail.gmail.com>
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

On Thu, 26 Nov 2026 10:17:44 -0800 Chris Li <chrisl@kernel.org> wrote:

> The current commit message describes what changed. This is the most
> critical part of the locking change in this series; it deserves a
> better description of why this new locking protocol is safe to use.

Before this patch, /proc/swaps held swapon_mutex from ->start() to
->stop(). On swapon, the mutex covered publishing si->swap_file, while
swap_device_enable() separately took the write side of swapon_rwsem.

With this patch, swapon sets swap_file, resurrects si->users and makes
the device writable, in that order, in one writer section. /proc/swaps
holds the read side across the walk and skips entries with no swap_file.
On swapoff, the writer clears swap_file before the file is closed: a
reader that saw the file finishes before the writer can clear it, and
a later reader skips the entry.

That protects the proc reader, not all users or the whole teardown.
Users that don't take the rwsem still rely on the live reference;
swapoff kills it, waits for RCU and drains the references before
dismantling their state. I'll spell out those two guarantees in the
commit message.

> The function name can reflect that it is locked. Maybe
> __swap_device_enable_locked()

Great suggestion. I'll rename the helper to __swap_device_enable_locked()
in the next revision.

Thanks,
Lian
