Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417463;
	b=BuVncXv3mTK/xXUMMA7Xn7K2hFANuvNBAp1oFVEC1nlQ6IURjq2/Q6T6Db4RxKkzH57f
	 JxUQobnKimxSTWnss1Eg0TZ1dOEuWG9zyPv40PyW+78C33fFQ886T8bR4YNlyJt3mAxpe
	 mN9LrgMCNE8WINqrd1A9UhaM7wKieQX3jBKHqsp8Vf8xFrhzr6DdBAUlDOtCFWmZv4smN
	 GNzYh1Dfdzw8DfIszY80aIdLYIYOeEs+0nSy/1YJEDQZ/ng2y9Z6RYo/gv3VHQ4559xMZ
	 v2TsYchtaqfh9H3tskxKZBMYF4FzlIuBBEpH4/EMNygcvAnl+fpAT7PwLOwhyLEynbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m9kW70JEMRn0Iy+mUsUZIP8LXqNVaxJT/Uhp8nLvcXw=;
	b=EkfXLSZeypW6IBINTnRObvLurfds7IGrl0hHK0j0lqrYqbs9x7LkebtEhhmaRiG1cATv
	 mk3kaL3KDanC8PifA8qQ3UPZ2+fpkVGeWff3rFpQF+Y2q2/2LkESCxtP1c92adYhn/2mc
	 X3y9/jXFkkmO2IPFlNo/0fH0z+DrNwkLbhgpDl+Od4pECuI8Nt03bpB1V6tBfGLMhSb3a
	 mEyBsz0+yxU1AlQOmsRPukS4XXpMLo25dkUG235M9NY22xnTXuGU6FKvBLIFuOLX/mlOt
	 lTDEYowgLdiZ0NxL7QiX9tavkZJy2U4e9bYEWq6KZCYm1Ds3S2ne0T5Rs4AKztmV+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N98+jTvf;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F995606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F995606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N98+jTvf
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso1633858a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417462; x=1796022262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9kW70JEMRn0Iy+mUsUZIP8LXqNVaxJT/Uhp8nLvcXw=;
        b=N98+jTvfIAeVNkMbvzXxFIlZXLLDtg+KJblhgJAZ8Zwb+oZ/6zKjggZWgE3WePZZEb
         lUcz+HOH/cpPvYTAOOkRsekUcCkrWR5zgAYHe9psNw7eUp5r89zb+DjUqggOne4gcZ1n
         KXyMcfM2FdtKjr6RfWFfLx27yM/xLZQIVuWtZrVnPGglxcfDOtL0XD22jnxNpBzYaWVG
         BJ0sXLw7T23ZErzHxzW19WwUKGyYAeC/yX7Dl8aPIYGaXM9tTfCK4nbQy9qqpXiPMEjE
         F7eZ/EP6e4zqSe6J2QNz0mMj5su/qFEZrpWZfL/sskddMQmvAuGgwsivnfPVyvQMocYS
         0QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417462; x=1796022262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9kW70JEMRn0Iy+mUsUZIP8LXqNVaxJT/Uhp8nLvcXw=;
        b=XUb8jGYGwsRmYgub3x/Zvl9+yA4w1OwiUgEl0mZevoIlQMaJu36EEyOTMrm3V4JSVr
         BXivc0r7lW5bkdeEBBT6ZTJlPbuhSUJ5+/XpEASyKenfOVqGostXLkYiqOWiHbbIpDsx
         wHuwwccNr9p6PJTO2vt4qGK591mrr1SD1Z/xc1hM1yHszVopmqJ0Y8nFb/1RssePQEXo
         Sthz35mf27rI6y/8Jssa9gz/o4laCFUUMnyu+4hCJqZ3asF9QTuRWmU6TI78QIGMCqIx
         xMBlCJm0992GC354zQDVr9GJygBnALLHuqUN0qVtQauJA/hhUoPrs55K+eU1tIy9+QKv
         OCGg==
X-Forwarded-Encrypted: i=1; AL+hErEE2gqSnwRyVVTTLIgKGh+OA/6QzMhKGgB1kQQQTuJgkZ/nFwxhyB1GasISGRgHSTOlnWWI5gWzRBhTIzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GQBKUF/XDMh8LyVJk6TbItTcYLuiTMjsLtbQpqIE/8PWuVwTp
	SXTUs9+x7PVKA9V46k33PWtb5/Oq6RSqKrRXqrIZbfhNDjJFpgiDR6qJ
X-Gm-Gg: AZFdTZeScFTF05ik2M9XpK5ZEW5TCaPmkpVsqDzXfErAXbMPDTavzZhqGFGuudCMgFb
	WPHdVxisQd1EE5fX4Lx2vwVbT5+vdgRtjAgnnkRpRNoHAXyUVjMQ5FWxhwnYzgwN9xF4rsFVV0l
	RK7HreH5QM5wC+KYNm/F1bHo1AcnN2lC6mR/utsEKdJHYmcsW/RBcirkS1XZuLisuZRSgNppD58
	OYU4K2jW+6lSrs7mPOCpK2GvnOMwI8+Inmks2DDjJTYWm1//7CkzqyC8sBky7U2FKvphwNG0Eyw
	jB8fxW7Cz4MBOYC8+pD/u0cQe6qDb7UScREQSKKKNG1Gmw0RcQv1l3m6oTKeYAk66FOjBW6hqdm
	EECEWdKrowsiwB6xyND8WnPXRjrG/ZKadRDf5Ld7Ryy+BLAVVd9dizYIeIvQfuMRTF2M9xEMx/D
	dwBvTO3xeB2ksvSkW3e4ZlZmzwJ+IbKLtwcPLuiIa8wz1BiO4dprx6B8b3pV0XWZYTSUJ/Rs+ba
	z6TT6b8uSMsR6m+k08bzHvxiIgDPbVQ259y/1Hu0gBEiQ0b0zeyweGCHmlJ66lCn0W0SijwSWS0
	zVMAb4uHHSikybMG3huncnBUiwdLB5h+Xw==
X-Received: by 2002:a17:90b:278c:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b41c97ac3dmr9924577a91.52.1795417462165;
        Sun, 22 Nov 2026 23:04:22 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm6691018a91.3.2026.11.22.23.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:21 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH 1/3] mtd: rawnand: fsmc: declare NAND_USES_DMA
Date: Mon, 23 Nov 2026 15:04:15 +0800
Message-Id: <20261123070415.3060054-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-228750@kernel.org>
References: <sashiko-outbox-228750@kernel.org>
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

Hi,

Thanks for the review.  I verified the three findings and they
all check out:

- fsmc: indeed, nothing has set host->mode since the platform
  data removal (a1b1e1d5bdfe), so the DMA paths are dead code
  and fsmc_exec_op() always takes the PIO branch.  I am dropping
  this patch; declaring NAND_USES_DMA there would only add an
  unnecessary full-page bounce for every vmalloc'd buffer.

- intel: the unmap problems in ebu_dma_start() are real, thanks
  for catching them.  I will include a fix in v2: unmap on the
  success path as well, return directly when the mapping itself
  fails, and unmap with the device the buffer was mapped with.

- The Fixes: tags were indeed wrong: mtdblock's vmalloc'ed write
  cache and UBIFS LPT buffers reach mtd_write() long before the
  mtdchar ioctls did, so the exposure goes back to each driver's
  introduction.  v2 will point the tags at 0b1039f016e8a (intel)
  and 67e054e919248 (r852).

I will send a v2 with the fsmc patch dropped, the Fixes: tags
corrected and the ebu_dma_start() fix added.

Thanks,
Ping
