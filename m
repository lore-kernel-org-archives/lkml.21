Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207377;
	b=JJ+pjVvS+pYB5AZg8Npc7Z8sIyNV8rjZRwJWD6Qu0d+S9ADoa3JPW8GYppv+HIXXf28k
	 lSmdBU/gHTlPIza6RGyFjvI5HEaPaZNmG+ZAnfrQhG10SAJ3u0DmcaUstp3J1ovAJehF+
	 pc+wqmUBCMr23KBB4DnRHJO4KprsDakYZST4sU5eYRH8LmGhvq0Oj6JvqSQEcwgL0EHnZ
	 dUuizQAQzhbyBkBUPwyzay7YtmVNqqZ3ZBEVHp5Mv5izQBHhX4PWXDsojeDYU58eDuwKO
	 gAWOAJd2dARey4F+ZcOn7e7OUUVM4eszzVv/w6D8Loph4O/AlSIWGfzlH1VqwpaQ2Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207377;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=4GH1ahEms1dqA45xIo5IOe2rBwRqoWw8ywFNljYwSWo=;
	b=jf6mBKhY/WD8qTPIpTEFi1NWma7+RgKrqsOfU67ZrShA5ydTJs9q8rcY5aCtINhjoKGd
	 SYMncy/LBxImtYMp14XMGCMHAnW5SYQMb9zcc5ExDuKLPf9Ra1zRQYt6ubp6sbdWdr8cw
	 AIRpnmRtQw4XXWvmiY05XFysHIy65IKPXnODRf/R71gSIr16loKx7dP07VN2FLeLJ3OOG
	 JOH4/TMpFzWL7jOj2Eh4FkYePRPsG2qIEfmILulfxZY1NJdEmx5LcUKPcGspyMqGZgkKw
	 nd88mjF41Nmf+nBSWmLESfYTND0eO4K5isl66wpCm6KIORWTWoWOTJ182lWzVUSluug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95584606EEEE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95584606EEEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55c5b6584ceso10067091cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207375; x=1795812175;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GH1ahEms1dqA45xIo5IOe2rBwRqoWw8ywFNljYwSWo=;
        b=U5Evh9Z15Paa4mcThhdC6IE6wHujt0SXMNtJqVioXjlHkKLXEbN+HGI+VfRhc6Rs86
         fIphf0uXcsE79+5HVlSOdC0R7JbAvwnuAjYKKwUnQLJsw9tE/9XoeBHyGvlR8nV/37RU
         J+S1yfIrnY5jWshqploNnCUQILPTANXVtBp/df2lw0mHwCVZYmN7YOGwwNGMa7ZWuql3
         AETsz+ia5l6FZy2PMNsz4ugaA41t8mSO2Z0cjyCu3Ud/p7IcGRtmUvFZFon1A+nGPXSI
         +P/Xw1q1i534+VSEthfDxccILmzRjVLzBUgN3ZluM0joCaMYJ7Qzq3/omcsxM41MHZ8Q
         dgGw==
X-Forwarded-Encrypted: i=1; AL+hErFJTBptYZCaqPPaMVxYu5ztWbl5rRatumWZ7BrB5cnnWWAVxCUttdpo2Pj9Er/dMj/bUmcCz1Wk46V+a4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z94n+yzg7ExWf8LLjHUfsxfa+sOMAaxnvARUepLeP9EBcACDONE
	rsgAoWCDLs2n0RqD5dEZHTWrJvd/QUtRlgRxdNAloRN0cdcorvlCldVY
X-Gm-Gg: AYBFou2DsFBf1wJeyaYSJOxuxiwUI02Ztijx3JPOUyXwjpXoRObXrKRqSw1zVoMYa0k
	lmcNZpdQCEg2/NU32iTByCWiEbyMdoqziGRYcnLC8+fryyH1WEN3gW/huqJBnKCv3Umy0RneaJM
	OhLHWrYpZtGzkhX2/49MWDZiyPHBMJ0BiyHHZJq5kxU3kKQ1GYEWzWM3wTi54TXAi8sWu5xwTon
	m3c3y72PfyT1z1b0NnOCtUEIGmadFuR8bxNQOJhmhM9VBYBawARz9oqBXB/vfjDKKzIjmdHVJ4K
	bIK/Q2/Y75y+5MJth2UIO845ThXHncNMQdrB3B7d6fTVm14ffcblvQ6JBAdjp2Jmw/FkI57CDKp
	fwhUXQZouq5BzZrLVmYcVvvfaD+epBqLlgHmSuViLMOG0Qx1q6br7JVH3jZsBxV9LjFJsez9G5s
	thtec7eSjG1qUWy30vnAVCH4hL/G0op1dThlSmyOOJCF4ZGRF1W2RCbrnXA7tnXgJhxz3CQm3+a
	1kU9hyp+ddcSaogsL1j9kRb58GZsvSMJsuyXvw/3B1219Z0NdFOQ6FA2fxI1ORK/pJQnePjf2rg
	wjC932QZOZP252E1/2rpE6YUvL5KFn7Weo7/Ai7iEdYuEeSSVdZTQZnVsu77oC6ZEZ2AOdzPFvm
	WDHYaKkRF/EAK6T467NrFEz5eH1ft67WaxuzsXnxOlFEzwQCzfuLo
X-Received: by 2002:a05:620a:4453:b0:949:7502:695 with SMTP id af79cd13be357-949bab651bdmr693737185a.68.1795207375597;
        Fri, 20 Nov 2026 12:42:55 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm288439785a.5.2026.11.20.12.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:55 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <olsajiri@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>,
 Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andrew Werner <awerner32@gmail.com>, Zvi Effron <zeffron@riotgames.com>,
 Andrii Nakryiko <andriin@fb.com>, Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711461.18576.2987868815331228057@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAADnVQLuNSE5AM6Cqzs4yDFrhTyD=j-y5dfya3dLwk3si9v26w@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org> <ajVKM9tJskwg9OFa@krava> <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com> <CAADnVQLuNSE5AM6Cqzs4yDFrhTyD=j-y5dfya3dLwk3si9v26w@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> If there is a need to check
> callback nullness it's better to discuss altogether.

Combined in v3, including the iterator API and its NULL-callback tests.
