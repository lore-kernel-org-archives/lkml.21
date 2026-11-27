Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802844;
	b=QxdVNJslUgD4RtlMGfs9YohY90qFagOZDFxTuNUfpZE98KnEtHuCWukyGlCGDFd1krsH
	 wVk02QeFS8tlnn6IaELKoGIEPhWkvz50T5pKjHFWsrX4YyG9wvqFlPsGrJiOpRlE9dXvi
	 MVCnJndqS6RVGeB+06xR1IsMZ5H7K8J+ghVVxeG28EBYrD0q8k/ky2NJT7BfyJMSgloOk
	 8XbDGsqiRBY1LCzOvAbgjzz0zd/lJsGVmQy81RSc9tm2dNT0m0DqyZozI2mk/eO91SQk6
	 Pbk2NzlWfyMW2yZnEgqWFlF6W4nc7dWSt5TK4DIBQaPvUpwUkP2exhqp4ZY7oXbwC8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
	b=t2Ofpd74GUCet9SpaUSXjEx7qBTfyA93bYwb9JTKhwOdU90V790B5CmFD/XQhNla2bpJ
	 /vjpADRrXhx0leA4otsVkayoRFHTg47gNA5oQG5kC7DFyaGIsonhAyvrmXpwSL+zzAarh
	 StBAkIv9AXCxoKhOL7JCY2UD+gfosCHEsiG4KiJj3rpykmvD7c1UIe1lYcNgTxZ5kw1UN
	 BX5AZ+Bm8Nzx3A+/cXUfvuxqKe445FbD0VDPLUhaYrrktThOdz0iHHzYtXnuOU+CxhFUh
	 45vZDvSIvZpA99tmZBzA3/MhL6rYWGMdc8/wJNL3RCWpcNxWNHSQNhz2zWNBxEQ+sCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIIqpipF;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D6B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D6B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIIqpipF
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-862a19300b7so2775730a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802843; x=1796407643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=iIIqpipFCHcwfHF6yKZF5MXMXJH82GEIZKixWw1pLK7tPRUreyTVop7XToyMIlAZcD
         bYs/RTo/YkkbaoB1VqLTuubTKoMZMliWA4rEx09Ki0h7nldeepYOtAHdAX0L0Q262LHN
         TQqgua8YFhMPBXw/Xux/KCEt1fup5NuSoBwKex/2NjCe0C26+EhI+cW03KdwtnmSPrhB
         4BUiXr76oE+CYfDxErnrrPryczlYj4SPKYYfm73cckptel+ykllBQhW4E0iZqAw6mDww
         45BNQSHylzyx2vLDLMb+mLm71XdK1j+JbmEm2SuvqcwfHjovzcyYd21jhZkDhyHjAE/p
         XlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802843; x=1796407643;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=v7G7IzdyK9IFt9+SVeZz7Wr6hfoYJ+Oo9exHx3nV9dejtuZXepHxxNgv6rk5LNjC8n
         GFhqbuBc6zZLZ1wPmbiieEJpBL2TFJNdjwikTgQL6vfUYJ6wVpDyVwAwVuuNcdAq1It3
         NRfrZhhlswg0XMwGhmu4djuitkWe1emhDiyy+PUY6iFryW4/2qice7BMAodttvvQzRqW
         YR/AJuaDa8KlGvR2JruIxkZghaeN5I9Gbh7ZeilzHu4lRyE8IaSOEto+utPdxM4FarLo
         edtL8YLnNtioPj7kvnEkyQz8+pE6yXmSpdXkHYUjTjQrHLGY0hlip8bioBSi2jDtjOcC
         KrVQ==
X-Forwarded-Encrypted: i=1; AL+hErFhuDgZrRuDVXWXTL3v8OgCStiJrQh+u++f52KC+ovDRX0P4YR6r1eDUfDVNwOGHEaFJR67nT9RJ/A2Z2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YkFfOiAKXRz9K2fRLL4tAo0SpWtWHpf+ZAW2Oc8LCDdZK9T5o
	2kHoRvcdcLYP3SqKaV68zeNsPBjKiiRESb5RK3p34t2sJbRKtQBdnMsF
X-Gm-Gg: AZFdTZdpsRueVHnWTqKAZfkS54w7C70LzSWnGQeYSDJE77BOWmZInQpCmZgYwiA2XgI
	yEY1H0icfNfTWvfioshixD9J/qrolFtvwje5kl4/n8B/eE/ZR7C7SD6x1ZOqfvrolf3xHR2bDkx
	tL68ltu8V/yAvvAcN6YUKCm00ko8edAbZdgxp8Jnt6FBHbFdT+Vwf0nUhE5NW4GA8lNkih9sywZ
	D9CeUKtmGvWdweENTMPpSgXXdMVshTvRWUiDF2uYgZUR+/p5+fd8aueN+SRBZJQzLkky2xvaUNQ
	eJKFVaLGpyHJKjlJScWSKdNEBzoTiJtWRtBbrTrhitpvA9nAcj127ItJf864mvDS7LkL4+ot2d4
	xnG05VsfUpxTdNXhYGsrU9irY2Kp7g0alJl1BqhWAnd7o91ZDjg5bE1NFAow231q5TRJfMzbWs4
	wcUBYpehYgzzog189krE/a8Lad98mx7AgYciR399homXEgX2oGcUTowHig9XsDXTQN0AuPoOc7k
	1sysyEemnyo81f2qmV2peqt3rvRI7fh1xI49X98voAIELeiCcu3FTir3p2C4GDIZMYH+JVQq3vv
	V8Lye8DZzXV9lxqeeu/PcfvF/dWuffc4keLEsk//f5pMydqF8CcSeumx/OkOvQ5XG+kSR8NWz7R
	0Y+dL2A==
X-Received: by 2002:a05:6830:438e:b0:814:8259:781e with SMTP id 46e09a7af769-863151bb271mr26675869a34.1.1795802842835;
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm16267566a34.4.2026.11.27.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: vinicius.eduardo.pedrosa@gmail.com
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 4/5] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Fri, 27 Nov 2026 13:07:20 -0500
Message-ID: <20261127-a733-dt-v6-03-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-236169@kernel.org>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-4@gmail.com> <sashiko-outbox-236169@kernel.org>
Content-Type: text/plain; charset="us-ascii"
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

> > +	vcc-pm-supply = <&reg_aldo1>;
> > +};
>
> [Severity: Low]
> Should vcc-pm-supply in &r_pio point to &reg_cldo1 instead of &reg_aldo1,
> or does reg_cldo1 have the wrong regulator-name?
>
> reg_cldo1 is a 1.8 V rail named "vcc-pm-lpddr" while reg_aldo1 is a 3.3 V
> rail named "vcc-pl-usb".

Vinicius, could you check VCC-PM on the A7Z schematic? &r_pio uses
reg_aldo1 for vcc-pm-supply, while cldo1 is named "vcc-pm-lpddr". I
will carry whichever fix you confirm in v7, with a note.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and Andre's reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo
