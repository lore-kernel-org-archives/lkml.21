Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404738;
	b=CLXrMItfm4xrAW3oGb0FjADxtftH7g6ZkaWqTkxxcmui++6E2m8TvKFnwugdvUrlEp6A
	 m/TBMZoOvmhxJENl080gxCiPcoYulRzIissJzPWUA0PvnrfqT1kpb6K+nmYB31LZwZR4A
	 U8GrmtL5VHLTuN26ux1i+4Zv6szOwrMzkzRCXt06Jlg4gjiTuSyQ96KmxVPLfTjNKev9U
	 ZLbzo6rsDUaeJVvr/edaQHqpmm2v5Hx88BxryESjQCpYuPLebaYP3aV/aF0o9MtMhgdoc
	 ps8RlDXFKgz1V7Md45aV+KJIZKKxNcPJXi9Vnr9fcd30hNMBqZ55M2xnke4jrQe7c6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L+depwuXaBkUxjEuF4EIS2PV9zfmiucR6rW8+6VuXgU=;
	b=KvOrO9KbdZ1RXTwNAGvG6W0Zt1VCgqUrg5fjKcVce7g8DiLzaemHBR7wnflPCRlOOZiN
	 5RnorFWpd3944sQIiYyYfn84sLt3/pznNpFS2MFbAF4p2THxXdWkAq5IV+cpmoRSh2Xu3
	 KegwXkygcfy3XytTix9r8SXUKrv5wTd80P1e7OMHrwk6Y4MUTQwfiyET5WCrwJTyojDzO
	 ixPejoOScuCvRlzcsU2lLRdL7aC058BYyDqF0thmwMZRQKlCujQ7bcwXwbh1xg8pMSN70
	 SqfHJuFuxGAFS7/A5jHp1itI/m1f2Hg3pnD7UnP4UifjIqlz2P61js5SUh38K/fX96w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oru5OnX7;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD63606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oru5OnX7
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f03920c4a0so17093255ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795404738; x=1796009538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+depwuXaBkUxjEuF4EIS2PV9zfmiucR6rW8+6VuXgU=;
        b=Oru5OnX73wCrVR9EhnYoyjJzPHu/OX9/JC66wT2aqLpnwjAp7hlFly9wmHvoMCnnQ7
         3fD3Gz9baJ7HewqgJz+x8KvJihCvIxUV9OFJiJLUT2k30jxnN6KNvLiNUp6g29M32pq4
         u43lI0H/0l/AFTZN2+15PeapXUD8tT3RWX8lPBFsha/Smk7ym+czPP2MeSlbwsK6pHgp
         pX5B5j/8/aKvpZkQ2mF8A4FHXXi4sz6CcsqZRYt4z1ft4LAP7wX0qUARs3GknpXxThgf
         Jlhs3EK0q5k93OFF7P4yP8YiRI6GOBYXVq2BryfkNWerE9ZJ5//JY0yK9UE/fIz+tw9F
         DFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404738; x=1796009538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+depwuXaBkUxjEuF4EIS2PV9zfmiucR6rW8+6VuXgU=;
        b=ObNcpNwSUeJUv/lo1kBfljkU2/Xd+ISA3Kx0yPARvvRrHa2Kf/6T3M2TyYwwvvm5VO
         /VgmVKCjo0YiGxLD0aGRS94fM3E7sjHt99iNdf8J+uA2QAJDo2JM7KdOdPUfXTgFYI4H
         zgqDc+IY5Zu4u54grcQkTP7HLXnJnE6ofFj/OJSSS/A25W3lpWO2hX2rDDh9YWZF1aTc
         kayfEE7YkguTmbXR73zOh8I29TmkYDtYxswG8LJNACNAL8/k4a7syi+IbDW1mX940zPH
         VlNftfIL4qAzxOhRWzkj5bGIQqBRnKbbDfxpPP2g03dfMBxeBnlV52YJzbwHQQcrtLjN
         UHjQ==
X-Forwarded-Encrypted: i=1; AL+hErEKqbvY6kXTdIGwW8zh/2yxn1kHDvovckpSKDahtbThBFuT6QhVJiOzsg27/AEqvJu9mia+2jhKx4Vzzyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0AdbNwIOVh2d6ZGFXaxkUXRYCAJWPXopHZSpmQDZsqFAr1cnD
	ylyWCK6La5feq8kt0KPMYY80OLqH1K8y6wgKnur9kZun+AFuFPCu84OZ
X-Gm-Gg: AZFdTZcT7V0WwjW0haumnxqZPH2lv1oVulx2vXS5xQ1K9mJnGF48PRolzE9mK+wO1jz
	/MQ9kbXbUynr/qLs+bObpm67lL8Aq94NxplOmWjqGXf/wb+1IMH+Lnq4qewpJgR8XVDfrY76rRy
	eAzMAtXT9J1Ffc0Jc//Ae9Vh643qjGF5Mwm7Tuzn8gyzbuvTLQGr1FfYYxoGyEAeyXlysEAFfy+
	iDT0RVZmPE7ONutk6nJrI9mZLshJUTgUDkEPdCigpLL+1FnuZTVq0yuSHknVvDIEq2LUIF7QmFh
	NTjSCJ/1fQ0SiuAMn9CqhohZp6CnEjqTR5knQMPkB9LieGmbibEURJrIS4pQyVYmB6EioVupug6
	1XwH5Osl2vztBIfzS8V8LwHpTQrLGUvcaacjEJmjDQ4wzqcEvHYZhXzw2Ko00jGKro9LZzC9M6G
	v9JP9m+PLRxWTiE1UCzZ6Ma8OFc7AKlTGF1P1RFdiD/l8bmKxvYtWICHTS10y0KTskW+IQMY6OF
	3Y0AWue8eo0Vk5IFdadp/iNr2kpALk2L2yAcoBY+i8/fLae/1yOnEErD2aimUIGu2kPrQWErmBN
	J7PbNdoSmzLjR+Uk51zFJ/x/EgFhWLfj1A==
X-Received: by 2002:a17:90b:3f0f:b0:3b3:ba43:54bf with SMTP id 98e67ed59e1d1-3b41c925a7amr11531193a91.27.1795404737681;
        Sun, 22 Nov 2026 19:32:17 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04ed9620esm35813525ad.26.2026.11.22.19.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:32:17 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
Date: Mon, 23 Nov 2026 11:32:12 +0800
Message-Id: <20261123033212.1660477-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <875wxtf8uy.fsf@bootlin.com>
References: <875wxtf8uy.fsf@bootlin.com>
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

Thanks for the review!

> I would be curious to know how this gets faster and why?
> Because the preferred path is obviously via DMA ...

The motivation on our platform is not per-byte CPU cost but
per-transaction cost: the low-level driver forwards the whole
transfer to a controller over a bus, so the latency of each
mtd_read()/mtd_write() call dominates.  With the current
halving, a fragmented 2 MiB read silently turns into dozens
of small transactions, each paying a full round trip.

You are right that this argument does not hold for DMA-bound
drivers: for those a smaller kmalloc'd buffer given to the
DMA engine beats a vmalloc'd one bouncing through the CPU.
That is exactly why I like your suggestion: a per-device
policy avoids both failure modes -- DMA devices keep
contiguous buffers and their graceful halving degradation,
transaction-bound devices keep a large buffer regardless of
fragmentation.

While auditing I noticed that the fsmc/intel/r852 exposure
predates this RFC: since the MEMREAD/MEMWRITE conversion
(83208e106a8e8), a vmalloc'd ioctl buffer can already reach
their dma_map_single() under fragmentation, because none of
them declares NAND_USES_DMA, which is what activates
nand_base's virt_addr_valid() bounce.  I would like to send
these three one-line fixes as an independent series right
away, as they fix a pre-existing issue regardless of the
direction taken here.  Only powernv_flash (which implements
plain _read/_write and is unreachable from the ioctls) is
newly exposed by the proposed conversion, so it would come
as a prerequisite of the series.

The plan I would then follow:

1. Audit all mtd->_read/_write implementations for direct
   __pa()/dma_map_single() use of the data buffer.
2. Introduce mtd->expects_dma_bufs and the allocation
   helper, with powernv_flash declaring it.
3. Convert mtdchar_read()/mtdchar_write() to the helper.
4. Provide numbers from our platform, including the
   DMA-bound counter-example.

Three questions before I start:

- Shall I wait for Richard's opinion first, or does this
  plan already look reasonable enough to draft a series?
- For expects_dma_bufs=false devices, is plain kvmalloc()
  acceptable (single kmalloc attempt, then vmalloc), or
  should the halving stay for those too?  Sashiko's
  NOMMU/low-memory point suggests keeping it as a
  last-resort fallback.
- One more question on the flag polarity.  With a false
  default (DMA drivers declare true), a forgetful DMA
  driver would silently receive vmalloc'd buffers -- the
  exact fsmc class of bug at the MTD layer.  A true
  default (vmalloc-safe drivers declare false) keeps the
  failure mode benign at the cost of having no in-tree
  "false" users initially.  I slightly lean toward the
  safe default, but I can see the dead-code concern.
  Which polarity would you prefer?

Thanks,
Ping
