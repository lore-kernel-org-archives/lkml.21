Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990971;
	b=RC/9yN0SkZLVKtiPnHMfwsBHhHd/EMECUZdBxppv2M+X1r1Lr1wKSSeZAPeE5lpUMkp+
	 bPAfmR8GzN6TL25Q9n8SZBqnjjrE4QbDZwUIOS1W8CVGPqHC2zZRgqbwdupvIqLqnlF5C
	 w0Bl5tXK6H+x1SO7zDqG6WNj8uHfqOPkzMcVVkAShaWdcBCigRD33u3WCAgbj/7r2pSXg
	 jM/YsGZNGVYZCcMcMtOOofgSitM5ydNIrDBKn/it9pMeV47WegpiYHZsFBOGKr7xujt8v
	 FNeOZxyf66gRETz7hA+cfcR2nB8ONnmNsh8qfAhmwI1jM1QuH7ilvoBZb+WyYlKRHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990971;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AngdKKEV49KCIJ12c6OSFDxnUGDymkPwOk1b71kiWuI=;
	b=T09yHeShNbFfbaBOQSaZDEk4AWUzuIsg6HoFlBsqcyxJiEpZE9Qw+z+OnV7mAwp3nFnD
	 0ZRWz10xHAUj5r5vdArFYCj3bNo2yYG+KIyVdgzOdUlhvV8kB/nfDditY/uETa7KTrr08
	 MOcOSZqvpHapZnnXhWw0Vi7jnF1HMNfdYv+InL5mMkO9zqy63c/2bzoqZiVOwHxT8Fu+7
	 Q7I3hB363a2Qv/FNeeqs+2lKRpHuwZosL9aeGUvaVNU31M/XLeuKI2oaXZZ5DDEqT9f/k
	 FK/bZJyhr++y3U6XrSYpkJeXeEnJcR1kjmdC8zoRMh5EL79ZBRhQZw+nNsPHcMdUu2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZrkxrDt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F24606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZrkxrDt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6075D1F000C9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990971;
	bh=AngdKKEV49KCIJ12c6OSFDxnUGDymkPwOk1b71kiWuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TZrkxrDtIKW+1c2LA5/O9nqBosrTD23p5cbN3rKpl2vebusRklTpb/VAO0TFTqzTH
	 5nqxRPhf2gwIfsnsu9izlpfQpAimR2URQNgiuF6MNXMccHNjP3FQoqPgPesLHkRNTx
	 xa2F6JyOQkx9kxnGq7EsNzPUPSumk2eN86+AWd5jwIzra8BoPK8q6BKTHEFbkjsnCn
	 ntm0RkNnCwifZdz5GAw1iv6nqCBrma+yrBn0hyJPO33hJZZ/skOEFNQXQlZU95zT8y
	 qx1WFN1RK8qQPBgGRcrsx6fGFWtVgg9+EAvKobVCu0nHp7spFam/dF4uBbMyvaVT9l
	 6x443H6OD83pg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b19e291cc6so609822eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEJHLmy26LwfcXcr+HhIgkJqQMq/uhg7SSRX/LSrxVJXa5T55y04oQ4vd/R7U18+Bry9WimYjBXahMh0IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iL5EfgyjNjwMUHhaaBwbvemDRt2jcjWVJUizv9Wh8RnutEmSj
	w3b2+KANWbP5+6PKkNWiV2co9hPthCtvhCrK/nYol8tXmoQAnV1CHHqpiwUx4uCnJftcgR9v8mE
	nH3Uh4maaXcuMrlxj3/DtHy1Ulz7Fpp8=
X-Received: by 2002:a05:6820:560b:b0:716:cfac:bc29 with SMTP id
 006d021491bc7-71b18843f7bmr920885eaf.85.1794990970636; Wed, 18 Nov 2026
 00:36:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
In-Reply-To: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 09:35:58 +0100
X-Gmail-Original-Message-ID: <CAL4WiipE6YzVOHwecF9wS3n7gq=dOSKNETXMq2gzKchg5LV_zQ@mail.gmail.com>
X-Gm-Features: Aa3M54pjTJQyL7psQSFQ4l7rjaL312tLjeRbst_IkgsN3QC4lzHm8w8YnO_pqgs
Message-ID: <CAL4WiipE6YzVOHwecF9wS3n7gq=dOSKNETXMq2gzKchg5LV_zQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: avoid hashing the namespace pointer for
 device names
To: Zhengchuan Liang <zcliangcn@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 07:27, Zhengchuan Liang <zcliangcn@gmail.com> a=
 =C3=A9crit :
>
> dev_name_hash() salts device-name hashes with the network namespace
> pointer. An unprivileged user can time SIOCGIFINDEX lookups for chosen
> missing names and identify collisions with a resident name such as "lo".
> Ranking this collision pattern across possible KASLR slides recovers the
> init_net pointer and thus the kernel text base.
>
> Use an unsalted name hash. Each network namespace has a separate hash
> table, so this does not change lookup or namespace-isolation semantics.
>
> Found by AI-assisted code review and reproduced unprivileged on an
> unmodified kernel without fault injection. The reproducer and networking
> selftests pass with this change.
>
> Fixes: 8387ff2577eb ("vfs: make the string hashes salt the hash")
> Cc: stable@vger.kernel.org

As discussed in v1, local KASLR attacks are not a serious concern,
this is why I asked for net-next.

A "Cc: stable" tag does not belong in a net-next patch.

Maintainers can probably remove it when applying, no need for a V3.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
