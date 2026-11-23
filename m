Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400679;
	b=UD1yzWTxBAZ3cCXBpX8vr7yVK4S23+mbIvXosT5XopwgSxUsEiz+3ZnXHePsB/K918Vt
	 1bBts171LDd52LkewJtx5c+RjlQ0DhwIBrnn6Of+sOSRhur4iRf889WMaJYTjHBndYsLA
	 V+F+s/bgy2aKAYccu7irFbMwJT/4ZskumV5e2a9j61/oU21RPny03inVUO8pC1dVRWji1
	 7sxJ9brOVk0GSLj0uvMyvHe/fhKViqI4MGOXQvnupGdlea2HfYw4myhKUFcNW/enXbPJ6
	 QkrE12Ak+alCjvNmPA4C4WChWm5APsuCaCoxF8JECT3si/uDV2BT2shyCTl4M5aFR/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400679;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=57tb2/Vr7t/oaBgLBwC/I6C/d76kKekhB9lL9K1wXnM=;
	b=qAk3/uKFqsqfdq1+rSnBNMFZHDiE3Zy0PZbnJ2naOCLDf725UjYeRiqwPcH4QTwSL69x
	 uZ9RPA42kexqYzkbz3a7jZKN/ufDPmS0wY6Q7VmHH9ZzRyP60Fodh4dF/3K1Njnn1qv5b
	 b6i0OQt3VwSZFBDXR3D1MAXBaCUqjqTOnq750IKnnVj744WvbhTCze1UEtuZeD04YR/KF
	 NzsXQCYd18J1E4pn5bFxFGZ0lHkkwznJMttgD65rmppPn3fy9Ha/snLU7U69PisPX20k1
	 rigyaCz9UPfi5Ard2TPFdOlY6Yke+AxuFiuqmD24hQWyg3MjY0r9Ii1mELEy46+GOCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrzfS8jq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrzfS8jq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F791F000ED
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795400678;
	bh=57tb2/Vr7t/oaBgLBwC/I6C/d76kKekhB9lL9K1wXnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JrzfS8jq/ZdwzK7qWLGEcDSyB9OKqmNuSOS3xhsOwReZb6AV3RVA8NEiI4XXHb5uk
	 NpoLRXLnpKKSNqolb97sUYCWPyyPNs/FQlPVEIYcO6T+VqlKBBFuQIkjeYSA9+r1vd
	 uCx4NNqhngD/6HO7Jn/D7ym2JjRXQp7isD6BxQAAdtgJi4ejsnl8mFUDk7yCOAdJ3r
	 EIbPD3LqkWS8IfS15OBb2Ovqv9N2gDbaEVahpUWO6c8uVwTImsKqh3ujdnaQSUZQRx
	 u6PZFiS2I7H70MAcPkfEoXQjVw9psXSUGizSGzLlqBPXZx7h0YMGMwKCojgAjcQHR0
	 htp2KmbblZ12A==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f2f2edb19so260933985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErExc8klzrgHorhvllM/F8AWXPN9nd7Z6rKrJ4oqVeT+to7Eg0Zzb2FaDerU0WABABDeb0X3B9BO/ajeLw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8odU3HrV+aogGfczUHlMrVLG+D8MrgUJJO9fk5pIExQLBkNqi/
	GA5rrrsylARCqOnbkjwpYqtdVvaXcuX4qzWxLgtWOsuCSRJ9Hwv4Dsn+f2iJqp4XQBLhLbrnUyf
	i7F9VUXKvHtvyV0r3tVHtAqrYAx8jdUY=
X-Received: by 2002:a05:620a:269b:b0:93f:228c:5301 with SMTP id
 af79cd13be357-949bab678d4mr1820344485a.64.1795400677521; Sun, 22 Nov 2026
 18:24:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081403.216452-1-max.kellermann@ionos.com> <20261116081403.216452-6-max.kellermann@ionos.com>
In-Reply-To: <20261116081403.216452-6-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 23 Nov 2026 10:24:24 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y5cEBmdxz91WJqc1WJdHM=8_nMomMDO=D5As2tfnAMbQ@mail.gmail.com>
X-Gm-Features: Aa3M54po4ST5My0w1x9oemNrt7Y_OkpJAd7w1jCl5IIsGSWDYO39vxHRXon-7kE
Message-ID: <CAGsJ_4y5cEBmdxz91WJqc1WJdHM=8_nMomMDO=D5As2tfnAMbQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mm/mglru: reschedule between memcg reclaim attempts
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:14=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> shrink_one() can return immediately for empty or protected memcgs, and
> try_to_shrink_lruvec() can break out before reaching its
> cond_resched().  A scan through many memcgs can repeatedly rotate
> entries without giving other runnable tasks a scheduling opportunity.
>
> Call cond_resched_tasks_rcu_qs() (as the existing shrink_lruvec() loop
> does) after shrink_one(), while the memcg reference still pins the
> cursor and before reacquiring the RCU read lock.  Also call it between
> bins and nulls-marker retries, covering scans that skip every entry.
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>
