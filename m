Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817667;
	b=jCgWdlqZXsR2TeF/YrFbGMlM7GXN7PZaYJfozhn7KU6hFIHal2xZtHAD5YT/kX6lsNG0
	 BIXLmk5sm493t6JuNuVTKSU8k6rNPOyvKf/O5lvG8vVtgpZg15GuUW1TUUYmbes10cpMD
	 AnsxEbmZN9l8J8uCyym/qH7L1zHeEwTLXy2jrjxMT36pzr1irDh60KSqAYt1ILnuON58V
	 6wCvGtM75V7g5DXn7D6Dx0rg1YL25+rWuQqVKv7j8YxqOyRmWt4QdwVHXASl0A6tFMaiQ
	 WW257U2mnHEv2a8t6gdHv3WNHHK6/gqc7g9U+c/p0w4PJrrFBWXpblaBNhzcn2LbaMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
	b=vbFAZNRKt7Yw9D0MQlc9mIWt00kglUmUPnP/mLh3g3YBlzHQEjITSH7hQ51AHl1HPgxL
	 yn/R7AlkaUjjRsFxeDWz++8265hJ1m7Y1lW/pLl32sLosWwPNKcLD5+2nQ5mPXry01W2D
	 3zMWPbFNuhv1WvsKsvWXxWgNObJvO0FhJ+K2usLL49w6PaIRPBavph+s5e1TVn+Hs0eoQ
	 cQEhqqYE35dQEE1fEb9BP5ilA4gnelbbeJcOQD4J+S3PBb7B6QGNWF46mHs8glRTFlCoE
	 sce+H4Ebxevng9CjDkDGOIdJlc0anMW4qv8rsogfPxinWW5Wxp3orPm/a2NkSd1WDkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896E606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6896E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4d07494b0so92599197b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817666; cv=none;
        d=google.com; s=arc-20260327;
        b=QSPerhQO2j9BQmsAa3mTvNk4I1OswXgnXOZMjILhNh0GOIg+2B9gckUG5lVar3J+U9
         0qXRfuXTiljtVF2m8FG/NIOaltxmOi7HWkcmjndMgvWL+1jVEUD83Xr/gOkBvviCPgp4
         ZKxXViWntgG5BKQpNEk5mfnpfOWx6f7q5GekY0Eo5EH0rO+870fOn2lP8Y5Buo+NdXvH
         Jwecbcn8lp1D4OoOqz6yNlgD5sTd8YW2nqU8jUMrPDjpCZLDlcp1O0K4+o2UehEtESwe
         TROD4Vc7cwqY6nlcagnuVcGVBtF1qzU9Bf9//FfxmXa5nTxWdF0cWfKBLPxMjf1LqA+a
         jonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        fh=U9oRvA4JbZudOZ0YdGWig/uQe2pynzs+7qDuCJzsYZw=;
        b=ND5FHj58KQNZrR/3tOrQCvkpU8IgiuO7d68n+0o2ervhpmExEIyzPdV5NGz1m1XFzz
         h3hOrAN6aFTt4zRC9egsm7zxZm+PHdwdmOrq3omAAuFSy53uLZHc7cZx4RvKDdNk2Rfm
         QUdZDDKwnpPGTWgeQFKUR+zsPv1mcwNdp72+tySDNQjxL3nMCUOwx1oNhC03hHXtQq4f
         +dUcEDXSwqJxH8Ac23g4H6WTbiFdZlsdTccenxOAjJOWO8BUlz6AtNX3xrKTu8Zq+FHF
         B8l75KIWHNG6Dxv+CS+6vb+UoQqJyASzBzpmki+2FOr+PfS1aQX4lQNOdmuxuR2YVeob
         CfWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795817666; x=1796422466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=JwXKkOiA1hHPevvY6KlGz0H49ngjn7RSbuIh1YPq3ZNFaYUe1nazCmKX2br5ZXNy4J
         lrV768348Q3U79vKmJySW2rQ/MkbDivy3dmUMfBNwTYOAPAbhoTrWGG85bRhMU+mxDin
         Q4jcdvzBp30jHmZqt0LjihCvbPF3x7iSxL4xEcataneXHFNDE2OARzMZQw8C/x/OLs4E
         LSe4CdBiFOxtxXIA6bELFzV2YiTbFfJtbz1i4xQtMCPC5/g7joS4/uxbvwPx90zjmTTM
         CE36Ip4C4zEdmHSCsHw+iyU9lpY7XuHS3y/YQZpYEZUXtfn6/OBY8NePBmmoQXkwJn72
         L+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817666; x=1796422466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=jLfCv+YlmZHUJ81J1pLvXfLnB9B2v1qnnq2WEHoZZspZ7CplRIRsvA3AI8TbAkDr+i
         5gHC7TQahC95LVlqBmQl6f1USMbRXwDYtevL1CPlXezAeuuvXMgoU3kymy1pDRMKy0jW
         gXy4Q8T+WnUA6ZKqvJmZNYPUM/aPlKKaOjYWmeFxeS+uXY56gpSObIXnTWPGDacXlYj5
         MhjnOm/cds70t8sFAsGO4sDo2nw9e3ArT1M39khhzq3ru5OV0RxkkfCbXafsZaIQekkW
         iiqbOHn259Aa9CT2v0+DGB7W4efoQ3+XmgnSrB/IcV788QxqI+kuR1CSt3rbpQdu+SNG
         jJ/w==
X-Forwarded-Encrypted: i=1; AL+hErGVSzEcRloB2fJjVa9lLGz18d22X8wC13RogzOJVhQ19sQkknrNfPUT1oXOJOydy+cWbMxeEpo6sGjQusM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QEwJNpD9LNmW/FEnta/qp0EnyKFCNVqXFyL2yJNM7fYKCuiLY
	HpvDoO9QdZWyvms6L31SXuiyQZyX0+1GJTo6EB0j5BqB9r946w7TebP6zyjJcv8x5Ssb7PmCCR5
	sEv2ceDwKR9ojPmG6NjZkZd0ytwXKH8nIBU6ER6Vb0Q==
X-Gm-Gg: AZFdTZcseB9l291M+WlH9uW9wMgwNgAlU2IabyeV+n42Ij1lzl5kChtiKDBiFnnoSyy
	XWRHXcqT+SHn6Q5RbdWVPfc8PsCjbXd/jo5S9kSxc5G3syBDttEljmLNNEBjy3pM2Zgc4za1apd
	rpT9Ik+HbUj9wNPm2ts6qZ/adNhfJMDw7cBdDqifRV9Ig7tlpIh4U7SFqr/lYyNBugi8wBMAjUo
	0ZZBmpKCgSHbI/Ac2wRIxmDucaB7JhHZtKfmsJNcbJU+uudl4u3/YEQTcXa3Ym4GsS6whKj5WTN
	iLI2H7S0SKynp8cIJuAIKNNKhfW5pbdybbJ+VktTwS1P+ef3uf2GbN0Pu5vytWAR/Tn+wvYKVDk
	bVVcwI4nNhPZpG9uhp2L/GgXxsNcHN/8xnnhLYpPeQh30UhrHICY/jnCJYh6arpsJPW1j
X-Received: by 2002:a05:690c:290:b0:895:8474:3c6f with SMTP id
 00721157ae682-8b5201eff64mr106815777b3.0.1795817666463; Fri, 27 Nov 2026
 14:14:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tcp-l3mdev-exempt-ports-v2-1-b920f3ff8f5e@nexthop.ai> <179572802536.3135.6305865608768923950@kernel.org>
In-Reply-To: <179572802536.3135.6305865608768923950@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Fri, 27 Nov 2026 15:14:14 -0700
X-Gm-Features: Aa3M54oqRaxMY7_UWPQgj5lUHHUmW8MGZPBMkR5eyixxsYNc4OEEliipG1r_sDM
Message-ID: <CAAv61uQA=z5i7OB3O55jvcZP+wVt5907oPUnhuO-zyjn2-P-SA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Could the commit message explain why a new UAPI knob was chosen instead
> of fixing the selection order in inet_lhash2_lookup() and
> inet6_lhash2_lookup()?

Yes, v3 adds that to the commit message. With both listeners present,
existing setups get a stable result that depends on creation order and
address family, and making the bound listener always win would change
that for every tcp_l3mdev_accept user. So the new behavior is opt-in
per port.

The SO_BINDTODEVICE case without a VRF is a fair point. The same
early return applies there, and this sysctl does not cover it, since
it is scoped to l3mdev traffic. A change to the lookup itself would
cover both cases.

Maintainers: if you would rather fix the selection order in
inet_lhash2_lookup() and inet6_lhash2_lookup() so that a matching
device-bound listener always wins, I am happy to rework the series that
way and drop the sysctl.

> [Severity: Low]
> Should the document leave the fast path columns empty for this field?

Yes, fixed in v3.
