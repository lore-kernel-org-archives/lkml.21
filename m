Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692255;
	b=Ha/ffIMRDPnuYHSP6UJIGDEP6a/2sGLZ5+eq5dSkTlt7/zWHG0JhY96gl61Nv3506LMx
	 WPFjAFcQ1h3k3nIHrO9NN6HLL5wc4iDLEePSWifl3tEYFt13W8NF9LJ+D/M87c1yaUR31
	 F9sPpyPVCiVdzbv3uZ/rqz3NsWpL4et/UkTkpvNaYIK2wUarfFZVIRUvmrVdelojdXEkC
	 NnM46XmVxrBEcYs1uQOo+X6z7pca8KLK4KkSZP6Mb/RqL5ztJ+ywu9GTNUsHxZqwVlrfx
	 SVJKaTVeAGNP1+MQoql3IpSqK2qBpVupHARoz/ytcatEXqL9IrKiVdAMg+Ak2Grth5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CPuYlgDQkbI5iiO9/9VOzdNRhnNYoSZ2JGqLIJUR010=;
	b=yIPzIt03MFY8kaeXEBmLtuRnmyi7MOIRJzxnX+Ak3ZE8E8Bg4GMUFuMHnz83Tjs/yGoP
	 4wephMgfHc2gK+hsqKZ2OsT9hUEIXvjG8LGmDmKXpYOFMkT9ts9ev21ixnI6j1VpbOT/H
	 FSAnhRbVGKeiuouMX3loB71PtToix5QRXf50RHmIooUxNuZcpUhp4kklOvcGkr5PeJRke
	 m+p+EM5N4iDuhQCdzy2WKGXKvb1bSuARK49ROLQjbXxBH1m39tyhqycHFohO/s7N2NKwC
	 4f2JMsmj9CWfbWqaGnsEZJ+RvhplB2/jD8BhyJ9/0c6WJqlmuJ3Tr+/mdaxd5AqrFvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h6XS9/VI";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424CD606A6B3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424CD606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6XS9/VI
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so2704445a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795692255; x=1796297055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPuYlgDQkbI5iiO9/9VOzdNRhnNYoSZ2JGqLIJUR010=;
        b=h6XS9/VI2KONMs6M1L+OQSSb4E6xVbWyzCe5DjgppJXQdAMxGs/oly3tREZmY1ilEl
         WobMJtAelNE+HaInbboMAuWbJguOEzYefnnkNdo+lnx/JXjSS/m2rJWRFnNSGrm8Ysm4
         K62zIMT6MM7y3hDG6cME/rg9lXAk2KIHdge6I9oG9cBDPn9Jt1fHUH4oqciF/TOzVH0A
         HlyVZsD/J3XPc0Zm6zTpZWNvBlYEBSQNYjE6liCoEGG6vKd+II+CJmpqaSz4O1slL/vA
         Xril0bcPMDu93Cxe5cmkVZiTrFKlxdKwASBT2gkmlnqPUzjJvuEl8Q1eUEo2GrglXPIC
         a/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692255; x=1796297055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPuYlgDQkbI5iiO9/9VOzdNRhnNYoSZ2JGqLIJUR010=;
        b=pBfSmJs0jedPmRJcQUUDmGbltUsjKkHHRLGpcCuoI5etJpDWzOAMI/tUA/9LZRUvs5
         rB7ZPNDkllTWmsqyxex5HPbDcgvyq2ucUTdIWlIwJJ36pY4DLv+a7zkO3vuhYs3jRmHx
         tBt/0SCEEt5YDqv2IhkKJ/6gLz3BI/21Giay74UYq3r4cwkh0ZrLnPu3alMr+XulJfGY
         wJ4zcBz7rpegcD4lJiyg+v30wdix2MhPDp1tlQ1abdTriqXQsg2MKOC5OyntZC7L923B
         srvK4QONPRo9CzJRM0Ytg4Tjt4hB8j5LmR4jO/e6giR124YZPtnWccAzIiXLql4ZOOpI
         BZ1Q==
X-Forwarded-Encrypted: i=1; AL+hErFk8VjOVpo5c5O4DeREiAWY35ZlKb+9GNU5CjSZJpYMCiuyGK0uddpV3FXibPvbI+0Z0q5/x6ZTWQvB7U0=@vger.kernel.org
X-Gm-Message-State: APuU4Z92e85oClLCp9azOeh1SnDrzNRvw446IF9dGAovms66fLOhgsbW
	oaGVsi4M/991/UqzYJJ8illNLqcSx3TNgeiaTVlMZ/i0rk9eDycfl0cSE8OYLg==
X-Gm-Gg: AZFdTZeEsmmJyFtUfEJKb6/KvRHJo5uBQXAx57S84SP4I4MfJ4oOU97yNR+DyNU7XB8
	LGUCY7v5NIjdI9+PhRim9PdxV08kXMdvBNNElsapoxTaTkMPEX3FVdS2WVgakwJwvOYJkzd0Cob
	7F1JkJFPS7LrcCcg4Xc3N05n55bhBgkIQU/PoAYwjV32WsjWEP1SNkc8lomnjy0SHCq5OFBS9Ls
	JEC80e8l12qcHsThMwYCOO8JyYSTOz2tZJdHGOBqUzsOhwL9hklURs68hGwq+U+tXKqEkkqVpMb
	dS8DecSjtMH/DBXjspE6fI2sASM6GBKXaiRKmNrS39htA3o1EWAdYAiNWZqcbYaUPyIzKc7aInK
	74D0NF/WL2LUDzk6ziXHyYYYM+WacIv3kaVdn1EMx/tjoqmoLN4GVwpWs7UZvwNvK2GzA/9Vj9S
	6iqfg233RgK1TuQ6HcEmm2J4fS4afvGMHev8uO7CPuWFnmIeukt0EN6d2BzPSZz5R9UZTntMa4i
	pyPEzSENU/YcQjN5HZ2UxVJYjY6HklGeSNVDobPbaIa8nxMfN6Gt47kiUfxTIReR3aLNAkv2Jlb
	rEXiuiPVe4pGIqq617iYF6zGS0/Lz5MCww==
X-Received: by 2002:a17:90b:1801:b0:3ac:8446:c1b5 with SMTP id 98e67ed59e1d1-3b41c9e4b0dmr20385243a91.31.1795692254534;
        Thu, 26 Nov 2026 03:24:14 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm11652192a91.17.2026.11.26.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:24:14 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Thu, 26 Nov 2026 19:24:09 +0800
Message-Id: <20261126112409.8491-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <878q2fyhvm.fsf@bootlin.com>
References: <878q2fyhvm.fsf@bootlin.com>
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

From: leeonion.muyu@gmail.com

Hi Miquel,

Thanks for the reminder about the threading, and thanks a lot for
your guidance on this series.

By the way, if you have some time to spare, I would appreciate if
you could also have a look at the kvmalloc RFC this series came
from:

https://lore.kernel.org/all/20261124025722.1476247-1-leeonion.muyu@gmail.com/

Thanks again,
Ping
