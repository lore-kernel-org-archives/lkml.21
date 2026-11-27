Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795738450;
	b=chNTBy1M4F82jfLDsx/2KGTopkhjV7IMHrVgDdZsL6kq50CbAh4oySK9cpmNylwDdr5+
	 B0V3nO3p6VF/PUPztrNOKXDiNXdcDMkBtquTrsskuR8bsZY2ru/QpGF4XZDZvGXt+jG4P
	 MQ/pFhCJY0JITC26GRV43mGsq8Ren1fjV1lRi4+AlFhrj9rv4RYybdPAIy700XhvLwQoG
	 6BJutFppVyMYsov4+73MMqxBm4f0CCIQZF75AI4AvY2IDqfTZmfye0pauWGq7IhlDyJIv
	 w70IRv/S1BV+mBwI2+UpTltdEgBlF641qDi+EcMneWjDc+izjVnj7cp5rqKHjDszclA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7W1ie3m2NPGIZiB/tNvKaLuy4Fpgr1mdDIko48ejOhw=;
	b=ezyXM7NVQHXnBTff8tZNJxUXae2sCEd1aaN6usbx4z3gTsLL/8H3p6I9jOYcPScDubTM
	 OYA5riqeux19BCh7iPWyBCXVTe30BwGT9GvPHdfBMNbYBSG0ltbuTYuSn29S6WSTJf1a+
	 DNP4r2VApeX10tEHZZy2twNDwIiIrrj1dapc276wowjPhbV4jEqKaItKD+kAdjd/sBxzM
	 QgTqCgXgdK4OXhPBopbVWap91CtzmjhToL5ndEIMG3IGRwl5eJcHvjsHE8KBhlYj2MrPN
	 6549px3T3ZJEUxln7WwNrwSQBU6DtNCo0ukAw0hnnPJDLRrhcPL82pAFvWnyrpoKu7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLdIJPOq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD57606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD57606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YLdIJPOq
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3863db981d4so10534393eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795738449; cv=none;
        d=google.com; s=arc-20260327;
        b=Ou3ORXp15cTF35ins59JElBXotiRivgm/X5eKf9pq4uY701XJPPisEUUJGbWxeVeXY
         2aBzfSPhe4zCBY+mZMnQtK9EXjMTqBwV+Q2S6xX66wXb8cV3POP/8UxGfn3MgjkG6m7C
         DzGVzIm98t4g/XzPykMANGcM7tQ18x9sqD5Kx3QfxNPzVBD0Fj5ITNjUKULyDy+lU2Kw
         s3ZaI+nmwFmFNkyRyQBG8i3jd82kOysOJauFQnLB+ClG1Piq9OCxkTef2ymyByMF6g+C
         Zswao/aTZzs+rUTBXqUOFwgOsBxdjTsvGhR6odGu8JLidLE3kB5mRP3OsufHGI/Ke7YL
         4Gqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7W1ie3m2NPGIZiB/tNvKaLuy4Fpgr1mdDIko48ejOhw=;
        fh=cTWeSmVilTHCsiNlxNADC1tslKrYATKwNw09sKC3FYQ=;
        b=bcarUSIsk1FpF4K4raF1DND3VvbC0SKgCWC1MBrZVeYSoco3cfTUv+B8PYl05MrLkd
         mo6CkF1ajVPVlwp3B8xtRs9NqTfqdOCwAiCYSBcYAVx+QDVs1L394SU+BxbUvubjtlbn
         qgmyfRA63XRGF9VE/DuHiZc1dkBVyR9GLNdb+f6IbSt5kgJqA8sOeryCXn0gaY28kZCj
         KiAas+4TkiG/r9lQEDD7avP0qswBViW6A5/R8jGd/IhjjNTunRaD01+s2sopJ+jSG/yg
         fs+LLQFazrcdrDgMbltSQzx5aAuImiAkn+I+G2RlHAPbyuscaqAREIYF84A4q3PwFVX3
         1yjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795738449; x=1796343249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7W1ie3m2NPGIZiB/tNvKaLuy4Fpgr1mdDIko48ejOhw=;
        b=YLdIJPOq5O3tPOnrGv4wx9Qg+7hyanVxXbwoUmOirWDxzLk5RV3DZOM3Vt0/I2CyOt
         9F8ARjz+kprXlzR3IQN8WMbWXCh9kciV+OHdAS1An384kRKZiV+UqF05G1ItO3/jM136
         q3hdiZ+Mtyv5A0N1HaYgqvOuzMgzSd1gngPvVNZsHSxwSnmFG0EWP8SNoeOweqevRiel
         USxj5muOo85LKeiAU+SrysP701nk0FnUFb8Sjf85e7wT+d9pYo1bwUZXrjtDuLCZCefp
         6VLy5QS+xBxW3jb97/2JZ59R2obKZFogqH7DBwS6eIZUZHATeVk6eDNBmPI1+0005f/M
         UZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795738449; x=1796343249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W1ie3m2NPGIZiB/tNvKaLuy4Fpgr1mdDIko48ejOhw=;
        b=NhM1AfelD3p0JRY80C8d7Y0nJ0jR8JNuFftJx9gYgwegwfovnmvnzsMU67efKOOGms
         52GX+7LBeh1w+Eiz5meJpdLF2OMaBHs4udlzGNlO/6/zqq8YCDzEybjhO32hA9fo6nL5
         3/rlxcQwt6y/v2x59dliwOjZ14aRiDcBf9wEE59txWZu8eyJhphwOLgxA4jQYKQr4lS9
         q6Om3p+lgi+ZkbZDs0xIl0jR0I41pTii7r+wn/cAmLW9y4QT8bzmpeyjyy4W3L/ocs17
         p0hJp5odI4YXHlxfMaBROOTxxD/iuR9OjueVIrLz0c/Gs+kCIgEVqEMHMb+UZ1kdun0/
         ozQQ==
X-Forwarded-Encrypted: i=1; AL+hErFbjUdA5DorVIi1o+6xK2C0w85WLTc0j6M18gA8ZRp0sPX2caJ3AMeA6eBb1uGeFN5JIC/z5qO9uAKpZWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XU24bjMIjUjg4BBCV8mcb46GSMJzS69iUVJ0nI3o2s0B5+lPF
	00dOMe5/bxjQBcoMxUmxHCAhqnGaxJ57KXV6HwsQ2P3XcyXtE1G4smZoUoNcG+ZLbkFNjE1d45D
	OuGQG6GUs+K5p9RNs5k0dKP8BU6YmXT8=
X-Gm-Gg: AZFdTZfH7sZkD15JejgH3LU0ZiW67Ui3kIjP/5pkfS2UrpbkSQizNjcbhpGD0hKH14p
	4mLlMNb+NMEDnopNbUN8yufDaias9T2ncgdMBiRnmWOLrdBQeu9uygbks39UUqOSdzjUOWZdQbC
	3SEV7q86xCsaSY9ohMDmQ6swGOCzN8k/SnMmOQnZouBA6Q+ACOchCM63RkuTG1VK8xR+1HrNkAU
	VBveE5SdYlsjWXREVOS7KRf+Dj7MPeeWcmhznzZYAEcpiiTcFwvqvFNBQakWVJlVzg+BCOlUvc0
	K08I1t+gKcV1nyhgMbPEj2xNB67p9VbAMXXaFF3tsNaicK3A8lpXNtYOrv9SblkKH5ASwEvMGNt
	xmODUlVA6PjZXh8Qb9np8pFwe+dJ6z4DIv0SvgsQ=
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id
 5a478bee46e88-386b2ac2832mr13850733eec.7.1795738449192; Thu, 26 Nov 2026
 16:14:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9a97a64f7e7aabc668499c426a2417a77d13a2f4.1795587203.git.zcliangcn@gmail.com>
 <4ffa6613-119b-4eae-abbf-26134bd60177@kernel.org> <CAOny8psx408zqVv1xt7DHN8yYkQksjKZFDQCJ+AGFB-CDN9SmA@mail.gmail.com>
 <3ee0f274-0089-4450-9888-7be659af9d63@kernel.org>
In-Reply-To: <3ee0f274-0089-4450-9888-7be659af9d63@kernel.org>
From: Zhengchuan Liang <zcliangcn@gmail.com>
Date: Thu, 26 Nov 2026 16:13:58 -0800
X-Gm-Features: Aa3M54oNeJXp-qLCgoFIGjayWZczBL3897rPIbXQX6titnmlYvM4Yq43L2upceM
Message-ID: <CAOny8puwHRsnFabwkMMfgkRVHBFbXFYC3ANweN5Odr2wFdvrxQ@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb: stop hashing address_space pointers for fault mutexes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Davidlohr Bueso <davidlohr@hp.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:17=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
> > KernelSnitch (NDSS 2025) demonstrated why the address of an
> > attacker-created object can be useful. It recovered an mm_struct addres=
s,
> > freed all objects in the corresponding slab, reclaimed the slab pages
> > with msg_msg objects, and thereby learned the addresses of those
> > replacement objects. Here an attacker can similarly allocate and releas=
e
> > hugetlbfs_inode_cache objects by creating and closing HugeTLB memfds. I
> > have not demonstrated full-slab reclamation or cross-cache reuse for th=
is
> > case.
>
> Right. Do we have any gut feeling how exploitable this is?

Thanks. I tested the cross-cache reuse step. An unprivileged process can
release the relevant hugetlbfs_inode_cache slab and reclaim the exact page
with msg_msg allocations containing attacker-controlled data.

Thus, the recovered address can identify live replacement objects after
the inode is freed. This is not a corruption primitive by itself, but it
provides a concrete heap-layout primitive for a subsequent attack.

Best,
Zhengchuan
