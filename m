Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618444;
	b=y6CMQoBm6zfhKASMQnPdX2rMw7I8TRGfzGTQbcU/0H8EKUMqZ0luVdrA9KIYVvU/hbKB
	 +MVl1LF0HXnoO+fmCpMgbI7SABl1q0/HX/Zr9iJiPn0P7Wqi9/9x5WJd74mOzMcyD2P74
	 xUJaSI64onFL5fwQ/NcnAGikGFugNwZVH3u87PZeHiIjgPq2ykig0Vqmu7OqxTzGlIp/+
	 iAM4wxbkomWuibtjL9whzWm8weZTXWg9YfydqOnqJK+R98J2joYUXAegQNmdTYapnmwEO
	 ZS5Di267XrhQVfARoXjOMZ62Vu5NMM/3XwNEmrosiSQHvMpmZsFbCjJP27nCu8xTqtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618444;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
	b=qkN5T3z6tBdHYYZ9Qdy7+JHP03tUIN8sN9kQ1YJNyyG6LRKZiN238TzAqYp8ajdg6Kss
	 oMrGMDLqkpSMmhn6kwqgRb8zOusNcIUJN4Fb5htcFfqijdGmsYNsaQ6d/iUJ3eoxf8sk0
	 J1sFFlduZ92N8yZJ6vgP3B8oHon9iW7cneaFqgFFAGV1frAcGpW/xwS8VnTS6xwMlUVSQ
	 s33rx76r+IxpgDHiFUnYDo24OrbODsH/IlgyZgHGd60XkO4LoMoJibzZqa9b2SYwzPLfQ
	 gtOyzNbuAlRZ1tr4y9nNspGTkmuQj+0581YLTU1TL29LzsSHpO3gmMJdgUaFTKjnVyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dMAIx3IT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pn33URwv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD6E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD6E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dMAIx3IT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pn33URwv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795618442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
	b=dMAIx3ITXCfH7guACr7zctorvtzz+BnDtFlFI425XAVLqK5Ufa5WhB4YM2VtpXQ+0yC3Kh
	sN5dCzbsDCNsGCabgfngNC+ElnHRPWvTeMsorFudC1/5+hAjCjFHbf79Dc8MDUj0pVoug9
	+25eWZyze/pU546RMzLCl1Sen9MMmuc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-PmYxD8MUPdiAAY-fUg1bHw-1; Wed, 25 Nov 2026 14:54:00 +0000
X-MC-Unique: PmYxD8MUPdiAAY-fUg1bHw-1
X-Mimecast-MFC-AGG-ID: PmYxD8MUPdiAAY-fUg1bHw_1795618439
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba01393800so39626245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795618439; x=1796223239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
        b=pn33URwv492/HgJMJYAPaj3LAp2loLgbZN6cf79qpiyUas/ua1yZcjWlBXoQmio+DO
         pKWG+CSXc/uz0MLXP5nRb1PRAT7XlEx55YX27md56PbAjzhh+0zeQ0fLtChkeGQ8Mylg
         3ngI/Q8HpTi6tNmxTHVELnwFnVP+g3fc5T8gDg4G+GLZ/KDHr/alx7ryyxYs5qT7dUVe
         DPr+Tcld1O2+DvGYGHz7nnsPcDhcGHzgxfVd79DW8tQTQxAPejz/RcmOJgSGq35gFODh
         pgxwLkiAZGWR1gz5VzrtGJEOcPLgdRd+OV3o/ngQRzV4IScRAHflB7uJzWSQp8R/iBIs
         oXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618439; x=1796223239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xx/dstjB6qlhxOOM3bpSPNtpLhsmfhhwbO7i7MimD/o=;
        b=OkO8tmUxn3o3aTzpXcMRtyT1b6cuqojQdKJPxFeWX4DHVYTW13vUttRw8p3fgck+Mb
         pfOJ5r65tdTzGLmwH8HKitXUxczHUDCMMaGOuu78STnEpGWxKWTxbnbUOvSY5cuZDzhD
         Q/WWHo2vK8wgg6Bos9o8KZQoYmt2Gw+I9fuHp1JWzTaQahKz3fG8A48zZ49QDawTncff
         0Su7IbTbmksu2L+LU7BxPfU45+oiKO9fYqc9g6+KyhtorsfZ43SNbuL/EWYzoOL0ZZAT
         WmWgYnT8EM5dy6Ej+vBZ71kvaR2orVOOtq3bZxv6C/0Za6Ls2Y9/j36AB2RYWhUz0Zzz
         a5iA==
X-Forwarded-Encrypted: i=1; AL+hErEu9wVIP62xKTkhWqOaMATdfsXcsZpvMGwSXO6yWIM7ri0IxpxMoyqgm7jdTWQg2tRjKXoyvU3irby0A+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L8j2WEKA4+S+o+B/ONX/cUsTJ/KPsqGm72AWFWtFouIDGn4gT
	CKx1o5zkkm+AKIbj4pIitF5ha605eRjTvBzvs29sjFiw3haxDvQl8N/DTXmWWShCHAiU9pQq5K/
	UxANCZAAowZzCKowYkbtLR4q22SnADZRtMUfDbo6dwYHConqnndulIgKrVzHxtTkavQ==
X-Gm-Gg: AZFdTZfveIxoKs7X3hN85RzHiiUG/lhNdFcNjyc4fXuU0trlPUg6kcpIg26hTXpLv/r
	4AXTg5mRqO4Vgg+D6VEwcUh6natLhRkME3UwIAwEfJ+cqf4JUNTJum/68NWdEbL4GiD5RtKnPhh
	nZB9v/pbmBTWXG7VoV8pF3RkEl/mRwJ5OlU0Lz+aSNodzEWaIOcma00Hu3n/bUQ/g7QmkofhThO
	dURsWaRci/gqbvwDEQwIeNbg09ySkBHc9fE3POeYgLLmk95lqcOiMFX+oY1WoCRgBwSOfMlaoVm
	nlLCaoFvdhFVBlGQOemIATu61fynsARG2wtpXZA5TtdzDQE3uuK4ink52bhdlrTbHVLCFjgHYX/
	xZEujtJXK4LYW7hkbszx9SiQFmQ3GTaIBWPs8T8LqXgA2raLUeJyKEgg0ezSSlxCK0Vunfcf9Pc
	8NTfDmlCq5nvcnKU1iD0GFGhMzMEQ5i2WJHZRx4hp2maoG
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr442506115e9.12.1795618439040;
        Wed, 25 Nov 2026 06:53:59 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr442505685e9.12.1795618438641;
        Wed, 25 Nov 2026 06:53:58 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm33028179f8f.18.2026.11.25.06.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:53:58 -0800 (PST)
Message-ID: <31551b64-3286-4f75-8b6c-b18e42286545@redhat.com>
Date: Wed, 25 Nov 2026 15:53:57 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/2] netdevsim: add TLS device offload
 emulation and test
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261119064902.242502-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119064902.242502-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 07:48, Jiayuan Chen wrote:
> Running kTLS over this already found a few bugs:
> 
>    b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()")
>    ed642349d87d ("tls: fix the open record check in the max payload size setsockopt")
> 
> So I think it is worth sending a formal patchset.  v1 [1] was asked to
> wait for a selftest that can also run against real hardware.  That test,
> drivers/net/hw/tls_hw_offload.py, is in the tree now, so this can move
> forward.
> 
> The kTLS device offload path in net/tls/tls_device.c has no test
> coverage upstream -- selftests/net/tls.c is software only, and the
> offload code needs a driver that implements it.
> 
> So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
> advertises the TLS features.  Patch 2 lets the existing hardware offload
> test, drivers/net/hw/tls_hw_offload.py, run on netdevsim as well, so the
> same test covers real devices and the netdevsim pair CI already uses.
> 
> No crypto is done, like the IPsec, MACsec and PSP emulation netdevsim
> already has: TX puts the plaintext record on the wire.  That only works
> with netdevsim on both ends and offload on in both directions, which is
> what the netdevsim environment of the drivers/net tests gives.  It still
> covers record assembly and the offload lifecycle.
> 
> [1] https://lore.kernel.org/netdev/20260901154914.11637-3-jiayuan.chen@linux.dev/
> 
> v2 -> v3:
>    - fix the build with CONFIG_IPV6=n (kernel test robot)
>    - address some of the issues Sashiko reported
> v2: https://lore.kernel.org/netdev/20261117140642.4008-1-jiayuan.chen@linux.dev/
> v1 -> v2:
>    - drop the netdevsim-only selftest, run the upstream tls_hw_offload.py
>      on netdevsim instead so the test also covers real hardware (Jakub)
>    - rebase on net-next
> v1: https://lore.kernel.org/netdev/20260901154914.11637-1-jiayuan.chen@linux.dev/
> RFC (July): https://lore.kernel.org/netdev/20260728125658.390500-1-jiayuan.chen@linux.dev/
Applied, thanks!

Paolo

