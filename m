Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081038;
	b=O5+iea2iDCKUVDlpJrlt+CYIEGkWQS4pobZ5Iy6bvywImkiDXOVV4SGebGhjcqDSCCHS
	 c+mhYUPuo66E47S2Bd67/sceDrO1aa2N2QKaPd4IgEVfn3DDNrJcJjk+x1toG27lfb++E
	 +5AEyRLoCtkdZLm8fHFBYPFscvFus2WKOMo+Aria/W5Zs1joagR2SacMUWEXw4PUfbLcf
	 23dZlyQ6qNvDsJu01f2GbviYB1RJPz4jb29Zw0PltjWcsFdBXgEWCR4EqhjiNtBdNLNg/
	 1ZCa/VlVSQGJllcZuJHUTMmeiw+S2i2UK8FycDcnkAzrcAT+xrY6cIphWmvfQJ1L2qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
	b=VVgF2sbauBXjF8fVuwS+YaHxjpHaW/VbzliRDC3TZfzKbHeW7yLX93nFTyzdLQO+QrVP
	 3Vf6cMv1fwwskI0zHTjg8mV4G6ozBSbnKHksLAdTGzDDdFCIHQhXq3qsNdEcOZyQwr0bc
	 202N1c1TF5NOiMSPpnf6rWEvSpRTFcTw+VI4+3Z2oWwBYjfnrXSu2+ViFndcXBwqxTcF9
	 C0endbeaHWW4KNFJUfImL2dHsjfupoT64KUablvgEMkTHwd8+rTBPRaq1dKbjXqEw4gGX
	 TTD2QVaav0w9ZQSzbz2n3L8hgQiVfcbvI+bXGyomxtm12ryEXibbK+n8xPSb558GXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtoChI0t;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE741606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE741606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtoChI0t
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f020d0169eso3099035ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081037; x=1795685837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=qtoChI0tvmSV8po3DIejJoBpEN1XaLcA7YAJvr8B58+xel8yLFgzZ59UZW0cprO4o/
         o+yoJGeoxRixuwCT/jMHnLqBCtMDWmKpMRRIzEA6Szgsm1Lu0YFbmFMfaVs4zJRTUkvl
         NXinjfRrFK6QzsfRN1iujcAz9WOT8jIQkWzyFfetXTXAajM9aE8knsrUIchPJoQ1/88e
         mKNV8TZ046TXjT/aqGogC6JyK3X7RVBUHAvKtGMMn8OocLo1/RAzEqDwLlG0NeLhEnM7
         F5fCa4nMAZR8r93n4NYGcNf/BOtAyaN4l23nQZwyMbdess1jBbJDiSX+y8e3j6RzVp7E
         +ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081037; x=1795685837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5iMD/+v8yFezHX9h0NFo7FfqvQ/A5A0bp0YVr9pyBs=;
        b=wSptZtGbhEtuW8TaTJjdLK701NS9E7v+XH9yBQSjFDSeQ6UuCGVKBeN0n9yayvfDl0
         l3FpdluyYy270LmC8wuT1ukSQT5OA8YMijfVF55V4ETtajNL41jr5WQxEGz4F5080t6x
         JhDjRAwmXTZubEEPyFFzNybeCl7Zm5fKfomLB4Hg5YFUWHv+s5FfU8aB51ObJqa/ENeg
         PpC5+rK+JZrnPw9aubkmYX8cagxSgDNMhSlZ0OrLaQEmf4ZEx09WRLy5LziFRzS/jNPI
         h02e53eQI5gYPpQs6XIIf5mfJi3Fnr1MnJTmrSeXI8+8Me8AXIVx4aUMx0xDN+lQFUB3
         pxHg==
X-Forwarded-Encrypted: i=1; AL+hErHa/TgC/R7PPH37EYAiMEM2FZsCwiIfGEv69aVY5U7D2FmYv7U0VOstuJAHCuzhcBwa2G4A0VeC8wr43Oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mb41sZz96/hgZxMznMhr0xCVzGCrjvvQF4esV6/1ArDq9egVH
	Qnss/ckkFqlQDkntyuRXNziUX/9v4rqrTzDGqzaycbc1pQD6R5ICrkMk
X-Gm-Gg: AZFdTZcVZh57ZEWaFrl8o63wADr1GOMgAPoMQS51UFdKoie/UKP1+jK2kGkBj4/e3Qm
	BpQZMHQq52q4epLiy3ZkhyYxkVIfKECYJKd7Sf7H+Kdwavv5iWgnMDOItHGNjQ5/2DFf6XhMHsR
	sRtR/dUqRFOcR43waEB0jOGKzyshENDfxpIcL1mDQx9qMxGk5w403s7pILUjTq626E/H+qaZEgf
	0N2c7VlqORB8Pjz7wwIKPatlKFVpFfxEQT2GcNiIOjto9TCINIWpSqovRagm5Rdi91xOiJvWhi3
	rMNj19kz7HamY4Jjs7iSmrQEPmcEOXxQlv1bXBdcQKz793EOEbd97hgwj87xboS/8GPqKpuxPcC
	RuuuyygQQyhUGLF9wr57z53Igbbq5fOeqFjXFxEzA5PlCCQk/TdhqO4NA9dWSSk4H7O2A6uzjG/
	rsMCCMZY67Le5NgYeiOBruhDHQe3PBJnEOxI46vFu8MrUwRqB/DvheGIrKyvInqF1on55F9rppc
	0PzqZS+yu8d+ZdGQmw+GM4aCo+Fv8ImOKbOFaf4tKg92W5+JSGc/x80wQYxijUn/GwSOEWvIDTe
	BH9/Xq4sdGGAcBlfHMr5lXoD+vARXVXvKw==
X-Received: by 2002:a17:903:1a4c:b0:2ef:e946:cdc with SMTP id d9443c01a7336-2eff769565amr60576625ad.56.1795081037315;
        Thu, 19 Nov 2026 01:37:17 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62876a6sm27034795ad.63.2026.11.19.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:37:16 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:37:08 +0800
Message-Id: <20261119093708.1445788-1-leeonion.muyu@gmail.com>
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
