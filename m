Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400515;
	b=rIeKlhm2n2GLpLzDOPIJEjRw8Yt/+Jq+C1/8lVvh09KZFm0cXuP2PAno5Sk9Ncwoo5gi
	 Ed4mbvpS+aZukQncOAY/nngM+Os+LiUCISw6d+2XgNzZ8/vpUidiyyhhcWIWqhBx3hTXg
	 RfJUITku5PNmJbedrVu2UhIKQDBGjxfArwV4UxwCFNh5Chm1qkTls+yX1qJy2ad6Urkpn
	 3GOqM0ibxeGcvWuyxUUE2oeJtxlN/ef94Z+WIp387MdjTVjrEtZKlG6a2G8u4t6PDcPna
	 d0dKSKbLGPRn4Q/hOKzkPQrEOOq43gk1klU/MKP7DztjYwCjF+OfhyzdPt2jx3lmyuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=qIzih0fB8OsJOrwE3j+2DEEIY6AuLHwswwUsz0vhlXY=;
	b=wcDk0UH9HyDltHWCy1LaNNZqQSyksS1brBPgJ1n58ziFjMmIuMRUWhUsnj2HE+iNdxTm
	 pSKXJ/jBWjzsYf2/Tp1Tixc3LxfiiJOghSzUfJBnoTircHpM1Nl0O01IBKEMft3h3LCZb
	 waF8VrTES33LD64O3jXDQOzeCKqil4mfMhkx8XL8O8GR2YryPDc9t3MhNkLrdrG3q3HJH
	 ngQAiUHjwZhU63Fm97TwrnKcIucDisvxFiOJtt1cFizMScRfp+dR8CwH8OgsO+RVwmNaE
	 38O+WaqlhxtyKuGujeKXBuz7m1fY8n1nQjLTa3TRvzgvXNSUo3QBNvAIqaTTqDSGKtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJX1ACZT;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB39606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB39606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJX1ACZT
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1190247b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400515; x=1796005315; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIzih0fB8OsJOrwE3j+2DEEIY6AuLHwswwUsz0vhlXY=;
        b=yJX1ACZTcjUxpbbTP++wMkoJseMfzO51Y+2EPD5i307atFEoeY/ALtI5UbP0KOCvb5
         all9+T7MQYo++0GGm/j9jYIuoNUMZsZu7J+Cbi1HRruaCWSH1uWeAxgwE2kXCX42DjTm
         sJQMtG3zMYp8fJbvjKhAUcYJHP3g7p4anaE3jcfrfhIcIiUMqlkjsm13w/6cJqBc5rdB
         Z4iu1gl7pxdlH9ybYhwDLjErhpuKjpwsHCX0BKSyirhHcKA0+DDe0DeXXW9AMEDiKP2Z
         SKaHqIb0ysTbPlChu4o0ia4wsBAYk4cblIAw2RDRwdnqKjz554z4+H1JqcAOBhhOLwOG
         4n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400515; x=1796005315;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIzih0fB8OsJOrwE3j+2DEEIY6AuLHwswwUsz0vhlXY=;
        b=MIorBfY/hisYG2emIml7Uh+bDsKa5+0OsSxmMuwXXT8Ec/fW8W0Dy7SUUforXrnniz
         OxLLpQadfzEcKG9X/KnMWVLDQ5u3TEYXKAmiKLi4I4zBr4JKzky/uZYdjfr/TSTPN+Gy
         JbMW4ytswJtWfyQ6xgwdoY9Ug4tML6Cu0KrYTkbYhpCygJIX/zdDsdTt5nE2+gAszLsa
         Z7n5Yy65wl/e3zqgi40+Gt94WEL+xGVo9oaMW6Se3l1ft9LNFx0Bci4x0l7A7lxSs+VQ
         Y8pzPBzFGdgMwY+TjEJRkajNF8Cm9tfMq5Ncld0ie6dO1Exw6yLnmaviLD7IhfemdRwc
         vdeQ==
X-Forwarded-Encrypted: i=1; AL+hErHm4h4GObZsmz59j6q+Y2TvG02/uk+AN8EOzM3cfD8pPygQFRGhlkx2QkC/mWplXVSRSeDyBB1XoAFPs10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vqgpEtB+iWfNtatW3Qduif5j7mlkKtlYCYeSP92MhZRL+9x6X
	3VMHpDh/xeMk+FA+A8wAbgNHB5L8Xv8nHKJgaCMTTbL7vCJTPUoEuyu5RdCIxqcSQ6wg+w==
X-Gm-Gg: AZFdTZeAt6M+VUkT9bjKY51/8N6JiPNO6HlbK/nDs0DQUdBw5BOZhTCcIDERUwH2tOr
	yBGXQqC09yuS1GQ3k016ZvvYWsICLjgTA7rLkuH69K8/BrVP/CCx27Y+YwSGHQ6owIfQLg0/mv1
	97OXf2haEgcyeDyhSE1Zl5ahP7z6edV7tjfk8Cg8W5tAdEi2KzMDhL/Qlc+VxlGO+wfmNbu1GoG
	d92zcWF1isaJ5PVD++aQgMnd/tRIug7GV0J7eaTCX9Mq9kXmBo0KsfSROogjWf4W+1L2EkEI78W
	zdVAHJRlGFaOclJBCsUSO63fwDlCaH3TK4tP2zkWLHySII6CWKXUzdOJ/ILBZiSHqdPvxauhngC
	rUr9y3wwCeNK/e5HsPLl0borg8u8soSgne7PZv+awOasSdCrxK+eRqs2jdrW1P3iaiMqZeNy2m1
	PQZ7nDU1i6MfoKcKYmNInHRpgKs3adstXz0iG9jHBWSSmSaenic1b9kv7HJMXbU+pvTb66Wgsw6
	HnvJrKzeq7yiv1zdcXoD6iBEYbHB+/7Shs0S9KPB3i5JfVQYCLtPmQDlHqvSeibXqwJuEI4oUzw
	mEnHNm4/1/lMrcDIw5ax3as6qB3Ydktw6vQ++pDoN+7sdN4yOg8v7j8vS2MHu9YWbf4nZSk8LEH
	V61JWDj4brjGAPxaRSAvRGnbVt8DTYLFI8DnoXr1PqLOg3A==
X-Received: by 2002:a05:6a00:2888:b0:89f:db59:193c with SMTP id d2e1a72fcca58-8c87bac50abmr8010706b3a.9.1795400514607;
        Sun, 22 Nov 2026 18:21:54 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm4674426b3a.31.2026.11.22.18.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:21:54 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal: rcar_gen3: release the IRQ handlers before
 the zones are freed
Date: Mon, 23 Nov 2026 10:21:46 +0800
Message-ID: <179540050658.417371.217605576878858750@gmail.com>
In-Reply-To: <20261122144813.GB3898744@ragnatech.se>
References: <20261117145348.1092528-1-shunsheng1218@gmail.com>
 <20261119022926.1493582-1-shunsheng1218@gmail.com>
 <20261122144813.GB3898744@ragnatech.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Niklas,

The explicit devm_free_irq() calls are needed because of the current devres
registration order. rcar_gen3_thermal_request_irqs() runs before the loop
that calls devm_thermal_of_zone_register(). On teardown, devres therefore
unregisters the zones before freeing the IRQ handlers. During that interval,
rcar_gen3_thermal_irq() can still call thermal_zone_device_update() through
tsc->zone, which is not cleared when the zone is unregistered.

Masking the source and freeing the IRQs in ->remove() closes that window;
free_irq() also waits for a threaded handler that is already running.

Requesting the IRQs after the zones would make the automatic release order
correct. But probe currently uses the return value of
rcar_gen3_thermal_request_irqs() to select priv->ops.set_trips before zone
registration, and rcar_gen3_thermal_init() enables the source depending on
that callback. Reordering would therefore need changes to probe setup and
failure handling, rather than just moving one call. I kept this revision
focused on teardown.

I have shortened the two comments as suggested. I will hold off on v3 until
we have agreed on the approach.

Thanks,
Yaohan
