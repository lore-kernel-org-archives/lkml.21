Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122692;
	b=jyyulnLsgZCBGUqAlky309JOKT5eEsP2JM6pqITClWLokbEhGeZPAxIHQkVHYS8VpBSQ
	 QNfTL4M8xlSfHkwBo6ao16eJ+5P6YfypigHiu0sBPI8e0SbmdshQ1ICESbH2wTzX4F1DD
	 LoCzCKKIyypze/DDlQnC95e0qIr77G96EZQdMGAxkYCB8oTxDeuwvy5kiVeXVMkcGLp/j
	 S43GMIt9Lh/1Z0Ivm6GSAUZzlIVkpxy5YcYdBABW+3Gg0d+zNvmJsCKpV7+XSISr130wL
	 4oZBWtZ5C7DBPqgqXIgvKHSKCDu7tQqCOT+FSTGtkaBgR6v9O5Vc55AF+y64e9i9rBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c/FxpSNP1KOyGBvVMF7iGpNqA3mgfV1zD60Qg+NCmX4=;
	b=AJ54gEkxd5bFGSII0aSGaOsDxUoCjAPgakXcp3RTKETHaaFXZYgh8r6s/9zUedOiWbvb
	 fG+6EP22xY4MxK6fjRm3KC9I8/s+UoXDGK81XFaY4pZpXt/FO0PoryexTQF38peRJpBCz
	 eEFWZwXNDEwr/SNYVRh4qbFH1aU7KM7QD7FBuEwFtZOCU18Ncwla2RHqOYdAgKl7FJVQo
	 VEPYq3ghcdoP305jpsQ/McgOF5z22/a5+ek7iQnjyHKXaKebA7zelIvPbOCFNckxEPc39
	 CsEWhs12RNwjxmPGu8oUmexcw3WIwm9lCv0uCKbZ5d9opgvpHovm+vllNo8lCVVr9kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nQj/AXSB";
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A2606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3A2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQj/AXSB
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-921159376efso3289606d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122691; x=1795727491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/FxpSNP1KOyGBvVMF7iGpNqA3mgfV1zD60Qg+NCmX4=;
        b=nQj/AXSBMlx3clfcBQYldrA8gxX7muuq67ouf7ZjWPp6biVchiONrwmhAPyu788R5+
         3983SrhAoAPloXSo0/meDJambBmtNzapvYoJzcGEMahLu7e8SlBSxoqxTQASYl+QCMdY
         EIaeQmMefl5CHGg7wRPaUKFnUdL1J6BuKySvlGRwdt3zQQl9nWrJFm/bl5UEZRXeWkq5
         AjsZ3stbPf7pNmaPsT57km434hskkTs5ni9q5nsQ+LQJDPFcKRcC5Rw+nBQNudu3Wtmh
         /fdzwUEaGLLspP8oUeGqCey8uGyYLNDvW3wYlrI9YLxNC/dbkPgKyOWrlnvALjKm/Qcg
         m7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122691; x=1795727491;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/FxpSNP1KOyGBvVMF7iGpNqA3mgfV1zD60Qg+NCmX4=;
        b=0rHvQhihTsDewdWVf4rWxqYORvM2v5A2vp4tfYz7Vlj29tdRMlIN7u2P5sFZx8UiGc
         tgsaln+ON7P1ZN05vFyf05gFZwZID5uJogSLawy9K7uRG5VJDT3gxZd2YZbS0PSCda9/
         TNVw6K67+Z8A3fM+0fJaMn4m6i2UMqE6iZFJTrEscW6QbK8l3LqI8SzxRgNTvJSEsw0g
         ygy49m0lALPap2RygCaEuOI9I15AN6Ybf5+hjviVIBJFA1f4xCJj57MeIirrxx7KageT
         OGUQ1n/7hgk9TUhths0qRVLaziFLBxCfXOUa3TV5IgKg05kyP9oLY8wjkdL+EPpczcwb
         L9ag==
X-Forwarded-Encrypted: i=1; AL+hErEuAsjb/F3Iasm+c/BaH6O1VMoVLOA9sqmXgJWiteCk1RRByiMrRv/XncdMIHGwuSksylcbmmyV/ii7bAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jddk4IFS6p9DCY2dAlGKsWzwu1cF147QldpXCX6yIcqH80ppL
	2cyMvQRSbBtOX77MR2K8pC5ewJJOJTvLq9LlKwkLgsk+b/flJ8b+zkuY
X-Gm-Gg: AZFdTZfn+j9Twbow/fW8Ir9uBGjH1yrMstJUgdO2Rl+Nh45K6O6iNfdHYLfcGgoXIgm
	sLV8wMDTn+hbm3/3JCCIKfzUOwzBhQiAKfTFaBpSfmlNwMxQozN0wxeWIEh5eWAWUmkTbGbHFpx
	rLrx3fe+VVgKAvm1bScgXqMSMGhv3kL0q/oTY8JrQR4c4h3mgVlkb8BWtT4PWmsP672/dsGUBHQ
	155SBoOdL2HJhdES+qTSywg24O5bmIoPtzURl5JbbRTJP0JqGh/C55/3yvNGEeSnK3fCKfDimJY
	vUDKp5f8u1J66vKbKo4JntwjZiZtDadYcZqI8VDQV+G4gYVnQEGLsO3rv3DZpvCoPIVjiaf/gGh
	2eiArTiudRZD8ANBy3nz4D6SEzg6EloduPklQ3KadFRTA6whJDFFVqF06Yl1M484g1A6Ngm40p2
	TCTO6ypYVFAzVoA8RrQe+l5NO38mPvNODI0GW1xjLjM6FGXhY4HscfvFLpe9Il98ydSAgM1a79u
	I+fQYxm+pGcSMkgCq3Qtc25IgihSRB7JWBzg1xtvU3D8hIf2HYcGIWyL8BZpdET2XlHJitDAIyM
	U492boxUfg49yDLWJEarrywrvacZ2Vj+JTC4yU7GRMR4YLrAeomnTla5msC73H9ainqo225Cs06
	5WKSYKGhv0+HUnNz/5eYp6np4LOxvYpNFNHG0ETDkTOhHsU8scimihcN4xili5pg=
X-Received: by 2002:a05:6214:5294:b0:921:b6f:e3ca with SMTP id 6a1803df08f44-9213498a6f9mr17532256d6.3.1795122691261;
        Thu, 19 Nov 2026 13:11:31 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm7227906d6.44.2026.11.19.13.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:11:30 -0800 (PST)
Date: Thu, 19 Nov 2026 16:11:29 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.373ae703fcfde@gmail.com>
In-Reply-To: <20261119144241.360238-3-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-3-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 2/4] tap: clamp zero-copy copylen to remaining
 payload length
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> tap_get_user() chooses GOODCOPY_LEN when the virtio hdr_len is zero,
> without limiting it to the payload remaining after the virtio header.
> A 246-byte padded header and a 14-byte Ethernet frame give vhost-net a
> 260-byte TX descriptor, above its 256-byte zero-copy threshold. The
> 128-byte skb head then contains only 14 copied bytes; the rest can be
> transmitted as stale kernel heap contents.
> 
> The original macvtap zero-copy support introduced the copylen choice.
> Commit bab632d69ee4 ("vhost: vhost TX zero-copy support") connected
> the in-tree vhost-net caller, so this case predates the v6.15 header
> validation regression.
> 
> Clamp copylen to the remaining payload before allocating the skb. This
> also covers cases where the entire frame fits in the skb's linear area.
> 
> An AI-assisted code review found this issue. An x86-64 QEMU/vhost-net
> reproducer observed a 128-byte frame from 14 input bytes, including a
> 114-byte uncopied tail. The patched kernel delivered 14 bytes in the
> same test and in 400 repeated short-frame sends.

If respinning:

tun/tap's vnet_hdr_sz must be at least ~129. That is far larger than any
header vhost would negotiate, so it only happens when the VMM sets
vnet_hdr_sz inconsistently with the vhost features. The guest controls the
packet contents but not vnet_hdr_sz, so a guest can't trigger this on its
own against a sane VMM.
 
> Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
