Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575760;
	b=Jc9Ioedn5kTSh2QhCGXIqQoeDMiDcvQgrywEqwQOCV9CaPxCgv0pMjDk6a8s7McdfhE+
	 AP22NpMriG9yJ8orVHP9vM8Ylgsp9BAMSPW0ChaYSR4THws+Uof8rReOFq0RB6X8BdeOv
	 PotWhDIzxqeuNwpHE8+uRVICZ8sL/inQMoxrG4yK+3udZhwgieKez5+9EBnEqBSxvy4IY
	 8myvc52AALMs/YYxcTFcblyH3D5Y3hM3VMndaGe+S2FkNSvolJ8MdzuNgkL3DmT3jqENY
	 2Ubhcv9ObLPweGA0g27m6Dccs1WaZuWsz8zYVcn1hvMuAn89M3E1lHoA+Kxaw9t37rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
	b=jVeO5RUMJ4mAsrGyUa8Hoi15lgzWB8ir9ntZ1e7J/BzUWq+EYkKWS2LzMYig4LZbSDlk
	 /PDeXH3ICjFHFY0NHMagxv36/a7HO4b0PQYkqqcIy2eGENksFqbjgbTLMLt8qkZCPvTbp
	 ajAkZH1n38XXLBMQ4UdnStLpd+oF4YKqUsG6rniTRu06qIvCnBEJXxzFJeYU49ZC4UbvN
	 SS+LjF4skeGgQN0beGtQDKFxgLngZ3rAIdKltfgRFXXSES0D+uXMwEICf7nZ76Lm0+/KD
	 QlXmaF2hDnNlIouPeY8cvk+hvLbP1FMGOtavKBT1AGqPlHOdQlwKpUgriqmnS77+Ruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCd2zNLG;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF31606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCd2zNLG
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so2956916a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575759; x=1796180559; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
        b=tCd2zNLGnXe27TOvg3Nsz35+Byxb+vmFt56s3OM1ujZaghvtCNHHsRIR3YgL2f76Gt
         qRAgSe7g8RVRytFGdJzCrBNQxJ9z9387sYot4IQUEAfqw9ixE9QBj6S+YbDQ+jLlEChY
         EMCGu6AK8SSZ/uNPZB96MBlT+/8o9Yt0SzlYEs7UL4+eB2bhnPJKt4obwaYlAZO5HkEr
         F4L9ZaayyXlejIj4ERqBQ9zZatOaT68JRM5VT5r0oRY4awazV3OAZqH7i4Kb5jbNkqan
         4eP76rCcqG1qt6TMRnhsJ31kg35lPbxjP9t0zzeSpX0k0AJBn6hDJGu1BhCvexrkE1Hd
         fsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575759; x=1796180559;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
        b=CNRRo3dO3MSn8cWj+3MQJlK+wM5z+lLHVmTpU7PegMkqHcc4uhAJRchoTVruAgp0U1
         QASQ5odpGd03RXpjoER9CkEXTEZ8Q0sgAbreeZSVVhWbWbB2UXZLbFufsHK7Dzq3DQF3
         VqQ1h8oJNctuHirMZKt1mWBQEPz1cSwhfRgMs20MoD6HooH/Pb0eEeqv3hTbOgPI6bcn
         8bssFPvziYTMDJiMD6TdrP7sTnD+x7ZnFIsqqYjWLIKgtDxUGEEOg5jo3W4tKem3G+fJ
         GCUcOs4d0OccyS5UBvs6dJA8h9ovIP1Lki/5QfjMGTqdDijC3TGuPqtcw/GiM24KUZ5v
         cc1Q==
X-Forwarded-Encrypted: i=1; AL+hErGT1jU46JdOs840CHIwgtqerI/19VdVkh9jTOE8ckWpzhWu3MjQ24FQ8iRZJVEWH4z8L4yCP43+JsCKHw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z81lBzrM2KWjcOLl32jzNQE/9Jro1YImmIFYk9FTC/V6ZINSSZT
	RGI3nALWsVXO4fRL1m4nBL4A1o0EybXSYc7Lkiio3yUyN81I3M0DHyxq
X-Gm-Gg: AZFdTZcyd/71UlOBNHMujQk3yKvlmFViccCzUQRlJOYC7jPqE9VV++7R2VgZy8vIzBB
	Fl6VCy3Jd4J7yjgpCRI2/D5XPn8jgin7V8mXYkDDeb00Q4L0fpoCx4kc3zcJ/y+4txImtMRsarc
	zq6mhSsG9EzqeB7+BTicDQTEPznkn5iN33MtMCWej9FT+Qt8LEheOKqniDKfXW8+nWOy0NtqQNf
	3IrzicW/M2xVkYCYEuHtYlWSpgSz1pCmB9h72+v8jdRfxuPnYbtddRUNE/hwI8qYIu9biiJqdOl
	aivUJL8fSIPD0kbqOjqWUppP65/A/DreflF9RzyQ68b8OMh1clOkKYAKwgSz3TYrMfyA7IJerVx
	cIRiApAcJeiIOM2oqS9v629crJk3sIjL6LVmBJ1P1RgcE05BGNCEJnSdQCnduwmQqEpzofulj+k
	PF8s9zpQTAEaTVMUWn2gpXsYLH+Oj4JarpDqruAI4t2mw7yu1Qe0ZLO7oJzgPj/h1Vo2n57+YiC
	qlmadoYWh1QY7Lo7VnAGxcMUZsIeEAd8twDRCu9dbktNABVxH1o8aC0JUSEVRmYg2ep6d9Zf+Si
	3IxzojvmCwsSTMRQwV5vaL06NGNTuhjnp02NF4VsWilyaaX5HB5/3qvXQRVV5Z3p8eVTN7+PYSA
	6Rjj6JdYOuIEsi8eEHqZyj3SgQUsrL/KlwtJRwohZ6xO8ATEzj/6+FO8=
X-Received: by 2002:a17:90b:4ad0:b0:3b3:cae0:2b68 with SMTP id 98e67ed59e1d1-3b41c95e7cbmr16230428a91.48.1795575758907;
        Tue, 24 Nov 2026 19:02:38 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm24999098a91.0.2026.11.24.19.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:02:38 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 03:02:37 +0000
Message-Id: <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: Fix kallsyms parsing with long Rust
 symbols
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
In-Reply-To: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
References: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
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

On Tue, Nov 24, 2026 at 03:33 PM Ricardo B. Marlière (SUSE) <ricardo@marliere.net> wrote:
> -	char func[256], buf[256];
> +	char func[512], buf[1024];

can we drop buf ?

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index e871a26..06f6553 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -64,7 +64,7 @@ void free_kallsyms_local(struct ksyms *ksyms)
 static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 {
 	FILE *f;
-	char func[256], buf[256];
+	char func[512];
 	char symbol;
 	void *addr;
 	int ret;
@@ -80,9 +80,7 @@ static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 		return NULL;
 	}
 
-	while (fgets(buf, sizeof(buf), f)) {
-		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) != 3)
-			break;
+	while (fscanf(f, "%p %c %511s%*[^\n]\n", &addr, &symbol, func) == 3) {
 		if (!addr)
 			continue;
 

pw-bot: cr
