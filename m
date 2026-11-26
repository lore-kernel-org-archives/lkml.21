Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724257;
	b=ZDl4OxV6SXgb3VSSIcnejTyU8NQJA7nDnValSdzsuV+DtfBw3Se0/jbgi+i9P9iYxLpM
	 qHAJoQ/DZFLm3/wLSFD7L+PTfzHMs1dZgORZ0a+/GExhAeKzEX4CVzKtipQuBrLDMLkmh
	 EgVWO48XVauNNrTgWc5kKiWQuuo5m9wJGtSamWARgvYGjidVUUoxZw3Rfo2aZNzazJNOp
	 TiLyTtRFAix5jAVB4cngkVhPZPZIAXv9rHn4t7N9LfLiiT96Kzn8//z+o4lL6M/XB21j5
	 qa/Kq+nyhlJvFhJNtOHvU06XRKr7yu9yPzyyCeWOPp9f3O9poVF4d3iJ908GxLy1U+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
	b=T5/kfHdT8xUGvqyNQkb/E180E5JAgC9h5QG1jsLvh24AamMX63RkcMcJ3/k4VLbLFLEl
	 gSMG8JiQeYHdLbyisWVdT/kM0I5+0A4tino6dt2qGTuLTh/adZftyJ+jWxBpYRJHirw3F
	 D6lPLGSir3U1WZhb3OWSz3ujmfziBhdBiTwmGRTHF6KTinNt51ZRvbjydWPhy6+X3fLK7
	 lA1ZfyPkKIOSHzLgkIdj8M76pjv6m27AAQfNm/R+9SqDX62LZ8zDwO0uFH7w79Vf0Nq2h
	 ValYEnyeap6xuBRgnx47GJhWE31NB8zuMMSV3fzsn+V7RithkmZoLWNYRCf2lqXXwaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIXrw+PG;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D6606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D51D6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIXrw+PG
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070755c8cso3574943b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724256; x=1796329056; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
        b=dIXrw+PGUZ9JFJs2m6IaKkl/LIB/ng9aqcp5cpZYueYeHvzKgSF6UVxoSJfJeV3yDo
         vfHhawgOnGvwHyR7T6h8eyGAN4HfXCpBiOsD07y4j4BDjyQXiw5cf+rwbBQdX2rPqq1L
         a64HcF2K98qV8hPTQJd9nVIQg/Nmu4sAJGfqXljLu2g0SXqzT5SLrdt9PfnOLCaQIC2x
         s4+RTs4c8V8EV/X9VbeZHtN5+0WLYHpN1mR7l39YBfixENuqIPHQkFUzsMxhDyRmc3nj
         bAIrKOvMOzO9WIOWUWQXnwfM3Sl20C6UWcstdIOF+PO/fzGNcdt+/GQUUrY1r4iTrqiL
         6x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724256; x=1796329056;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
        b=ub7xoIwD0WyLp2X534yxYE0t3Vm6taFqo2ydBR5YYY4PnYFdKXdGjybN3FdLLjp2wR
         h2QATN/y7ZCvvAGI8y0CLrfWPFYpoqKax5P3N2Cfp7jWmT4wuxYh6TyOPdEPOuRXfN5/
         1TVn7kuCXIi5/G5uUnvFcN24kEJ1flFbDao9ffZXceL5KZy28kcxxV4epIIqBmvPU2xa
         W9UGhx6SRCKphU0MXJWm4xsPs83UeEKg/Ez0CkrEF2t5BWEs2y827+r2iw3J/oNW41Jd
         cKZmgTV3AmoA/ncGMzeVbV1yyVMxria0TzmQ0ViJEUYC+/e0bjhFzW0PdcqwV+unSttK
         xzaQ==
X-Forwarded-Encrypted: i=1; AL+hErFb/WchfLu3zkl3b5EjmLkkil0z8pInr2e9AP1Vea0PpSdFTwzhkfJSZetM0ocbEvwyS4Mio8QMrY05+X8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mo63X6KHbV44AUJKPv2f/Hy0C8zLPUrdYPPOMLJnJK1vWFqKH
	AlGmb1yX6kWR09O6whWzP9z658sG92ymaoEQLbaQQuud/DeQDbEoG5Vp
X-Gm-Gg: AZFdTZdbXGXwMWrJWxWrpFfDJxsURvR3GCZCiaKAuJ0VlsvsQcXgTgajgHDnQeBEuph
	eWfhEqhir7X6zav6atnYauNUGQCn0qq4zTuE2anUnHnuzdy1LODAWVdy3ThnpFCDnUwR69vgKN6
	5WGRgm3UZC5uQRDMc43OoDX5dFSfa1NuEPyK5OSB71L0/Zi/lmMee0I+acl7WQ7rL3X7KQ4Aw2N
	aVVyNniOBRhKqVtuXT2/NEdhRxdI+RGSk6+5cDNvC0XhTnVGdskAT84GQ24VAkxukYHFakJWKtK
	lRIE71vauMAtDKS5kPSxNWzN3MRhWeiY+uJKwBd+qKOpJmYX15rATmrvb0IYgwVjQSNt0S7HXvI
	VGbXHAh22/NkN8C0xL55nZRZ6d7vKMFv4Dgm3G2drr+EdjTxCQDnO7O9ZaUFS+2F1u3IWYzB/8S
	FHJNMWLNoTUar56/vLcjjhTs6qqzQkLjGMSo9G1uixVpHffZ0EvUtV7Zb/PO4DNesmvL0NMqwpD
	gLmGq8ocNMkDyFOtmJY0Z6bYM08PQbe6d7wifiiP1A4z0n97mHVNInfWUEGhbAyvsS6mBV7rbYh
	agoA4pl4WJ6Ql6NxG05XkeejfHeK3ZL0On+XgiOaxoH+Xhg1ckvF7pz6LRDg4Wol04XSAYzx9IJ
	X4K31urxJvqnV3vK6HiEc5lp87HL22gWqOLM=
X-Received: by 2002:a17:90b:134e:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b41c96764dmr22000708a91.49.1795724256067;
        Thu, 26 Nov 2026 12:17:36 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b50234fb25sm3468314a91.2.2026.11.26.12.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:17:35 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:17:35 +0000
Message-Id: <DN5F4EBDNESC.3UOJRTCXCL4HI@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
In-Reply-To: <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com> <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com> <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com>
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

On Thu, Nov 26, 2026 at 07:02 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> After further profiling, I found that this collapse is
> mainly caused by Firecracker instances queuing on the
> global pack_mutex in bpf_prog_pack_alloc(). So a better
> approach is to replace the global mutex to per-pack locks.
> I will work on that instead.

Makes sense to fix it there. Every prog load benefits.
But I doubt that per-pack locks help.
bpf_prog_pack_alloc() walks pack_list from the head and takes the first
pack that has room. All loaders pick the same pack and queue on its lock.

I suspect the hold time comes from these:

  path   under pack_mutex            what it does
  -----  --------------------------  --------------------------------
  alloc  bpf_arch_pred_flush()       x86: IBPB via on_each_cpu()
  free   bpf_arch_text_invalidate()  x86: text_poke_set(), text_mutex
  free   bpf_arch_text_invalidate()  arm64: kick_all_cpus_sync()

Every free marks its pack dirty. A cBPF alloc from a dirty pack flushes.
The log of commit a9b1f19a6a67 ("bpf: Prefer packs that won't trigger
an IBPB flush on allocation") has ideas how to flush less.

bpf_arch_text_invalidate() doesn't need pack_mutex. The bits of the
chunks are still set in pack->bitmap at that point, so nobody can take
the chunks or free the pack.

What do you see in your profile?
