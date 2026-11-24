Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552168;
	b=zTerJYjNRbfGZPW7d75VtjPVJRRwaFIPdTaFk2EtTxLH/Iz8apWUC3DQUm6HRx/sonRh
	 RHIrG7gfLeMDxvN+zJoidgFgqE+kwU+mS4jv2GbypAYFF88unaK4mmcc4Xd3G7DgzA5Wd
	 XnpIQd7BoExaGVEwVhOyo9V+efnne6hvIc7B/zOLgRoCaCy1BqjBFftV376wv7CWy3QE4
	 46pwRObX/BeLu2zewW2ekh5WDlenCH7hqtYuoxD+fax4Eb6ZBTjtf2Gp1HV+c0W1kX8kC
	 PV4wAAQ/duD5a7IYiDc7znRZaeqvNQviY7bVT8OD3zHSeU1DwJQ0oPbN5eRCvvJfoAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
	b=1GmA+1VhH/yxVu82JgDqqtGZGDBRGy4Pg6k8Yg82ATNeKiwJHPiPBre1hzVL4+ZYtpLH
	 vvZSJg+WOYGGX/VdJCIJDiyhOwdR8D8vCAgSgbD8LDUbW6oAPwt9S2O0ymJHtsxEDHcw0
	 +7OEdnPYmDj62knXuqdhOs+1iZADvSA6RrUf3osD9v4Tz8QjSKajMdCBr0p7cZmggVQUr
	 hxkh3O3HMhXqziwkx5iiymhZQDuRmH0zM9q+Tnkz/ZzG8Bbb+KKHNELVreCueczmWHznd
	 l9WzS00AZn+Uq4Zgqr7Nq5C2MGAFl4O+VK8UCSqNMfrYYCasbZJ39OQaGCFqe0VVPIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5P5MBUo;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A04606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A04606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5P5MBUo
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so3340609a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552167; x=1796156967; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
        b=q5P5MBUoQ2u5uAv2QQKhX4lON/ENs8MT9JMtBOTlmzOwFEg3C2gtuRUGsiJPjuOnmE
         CViVtedEvVbEx3tJhWmvK+Z/13K2IwMxH31Nh/xhtIgVj6UkxstTvE/ZSeNlX/MkACg2
         /KiYW3+8IvV+R+VfvzFVj5119ke2ZO6GqAEPIw087pR/5DnF5sehY6EGmk6vQTr5q2Tx
         Uqy2LhBRlsVWVlBXyRWBf8EDBH98rRIzBGwDBeSPNpD7s3vGntqyjN7JcM4jn501ZdFU
         aGsqCOWDR1ZH/YPz47gglTj0YEO2H5S9bqTnof4aj0NWQM2hvqiwexVaOQswjPA45tQe
         qCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552167; x=1796156967;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
        b=EsRe/9dn8aeOhoC0iw8Irznit2kQQWkSh2nrJ8IekndFOL5KWEvUdud+jDb6YbWNjP
         0Xg0lNGOjvFblnFz/AR8724yksZ6R3+ZVX8RsXH6YOhnXytPTc+r+rEwlVrSXAAWxPH+
         XZp6yXKGBcVO9QGQTfVatZ6vOxQJ97cPdBw0y2prJ8tZJpG4R+a4OJLaIZ1wM17sTZQ8
         eeA5qjCqVZxmUuq0xb01tOqHdSpi5O+nPE3e6GlAP96WZHFVxXfwF1//dU0OtPlap24O
         3PsvaEKCkd/rAd5zFLoes4uAhvZw6tBO2+IsSPqhBvpPxpN5XO9IpSr+Kz20NbK2UgfM
         oE/g==
X-Forwarded-Encrypted: i=1; AL+hErHpG3Q0ljyu9F4UX3qF8m3SqTa/PD5zT8tjELbUPFyrts4SqsqTaPq1Gtk2FWUCg5XFeUT4fnI22NiY+/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+29kMa79kpB15vXvVmye3otl4710y8rdXeoP52gRnhBILB4j08
	3U59w1GHpYUNPXewd3UOFpt/Fr2/TiKIJw44yqzCXavDbxHeJYxUIfXt
X-Gm-Gg: AZFdTZeSNLvqcp6yjMZO6EUarBk/jOTiZx3l5GXHrZJzu2sBDtN02NBqVI5xRHuXdMV
	75B8rl87Nx5GAjwC9ISfYgvr56nff3OZ5cIJPg8fSPhON8RjZyMHYQ+d1kBUa0shqUia0U6kx9v
	X1rva0M/FzbeLqU/9rUlFINOcQayI0YjeT1asMFsIhpp0DNCEDD4nwUNnXaBOnPgU4jYSR8Lv1E
	dn+yIV4xXPqKzsHMd1QpBo74xD4H3SUZnuRxpqfIYa0cvGTAj/E612CPe4dpf2HHFJgcQ0wZDdo
	nnKd8GP21AhaCfMPQxdNhk4ZXfZetPJIpFhCD2Mj0/LV3STqJxa7dCVoMEKZg2+fZMf4FoZbWzt
	CjHF8whTMX00p7Y2hb+9qtaIXPQmeve2GMDW0s5czUs1q4G5a+74eIld1WPBqUtjzVlc5PrvXyd
	M4qb+5EwdQpxnCiJ0N+wVb1N4pUQdkBCju8UpCwnNZAJPJ4N7FeHcByKo08f9zWNuiCCVAzifZ+
	SZCrV09yNnT9LLcXQlWCcb2lWoaEtxsTNToUZdQ2B+2CTtjri5Rx0wyWIv1ibA23ZRpoY9HJY5L
	B/VPCAsNe/827QD1/oDoMY9Uskrbp+QCnSEPbFXkLb6pPXEegVveq2mFoSc9PI4ywfWkQLZl19K
	Du/9K3SmaekMMv/NfwQcxfqSn6haQlLYCdA==
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr14406212a91.9.1795552167442;
        Tue, 24 Nov 2026 12:29:27 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm26492190a91.11.2026.11.24.12.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:29:27 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 20:29:26 +0000
Message-Id: <DN3Q4DUI8GEF.PX8U99J6LKA4@gmail.com>
Cc: "Chen Pei" <cp0613@linux.alibaba.com>, <memxor@gmail.com>,
 <bjorn@kernel.org>, <puranjay@kernel.org>, <eddyz87@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
 <shuah@kernel.org>, <rgbi3307@gmail.com>, <guoren@kernel.org>,
 <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 bpf-next 0/3] riscv: bpf: Add BPF private stack
 support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huawei.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>
In-Reply-To: <6f594d21-f5c5-4224-b4ff-04ba3183a414@huawei.com>
References: <20261106181558.1564-1-cp0613@linux.alibaba.com> <6f594d21-f5c5-4224-b4ff-04ba3183a414@huawei.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 11:46 PM Pu Lehui <pulehui@huawei.com> wrote:
> Gentle ping on this series -- it looks good to me and bpf selftests pass
> on RV64. Some upcoming patches will conflict with these changes, so it
> would be helpful to get this applied first.

Sorry for delay,
please rebase and resend.
