Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207342;
	b=YFbkwjH4t7S3GJB4RwVH7CiSxV2i7CsUJeXxIGMHVSlo7X/ybf2jgxudxpOKTJ/FDhjj
	 K8GghJrFWXlcAl2FyX2Xd2v0fKuwMoUL3hoa/htaxIou2xIBlBCzEwOBZQdTsy+zFJR7R
	 Ws6u6NX5fXzAR9VYH+bN+5N9A+yRh+CSUhVBbIVhEDbrddKwehyvUx5F80NFWQxUu6LOD
	 KsO71kkQfYf2L3gJgEL5ohFgFqevUHMH56/7H9i2twUjwQgEU1tMnDeVFHNzLP3wHBA1y
	 kFB9Hhb0W/f3YqK55yN8RVVshQZN67ksmEjLQNo78bPK5y/ARxDJRedLaJh3lzTAD9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207342;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=zjEa/5UGkvmboDqiKH3vCqUwfyIWNYaswKb2LA9yUPc=;
	b=DryTjEjp+XVduir8k6tIZnrtYtBcXAOUp4gCCcjlBbu3UVtZtE9Oq8ey4jxaP+8jb6sH
	 XAoFWA2Zu0SooMNS/j3Nxq5NkgSKmAl7uAvP3w07NYML6A1IqgU78PEFC3HYzC309UF1N
	 O96EGhOFNx0PGmnR2utxAHa4W8g4OWU8tSfRHCttLq9akDExVwaOegR7e1SOjUMESuTNZ
	 Lcwq5ABKhyPicWrMKVlmubvi152YrRkCL2P2aim3/a1/0zX8/z4VrIn//x26HKmIwbVB8
	 16JHs+I7obEhr85O9erjOtcniaX9JY60hy+VaPQ8+tcaWRwv399H5z7OO+eoA3Zc0Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0E606A6E0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED0E606A6E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5365f9a04c5so8338521cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207340; x=1795812140;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjEa/5UGkvmboDqiKH3vCqUwfyIWNYaswKb2LA9yUPc=;
        b=LeAPRy9DJpL5/W2xQayVCY3JQIoRF2uzpcglblpepyL6lAxTw+icsdXnkqaQh5D1iU
         y6l9/iTB/8Zeckx5AHt+OECAUS5YHmBjTaV7fcQUFyPbpzu4NGmkPusyqbiwgtUzg3e5
         L2yhzEDESJwFgHRjPfpoEsMQBGT4p+ESIuLJTc8WGYHVwUjm1G5s9ShSn0YstIuvH2+0
         PIcCEEo/kU5hwkhOZDS+rcgzIZYCbVN0m1QwWe38dIW7C/9Ox+EQTiMR8IND4uXuMznE
         7ik0dSzI+XSYgqnzV/K0VPWNJXNmZYlTqkDT2TE/tUQPTu4EYhou4ya1afbPqoAIdnzp
         OEFA==
X-Forwarded-Encrypted: i=1; AL+hErFRIJcpqSFfc5uAHrWVi1fMNiyrm7npJvUr99h0knYvk4oSVOI2gVuFB2aY7tJV8+AX/zlw/6N97rRcFN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RYYGW6GZlIWe4dGGxGmnkRCVPODEMLtTeSfBqv/zn5BAoqQOB
	eC3npHpuCm2Dfeh8P1VTj8+hdJvcKCIUCy9LZIoU5zXAob072RXnY9Yy
X-Gm-Gg: AYBFou3/RAHgPRGulIR4DqajtV9jEUODquDqNPXPz3zDBMDmWHFpqqE6XYKdEpGrGLC
	Gq9gfSksgZoYHlD9kCHMkiccfbeRzOhkjegiZuspXP2AlR2ZIbpE+0YwBVI2j4SYCfl1Xw0uc9i
	P3n8h2Y6XgHwrRcPW6ir5dEBPujQZdKluPwMQbN5/zNsDtcRkOgVM7dpmgDDqzFx4yxRGtte4nq
	KJFvsiF9zKYPIGqUHMqVQDASG9vOV2rk4qUTSVnStv0VP3Cqtj/IVGa+Njmm/4+5/DGgv1XIzvU
	ZEvpSQl9uurE2PqajufLCmIWx25bYzQPmPYPuNVBdgvJfPuJ5U0XQCNmc0ww0fD3swSh75qoYYJ
	ru0goEpgGXtx8KM4Q5hhvKvU2M3SnMGOKR0sLA02rbP6wGiMDnDZj+pKPvtGHrpU3ODRN0/8YgM
	6GFwoTDxkq4hwkI8tUllB1D0tE1j9h/k4Z4jDDhW2UBf9ecgY+675iEKk53lYI7Lcp/X56BtWyg
	fSEu0JLqT+6+6iUDNjA6W4/gmORU7wQS/BysS7d1IU9uHy4k0rwBt9WR79DtT1wFH8+9wP7Ioj5
	jSjGpPLbOy0xVh37HRGuFAPjNPBmuDXSlvQi0ce/pWobDnCUD8UboCmSOlr58CJhF01EjF/qin4
	N6rdUjrwUaMIHvlp8A+sT8IUKmTQuvPe9zCUvJ4Qf8wSsFvcov/fc
X-Received: by 2002:a05:622a:5e16:b0:55c:216f:38bb with SMTP id d75a77b69052e-55d76a5af75mr78983591cf.36.1795207339712;
        Fri, 20 Nov 2026 12:42:19 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm32377681cf.9.2026.11.20.12.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:19 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>
Subject: Re: [PATCH bpf 5/6] libbpf: ringbuf: Prevent missed wakeups
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711429.18576.6433271673673285138@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <DJBYY5JF4YBQ.2QJVU2QKJ16N2@etsalapatis.com>
References: <20260613-bpf-ringbuf-fixes-v1-0-e623481cb724@kernel.org> <20260613-bpf-ringbuf-fixes-v1-5-e623481cb724@kernel.org> <DJBYY5JF4YBQ.2QJVU2QKJ16N2@etsalapatis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> let's use regular kernel style

Fixed in v3.

> [...]

> The extra new variable feels overly complicated.

The final iterator uses one loop without got_new_data. It retains one
fenced BUSY retry to avoid missing a commit without spinning indefinitely.

> [...]

> We just add an smp_mb() here.

The tools generic mb() fallback can be only a compiler barrier.
__atomic_thread_fence() supplies the required StoreLoad ordering.

> [...]

> Why __ATOMIC_RELAXED here?

The stop flag publishes no other state. Relaxed atomics suffice;
volatile would leave a C data race.

> [...]

> Label is unnecessary

Removed in v3.
