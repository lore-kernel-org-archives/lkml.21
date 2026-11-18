Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035823;
	b=l3GfKcc0naNHTGPB4jgbA35NctI1k8TZH5WIBFVAaVEU2lr3ARl3BGaP3a3/kGS2SlV8
	 ydcjZzlidO5UFped/EoBr0PSv07rFYRr2fy3Yrblay7NGLpg72de8Plw2tUZnztDpxLJS
	 VMUB8t9axKFxkKW8CKiYpelXcGjKvzIYUcBZH6WEteLzFL5Eosy4R7L0b5b/X0OfRoKn4
	 mUF+EBd6aKC8ASkFiHP/oxtYj6Y9YIaYvSYIMreA/JQqpAhoSNruayRvI6WeoMaVQCsFL
	 qB+xryXYmDYDSKau2IEhM3234TUdtNuyNXgaLtLrLI4Q9gLTdGvLw6orkRcyPfYdqcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
	b=TcVc58sSf6jW0e4VNrk3FrzqAwq3FzDdlz3LuZZ2Txz8fxAFNG8HieYGOiJZorP+Rcpx
	 d7fANuuiJIhW1wPQIdRTKVHXCoo7KvJVxYmU1ifkrJnT2eSQkCod728jpMNj2nWDChcah
	 x1H90rSgd4TMtKC0KOeUuCMix0wYEHaRxKHAsaFhyk7fjM4ukm4bHAocsTuhsjMYrj33z
	 nxlrYe1cOKmrbRtrG9sF3lUyU/k87xqiifYBj6162aBU85xpsMlISG0XGFILwWavm7OAO
	 jSGF0fMz0tSLuTrz0tU+jEUVyoON468GPcU/kA1Yq8z9MPhZT5fEUVWGrq38UNgtCRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdv4jdP5;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAFE606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FAFE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdv4jdP5
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so279166a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035823; x=1795640623; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=Hdv4jdP5sy08zBfvTne0xomG45Tbd1SP7Lw1QxQiIEaqMHzUWHLKKP1pb5bPGJ18o3
         Z7cgIX0JOKAMgAGkY8GYD8LG45OOJVsRuBguZwtDwir/MfS/T4RFWjFTWmVabRKHN6/i
         m9VD9crrDrCVDJLSJ74eFbq+atvvEZ0lDoAiUOyBNqFLDROZRWxOqhOozmcRGUqOnhOH
         w/1no8qMQitL31Eac27CIrgHXZbkgmAKaNqgZYprs0+nDRr3Obh3WwCugHtc2xm5179u
         aozEwiHn8TIh+3WD3JiobVeFkGOtW2KqSzVMLbaEQBmANt+nwjFiyLk4JMy+ogR+SGLM
         Jgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035823; x=1795640623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=hCM67s6rw7Domx/cfuvIcs1wDJnzGT/NJMRa0icwudwKRZv9Shdr76wrUB6YbKvyP7
         QA1USHCm8A8hehI5XxijAD/6Zl49GcGQ2fMegCg3+sRgurojklo4j4VBLRYWiDYy3sjU
         oYu83NQW+Jc+90dJAPMczqnxpVa+QFZ3eg8w497oDid8RGKYA2I2aZgnJ0sRA/7YfkVS
         hrfNI46PRGrA9mfY37POkZYG7nCC4Th/wdkhsRxLsmNl6vel/yQ47doRxp2Rl1OhpBhb
         1yE/ohTTmPkf1cCbD6gDDcprvH9qljXt6ne/PJpqMesLiWifaNOVCT+wzwvGxqcdiRE6
         7Iuw==
X-Forwarded-Encrypted: i=1; AL+hErFlatAxahqcqiqAuZ6NGiP/cWd7iCJ18P85x8LSYjzR+QWHDpd+eEhqJGnqPQYONKm+jswOEr8fzhA0FS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V5gpYyo0jr+eQnbSlsToomGjY7yIqmHMLYxyjtK2KmW1kY407
	C0w3kDnz9QRmymFBJwuw/L4udhz42zO1wDzoymGLc+jrnLF8eOqxw9tq
X-Gm-Gg: AZFdTZeI4/vz1YQrLTIgNzOGD/4mcuDIreEcnYe7PBKWVFoYSK8DTEeD3xIHkM+b0te
	r1WybDs3MUEu7qJumsnc7LaANksEhbXOgljyiIgEhwqjTTIMtOOaUtqW02IrJjh4d2QzuyuFwO3
	2wRMZJO9rhBtRvtKBRY+5ZmHbLVqkY7vlwT6hH9xaN0ZehvMC9aWil33rZLR4zXCO09tG1IElAS
	pJeL8v2GQ9Ti+FvVMm2mMTR8F6I1NssPxFWNwQrnNdZrkj9QFhinnVmTek356k2BwDmXpiA8MG0
	Invnpd/L4474+Ta40ghnlnrRxKWJ0bFYq2ThD4PWZQ27heSRN1PDew5PUwQts04aHmoVXsPO298
	8XpT5P/q01j1gUThxYo/qzKXuJi7EPeVEwdMMDyP/P5Nw9xo3KQe31IiMHmae6FMc+C9fKSQ/xz
	SZnv/fzcK8PZL9fHs/ms72pgQHpL4d0bOAMQSrfu/rZY30q2jdQkqWN5vGWwAexLnuU7XxSjoyD
	k4ydSo8ECbDJsuppOCYdhjksSHtcyBhziYBfhw8FjAa0/bvOZ8ZNnZdMUxUyHbpv7rxY5Ua2wSe
	IZ8=
X-Received: by 2002:a17:90b:3c81:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b3d07aa355mr3694363a91.25.1795035822845;
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f7066ef3sm865257a91.11.2026.11.18.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Date: Thu, 19 Nov 2026 05:03:36 +0800
Message-ID: <5167ad548a578a23ed8d5172196b36f0.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 08/17] drm/spacemit: add Saturn DPU core types, cmdlist
 and display MMU
In-Reply-To: <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-8-327d7910bf71@gmail.com>
 <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
Content-Type: text/plain; charset="utf-8"
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

Hi Thomas,

On Mon, 14 Sep 2026 16:10:25 +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 09.08.26 um 15:14 schrieb Cody Kang via B4 Relay:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
>
> I've looked through the code in patch 10. How does a plane interact with 
> the hardware? It apparently has its own command list, but there's mostly 
> code for the CRTC update.

Thanks for the review. A plane programs the hardware through a
command list. Its atomic_update fills the list with the registers of
the plane's read channel, the driver points the command-list engine
at it, and the hardware replays it once the driver raises
config-ready.

In v2 the plane only fills its list; sorting the lists and handing
them to the engine is done in the CRTC update, which is why most of
the code is there. v3 will move that into the plane: each plane
builds and submits its own list in atomic_update, and the CRTC flush
only submits its own list, for the composer, and raises config-ready.

Cody
