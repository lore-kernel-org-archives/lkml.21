Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469027;
	b=K9dfJDzL/dpq+1Lj0ggIl6MR8WZKeOwkcluwp7GGHUM+z8E0Le1yE3lJ4j293/tsSmcz
	 PAI4MnswJrca1gh+noSk4yuAUxVIBFIYX356MbBtdeRVwrZi3UsZtYrMUYIi8jWriJNad
	 UNVK7nPMUCcZthj2ORo1lYBDq1SzmfTPyBuI57ajd6lipClmyophXI2FWwpNDGYoO+dhP
	 jCHcYuGsl+QZntuX9IhpW57gNW4yjRjxZO095THYiRcmifJoDZXNteoxvq6A8xbK4oton
	 NceY3T5XMqmgpL/hoVPiMQUl/1HW4Hg+H/e2Pvsmv62pkd0cTxK5I3l9Ks2KBxkfSbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469027;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DVAt2we2ngEUNATOIEmS0h16G43bUM0UOuNkbG4NCZQ=;
	b=xv2ir+WhK+H9ILsHOo2mqgnAZ+Wn+AmvqQE9ptNIIZgkY+uwjN4/zMnUSGxGmyOfPncm
	 yRcr86q6g+jYgqCG5tcD6OUJsSjy6HqnGY5skUqwc2kcedBF1dMLPnzwheq70DPhslZTa
	 OA1/L4baMpd9c9uVpezBzZ/pOvNAfq3PRYxglJS/y8kB/S4s9AoSgwaB8rXdc3UfF5lri
	 xx6c0vD7NKlyvg/a1RoylaHEx+EP44TK7FFPxtn+xGo8nBWuIgr1rQdp4FBcKjlW4Xs9n
	 LqeFIBm3tSIx7WvK9ja54YUlJl7Hc2oAFuFcW65ydUM/0oLAGU05Cl2CwlQowLXBx4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k0n/Oo0m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13947606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0n/Oo0m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4F01F00A00
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469026;
	bh=DVAt2we2ngEUNATOIEmS0h16G43bUM0UOuNkbG4NCZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=k0n/Oo0m66vECJjujn/GknnMZ+yIIg+csYryLX+vjqodMeLUfYzEAAZVFOrB5LhCq
	 ksAyGgAq2ydka1hTH6kri5qjX3qU6Hzpv+u4hbjhUqURQfXlA+fqB54x8+uGiYRzfg
	 ANqQG7OxiNz13w9yTnpKcyTpQNxpLUJBpfAH2T2nGgFro8mq7n2EivgDG5Z+sitYd8
	 zTc/4Hsf7pQdbSkY5Zq6i5wL0oLlNpU58bn1DM72IrNSYBJcQVY+EU2/jXtwg3oe60
	 HJFrsVnltNeV/uzg5jxR01IowHNqZzFoDneQvAjUxnX9j09UXDTvRPOGilQacp7roc
	 LjAR8mT8N9n1Q==
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9495d543c42so396302285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:23:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGqN2ImEasbupjq9FTSqgM+eIggLb0Pj0wCqlj9yrYyVXJPLUrtQgyp2uC3EMiksW048EIatMBu83xYgmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8anlk+TF3U4Hqw2nQiYmeqGx7piSU8EqR6q7Zd2Cvu6ouelVCJ
	omgHAAGxJCZh4lxZOVqzYNHp1G6wtSaih8DMPM/3IplrYEJ3ormgozvVkVRmaRkQVgKwdHf7bmE
	jk8r12E/yxb3VCbVogMZE8LU+TJEuyN4=
X-Received: by 2002:a05:620a:1b9c:b0:93f:643f:4f4f with SMTP id
 af79cd13be357-949ba9ce6b9mr1992217985a.50.1795469025645; Mon, 23 Nov 2026
 13:23:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135200.4086519-1-max.kellermann@ionos.com> <20261123135200.4086519-5-max.kellermann@ionos.com>
In-Reply-To: <20261123135200.4086519-5-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 24 Nov 2026 05:23:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z8RPpAmASUdS3hw3DWC+6VtYQ0yKVDamtYkM4dND5SPw@mail.gmail.com>
X-Gm-Features: Aa3M54qcTL8SSAjAQ_RVHmHSBfar4B1hbLxQu69vEWbG1NZwuWI1C1D-CZ5boWY
Message-ID: <CAGsJ_4z8RPpAmASUdS3hw3DWC+6VtYQ0yKVDamtYkM4dND5SPw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] mm/mglru: avoid redundant rotations of young memcgs
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:52=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> Concurrent reclaimers can request promotion after another reclaimer
> has already moved a memcg into the young generation.  Requeueing it
> into a random bin again adds list mutations without advancing the
> old-generation scan.
>
> Therefore, skip `MEMCG_LRU_YOUNG` when the memcg is already in the
> default segment of the current young generation.
>
> In my micro benchmark, this increases the request rate by 36% and
> reduces the average duration of each write request by 27%.
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
