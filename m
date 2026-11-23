Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468733;
	b=oSt29Y7cQj0yuX+HcQL4BZs+bV5POvsCAlP2pi03V99h8Qbd++Ft+0qYoNM/BIuOwSod
	 +y2vD0wlrsQOEqLs0F10lDf71EmnClFnLzrLP4aL7lAR56M23RF3crEqL0nj3k/YJ14Bn
	 Lz7engoSUPSpXOxhw8dR1sXTtRKxDG7CCdSZZ0TBtXjo0IYaeTpijzWmfGWBjAZQc/Ds8
	 wKNiio5N75sVEGSEmyfxQ7R5XCO8OnlTaLHsSmFGIWw8wAj+gnab6DpRz0Tp9nTa44eDd
	 IUA4ATOXO4OSFLihCLmt9wCsaKWWTGbCYG4v1aWKQv02RQFIc3k+KjqnBcGlhGcuXFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=UdbWtdWbnHAnBe9m59yDmsAfmbDCGbDO/F2rxx+Kr/w=;
	b=LYjbZM6FvlWnhaGQkrmuk4JU1/ZfeAxV5DiamwUjg/OerWDrnNpS5v17yU9E1/KXzqpK
	 ewIsYheCBA1jAEecWN2MLVrbSpuBA/d6t2TOIv+66tK8ZR23HYKzvYsFH+0Uc5XvNld4V
	 YH+YWda4TrtdhcfWqyRY9S0kfNYzor+vTUVG+B3TaIHrPBtIQWU5prIEexRQJtYu+8BdD
	 5KHBe10H4zxT6IJjtbC4LM8ZK6O6dGSF5p3aRk26JQocGliAfJe5t44SJxRSG8U+Zo3jC
	 TgOR67QLGsGKnQvZUXXBE8dvwDTdxuoAtiTXqsUEY5W0y0vQp20RHGQN5J0ijTCWR4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQBhbA9a;
	arc=none smtp.remote-ip=209.85.210.66
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476D6606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 476D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQBhbA9a
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-862df509d48so3043685a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468732; x=1796073532; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UdbWtdWbnHAnBe9m59yDmsAfmbDCGbDO/F2rxx+Kr/w=;
        b=MQBhbA9abCEm2W4n2Sav0twyTWtHL9dlzCuGMe+dGXr+Bmgsqse/NRFIyOVfR6kdc4
         UX5Vlwam3jCbCoRj3cJmsGOZzo9BU8ufbFW+1KzByk1lTtB6Lu8kgr6C2z6452t4fG18
         SnRWJUAMIpb8EuBZxehw6staapYIft8RHTa50htw8vH/dTmOhZDUlI7Hc2e7BQjEM6Fb
         Q8IhVefAvcdWnpYWzYomK1MWevYD6eIHXQnODB39jOrXmnT77+/SyIMNi/1qHwME2J5Z
         HkR4ho/r/3wjX6fZPuCOxcVdG25oAMq8Iiuvw2lACgNuqpxPZ+SEjg/LiAMsUMVs/7UY
         tZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468732; x=1796073532;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdbWtdWbnHAnBe9m59yDmsAfmbDCGbDO/F2rxx+Kr/w=;
        b=gNgSDn5hU6iXXPnrKpROfboUyolATKKk1lqRipiRYZG3lvBDsKWYbNtIauYhMK8oOk
         Z4kosJJn40i71cKXt1gK0T8V6MTVODJ0Tx1+dIKqjQ+VUQdgdyY0eRmlhCKM4OM/ikZ5
         TCTbjdyaVkiXCuGFGaTxzaRNsNX34XqR+L7/elwjtPq0kyPgp5U6i5YKV8GiBGzqW5T8
         aSeGiKqsgaIX9odyBeiejOPrQOYm4VDJCdweorodMJa+HkEWcezcqKn8oHYdIWemOEf1
         joNCJ5Yo29FoN/q0msIxJ1mgPxfOg0dboFaPpbxzt7H3/HadmRMDm03SiIEzLzC7bWff
         Whdg==
X-Forwarded-Encrypted: i=1; AL+hErHhudwaa0wjDd50+Uokwxug+gQ92oM3Ynz6hfGRMiC6J+LDKbMgjbt49a7NRu1xrouWB9UtIZJz8E9n4zI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qvI0dKrNs9cvylIXkDZx/LOORFLqLcryjCU4wD/n79wOB2aWf
	MCYQGPHTJdx9xGiojHHPFOVYttRl5Xtnvs9MQRW8LWiCO+D57Q8KEtTc
X-Gm-Gg: AZFdTZfJgeNJd9QfbeiSZ7eNkFnxoNTJHOvmRexcbWDKlyBIfp4esGTy7dcK9Qtu2tT
	0yjTiNs6jfpo9tDqm/bRgrM6lEjb8RM2EsKn2m3pBhfEH3tOd+iumpT2OmxTJkQIYXofHQYomU1
	E5yHhg0j9g7r9h7TTprUDcO5Tpxmcz4TXXW/kVe1TuRMwBh6dKJBWbnTYskeEDaAtSCUfwyWDWS
	wDLb2GGxkkdDjWb/gAbGcZ08jjsXfBoS3jLowXPz2PFQEgHMssqzUZDDwv5Q9+7KpiGn4VSQg8S
	up6CjsHz40fwmH43PEqkTTYrd0V7qWjR1Y1/ToRgU3WCTE9ZB5GBguVvNFWsthuxfV5c/wyNoH9
	kzv0FHA7kyBVLQsRYBYXQCtRY/704Ik4vDiZcDVSsjG1wFB0AKREuIIQCRkYM+YPC8mEtKQVzuW
	YIlU07+pwJIbi4i++9gCBmt7SGkaJiXYJLcwQGwCut/4FULs0m3YZb86j8mrqUo5yvZXPk7UiFZ
	ch1+6iFxWfHQO6p+ARPc57ndKOmZe2seK1klj7gCPUnSMsdzRs/9wCNB96nCUQzgNgcD2Uho6Xs
	6qG75xdWYgy+hm3FVNZmslDMZpTujlWmBncw1r/4hFfVsafCGkj4lL6VnVOZAsPUziTJTm5epWP
	njhFgTBgmRkOYUqHSxoLPG25PY0k//htBMr8=
X-Received: by 2002:a05:6830:82ee:b0:85b:895:a015 with SMTP id 46e09a7af769-86309065b5amr10471283a34.4.1795468732137;
        Mon, 23 Nov 2026 13:18:52 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm9734033a34.24.2026.11.23.13.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:18:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 22:18:48 +0100
Message-Id: <DN2WJMWD5G0R.27OOI2IBOXA6M@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Andrea Righi" <arighi@nvidia.com>, "Xu Kuohai" <xukuohai@huawei.com>,
 "Andrea Righi" <andrea.righi@canonical.com>, "Bing-Jhong Billy Jheng"
 <billy@starlabs.sg>, "David Vernet" <void@manifault.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Andrew Werner" <awerner32@gmail.com>, "Zvi
 Effron" <zeffron@riotgames.com>, "Andrii Nakryiko" <andriin@fb.com>
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned
 iterator
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261120-bpf-ringbuf-fixes-v3-0-ff7ca15d6c37@kernel.org>
 <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org>
In-Reply-To: <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org>

On Fri Nov 20, 2026 at 9:33 PM CET, Tamir Duberstein wrote:
> Ring buffer records are exposed only through callbacks. Callers that
> need to stop at an operation-specific condition have no non-error way to
> end consumption early.
>
> Add a caller-owned iterator that returns borrowed records one at a time.
> Each next call ends the borrow and can publish consumed records before
> inspecting another one, allowing callers to batch consumer updates.
> Implement callback consumption on the same internal iterator core so
> both paths share the record traversal and publication protocol. Allow
> iterator-only rings to omit the setup callback.
>
> Preserve callback validation, so callback-based consumption of an
> iterator-only ring still returns -EINVAL. Keep the consumer-publication
> barrier on early destruction, including bounded and callback-error
> returns.
>
> Keep overwrite maps out of the public iterator; handling a stale
> consumer position requires a separate resynchronization protocol.
> Require iterator users to observe exhaustion before waiting for another
> readiness notification.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---

Hi Tamir,
I had a similar patch set in flight, to ressurect your older changes (which
explains why I sent out some your fixes which were landable).

We can compare notes on the API design and decide on the path forward here.
Feel free to provide feedback on [0], I have put you in the Cc list.

Thanks.

  [0]: https://lore.kernel.org/bpf/cover.1795467315.git.memxor@gmail.com

> [...]
