Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207374;
	b=KJ8PRAjTTJCjCV4RiU9WWJRkp5gO0kSiwCUqJ21LqmAk8I+d4UAgOM4c1GAI/FLxtDP9
	 GkgCfLzJCFYYi2pB+NbAE6Y0tF8iWOx9QNXthk32FVejX9uhIuAXiaUbrnnQZwf1cwuir
	 XfbDQPHyZsT3c+6upJxqo9Zfi2swFumBSvtKRvJWj3czdbbEt4mZlXaJITEfTQbzn5sTI
	 nmnCKqCGl8aissXo6ORB5BOLwoGl00rgH1FYqBSiaCpPli+7PD04Xy3iXlC76kOAkiaPQ
	 7thC7MjxTA5bKSPHwt+XKP7HwbuM+9yOiqkEM3bnvUpDKFjIsEMjptU4eVI46vn+LQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207374;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=tokKV+ZbU+lf/1B8MUnFvi6VmCUJYKTRqvgFuF70WpQ=;
	b=212LzvaKuh/cd0oMrzL125sdwWVtXBNtomno6uIWV+21JDDX7dR37U1hL34bk8bpjpuK
	 0UAnatQBW73/aJ8m8vNqRLIJOQMVym/3YNVWXTSX65994c+i/zsMuFr5lVA1Q7RsLOPLU
	 tXQ/E5R7/7b7vqwrh0hERZRm5bZK71V1yYaZWrXSaJ5rnSVAUWN6ywmmnQeGPEBDjevzr
	 Q9NnhagsijC6o82JAInwAN+KjHkJSrGC+syI5ws62AQSr7RyyZ1mw4Cxdyfm6JoTaNfYs
	 aJXzm47YM4F1RKRnLMM9I4T5DwzHuahrblI/D9JA1sUhMf5yWemMiC0XEvtEKtt/7bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE82606C9E0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE82606C9E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9495e8ae23aso112738785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207373; x=1795812173;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tokKV+ZbU+lf/1B8MUnFvi6VmCUJYKTRqvgFuF70WpQ=;
        b=TsWzRBFk2l+hcqoxJzFgd+EsWgiLTCvr0SV6kmSTK/JfbrnDL2mah9+3ibUgAGSc5v
         fN5YDbiBOik+P/1poOndRmovsUNBz05PXfaRP3IfDvPQTslpA0qU9hElIdbghPlmxAb0
         HLDh5LtkXLf8f440SE/mhL06lM1RUZYC4JKZxOn6qVVbNqTvmazLkffloofs594MNcJf
         zCZ97ieCxUZ3KB5h+Nxy5rWiuwdvB4FBsZK08Z8AqfkKpkRPx8kLnskIG5qiluvI0yvj
         Wq15um4xwecZo8Y8tej6+E8PeWHycUyKVTB1SZIC8anGlWBlXLXHIuRX3NiypzOBEL17
         Ja1w==
X-Forwarded-Encrypted: i=1; AL+hErHuvmc6RpX4fQkMp7TvY8cRfhfKeurQfi/sh4zFa9eDMnfXe9PsXZCFzK7y51wIjVrziHjzZzvsr5669E4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vU0ep1ALz+zQaMdrtvZANFwFn0eUln8X604FBckUwxDMt2O09
	1kHzUPKBKWv1JzDupeQCjbkUH5O6dtOWhvrv68cZDmohVKjTo1HyiLnh
X-Gm-Gg: AYBFou0+WHQy2hDwCw64oCtlRDYtIlXPdXPdhRNzg3Uh4kP59twhgtBeRu8Aiop8q8S
	LeJu05aSuZ6s6+BrPzC+h5xHiAUjd57pDfFcuV8y4NuBxTbnm56731VjRNVcxZnla8sSjNYOqCf
	36F+GJgPJcBTn1fV7rMadaTlMW2yG+NbFnlS8oiYNEBGb3+1LhwAtZJtphuzpeOLR0wZPcN9fJq
	YFo/02qE7t2yI1odauxVXKuFUME6tcjDcXQC1zfL6WXu1jCvNH1mjMNqajjWQOywa+EBw/mPpS/
	9WjaWjVMJFLd0NYCmqKcAbFIQa5wswY2A7LkknDiezppnQBvoJzZQ8SABD/wTUVNj8/Fn8eN2rQ
	vONCpTo+IZHSzSQGDS/uIHSGtC5bWxsSbFaACYXkdsqjIj5szISQ8NRRmpmY77pQ//yCCVDbRsX
	bBjlK+DPJnYY4+YHuVSYYEth0tkc9YJpWQSDV8cH+K09PXsrThRa3CA0Nl/j6JA00UXzJ0Smc2I
	vbfjw0gw4bhB+vHjCTdvESc3UlbgpLCj/Rlgen/hFUw6uCjiNVCQKmxxXqjZYPxFugIFYX8abqa
	I9x3CW4TTLkyqiC5Ges7DwRmKWg0+8D82ZlaDpdC1rI3mJ2zFRCZh2Q4roN9dISUBMpS1S/hWng
	J4F8xM8d2H/5kVi7DJdsGEeU/oDpsm7EaQeuoUIC0Pi6sFutT83q4
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr795897085a.26.1795207372569;
        Fri, 20 Nov 2026 12:42:52 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb424fa6sm270598785a.40.2026.11.20.12.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:52 -0800 (PST)
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
 Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf v2 8/8] libbpf: ringbuf: Prevent missed wakeups
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711456.18576.9562508567420854149@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <be221942819c7654f054b53907fe9ff2e9526f79.camel@gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org> <be221942819c7654f054b53907fe9ff2e9526f79.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Please move the test to a separate commit, I'll review it a bit later.

Done in v3.
