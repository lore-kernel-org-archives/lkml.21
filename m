Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619071;
	b=NuoTzKU2yVEcnrjWBMD+9g5X0CHkdHyVEfYhkC8YyW/0fcgUA5/n0LT839iVD14fgMnA
	 CEiI2xbk2mlCwMUpcHLRmEtSmFMDYjMjkRL5HQoFzztywPuiTkEwsyH2UA8f4HebUgNba
	 MqCkg13f3CZhKmWIsh+X2DAaqr5Q6OvkN+x+Tcx7Yxns9jIC1ogmYnu9o52hGbxXTT9IA
	 LoeOseqdNzOqBp6nvmrhLQQR/kVevVUxjqC2+yEsI2SVDfT5URB4lFFr5TEm1L3PQyYlv
	 XttNllbSKcpAp0XDbgiWF9UWA+3cFvUPr2qJg+foSJlpxd6kAKQWcsdOQM+S879/5YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjF+1SNTBYmoTbto41QlFak1T+ojAX8GDSGPxlX7PUM=;
	b=fdK4VS0UPLE+sKz6kav18AE+abTPWkRko9s+N6n+Kb3KuK0qoyqtU6Iu5E98BCZePte4
	 v2WFPcW7hPMMjyCYbsgUVa0tnCFcKtkV+ESy6rSJN5K7RDN4qXLbjm46N95NunCz+9H8t
	 snDtq/UH/YsNlbK6l5R+DDIRqhro6MvijREr7jy0gvCtPpVMa9OExiUJRHehZ1THKsdJu
	 aDwH6fnA9XU+BDqObfliNXkxcB/lUGq/FIvv4aDzebSFwRuOcjfq2+3m0U+RM1XG+bL6L
	 eD4KegiUvDTr1l7xg3W47u9vrUHe0SCertm0JTjAKXsCyTNo9r3cJFxO5VX3/iBvjow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Iqi7XcoI;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00263606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00263606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Iqi7XcoI
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2804300a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795619070; x=1796223870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjF+1SNTBYmoTbto41QlFak1T+ojAX8GDSGPxlX7PUM=;
        b=Iqi7XcoIMiD7WGJgYG6wxxlxgBbCi1iDI0Ov9FlwomgcHKYHj2+SkdTSNN9odPpcz/
         /UfwXSwWy+pVYmYpLy+/MbxhgI2o6k7XN4sr5sPCmMjbmfUQ+8YVDUFq3EJr/PGmaB9v
         GugdqcVIJPPvSvvbPOauwsWkFij+I87xcqWEYjM5KW47rsBSuRp/Wpks8F9AKGQm0rKm
         tX9lDmA1xz3IXuRkklxDQhD3BajZFnC0j3p/QlkZNJVqoAzWkXSnpRZmJHypjlG3HKOu
         Bx81SDhQBQJK0vYcAWLkWAu7hneDaEFnlFz9RU2Rper3mK9ILVq/RBWoPlCG25S39OSf
         zQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619070; x=1796223870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjF+1SNTBYmoTbto41QlFak1T+ojAX8GDSGPxlX7PUM=;
        b=1eAFbQQO8g6HsqSMXZ8rpvqaGmPK+m6BUuN779VpfHyv4EERLhc4GgFTUlb3Au8WyT
         Fmik3+EMGC65qgtW1WnfIr3O6juHXKwrwIkc5tuWbuhigAqM2vvMC7vJf/tcjAfmw3is
         uOWOlHiA6yuLHLzmiU5KHrsROItcyXX+VnYcRZD0kKv1J8+vkSjrOA5hkfN+MhVXKoa1
         +9mH9W3P1u+CnAjuQ9KodkCIooUCKfiuYEPYHak+k52hhs/Bejoi4QzV29U0jrtvZfUt
         AP9LrVrnVef7KdI/lyRwFRSN1IYyvnrAVE575EFFw9abL1tBQovNmS0BvUADB0nbfZl8
         wu+A==
X-Forwarded-Encrypted: i=1; AL+hErGG7FHcOmuD1CylvSDQg/IOo/aEvoxcu4tz1DM44evTMEUH8qRCoQMS9CNWu2Ujcomt1YG73OC4c/PpX38=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N+ZT80k/z9zhCtmK92Y7lK8hdDfTdtD77R7o+AEowCRJ07HxI
	s48dpt0TuNMp6NVkV3/mMPFv7hFN57dMMmeWKjYmqSkkKhOXAER8esKCnXk9TIba4q0=
X-Gm-Gg: AZFdTZemLHCbYs69Lhe7q/5vy4qcZU9f7P4dAcsoDQRtOdk+5+WI55cKsjKdRS6Mjgz
	tROWhwG4rPlBCFnw8+2vN3t6o6hJ5Q6si8VPVG9liZ8O6nyFuHH3NDaReqmyXQ2wlPtxIA1YzNk
	+2y5HBn7SD1M995hiDiKEW1S8Cw4Fqnwzr9NsgMuf/yV6fMpNtrbUJLVtIy1cpCjsOoLT7tzzVC
	+0r4Jv6zJ1KKC0KPtQWgg2OKqk2F5jtNnVVUvBzZ5giPVK10YSLt4cCNLyzmuj+B2cuksaoMRtU
	IugMOIa77EhTHIqTKt4zLzb4C3lnaT88Hweg/NnkzLRGgBBew71Bff0FjVeSVJIpIVfHXhcunAZ
	cwKusTvPG9J6XXRi0x7mQLIi6jBU53uSnBLa7uYYBqjDY6EtRmx3tbUmYLyspq4iVSMI4TGqrRh
	Nrq0V812gpfTFZ5+LWfGa686MSK9napupWGpA+8/qGb2shDyTmtMCJPI1gDQVGkxrFEgyEWmy95
	CuXQfbcqcmDMabS/1Q/XTXdhhZxhnXibT5awIrBFg6toeTpjIBUh9TRg64Wbqe54nEekH3rAShP
	eVWpDYAC6uNmXNQiCfQlWbUxL2D1MJUaxmaoZA+V7ZuCGGBGgCK7xIqbXUtI7PYgWluCfp6iug6
	ciSyiTCjr3fZ34jO78IgZ4BM4MPwVgF1KzQw7iQ==
X-Received: by 2002:a17:90b:134e:b0:3b3:c2bf:de33 with SMTP id 98e67ed59e1d1-3b41c93a017mr15614182a91.40.1795619070369;
        Wed, 25 Nov 2026 07:04:30 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:6ad4:29a9:2f98:35a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm13249130a91.2.2026.11.25.07.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:04:30 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: hch@lst.de,
	kbusch@kernel.org,
	sagi@grimberg.me
Cc: kamaljit.singh@opensource.wdc.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject an administrative controller type on reinitialization
Date: Thu, 26 Nov 2026 00:04:24 +0900
Message-ID: <20261125150424.255188-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125051608.GA20096@lst.de>
References: <20261125051608.GA20096@lst.de>
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

On Wed, Nov 25, 2026 at 06:16:08AM +0100, Christoph Hellwig wrote:
> Well, we'll have more issues if a reconnect changes the controller
> type.  So please check for that just after issuing the identify
> controller and reject such a shape changing controller.  And please
> cut the commit message down to the basics.

v2 does both.  The check now sits in nvme_init_identify(), right before
ctrl->cntrltype is overwritten, and rejects any controller type change on
an already initialized controller rather than only the I/O-to-admin
override.  The commit message is cut down to the bug and the fix.

  https://lore.kernel.org/linux-nvme/20261125145902.254297-1-yhlee@isslab.korea.ac.kr/
