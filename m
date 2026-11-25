Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598733;
	b=VkrVccYX1yn7mJbIiuPY1pdZsnL3dbRtNYSLcbCg4hBTtIs4Xl7tDnDCgvu92V67HAhC
	 QmNB/ehuN4CuQedW99ZwLtPSloEBc3LqIwH7Cg6k64X3Scnk2zDPhFrYwG+Wxsv5XOlro
	 IJaxS8ZqZZuAw5uim7XljDgLtOQ2oMVY5iX4p5AOxN3Y4AT2MyQDAgxB6Nj8d3eHJl86o
	 ekLW2UUkkEEWhvPpXFjLMj97uJMGq45DesEb7mhTtBJ0furTIRfEsNeYtOVVg9HSbd+cu
	 Hm2AlW5jGWq9kU6kqTaIvmFA1buMafwT9YDat1pEM9VaTgaZmqdYXjmj33jsDMSb4Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kFVOFcFtL3Kl1lidL7Hzux9EmFfy+WWbY0BBgURBK0s=;
	b=ufM7+ZEULCQ7U9qX2Laxf5kM0tCoaAz5OTAsWKU/UzT7Esn5551wtSnooKNgt6HIDOZd
	 Fl7hWHi87nmXkV1/W7Wl3DWozpzPys4c5020wK7XCtIXv4qrvVR1kWAdqVtf/1lBEUwos
	 Gbwgg9nnOOr0jlRAZhOCdLGbEND+dEmRCE+y9mIThubBZjT079d5ru2FYOt2kg6yi8TxG
	 BMOaRUNVZbjiAUPhG73wwi9ftdChGcHidUx0TOWcZ91KHSQDWBQRHWr974bhtWE9VWS/C
	 oU2TJMzcHCWCA1N/yP47kU+u69yBCZeurGAptKG3F8NFNaQR9j22uvWK16v80P3yXzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ03HIPc;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A0606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ03HIPc
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2931652a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598733; x=1796203533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFVOFcFtL3Kl1lidL7Hzux9EmFfy+WWbY0BBgURBK0s=;
        b=SQ03HIPc5Uqz/mf3s6ezchpcJ+u2EXHxgVH0SiJ3poNOZHngz9ZvKSvmmmxbYsLUr9
         Y9iWFGV/dZc3aCeQrVpEa1bzDKTVRXVnPCPQe8FTcVYnzWnZ/YKOD5JiC1mD/KfvlOV+
         6bi/K7u8aLQp4hU8/Gx+llPQfuEm1zQatoMShR9Z+BP2Zy+ZBo80BqFIEb+A9FavAUO/
         r4/ZgsqU7GBqvOqTZY2TIA+VIYsDFCceh4asHL2NN9wtzgYflA8aEQvojBP22ga05+Gy
         itrk1fo4J64VkQcDq0R9SGsdGddCBPELXWN8iSIscqwtJFvYUw7m9pEKx5rr4WhLJ3Wm
         IbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598733; x=1796203533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFVOFcFtL3Kl1lidL7Hzux9EmFfy+WWbY0BBgURBK0s=;
        b=rRcndaZrs66OazV5tA0sKoypHF3B/mMy9N7770J2aqUDuVUaJYavKop0TI5hhR2++p
         xGXamzMep0nHJoMK5wkL4wgAtt7k/LHxlWTkISFuMOOBzV7+/kOJ0t7jiaES+/5ExXrZ
         eTkHU2tvQY93pfBdjVy6ZKGD4xe1sdfI4jo299VxGDPm+CLoG+xl0MkpHvToMCR3t01o
         lMNEA6wWJJvnDSAaDFY+eNsk143pmRWsBLq55hcaYWy51x5LHpN33tjtSK3rm/yQMvVh
         iAnYmmIVTkIU3svitYT1fZFCXCb1jBdz1r2RpTQ4XGdXNmFFWw7h++lqdbfleuusSGW4
         q8nQ==
X-Forwarded-Encrypted: i=1; AL+hErHd0eZZh7LCin+RycqMFnrSKcqsLermkyQNySXoM7V1Gl2hBLrvYeERVpba2tSr9JiUdGJVmt8uGZHKRvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8349i6HmmX0VRroRMERIUxynqaQ3oqLsgTF+EnIeqiB8wW7YYu
	DOHPuWY2+8NSi6vdQ5IphictvFTw55P9lHYnXCqqc0FFB54qeWabeLhe
X-Gm-Gg: AZFdTZfW0ztP35F8AAdCzmxnN/LqdYw8KDYL4oVS/J9A6cY+wtClZBeXlYXmz2ncJnV
	Y6FWyueybhpGxuPN57KSQhBilI/cjzfB7b1U9WN4aob05xywhgB15bStqBfvINONZiNApgHumLo
	giSvCpqDxGr50MEBnLjMg2o6yB+/SNo/1zAQ2TNTBjzxG/ieU3IFs6oF1NyY4kzEAJsrM1wGZH8
	q0PE8I1UY4BBylSHmiUYP/6/IoyFXEQY1fbTj+VD5u3L5rgO0AkYQ7yHypSbM+ON0N68W201UDd
	PcRFoYvmvRglR5snnoq6bF8KDbecI2gUV9bZrEQXoqR3v5PEoUclKNgvGNRLMYaVbh4iuP3VsnW
	IQciRSNxC4cwXewEqmGfVK+3YIO/LSLjb2mgAelqextRPT089zykB7EKU+su5ZqgxG6DvLTeY1g
	ga1JzyqeqCcDq/KQIJmMKQJxY0167g+psVVk3Bv0OVCa0S7cqkvRTyQilWtUohFa3rsQo1RrMsA
	oVfPcb0BRYCKuGvZjd/9s7vccAatvXVN/3Fb9ePW36yvPL8DKywlLC1raM3VfQnaIntK1vaXxwX
	6DxwvMfthdwjR8tYlxFJwpUMti3Mit1YBEwCjwiJ1I7DyCIBQO85dEk=
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b704:119c with SMTP id 98e67ed59e1d1-3b41c938935mr15697647a91.37.1795598732549;
        Wed, 25 Nov 2026 01:25:32 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm29160242a91.5.2026.11.25.01.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:32 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
Date: Wed, 25 Nov 2026 17:25:27 +0800
Message-Id: <20261125092527.1938256-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <875wxl1ea6.fsf@bootlin.com>
References: <875wxl1ea6.fsf@bootlin.com>
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

On 25/11/2026 at 09:55:13 +01, Miquel Raynal wrote:
> Why do we need a local bounce if the core can do it with
> NAND_USES_DMA?

You are right, declaring NAND_USES_DMA is the consistent approach
with the other controllers in this series, and I will rework this
patch that way.  One part of the local check needs to stay though:
the 512-byte alignment condition.  The hardware requires
R852_DMA_LEN alignment, which the core condition (chip->buf_align,
default 1) does not know about, so misaligned linear buffers still
need the pre-existing local bounce.  The virt_addr_valid() part of
the local condition becomes redundant once the core bounces the
non-linear-map buffers, and v3 reverts it to the original form.

> Also please add Cc: stable to these three patches.

Done in v3, thanks.

Ping
