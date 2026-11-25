Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604633;
	b=UrEFaoy3z+olzWspFWNYqoeavWMDWyZ7AyZYsa9z4x0Rw5doSbNzg+nAQjeKEXONAzOt
	 LCXkS6YTVxql+6jmfCx3clIoBiwdz1O9f2BUjAr8rB3mhbHWOoe5qrhxApsHDJi2Y8fm7
	 MDb15mlClodPsIZooMgvookS48v0o7g0e+Qjg0yMG3mqvs89z76Hr/uC4QC2M0CUbDAJ2
	 Y8YYp7FmutHkZj87TMprfPHNBjN7IYHxl+9nDCgu4XgAOpSmodr6askk9rwacgIx/orn9
	 BAaohpDCMGti36X7uYwBrl+CKBSwrNbmcx0mip7xTtJkXn4pypSXIsiAU7fTeg42MZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604633;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 DKIM-Signature:Mime-Version:Content-Transfer-Encoding:Content-Type:
	 Date:Message-Id:Subject:Cc:To:From:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
	b=QUkqGY1BxEIxsea6qSPG0ffmPpaOjkEsOVBQFuXVisLd89KsP/7bBduR18NRZbp3FO8K
	 XFNWEovlYpA6RXngU13YLgcECz7P/eRKF577N4c1VneM+spNYdHsGJwiNxD/rs/jvZMPQ
	 XOjKl1l3R2rQQ8NPbDIN7WMoejgOcPhxiw7bg5UjgUw2FVj7wMlimDD1j+FNDUx7/J/Fw
	 85ASKhAKiiXQdGiAX4h/ZjdxBUBcdy8kL/Vx9g7iVlGWBkZHVxxeLyuZz7RK5mNjXMYql
	 PqpTB1yI3Hg5Scq8A7cGO6sXmEK6SAw1qmVNfmt2sDIx/YrtsI2qPNvVM7UCB30P44A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marliere.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=mVZBe53b;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15769606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15769606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=dkim header.b=mVZBe53b
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48eee44b908so3300951fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604632; x=1796209432;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
        b=fRCGhSIeLuAZ6Idjg1Vmqp04AZGExXXpmMpourgSKfK+5MGQz7K5YwWiNysuHsONKQ
         W3g5b+GzH5cCKHcx4magiruSpYkw4ZcuI76gxZfB3MqV99lc8TWSZYwEIa1bCNaTKlZA
         2c2q+QClUsONzjYkfP6ylaalofmCaSQ1dgVMB2+B3D45D+khj7mk4e+Nt2XjX63vvdcG
         Tn2eyLm9ztzXXtFym0dVLPWbEAo8LGt+FDPzjehr8tBYAhCPXXBno13NcV7nlZO3KpQc
         3U0PtdyH5TUEET3pC3eIH9CesTzvkkwMwChBgfdfD/Da2iOGQFSTi4D2mmioBXvlbUET
         CRZg==
X-Forwarded-Encrypted: i=1; AL+hErFgUjyQX2RvqukYojPJ7L+kyBaIvTS87zbr+MujYsUvcA1u5VB7pqtwtg55mJcM54WLT42/5U+gRZzdYj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9piZZHhGnX0cSHZC/pESNx938XravdRKXJWcCvAM2Dgvp6jajU
	uYXOnQ1xtqYKOF3/I3iTqSmngcyxIth5r4aHZ9dB0nJNPIbdhpe5NHQt
X-Gm-Gg: AZFdTZfhOEaYgSUPCjtZYjF8Ft/VjPnPSAuL5wWHsjTmuaO0X+KtBq/ZX/7jTvbW4Ja
	xjl1sju8zYbAfWrMWMhtefPWw5v2c35WKTwk645QoKkdBwEy4ze1TbXP9SiMJgS2pf4d+SNgZcK
	5eTXRW+btWU0zQGbFMNYTbnY2z2xh/SVfcZFwSHyeujGgVRQqk7u3dmWhDGtEy1tiEICUh/zFDJ
	uSrFWJ1Rwc447xxbtq20spCcbwMaaWXzoB+DYk0uqUjlMmD8LawCUmN6erNmIEaIhcX+c4EQvv/
	ioUuyGC4CCx4HlWoi86RkpR7ii2AX+MkBV3n2Vxb7ELjjIkETYpVIUtynVArvRdzKaqe1WMN7/I
	dzc/EVzPrIbkbvp8WE0zyMohen/yeynrDds+pNyvvh9/Mq9kiOJ/C/OAAUs8PXqo5qNdZrJS/nL
	sDy81pdVQ7QXpeIqxrtpOoFD2BKklFV5S02t5QWkR2NFiBeAlRg8iUQ/st6QaA7W+r+0x1Qqgma
	efNXl6/nbldf3S0nnep0KGPhBV34RehODIcde3u31jImNtjVel2bsQ1IZsJVeKoLiukUpguDyUn
	hDR+KZ+GF6dLSf9gEWljp9MSebwts+OQuYRJuo+jAwmFKw4oDJjxbI4+4OIymxvkkAGWbzVccRX
	KwKbHyXk5zI/WawBYZpk48Y7qBKGaMC0=
X-Received: by 2002:a05:6808:3195:b0:564:5fe0:dd80 with SMTP id 5614622812f47-57a0c6b6b35mr18642000b6e.49.1795604631958;
        Wed, 25 Nov 2026 03:03:51 -0800 (PST)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35655a5bsm13720074b6e.13.2026.11.25.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:03:51 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D3B7605F4;
	Wed, 25 Nov 2026 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1795604629;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mrSzuPMkqX4MWQZ1Vs04gvpO/41JB6WErbOM51m8MaU=;
	b=mVZBe53b+1iYEz2JUxIuiNR9+Py0/uSe5+otcdgdQWU7Taf9dvO+hB3dYAycHS4mpFX58G
	vV6DZzVxJ5w8FUgTr4XqUexlvB7GaFWiW3OZc5E5vLnquW3/R7BVCiaQEAmhTwaI6KYcz+
	WKMfwezQ7cQLflxSwa/Npl0fQJVmkwKtEmDNd5aNJMCbzuVVe0ajurUaD5bCcm6NTco6Ds
	1vtjOlq9kbB/huibnDLki/qUWQ4E/tssU1ut6areHNAORl2PP6lefnfCyTkQSBxPYZQ5Pt
	HHr38vyct1t04ZK9gvI9jxbGiJLcYvYDkBcVLc91Rz0kWIqh8m/9Uy61UkQceQ==
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
Date: Wed, 25 Nov 2026 08:03:46 -0300
Message-Id: <DN48PTO1CTAC.3DAKV5TKHPXLJ@marliere.net>
Subject: Re: [PATCH] selftests/bpf: Fix kallsyms parsing with long Rust
 symbols
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
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
From: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?=
 <ricardo@marliere.net>
X-Mailer: aerc 0.22.0-17-g7220139118bb
References: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
 <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
In-Reply-To: <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 25, 2026 at 12:02 AM -03, Alexei Starovoitov wrote:
> On Tue, Nov 24, 2026 at 03:33 PM Ricardo B. Marli=C3=A8re (SUSE) <ricardo=
@marliere.net> wrote:
>> -	char func[256], buf[256];
>> +	char func[512], buf[1024];
>
> can we drop buf ?

Sure, that works, thanks for the suggestion! Sent v2.

>
> diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/=
selftests/bpf/trace_helpers.c
> index e871a26..06f6553 100644
> --- a/tools/testing/selftests/bpf/trace_helpers.c
> +++ b/tools/testing/selftests/bpf/trace_helpers.c
> @@ -64,7 +64,7 @@ void free_kallsyms_local(struct ksyms *ksyms)
>  static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
>  {
>  	FILE *f;
> -	char func[256], buf[256];
> +	char func[512];
>  	char symbol;
>  	void *addr;
>  	int ret;
> @@ -80,9 +80,7 @@ static struct ksyms *load_kallsyms_local_common(ksym_cm=
p_t cmp_cb)
>  		return NULL;
>  	}
> =20
> -	while (fgets(buf, sizeof(buf), f)) {
> -		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) !=3D 3)
> -			break;
> +	while (fscanf(f, "%p %c %511s%*[^\n]\n", &addr, &symbol, func) =3D=3D 3=
) {
>  		if (!addr)
>  			continue;
> =20
>
> pw-bot: cr


