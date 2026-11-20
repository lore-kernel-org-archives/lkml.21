Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207372;
	b=M0NHewkamIKUEXNH3LZtI1wGV0H/GavD+8EtOIJbo8uWukyUJoOA9Hkbirb7A6SmeGyn
	 3uxiBDJJ08p7vSzaU155o6Gm03lTxN1XayZ6yUi1BPwDICuMVg/I3mAFaT+MUFLUJe/nR
	 MndLsaWZ30+huFYatZXRFZDPZ0Ms4KKhuOuwbj4te+hPUeW4zYZNIpCfBQaAS3+0o40qM
	 gyV2nR0uTukP1BVqDJbwKgDO3TCL5ziuiqMlXcw0kMWfOYUZoUEzFKHJvLl6gl28r53Iu
	 yu7t4ilsP89VhVj1hOlH1YRxAI1Uf/ntrzl4L4EH5ojS+uXgj3I5Cyau3qvrlciazWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=5Vy+uDDmlpqXaPhIJuzEyGUW5XXKRnuQUYCNM07djE4=;
	b=3+ok7S0mmjCzHQ/N4c5/gpCNowxgPY6guQQKdPuSqN36qRULsRcX5ay+iuwYwMHwVlLq
	 UAbZzyDPmd5hPhMFbytoTWxU2nKKFZ8vTUHGC/F7zoSb59/NMDnCBMWqlCicxRKbtj1J1
	 jET4pVIjvrle6ydhe/EcsPAnzM5p8/E4mKnmhlIvOEfUQXJ4+WNf+k3AnxK6OWHd8eYDk
	 q4sfZBSm9opNc2v9bmzHNGCpoMdZDWJeKvwkaGN7t0FSfmg7TznsTYYhjLlrgP2w1PN6r
	 /UTdysu0TCWKfsbJqj7qpIYlaGRXO5kzkBsWHSMaEJn3MOMYueetq/cyVkJlK+u5ibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E035606C0D1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E035606C0D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5365f9a04c5so8344491cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207369; x=1795812169;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Vy+uDDmlpqXaPhIJuzEyGUW5XXKRnuQUYCNM07djE4=;
        b=NJviWcFqcZgrJ76z9xXbaqgjgTNN9vMjjMa9uxjxOlnN6eM+MHo2ZrjUV1yC4KwVM+
         lsySWBNw2P6Z3o4uZq8hNnHM878pNKFWm5jor1ocmXtp/hDmpvgqn0tiDw4IP9GXKOJ/
         b+AK5hoe07VylfMvDfVNUh9nsiRx15ej/ZbEaGqNEJ3TT9MPp9CrILrs1rDCwWBYxFvz
         5Ff+Jbi9H6kvmMRaJbZ1Xvi+5IAEMRIv7w4Yc1Ey9xWTLKTaK9IRvijAUELyb/tqKmVU
         cVJqnBPKsIN1UtIlzJkt65ZEHK9g+CYz3JAENI9XcblQPwcP7BF/Dfx4Bc5QCbjXhSc/
         4OSA==
X-Forwarded-Encrypted: i=1; AL+hErEIO4e/aWhy8alY2bovf701z1lbavaDFn025tEulSDMmjPfHCF1iWeWk5TtCnDCXenZBxBxRli7wrexIb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EXrnTM5GffifgnBro63NbiW01ZEByV8qQnajkgj9T8aP7QwAp
	N4DlqnjfUNMuIxTGH66W+rAQZXNTGTcWUjEof5a7Mu5gTUHp6kVLfP/u
X-Gm-Gg: AYBFou3ztQESJvyBD7+NHlafc0/6oOqcrtszAvohV1VixyxrWoPCy2wmbAI73bGmQ7q
	/Bx1OmaSN4EX6+dq9iSGYg9ThAykRtzXBskIgnZgegirUIH/6sQvz77uWsISbaPzwg0d4XUrcVN
	NK7UrTA7+lMPkwaxAFpf48ulmXcRqfo6V+6MaEWDse6nxt6sdeMXtPN1NbyEfMrZXzvUI68ZvyW
	7mLnyhs7ESEDpJW7hnP4ilkHgFKInZf18Ge5GOvxusv7aguF0yHzN+akU/1rDdcYBKK+udR7PeS
	TGRVRhhvoJxXaKNEBexMZSddLkYKrqFRt66mEO13fakhcc/FI3J3M56Gc0tsEqehs8mTLUJ1YIz
	fD+X3dmTc+HuGXEttbFXKoKk/oetTfRQnAN8yGjIoOR/1q7Y02hrtL71mNwrK1oI0jC5qI363qT
	jIykqRghwPPTdD2w8cpRTbl7E78yWyDEgvAEt/i+lzB+uJzOsa/UXasIQb1FH4ChB7flusfyn0I
	1Q5zDfbIe6Rq0X3hO/ar2U2RLEFBY7yUE2SUGI6GF4or+QNG7XHIKHfuihkDBF3SRboxvkXf2Nb
	75IeD435Odr5ZOAy1MGBvFo/DybMCVBFS3jsE2BjJ8PDzRt+gdmMBL+Bk9hv2c48EtAWuypmf+r
	/YXH4sODFIu8luMUTPv+HpRYdsMePQkUPSatKZRuuQ2st4kcPRRWv
X-Received: by 2002:a05:622a:647:b0:535:92a6:22db with SMTP id d75a77b69052e-55d76932dc3mr81030961cf.1.1795207369141;
        Fri, 20 Nov 2026 12:42:49 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm34020236d6.0.2026.11.20.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:48 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 1/8] libbpf: ringbuf: Honor zero consume bounds
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711452.18576.3585895078868133287@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <9323b0acc22de75ead4732db464672443eb141ff.camel@gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-1-33fde039ddf3@kernel.org> <9323b0acc22de75ead4732db464672443eb141ff.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Could you please pack the tests as a separate commit (or commits)
> at the end of the series?

Done in v3.
