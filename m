Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117478;
	b=Fk3n+5yYBM12yFZbpyL1/UnvBElRq/41Jxlc6ls1gZuY/QyVCcNKpkoOBKmOr14jt90t
	 JzImf8bTaq8R7dfI5WwD+z6sR9n5ADlj5V0u8cEUBLCxrN3HP1sV7tjd1BjV4r3xHXxEj
	 EGRPdePjSTpIFl5bO63u4uXvEpCVvUKvmBOldSW+FnjyOKt3SX2a/89MKQRnl7PaKNE6w
	 glKPUjbUvco+QK/nlhLw5V/lvolhLXRcWei0CneuJRPBQTjDJdUT3124uKalCkh2Gh1f1
	 fzXKYtv/KkfXqcfjPNKX42vCcNMlLxtBz4CC/h4z3dDAa7+hRL2ygQqO19ciZzxapbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117478;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YKyrivJzo+Mben9cmzx8JhnXyAay12IuEg5j9gR3E6E=;
	b=XIrX+Z+GOSSjvXsyMKgd8CgCKvLw99OYeUdRXt7W4G3E9oXim/INTS+ROT52Cqq2Uz88
	 dnvczgbVzX5T+cMOzUMoVx3/KurUmfrV5T2A9msrDLOapRrUjm49RP/0a4Z62OY5m9eoQ
	 U7ZwgoLWlYlSO38GrV0H0EekDxtkj2W4uN0p9pYUAmnDl5Y0mGRMYI5yE0U4rJRDE5PYH
	 WNgZ8bFJv1YAR/RK/RWx8gJ3HwLG56sbRqTeUxuUV13y5odcZgrX/1bMdd/FhEK3GW1Y/
	 fGQPVVv2kILzCItD5Y4fg7s5+lPfEGjGU/AigLYrcB+U3XjSOAUe0RgeyKJfALI8EuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYT5UxV9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A19606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYT5UxV9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEAA1F00926
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117478;
	bh=YKyrivJzo+Mben9cmzx8JhnXyAay12IuEg5j9gR3E6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VYT5UxV9dN+i3zJxAoQ8miiBtqQbPBOELIeJMtelU4FWbjV7eXta8HQ01uZEdh4EQ
	 hepC1bPs5K2YTakyR0GvxcH8SJC66O4nsxb1MTcfJIzVjuO9C87mHIsJn6IaJkei4Y
	 fUmECLfL7BU9CF+Jan88vX/IweN6vpAmlfKjwqVCaPbMp2zLmNfkoy/TXDYu3GhjSy
	 64Hz1b25H8HYOoMu5QOUSrFNCWZKpR8KZo2YTM/hM7PCb7XYkm9JlciKJW7Hwpqc+7
	 igrLVO4T6N6cXC44KzjusVQT2kIUare5neNQjft/xuCtjKBi5jTxbHm/UNr88aopXl
	 /q+DTwC6w7OeA==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93a40a9a01aso166892585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGBxFtEKloI2VxAjx4wUh2y6D0Un9B3rOV487s4/AESh53r3cLJxrmXPEbal0tXDnssjN9gnsHwq7hbF4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/byEnx5hyuYg00CImLyOHIixQZBgxUD1AuNQ0R5THeTkQxtDsH
	X7tK7Fw4ORNbktgQ7RUoKVc/c6IrGpgFrNAlVam6F05mKXckOMFspNHVeg+VWKBxTgiVKfLa+oW
	r6Fw5vcLnuo5XZYcqatTRsGlVXH7ThBA=
X-Received: by 2002:a05:620a:261d:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-949b3841debmr323824085a.39.1795117477060; Thu, 19 Nov 2026
 11:44:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 20 Nov 2026 03:44:24 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xXdPsnHFX6SUff_1vbsEmGCHdZcXAmOumiN8EMar+KAA@mail.gmail.com>
X-Gm-Features: AclHuK_KKF5P4wFEq4Ot8gOVbDoJlPrF_Qs2r1floMy82S2ahYTVnc8-alAnTWA
Message-ID: <CAGsJ_4xXdPsnHFX6SUff_1vbsEmGCHdZcXAmOumiN8EMar+KAA@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] mm/mglru: make generation page counters atomic
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> No feature change, convert them to atomic so we can update them without
> holding the LRU lock. A temporary underflow is fine: readers clamp a
> negative value to zero, and the counters only need to be eventually
> consistent.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  include/linux/mm_inline.h |  6 ++----
>  include/linux/mmzone.h    |  2 +-
>  mm/vmscan.c               | 26 +++++++++++++-------------
>  mm/vmscan.h               |  2 +-
>  4 files changed, 17 insertions(+), 19 deletions(-)
