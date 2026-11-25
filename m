Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604617;
	b=C+8dhZ2EakJY9EviT5j2W4FvCLapt6Sw78+le6ykG4en5ihEkl0Fb7As3yMszxUa8LKp
	 mAD83C1jyawzBa9cKeMBEtMnqQDXa7Bldz8JCPPLDT/X+Y1xgh/XZEbXAYHHv9HJgZ4yn
	 yjtdoOQW3PqfhwOCJv0TbRFGClNMZwGU4xMaydcyztZTjFV851fHaf96d/UbVP/hlv8RQ
	 aCnLUeaC/HnsZVEoBEQpFJw8QoYs6M+d6ih/ZiY9ZRF2A4DVWUuymKD7WayOO70XFHuAJ
	 5wWkrY5wAPKGPqF/mtBXJi5KF8I5U8JS/SZWUuNLKKIh76QQ9TSEZ0yJEWvWf8PXBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604617;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Last-TLS-Session-Version;
	bh=01q8TemiEbPQScbgUzDguyMv2m06hdvW9i45NWYmZMY=;
	b=hshnqNx0aiaO0lGRrfSvn54qMCHMcFICvJBgcGWoxDIyhRSnABW6o9OK4X8Adfwkw3hL
	 koccovdKLgLnyKGLbBQXk86o5q0hSXOFYqpmbH0Q8ldnNuNxvDwCBeyUDS9tm+raU6AiT
	 NtASIsG74RMDn0eZUZRk+6LfV2xRByYkLkPc97FjEtqdxvxXsP81qEwnsfJQJQswInvxG
	 5PzA6Q0v3on00GGd6Hvmtb/HKF6wOukvTP6sqqIEcytGL7YsCsceTKW8FSfCxQc5el8OQ
	 ancTV0ISnBf+RXGP2JS2d8lqNTOOYmlGcG9XBJVX1EahwvZ2S5pdGp+DHEpVVftHp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b="XQMJ/SGD";
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DA606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=XQMJ/SGD
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so2995747fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604615; x=1796209415;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01q8TemiEbPQScbgUzDguyMv2m06hdvW9i45NWYmZMY=;
        b=XBLjsHhMiYAG/QjbPfI7/L6W733zInDYCXTXjGYajhY6iXUVVHjoTRiRGpJxYSgF2S
         SoXouB5fRqRhD9MTfeIrc43l9GSR7XPzSYdMGcGo8czHDi7Kfy/UsBPFRbLaKqvj02mc
         f6U3SFpeNmDHe4yU0okupbz5gxXsrhBNbOrFj5/+CccUpsxY903FLLDoIb8YwUL+bCQm
         8sDmLCUiSaOdrfU/nmqChMDg7wqAwdv90i4K7jfafx8Y4keD5yf3DI7J56zH2RUDhRIp
         qftCKTDhYmY+tjhv/XzL1RC3NARXDdpdjwna/YiN+q3AMzQjx+r5/K2ds9peT6JIBxHb
         0csw==
X-Forwarded-Encrypted: i=1; AL+hErE2R+bBi9qh5+c/4hxoIKZIUJtrlIC7HjUKDLWMxmu56m7EDCwcjnxPlsXpoY2ziwbb3v2bL6FcF5TGwv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6r5BNbSU8IUK1ZumkjQY0BNFNO9YLGrPoXbf9tHA6mTBj3Uky
	pOAIo1NqFm4wVA3PNZwORKtWw0mZGLTtpDQfw/sOqgHfjNUymTwp1C+g
X-Gm-Gg: AZFdTZcw65T5G0M0Fw7DRZrcb7j5A+7yOTw25VYVaBoP25v0p61EXoa/AhF0X6LrJ/q
	ZcTb4ksZJ9b9QcWu8XmkyMpWYb1Zbgjcvp2SWg6XOdOWTlbgq7+QpGixIZomBnnDTYNp1gJB3uV
	NU5QvNpwWWMl3D+f+ldZrsYk1LLQqUNgJETB49MGgbaES1Dus1kNAkIPd8O4Gd5lyeoXmwOhKC7
	t0eJkKyAGBiEyij5gIClJXJa1Yh+2XT/JZcuodRThlBD20qDtFlKOumlAqGdek0LCofn7cXP844
	2MfKflamS3tQxQ//DrpvxUEjfJ97W4+eDpPhAnZ+N9kuwbfEWlGtLsl8q/EJXF0hgulM3Iy3y7P
	lNJqh1wJAWetkPBOen9Hpbt80c0b02gMxSkpvHvpqrBPRpTUkl9UNZLEsWBcZWEzSLw06XrNvXK
	Wm4071HW6K/Xa97YzeleJEEWyDOxvyx+51teQNU95Sg23HTUrEdxNDRlLlPatJC5jP925z2akCL
	r9yvMYKU6iEteZZjdIiTb4i7+6+N4MmqEJfhbCaKPWprT/Wsybf/n3omMpM2Jl2qqghU0qvjZbv
	IHpWIsQ8MMKBQM/4Kry5D3eGyk7VVlx89nCRx53MwoQkKY54DSaByrpi1HRNUkNcWjL2Jg6Eb8W
	Lj7qJTcjdtQJFngnXvCQy/TVJs3zknyA=
X-Received: by 2002:a05:6870:be92:b0:49e:4895:2366 with SMTP id 586e51a60fabf-4bc8208f78dmr16261363fac.36.1795604614931;
        Wed, 25 Nov 2026 03:03:34 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d766sm15946324fac.2.2026.11.25.03.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:03:33 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B25F605F4;
	Wed, 25 Nov 2026 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1795604610;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=01q8TemiEbPQScbgUzDguyMv2m06hdvW9i45NWYmZMY=;
	b=XQMJ/SGDl7Kg0X/2qnCdY3LpM1KMcJbFQ0pxQypPzVhm8COHEUxisIbsIrBUB90w/W7C6l
	FiBNXIOvemLL7PGLJVDh3yMuTAj/lkfMZgpOElbRUHkvtK18Z4KkiAksbjtqBZXBkX3bnl
	mOTh6XYG7PnBSeAaKBb5eolC7iYERs3DcwClqhAkrqbZEqO3kyX9rPGZAxmJcuERDotPgU
	QiRWiWezc2dDmfpEMG9UMCgo/Gh+D7fF9RK3boj2/WhejBFcMPCfluXH6ebsw8UXjlggSz
	lHH+Lat1Ni9B2+Jtpp3ogCZ6W/pLwFgDVD9wog+yicNu06IqZxSUoryofd6iHw==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Wed, 25 Nov 2026 08:03:18 -0300
Subject: [PATCH v2] selftests/bpf: Fix kallsyms parsing with long Rust
 symbols
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-selftests-bpf-rust_sym-v2-1-6cf5cff663e6@marliere.net>
X-B4-Tracking: v=1; b=H4sIAHXABmsC/4WOQQ6CMBBFr0K6ttoWMMGV9zDEtGWQGihkphAJ4
 e62eACX7/+Zl78xAnRA7JZtDGFx5EYfQZ0yZjvtX8BdE5kpoa5SqoIT9G0ACsTN1HKcKTxpHTh
 UphTGKJ1XmsXnCaF1n0P8qH9Ms3mDDcmWLowm4Aa1t12Kou0yaAqAqewchRHXY9Yik+TvgkVyy
 XNli1I0whYA90Fj7wDh7CGwet/3LxkB9r/uAAAA
X-Change-ID: 20261124-selftests-bpf-rust_sym-e9b50bb2a39a
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>, 
 Alexei Starovoitov <ast@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1795604604; l=2430;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=v1+J5AyYE1mm1bqUO9cvlJ/WDdBXeTNjZKb0Tx2U1oQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJv0PKQKIyXStomhGvoJ0TsvTJMYIsGcFuJ7wxLe8AAzeOf5WIoX9JVkQRmWrWDvJCSavAZ19If
 MyhLG1oF5KQg=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

load_kallsyms_local_common() reads /proc/kallsyms with a 256-byte line
buffer and stops parsing at the first line sscanf() cannot handle. Since
commit b8a94bfb3395 ("kallsyms: increase maximum kernel symbol length to
512"), symbols may be up to 511 characters, and on CONFIG_RUST=y kernels
some mangled Rust symbols (e.g. drm_panic_qr helpers) overflow the buffer.
fgets() splits such a line, the remainder fails to parse and every symbol
after it is silently dropped.

As a result ksym_get_addr() returns 0 for symbols like bpf_fentry_test1 and
bpf_testmod_*, address lookups resolve to the last loaded symbol, and
bpf_get_ksyms() fails with -EINVAL. This breaks bpf_cookie, fill_link_info,
kprobe_multi_test, kprobe_multi_testmod_test, kprobe_multi_bench_attach,
tracing_multi_bench_attach and stacktrace_ips.

Parse the file with fscanf() instead, bounding the symbol name to
KSYM_NAME_LEN and discarding the rest of the line, as kallsyms_find()
already does.

Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
Changes in v2:
- Took Alexei's suggestion to drop buf and use fscanf() directly
- Link to v1: https://patch.msgid.link/20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net
---
 tools/testing/selftests/bpf/trace_helpers.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index 6d7a4b8c4ab8..5f558280856f 100644
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
 

---
base-commit: 81c6c8c608b6075846d3bd5b6f57958300a56eda
change-id: 20261124-selftests-bpf-rust_sym-e9b50bb2a39a

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

