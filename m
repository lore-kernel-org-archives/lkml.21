Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706828;
	b=Oh3Hbe1dR0jszKe8gQGAge0sENfU0bMFWjqZ1XpFktKQ004p2HyC/3D6U3UdB0S2SOFQ
	 OUE8BN9TpUJt3uKjKbn1+HBoKMgWYW5gomMzebnlDEsx/HyZHseTAJQ7tEzpq26NQfJJD
	 tTSSCjUTMjQ+NMa+gc+MsLjvkyP1eV7Z8Zvt1ZnpwV20UaTdOtdiw0e4igVDEVGFKpziN
	 Vi5kzTu34c6Ai4IB2vq5Tsx+R2PGiYeCrbDlahI+3HuPpb1ik/wXYcayN3wV8F/hgwn/x
	 V7D403VSn/h6jmNur9/qOAy833RH71rFwIr2B/Oo19m82VrRFLVOMeEhoV86TF52EgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706828;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yuJqy0NseoGTjiNdlXcAFKErbfQ+Md0iYPLbsmzKFlE=;
	b=0HpHWZ0qYDtxMhNwzwOVuKazQ9ayU4nvsTQtGcVFkljqdAH0KKnNFmcrvrZj5nyJB59q
	 cH4kpHh/pRvzK8CGgb+g7o49XVTl/7fkh5R8sySX7q/TxvvR7K4yUQQoIbckQtjfZaWRZ
	 0P9ahBGWWdyP/3xjGpa5gQ7eqfumfa2SZn1LVpTk84Dp0Xx89X0eJ7LELjReaZQRUDGmB
	 wvVYXI293e73osU3qkY3l5blX/wYQ/1SnFeZRMTrQmwV3Gr9CIoi/WEthaV+7Qfg68Phh
	 4ZbwiFhUD6UKkxyujBCMm8J9BrIkyUGXMDaoL4BJCgEWusOIHrew3BW3EAHK6tdCJWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F4BGsX4w;
	arc=none smtp.remote-ip=91.218.175.21
Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1569606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1569606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F4BGsX4w
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KbVedbyeDFEeAK/XvGiJ+Oc2ogwQltzRQPHWkSa26XU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795706825; v=1; x=1796311625;
 b=F4BGsX4wltLX19n0RQ8e8Lt6Xa7f1+aUnz+D6fm9t8CzdvEHQAYwU+IaId0QNmsBQAtY6/2P
 u0mi9Zje/Mxd2bT8bJP8x4XrSBVRCtPhYixoPR9WsY19bI+h7mhdfQbTumZkt06dDUk+TSDh4Ge
 Y9/YgJmw2wdECDMDiCLOEwX0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9864cef7e22ac7f;
	Thu, 26 Nov 2026 15:27:05 +0000
X-Mizu-Trace-ID: a9864cef7e22ac7f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 07:26:59 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/memcontrol: expose anon and file reclaim statistics
 in memory.stat
Message-ID: <20261126152615.GC738059@shakeel.butt@linux.dev>
References: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>
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
In-Reply-To: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>

On Tue, Nov 24, 2026 at 03:51:27PM +0800, Xueyuan Chen wrote:
> The aggregate reclaim counters in memory.stat do not show how reclaim
> is split between the anonymous and file LRUs of a cgroup.
> 
> Expose the existing per-memcg scan and steal counters by LRU type so
> userspace can measure reclaim balance and efficiency when evaluating
> reclaim policy. Report the same counters per node in memory.numa_stat.
> Both files report the counters in base pages.
> 
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
