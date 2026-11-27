Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746437;
	b=yQtlERx2oDSsdm+MjBUUW10cm/DTzy/HIusvNOTAbBvI3b14e2i6Gp+GDKL9lSxPKPVn
	 1tkAV8RLwtLfzhk61soGNo1af0mJLOISXdIttuiWc6MOgrJEdanujJ/NqWKvvrthN3aHe
	 V0WKuXuVJQzl8sauWJzfTah0Oqh+t1ag5YLYa5FRJDIcQi3pdI53P+mUzOJpq1LW8WAZQ
	 PUpfIxlhHdVCrFOrWzNM68XQJJRdoS4ghH8VvNwwqWuZdttp/wmtQz9F+osfuMhFBjovh
	 nqYpi0rOB/7oioKYeDCQh9y5WtNtwF3f+jdGABeUqk6qttOR4H1uAktkZN+bDKZXH3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
	b=P5gImBfona2iV/SWZutrvJ51Amx4GZ6rYrFnVQWOX4NnAma3zZQC/nS5P546nnotsNX3
	 Mwbcqpx5pjpUfdGrj8W0Lr8akgCWRBfHFhm1fGoS7cPwDiL0hOFdyEh802VE4zYGLjnKk
	 6pc0t2qov6IOQV85dGSObBkaZUxKknqDi0hnbQ3KqITNc0Ohb2lfMMMEDT1VON8uNgiav
	 V3EtUMorzFOtlb86kjQTxS85Im4a2Vqb6QeyTPCp6JYYiq8PQ0GkvUKMPjCMnwBrK6hFH
	 kj5GjVCNF6FBdHiHU6jL6sfK5lUK6ZYI/CQy8tqXBrtFxld6EaC40KWrDdC66a6ZQZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYoD0ME+;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3EE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYoD0ME+
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0426a65e0so46510415ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746436; x=1796351236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
        b=SYoD0ME+aq+mD4AGlnesWPsK4E9RbOCu/bvQdzLNNuDEa9pF+waQ+DvrJxtWfE+kDl
         B3wEtTn9ThiDuL6k6dnXxBcST30Vo+fj65hhsSxgIA7hwMFnlUx2ex0vxdSciZcKRnEr
         yzvL7XZMg3VS0YbUBJWk9ZP6qpjK/1CxEb1CoPfyB7NRww1d1cVV1SQYVseM1oYCDwas
         GeIUrSYJ9SuA+c9jJ3n2pZSaC2XalvVpo8CZAho50rz3b3TTNOTUwrrPpb0s8JWqBFU8
         516MxTI/TL9NYUNsDlTDXsPHuCgAwYklmTWRgpQUe0TuVSopDPogULSL1SFPzHCI+fR4
         hQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746436; x=1796351236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
        b=gpqc0d13iIYB1PM1SRBmrfV+qZsCS6JgfHHptWrf8N5Y4YMXGtPwO78yrnI8KLNlzX
         IRZA+sZQccqiJu7cyrv3LMrjupiNr7L9o2D+qTb8YKYTNZ3rRw1heFuLUU4n9LmWvuac
         Zn004yVruMUe7UfjtxwLDkQGwTbUaEvIFgRztyUK6V6Dx9ByO8ZkUqKnkbgCoKaumPHS
         j+BKz7ynjVhMcmuPvKbe2MjtrXqdQB/VEBiiZiTnR3FPnjDdeBjP5Vrlnyjl4BRu5gh1
         iQEs++v4YO2cN4oKni3avalSst5j1Iht/hkOef0R9TgnCT07Z34Ybc2gZuvxseXu2Kdh
         EyAA==
X-Forwarded-Encrypted: i=1; AL+hErFkBeJ0HZb1JA4bDcjibJEF1MQYhm/xpkhTbYhVz8i14D5iCJFlVninSVWNIE+T1q9fGIYqfFgMSJpkRHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o+e6N4R8RqgUezjk1//amLoBFhJgEoeic/zkR7bwpBVGcwHKV
	8NwJMK9LR1cVZIMgtIDJDhvshQqm8dPbcU8otdC0XjxLM/dRJ1uIuhB5
X-Gm-Gg: AZFdTZccS7lCeC79Dbtgsl9ZUlego9AQeckE/VmdGYWIpfz5ty8yp6cq97MgbJd4csp
	utvXMq8mZksbM44IEGJRhS5V7/vZrzgNR2rSSZfEPAF2k317xnXtMnSw/hPoaphG0w3vfXt7MhS
	HJOpHwelmwjoFPsY1XhsKKucdx+qFLhEjfArNG9Yv6JtRC9i7lIRYYWHy4hFz19ltMi9TnwGN1z
	nEQda+arwvQaBFeenybrWCGJ93mJion+Yv7GLIbICcGooqO6TsVDa8sWxDgdsynlZ6DJnc2YjHz
	O4uvBghzvBfLajVHSSqFrnd3IQyApvI/kEsqa1jhTL6MJva7KHZ90uz7avuq9zbyyuaYEgmvVKr
	ZTi5BsLUDF2rMAVJDi0BvBFdMZM1GEhwMuC9HNvDw4xB/J6T4RnKXsAi+llJZByntijO8jNqa0i
	DCgz3/9MQeSaIyx7zyWmdL0DeWNIDR2DeFnAqnHj/JfPDzc3bFTieC5XUvosQMVvzLwDMEYgEc0
	/PtQ0NuNiOhcwNsfcMxOTO90AdCMBxABXZlKItPQ3pXZEDDKJhR6Gjt9C0XsqCuBZiEHQrHkPVt
	KYRQg0EYUihDEXtMXPO5+C+v0Nqql2kkqQc17xcTXHwGHkkCXesEB+vYUKsXjw1DBFuWsxJMbOi
	jqNc1+Ho=
X-Received: by 2002:a17:902:c40b:b0:2f0:7db6:50ad with SMTP id d9443c01a7336-2f07db65335mr158745195ad.18.1795746435838;
        Thu, 26 Nov 2026 18:27:15 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm57903655ad.45.2026.11.26.18.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:15 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: jacopo.mondi@ideasonboard.com,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: pisp_be: Initialize lock before requesting IRQ
Date: Fri, 27 Nov 2026 10:27:10 +0800
Message-ID: <20261127022710.685062-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260830150045.2704062-1-runyu.xiao@seu.edu.cn>
References: <20260830150045.2704062-1-runyu.xiao@seu.edu.cn>
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

On Sun, 30 Aug 2026 23:00:45 +0800, Runyu Xiao wrote:
> The PiSP BE interrupt handler can schedule work that takes hw_lock. The
> lock must be initialized before devm_request_irq() makes the handler
> runnable.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be fixes, by rebuilding the
pisp_be module.

The driver probes normally, unloading and reloading the module 20 times
works, v4l2-compliance -m on the pispbe media device passes 400/400
before and after the reloads, and there are no new kernel messages.

Tested-by: Roy <rongh7426@gmail.com>
