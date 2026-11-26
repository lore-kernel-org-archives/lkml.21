Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672942;
	b=JhWodOyp42a3e5THk4zZa76L3ZQ8RkGw4JsdHtIVeGNkJkTnfvY9jQGEO7WUQod4t8Qe
	 rRk7HLyjL8DF9U33abcpp3pdF+vQ4ikTbE65x3Q8E2YbB5tosgl+MXriBvofWaEKIAXDN
	 z7N3/qABouvYtmlS+wfIfHQL/ITbCW/b4CZbTN/kfMzg6/xjOyMpoAioBhP7OjbDNtpFY
	 Pp7c9eeVIvMje/DMB2pr+6xqj94gRP2lafUljB+P7+/3/NrmBHviI8UuOthR7QNfXhtvJ
	 Djl98PKlw4Hds6HolE90OKIUt8O/WoqiZguBgGf2ZCvfg6q1VG04R3Vc7IDQIuPZh9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+z/YCWGdnXyLJzZ8AU4hcI/OlyYCJGPBekNYtY5GceY=;
	b=btJOB9pgAtHmeM1fj0xNZkgFPsorp4eb45xhIjAymAtVkrBaj5EbjyEvNnf90Bvu+L7m
	 rMJcUmanavBfvz9LKIMGUsI039bfM3x9U3M2u2oAF/6pHz51dKKOzum8fDtfy13ZQNuWS
	 zu8sJfH91MwPL44M8leH4DtX84rjfAZptU20JIy8XF79XxK0KbNexqp+weheUWsp+pHZp
	 apsMs3G75zM9SRA8URvTzwDe0WTf9kQMS3NIoipoaFrJoE/VXsbTyjc5fJJ8Sl8iHGsi/
	 8K196FDwywiz3ZEmkxCiLZt7Ugt1jC4hBYyYM8yeuSdaH5+/ukoWkiCF0uu3qoWJ2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iORhrczw;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80268606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80268606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iORhrczw
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04f61282dso30606205ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672942; x=1796277742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z/YCWGdnXyLJzZ8AU4hcI/OlyYCJGPBekNYtY5GceY=;
        b=iORhrczwcMaPLyESxs2JW2uOBMBH7/Q4VsL4p+vJX1dOH8xKb554vT5M46U1A6Ffrw
         m49rJgeQzDc4yrjWeAiRAVI+p6kg5M+B34uE9+mtK8lVA0JC/dvvFxTTzfxjUDOFmw6k
         Rsn9J6fnXWxHNa32oFL6rF8ICvKLjRwantG1RB9XGDSUeJDrPjKXbcEfyhSIbtmkjKs4
         hlMZ34VwCLGrcBKNM9uk3U5bsgB5z0aYfmB93ogXYBo3hmeQcJdybOemlj0XkcwTbeC0
         2TYDLoBhLeMxSfIdAT2IInJzS8SfcoMSviPrHUuJX8Rxiuvv7QoNYH/OasARpMu7Q/9h
         VK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672942; x=1796277742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z/YCWGdnXyLJzZ8AU4hcI/OlyYCJGPBekNYtY5GceY=;
        b=YfwMxg1wXLq5w4raeUtvwHjWEWRXeWaAA4Tmz1IIosbIfaSoJTknXfukUBA4UQEiV3
         kOCoIHGjN4M5SKEaFhodTSs4CUBdr/WoFpRaGeXjUMPFK1rfdHeLZSDMCz7p7m2Aisht
         KCpPbNO5zo93v/c9/HA58KT/d2JICHzmQ9tOL5ZGWLcZGR7ya3HS64IO7zhBYsLCCK6b
         yL547/2DDHtGR925wqtWX4IviMlm1NJp0prPeXfVhxs6YaasbAb4NFiyEj3GgaGC7Y52
         Q99hulzrLSRc3IUpuTh0ANWpSPHND8HwQeNdppdSLiW6pGfTTQ55CfkK7vVMOJvu1Gna
         B7+g==
X-Forwarded-Encrypted: i=1; AL+hErHMEneQF5FtbqehZsToXqlh2SYjRWf92fzzGpM5XF9jF//Gp8xOgWqMoX42/Z63S7VdXc1ZeWge9pTQAXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HunybrOodpev4A1QBvom3GD8Vg03VabXj8BzTQIW8s9FEue7o
	OU3xKqkJEjtoz15p9k33bgvzHd0gupGEp+Kc+vTItyK4shydkfLFLTcB
X-Gm-Gg: AZFdTZdVL0JChAk+WKAB0HmivZRanq1evICQXNK6fRBsLuYqTURBNSZSpZNxSJef7qR
	w5wXZZrYPaFctE36uUZN75um6OY6TqJ56bC0FRdIziyMIIYs4OjX7dBuZ80VvVddVGSnEsZkxC9
	XcXBXbHpquzUy2y2DnPfTWDfYbMpleJb6EwK19iA0bT5dYtZnEavufzzIFplwN7Z3XLvFkFvNng
	LrXP+frag0iZYKHFw3IjRmoBeC+yAS4JM+QDdEj4BTxMageeXNTP/ki+L3zcDFPugI5XaJhfh34
	5BxWYsjgNfOM6A8MC1kbToXic2wiQFZBMoq/Qq2uKntXUaYCiNuAIvcYakTap74ISMeOw34xZH8
	q7TL295sWkUSlwLToHwfsqJX8OXfsfiK/oSNF7llth3krD1RZ74FChpbRo8K8XrZlkqcUwkcbsl
	YmxyITJX9QTgrzVq8bx3/TcJMBTpuWDhpTgUhrK2NAV1574Agzq1n+mAzWy3gAaWIQftnTVpk15
	Z7c+nh0T7HbYkPwsjkhkvPMuQRJVT3BQ61t8KaHo/svHqEMpNkO5rQAVPneM8BjXpWqHB16/PvQ
	XObZRBCVMRfw4L0jK5lg+TtN6Ew3csEWdw==
X-Received: by 2002:a17:903:4b07:b0:2ef:de9a:e59 with SMTP id d9443c01a7336-2f03f1a1767mr184808665ad.23.1795672941840;
        Wed, 25 Nov 2026 22:02:21 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm98125525ad.13.2026.11.25.22.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:02:21 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Thu, 26 Nov 2026 14:02:16 +0800
Message-Id: <20261126060216.3155872-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87cxrtyss2.fsf@bootlin.com>
References: <87cxrtyss2.fsf@bootlin.com>
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

> Wasn't in this driver a bounce buffering operation that is no
> longer needed?

With our patch in place, a vmalloc'd buffer now gets bounced by
the core through chip->data_buf.  But data_buf comes from a bare
kmalloc(), and kmalloc() does not guarantee the returned address
to be 512-aligned (with SLUB debug options, for instance, the
redzone padding shifts the object placement).  So the check in
r852_do_dma() -- (unsigned long)buf & (R852_DMA_LEN - 1) -- still
has something to catch, and I believe it cannot be removed.

The second reason to keep it is that the local bounce is also the
fallback when dma_map_single() fails.

Ping
