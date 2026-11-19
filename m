Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081087;
	b=h0AkZ3AwBCO0SWrYobjDyxZ1AeyhHPPXfs516SXVtE+LdJI7P8j2VFUGXarkqXV+Vuuw
	 h3vjMNJXC3lh/xsemyNSS0lBxl1pTX2wNo0FFHGiCcR0GcPxOQU6tNfTVuZmIKDxVKZ5f
	 KocrkvbuB7sGI2XcGvOhi+y//rD8J0p1rxMnSpVClm7WTj5O0Aa7E+9hiX1bv9bulRODQ
	 plsIM3VnIeBxJxmwlczCjrd9wKz+wFo4kX9z9MghXVSwbmcPCcf+pwUyOB5noeFH0xxm7
	 SWIfxXUiEJ8nYQ2w3HfZUWafhJqNtqaryWKFWmnb35G2qTERG2/JtKeAhE3vDGDw1LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
	b=MLALb6o5CvsmWq7hLj9cycL6nVpIObPs7JsPkdDpP7XlP0J2D314bRIk0TkjlKM5bnmE
	 O/usDO9B7LKTd8L/8/F+KQqHhIMV4xXVr85cWQlIj8QxYYloNiBWxrkan4Tz0LyGibhRK
	 zEMMIwCGP9v4WBuAYiyMRMJZzA9ILCyxYud0n/wYUzmuFE02AGjHJbi63II2LIw0pScxN
	 4bVMwguCnWRowAChj2PHFywPUfn9kFr5lwt3hNGSGhFu7ttesv5yoYbJOh1s0TebdfkxB
	 +ta1osCtLfUHU62qEOrJSN9fLYKNGYuza3msZ+7+aiRQjYuPENZw8aGSGUwBI6fQwNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yx/2zs4s";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C8606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16C8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yx/2zs4s
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso1661003b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081086; x=1795685886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=yx/2zs4sojCnvMrfceKIHjLUp5swFtteMFErowEKO3ZfkCJMiJxMQjnIfsyIx9nG2L
         3kqqZSyXdetSBT9IMgk4PY/8sxuBEk7+jFS1NpFeON+onB6ZvtMUT6O7MVirNqY8nKtS
         1VPB1bzmnEm3JCq9N3zJBIDfc9x8ZMSX7A9yxcafBLl9m0ZRh1cVIOAD/DZSTGn0iGJe
         NPbnRFMbidRbCEfmpjeRN+TnRHoYEUJviXobOH+YP0izJO/znC4fe0WdZjNH8RvMyDZe
         4VaMVk7xnfEq9oGm2+9kVJ8njIkGtis/XHD1QmWK2sDihKy50U7VQodPwW20SZD2zAvE
         jLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081086; x=1795685886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=lK/wFX2FYI9M4/+MUW1akf2SLG7dDQatQLZqgVsjLqsenGWMUZsaNvfe4kdDf0+wSm
         K1h0pItlp9XciG3v9QtLLhYVvbm5Zg7zBlhIUbltjah4Xw4L6FiWptJJkE05dvwbuDKe
         kcyapGrAt+w0mq3Q8vOe8WDoCRwQnbHVk1sEEYeqfEmczYfjqDxhFCRKV8mSlzl2CyQ8
         /LuPRdz0y4bEaSYEhdGhpvNi3tmxBO12hfzHDNiYM2RJJapKn6Xd5JoAUGN7KbCaLxbi
         FJUzkbh2/VVL+Z8hXEwAnaDRQrnII7o55tI0YA8gHwKpYl2nbN46+tYFxcx41gPsNEGT
         Lp3w==
X-Forwarded-Encrypted: i=1; AL+hErHngvqFwW+FVWTSUEuA9vr0UWUUtRMpjOlwZJ+e8IupuvoiNqqr4wqLPUaswmWZ6APxWCgqCv8iI3huIO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TR5jy9AyAzSEeJLId4Tl+7YBce8/jkjSKX2L2OBCFchC/44pG
	5BcUrTOaVOiwWKvjAV5KRaY9csduZ51RjGDzBbMkKuVi0aHkr4N6iFcx
X-Gm-Gg: AYBFou1MCPITG83yOrbc4NeR0u9x8ByGu7JdnHG7O3YGBrmNbOHQKLiNtqohsn2sxyK
	xkiWnoVhv9k0QRVhzmwWoMup/mSCjkVNHHYyIgRYIiS+PFcZHS0N38LIFDGrBedF7Syfpgz7hT2
	++vOWjTOd6RK/htFpiyZEEeyayoJTd4kVdQ7tS+7oDMlu5syDXhkbsWijTve9kS2H/Zyb49gFnI
	C+oPC6+TUREQlBdvTncvaTLV99kP+gEVJKEMRiMIOBldBFBLtyOCPO8sVnepHlnoTiql45S+1rS
	khSYHhd1ah0dW1BA9a5RP4oOA5Pojo736JuVwDaUer0lvZwKjpAbCyWrSloNCxBzJpiFl/C8O3h
	h0NXxMRSQIly8VLqEY9qzcmM7CWjX4qog8VUC+uMYGXQesVGejgT8jDkbZkv6czD7suU/cdE+Kt
	nKfu9MPcjCv+7dkuWr6Jvzd50lerlhB3xYfqKne724gONkYIJB/nAr/lyN9sQ0TGZ+jh/AIvr5i
	PiuJ1GNRoZevy/G9yhDe7E9bb7L1o+rgxTBJ7zkH2mH6pwk7C1wjZZd3lSatJw3eAutDPk+rvbO
	IogtytAC+eSqDq13x4X+885QZq549RgaZQ==
X-Received: by 2002:a05:6a00:4b14:b0:898:22b4:c8b8 with SMTP id d2e1a72fcca58-8c5d0f24a2amr5021870b3a.3.1795081085930;
        Thu, 19 Nov 2026 01:38:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa27dsm2523077b3a.19.2026.11.19.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:38:05 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:38:01 +0800
Message-Id: <20261119093801.1447618-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-222838@kernel.org>
References: <sashiko-outbox-222838@kernel.org>
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

Thanks for the review.  I verified the three findings in the tree and
all of them check out.

1. powernv_flash registers _read/_write directly and passes __pa(buf)
   down to OPAL (powernv_flash.c:69, :220), so a vmalloc'd buffer
   would hand firmware a bogus physical address.  fsmc_nand.c:505,
   intel-nand-controller.c:312 and r852.c:196 dma_map_single() the
   buffer without any virt_addr_valid() check.  This also explains
   why the 2022 ioctl conversion (83208e106a8e8) was safe: MEMREAD
   and MEMWRITE require _read_oob/_write_oob, which these drivers do
   not implement.

2. Agreed on the low-memory regression: kvmalloc() makes a single
   kmalloc() attempt and then goes straight to vmalloc(), so the
   size backoff that used to make progress under fragmentation is
   gone.  The stale comment above mtdchar_read() is my oversight.

3. Agreed that "shrink first, vmalloc last" is the right shape;
   jumping to vmalloc while intermediate contiguous sizes are still
   available trades a cheap shrink for an expensive bounce path.

So the answer to the cover letter's question is: quite concerned.
Plain kvmalloc() in the _read/_write path is a no-go as long as
drivers assume a linear-map buffer.

The options I see from here:

  a) a small pre-cleanup series making the affected drivers
     vmalloc-safe (bounce or reject), then converting
     mtdchar_read()/mtdchar_write() with the size backoff kept and
     vmalloc only as a last resort;
  b) keeping the current halving-only behavior and dropping this
     RFC.

I am happy to work on (a) if that direction is acceptable;
otherwise I will withdraw the RFC.

Thanks,
Ping
