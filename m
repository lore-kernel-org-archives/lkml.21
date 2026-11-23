Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397760;
	b=nkwvpM9aFuUz0xNj6qIEL5/vAqSVv10lgway2baFReXypme0j1xYIqe9jfup/9MUEazM
	 1UZgztml8OSSuNF8BIBBuWVkWYxu3v+sh/BOT3BNsgPqd2Jkfup4uwAXgs5IqgWGkwnXC
	 dcPLWcL6Fe2T0E/TsWEaTn4E4ZsmMKsS3jAJD51xTPqb7A7DATTD1/8lwXk8yfYmAgiYu
	 9N7mhHE78GW8N4fYakXSPRhe9QDy1MK8g+2kZ31KuICNyfi9YJiCzssZI5gqn8OdJZs86
	 UcrN3NrtjKVVnq4rGdS4LE8uAIu0/YYOMEJoXk7phaLzZA0HkK7D2g8rj3Ee8OYLYEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397760;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LtCu/Lv31KKfbMFIllslMcSrDnoqZxMzFxkbUKmBWlg=;
	b=jFlkM0ei2EfUvRDMjSpYwHxZa3KmtyBD1La8M3CCVxCqqtnX8U7yC5dlo91I7UOVDW9W
	 z/+oPfJnOfRshCC6vGAhWOvv0/tfMdZp649uQYC6L4MJS28rhGgNluxsVjpdaQwzhufI8
	 9Z5cp7quCsHbD2fnncSt1lHLg3nKR+gIFUTNEDMgXtmWu3XvJ0rNvweA+CkbPdqfcV4Tk
	 XYm60UmUIgaF3Glm3iXEgtSGX+w9NLoIb2iPX2Mm2ycW9PcGgH4uce5Lr+wzoQlfBLxI/
	 8RDh6Fai3mIEySZRnTD5tlHg35BzaM81ZOCVx1K2vpPqvpvCEya1Y1M8gc9gvuPaBKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDlnfJv+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDlnfJv+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557101F0089E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795397760;
	bh=LtCu/Lv31KKfbMFIllslMcSrDnoqZxMzFxkbUKmBWlg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iDlnfJv+Z9rSHd8GLoqfvgkwVTlx53iufTvvD1pHLs2ng42geuqVkxpT5Kp/tTTyW
	 RjkgvdXFDsSSJmhS2ex1j6QN7ONvTnCDL89BErBSWbjAQC9rv8K8NrJSVsPzJjlXUa
	 RjvNPgluwksPzX6TdJn4l0n8C9SiGmDURxp70FErfFfuemISKxPM44v1qiCw7FjTV8
	 LlHrqbsHm9giby2oFgQWfzrvSNwHapobAr/VMZCjswN/qW1SgGWJ0lL940f1NjeLUG
	 QqGMoA6q2RTOimIGb9AczqNtGeY26CzsI5mAw0i+vrZ3RoZeICd8bSIt/GA1Y8XVqa
	 4EHLsvPoaZltQ==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94961bfe1a0so184898685a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:36:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFriJibgQNp6Di9dg8vd9+gFgVMxM8eVNlyAv5lVLBunxzd5qucvqRlOekJ7dgTlxX5597QTSWdK/U15LU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jNMpftvtVWF0X33CYv3ht0JbbupZemRGtDOBBOHJFX4OlZ9k5
	BXdTf/Fv8NiL72HeTTYHFyooOyDp7HqsHc/2qwAheCt7FZJi0ilqqbqvorli2HPC8PtKIL4XIZb
	RqzEKljcBp6P8TIqORrXAnDKUHMYbFxg=
X-Received: by 2002:a05:620a:838a:b0:949:3521:b627 with SMTP id
 af79cd13be357-949ba9ff2b7mr1644030785a.38.1795397759398; Sun, 22 Nov 2026
 17:35:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081403.216452-1-max.kellermann@ionos.com> <20261116081403.216452-3-max.kellermann@ionos.com>
In-Reply-To: <20261116081403.216452-3-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 23 Nov 2026 09:35:47 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wit5jKGn4L-NDTqzxDRNS8s8-FV3g0m5e6BOcG2Gx2Eg@mail.gmail.com>
X-Gm-Features: Aa3M54oWK8aP7uwb_r3XD3rWcrMQ-9dwA-s2hQH_XdkfS1nJ0lq-9viUM0tfLcs
Message-ID: <CAGsJ_4wit5jKGn4L-NDTqzxDRNS8s8-FV3g0m5e6BOcG2Gx2Eg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
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
> Preparation for the following patch that adds tail caching.
>
> For simplicity, hlist_nulls_del_init_rcu() is now always used, which
> is also valid during rotation, because the entry is immediately
> reinserted under `memcg_lru.lock`.
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>

Reviewed-by: Barry Song <baohua@kernel.org>
