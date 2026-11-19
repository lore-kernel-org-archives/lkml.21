Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087665;
	b=1SMNf7nyfFyWrsLJBpaMey+oVVyArbrpFAgqfKhZNhQ5KEIXrIFda+Jk52MyYKnRiGxg
	 5C1Y3XVsG70GhOXLzFHPI2RZox69UyNvcHk33vuNS5IvFCjE/RvSfgps4KV806qHzAqnz
	 +H+41J3ustz3FwQNo4a4/10ET29TKKfby+sb3yfVjMMAyth6/LrzBxi7AFJjDRZJNwjhR
	 m6E+a8Y5Vuhz8lAoEd6YyMtUi7f2aKiyOzvx8X8bLD/aYWmOCHmxnV+CUv/z99wgTA4wb
	 QxTNoVKe9uJlus1XW/iAR2T+1wRO//EmCdAmEXbhwRHCsv9Xnj4nA88xSYLB9acl3IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087665;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C10/UwY0vgcLZUDt7ami1ayVX3pRMgH9t04Cv6vtLks=;
	b=5hdgLn60kP4ZFSo6RLWnunGY/JOd9YhB8QR/XUaDzoATOpR2x+GE3q5WYDv+NsNqw3ZG
	 YDRnISs7lB47PHyKEHd0sKpewRzjfibz3oMM1OHEkVB8li/5SbgKqnAAUb0TtRMrJ7+fi
	 FJsthTZ3hSs8QqrcCivM0CDQH0WY5MUPo3RO+Vo3ZtKgwghltJVvX+THpIJHjuDyhv47X
	 ievzF9YDmVMGKpZMnYIkfhR7PcMKNKACTRQ4xmQ+PHXmQeHTcTy/HWMQ8G5gSRGTM1GSU
	 nwg3uuyAiT6I/sOKhLN+50iyicIWTjdU0kCKTUPbHIN56EDIopyAsS7BbDDXfMcZ4Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lruVJiHg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5752A606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lruVJiHg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60F31F000CA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087664;
	bh=C10/UwY0vgcLZUDt7ami1ayVX3pRMgH9t04Cv6vtLks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lruVJiHg73pqTOwyz8gqmX3D1HROGYBqLpjhYFcSkRpKTEzXFRMHFFhEfK/XR3K9x
	 /9+iW+N3LMq1NFcGojQb19LyQXUIlgdDpvwbzDW8gDN/nTcOHe2IyFJkCGA6wE99aH
	 xWn9LF77gMU1rj42itXkMHjOoQsvk9qZAmuK5TeMCsJOiN7G18HPJuX0K015bt3LGo
	 4Nf5D9TVWjc8dR6BHUf5EJ1Y7AaOmO9KWBEQXy5YNBSYb4gyPI4sAkVxxnH1Lu/Y8p
	 LXNf6xR/wctV/SPhxg9BSLDmCRthuYJI1OqPLg1YR6FpcG6B027ylyQzCi/5AakyWy
	 HFhpOnU6xMLaA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3750048a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:27:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGZXI1RPTOAN2j0TtL2bOhh1xxBwyG7dgnM3mI4O3ue86IgizjESEw2XvbqUAZnPJs/UWVNZUyINGK9fv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kOm6TZlyum/LLhz3HIuvTXlLVwNNqz6CJdnSYby8DTqVkbqCK
	TiamwEQ6jiWYUJa1EC/S448vcczzOzOWx1rbq618AjneZnxZ6ER4tdaXYrHS2wOHn04oexEfTaJ
	NGJAmvzRW+o2p/HrtHzLcH1Nv1NaiSi8=
X-Received: by 2002:a17:906:7946:b0:c50:d92b:6f40 with SMTP id
 a640c23a62f3a-c510e2d5928mr493622866b.20.1795087663605; Thu, 19 Nov 2026
 03:27:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119065652.116074-1-icb@fastmail.org>
In-Reply-To: <20261119065652.116074-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 Nov 2026 20:27:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-WY1s-4rk37QZ1TKchby_+n1LD44tPiEVWPPQsVh-TUQ@mail.gmail.com>
X-Gm-Features: AclHuK8gH4_BlZQVcilNEIdLYT7RBGGX5b1cm_i5R1sumAtwAaGEqiEf_qqO1PY
Message-ID: <CAKYAXd-WY1s-4rk37QZ1TKchby_+n1LD44tPiEVWPPQsVh-TUQ@mail.gmail.com>
Subject: Re: [PATCH v2] ksmbd: omit the DACL flags when the query omits the DACL
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:57=E2=80=AFPM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> A client can query a file's owner or group without requesting its
> DACL. ksmbd leaves the DACL out of that reply but copies the control
> flags from the stored security descriptor.
>
> The reply then has DACL_PRESENT set with a zero DACL offset. That
> combination describes a NULL DACL, rather than saying that the client
> did not request DACL information. The reply can also claim that the
> omitted DACL is protected or auto-inherited. These flags are wrong only
> in the reply. The server still enforces the file's stored DACL.
>
> When the query omits the DACL, clear DACL_PRESENT,
> DACL_AUTO_INHERITED and DACL_PROTECTED from the copied flags. Preserve
> the other control bits, including those describing the owner or group.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
