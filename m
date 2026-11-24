Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505162;
	b=gD4Fw1N8qMmxB20TNw5JgClFO800yD5RejooQRSC6M9JPm25pa+YkV3ni7KJPTDLmvJ4
	 /Im53GHIU9T7Uzv6XpYf9AxNKV1G5DbVr5G5/+hkVZS7f8bylBo4p/cJDDXIAVQcycCia
	 wt6eT7rKWXrJC2doWc1PGlhVhwXwI3TeqObqZvsUWEDQufcFRsvcQbnO30ybSXsMILRf+
	 sr4v9UnaNAZcMBeskVs+zRZH0Mer7FDJR3H6TzOMgizqThuIP8KQpWwq2qnSgDo6SoBKm
	 p2lvpCVXGGnLGFEx1bbzrBdO9m7oTDwpLgQDAJwopu7yx+nIlGlCoAFaE2AOy6LEAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IeBQC3lSXEZNlP3HbfWzWAcMFyODyANfg7T0vLSKZnM=;
	b=w/SZ3Qj3RNluN2V8wBUQyrEYYJi2zxjA9Cma9dIcNLwwn7SHgikNeBymogCtH8TTGe8x
	 fga/GezdtKLvQwnTocyIR+TdjGtuIEkysHPVfJ4jnGAZlfLmQV48A2EWo02xeMPxAAbCQ
	 +D7SXRr8lnTIVxY2Fq4Rb9/qKhjFm3Prm5V/04UNox4RJDc7oqYu3UnxYYVYiJE7ZhnLu
	 +DD9A1/614Gc+G7YaC1LZNiDVcox4IElvzSsxumNpomth85SUzoTJvVyLROahTMFrsb1m
	 2m//EYHO17iSAiHbmMyVKcHQyEn0v4nh1Xio3sLFUU4PBkQvzxVwRasi9nC7CRPBhzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="S/Smj6gw";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4F3606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=S/Smj6gw
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so4829741c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795505161; x=1796109961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBQC3lSXEZNlP3HbfWzWAcMFyODyANfg7T0vLSKZnM=;
        b=S/Smj6gweouoG95p7UsC5L9Rx326jh0jEK9gkCokZYGvxdANcb0jbpcviSVVuh+H6A
         4371MTqFT/jUvbR/Z8Tcx6roSTVrzfF75Tm5uMLkzi8qyBrEMQVt/NvknLxk51SuVVa+
         sE1F6Dbanul6jDvIlLeAy4t8p0O1wCMUXNxs47k0MxUPbJt0YRU0NK/eGpsmWRgO5v7V
         IHSujl5P0chvXtfr+4FoXvqxIvQTklqVHZ8p35Tkvn6NdtC/uGme9ZSZlJKP05mg1IO4
         xosJ3Mwn9AsibhfRhFM9ZxhyG6LA6Z5JzTYt8if9BrFw3kpOVlBjwVBUBKxYYJ2oXM7J
         OJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505161; x=1796109961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBQC3lSXEZNlP3HbfWzWAcMFyODyANfg7T0vLSKZnM=;
        b=TQCZqSRjGzI4uT2x/z9EISGZ+CWHT5UVIsgMZ+l+6LqIOZ1wztkAjOsLg8yruH9BYA
         rH/ATnsTYssVjPYm5A+GCA00zqZe/5UQoHQO/6QFj9zpuYrIrN8tiWMbY6JOOmz2Li1g
         x2StX9kSTcZKjR8CbU4J2yN+c6avqNvsicnDI32Q5wrWDIZmv+eUYUdzvuVFfA9qu+f6
         Vxv7uddjW+/cgeHOA3ZdxiAWb84b/59Ei7PXIy7k7K/FtwUADYOQ9ZVT9EWJhKWN25cn
         oMoGnWCIjgylYd1WTu0ARXtVA0drMMkeS7A28v36DuGgHhipODVG9IsmTDq2VbLP7yKk
         7TBA==
X-Forwarded-Encrypted: i=1; AL+hErF9LCEG3p8+hcmuoAZLjOt95I4axrWlKdGkL+FbZw8Oqda1YrtL+JujiV/9icaXRdIzQOwD2rDzFiAranc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vIJd47Oo1zK3Bm0w67svW0PnLGfCEqgCg9/cqJY10Nml3PZVv
	3r9tJGe7YDvpjlTlfgLEmPNVDKs968GPGgQLsAx4LDWCObJ+MBLpNIStTiNvWjiW1Vg=
X-Gm-Gg: AZFdTZfnAaIZk/NXeVmSsiW0rhttsKKFl2Jl+dCzDZOuAknyc+SNx6+rNlArOHch2k0
	HDdUIsgzXC4fenDHUkZEeJfplIhmTwEQNrtmCDGDSL8FtWMH+HpH462dOYkUOZ4GQQqUbslD1Nn
	7Z46RztWPLtRvIoYJWdZpV5UEVK7bcVsn62xVxj8VW/rWmPVqcpxyDQXHoKfIRz5OfyiNUhySpF
	FRSPlwVkh/vAKXORSkjOgh0JaTAPCqMZ52JRSPhKA2Dz4si6SD0/8z8ytb1/ZeQznVwY0X7UcfV
	RF0Oz+mGkTY9vya6OmAgDS5nUV0RQVGcus9vGHjdSGYGAUZXvE3uGlrP5zkcoE2ivr8gSIebdza
	9Ih7FfgrvbdBUVgytV27+mEvSSDm71IYNSwENEfw2iB1AyT2u9b9l1wXHSY/lnnSatQ4vZGAKxU
	JUOq62gfkyOwneHg7MI8aY+iqWJUdnQhn1H0Ln1VvlgALMCWcuJ0kIUwgCIIhEHfD53NfSghxik
	19ESBTyXZK0QffpBiUo8DB4U5YPLuQ59cBSYnmNxWC2Ifjr+D+Us593tdzWErD8ZY8KMB2jasCz
	86phAo9ktOR4cfYr0YXOsPKkN3KlbKlVQ2UhCsnolF9r0zSMX85+LGPOgaMno/dDl2J/B3Jll90
	dtp8RksMai4LymbD2x7gKl2mjnVdQuJdeF9CiVUsx6dNN+3xEA20=
X-Received: by 2002:a05:701b:2088:10b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b5568d349fmr14493980c88.29.1795505161121;
        Mon, 23 Nov 2026 23:26:01 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm33037003c88.1.2026.11.23.23.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:26:00 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v3 3/3] amt: make the per-tunnel group and source limits configurable
Date: Tue, 24 Nov 2026 07:25:56 +0000
Message-ID: <20261124072558.846669-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179547826432.3135.16263442399696125291@kernel.org>
References: <20261122235724.2898320-4-omar@blockcast.net> <179547826432.3135.16263442399696125291@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 23 Nov 2026 23:57:44 +0000, netdev-bot+sashiko@kernel.org wrote:
> Do these new ceilings also raise the per-packet work a remote gateway can
> cause under tunnel->lock by roughly 32x?

Yes. At 512 groups and 4096 sources the budget of 2/3 allowed 3,850,240
bucket and source visits per Update, 32 times the 120,320 at the
defaults, and the caps were argued from memory only.

v4 caps the budget at what one report as large as the device's MTU can
cost: a host splits its report to the MTU, so a report names at most
mtu / 8 groups. On a 1500-byte stream link (relay MTU 1460) that is
416,256 visits at the ceilings, 3.5 times the default; the largest
legitimate report there costs about 348,000. The defaults keep the 120,320. A report
larger than the relay's own MTU, from a gateway on a jumbo link to a
relay on a standard one, has the records past the bound ignored at high
limits; the commit message says so.

Measured in a UML guest (KASAN off, so only the ratio means anything),
v3 and v4 booted alternately on one machine, at the ceilings: the
report you describe, ~7,500 empty records naming one group that holds
4,096 sources, takes 8.2-8.9 ms in v3 and 1.3-1.6 ms in v4 on a
1500-byte stream link (119 records applied against 13), and 5.3-5.7 ms
with the stream link at 65535. A full refresh is not slower.

Teardown at the ceilings walks 512 * 256 bucket heads in v4, once per
tunnel.

> With hash_buckets at AMT_HSIZE_MAX, do the per-group and per-tunnel
> allocations end up just over 4 KiB?

Yes. v4 keeps hash_buckets at AMT_HSIZE (256): pahole gives 200 bytes
for amt_group_node and 168 for amt_tunnel_list, so with 256 heads both
stay in kmalloc-4k. At 4096 sources in one group a chain averages 16
entries, which only makes a lookup longer. One tunnel at the ceilings
then holds about 2 MiB of group nodes and 0.75 MiB of source nodes, and
max_tunnels multiplies that; v4's comment on the caps says so instead
of "a few MiB".

I will send v4.

pw-bot: cr

-- 
Omar
