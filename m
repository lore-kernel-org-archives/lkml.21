Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670749;
	b=G9rhVAqQCEFAAE3NK3eH5qAAbDY+nnCTZ/qN9LQR6Dx6nR99laJ/gCW26ruhTIntKle6
	 TbEGVcO/KZwAx36JDrlmGN7RmaR5V9gaRgWM4IXrSlwUkTXk+m7a5B4Sg6N3L2I2sdpaD
	 YEYdWbTcEr7X//0lV8l9pHZ6smpiYPlH/NAV3/oxA4z/8AvLuu7d1AsjtJVjioQUokqjn
	 cF6oDLzd7+tEpiCKCITyVWbWR7C9OJZCkzwlOdVTdAoV4HownPD0h2btXKsn34R47qQOd
	 Jss9Ixqyjk8VhqPdgwe3tkg7QXsWCzqvVTO6X8TXLseNoSFm3nmbzRaOpL0T0gJITag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Received:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Kj9OnfHKDgvvaSCC/2rH11WH3QsDA+JckreBPEmumlM=;
	b=WW6iNxzLd38g4yUQeIGC+eLd0sl3628XzqLJyouLz3JT20vr/M4HUV9+LfINJU4BcNzW
	 T0Og+cq6pcBUdAk6ciABBGHq2MZHeVwvhvHuU+olni/PmphHhyzassjbX38vVg7keSchw
	 tVbScHaxqi35v80bdl0HPdfQdqaxmqezjhSrQT6gcXu7wgk5bQO5n9P1x0sDtkZBW/iGV
	 RIqD/t8cOfRyaQPY/f1+OOyc7cPSdUPfmfvO1dSpIVMn8R55Q6gFk1I2fF3qgvFGOJCe4
	 TNVIrR2wmMwSWGa0Uy2UvbEiiMOvEx9Rl+s0aq+Gj42qV8baErNBmEHfPYtPyVRevwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KKjfxZ0;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C368F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C368F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0KKjfxZ0
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2efe591a1f6so22614795ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670748; x=1796275548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kj9OnfHKDgvvaSCC/2rH11WH3QsDA+JckreBPEmumlM=;
        b=0KKjfxZ0KuDQQ8eYDYKhTI2JKNURp3b9lbTOhPnP47AVm525JKNGqjp4PHoaeLFxXH
         FQSH/D9DCec+F1O+J/5B71l0azM2e6jLMy/6zo8dlpB+eU64uX9Lg/AlJWCn9aeU8fZk
         LLwjnA6lvXun9YyBrpfcsBLYIpLe6wB/7aQy5FhZe7rSxMlMFkmpoIkWLHOL3UoT7Zgp
         PkuSlQlXwzM1ymw/59+D+toFcRy/On90yu7rNZAcd0AixWa9ApavQ6SKr5XZNIX06ISD
         we1U59m4K86MahXVmMLXkY/aEBbp1mJrH3J1XlpRyJNyzx4tIy3xJBkRfITgFJJ7A/1j
         wmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670748; x=1796275548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kj9OnfHKDgvvaSCC/2rH11WH3QsDA+JckreBPEmumlM=;
        b=T4GOeH+mgG40ilqtE220vGGlzWLCwl/ZREMMDsh0Cfh/Jb9pMbKOVJy7jVBUZHv9hn
         MsK+H+NNhwJ/1m/eCSiZd9OPG/5hSduCOt2CqZLo6eUXjrjEdhp4VzJn/eyOP0SAEo4j
         HwWg6cUnzqZjOMzMojakP1KibssvyTtmFjaKmoMM2hxPN1JUXITYP1MBUn4m4y16GiL3
         tefo+jpp5m7qjVAmofmmt1AM+0TC3UNYbmziDSOChXdMNQGmH9blVWzd+2sTDIfnGpzJ
         n0As4vsd44JiNO8rSBDC542tmHobVN4WfsBVIf019lKiyJLb4X37rtheeVibInxnZJJS
         62hg==
X-Forwarded-Encrypted: i=1; AL+hErHOrJWVwpPhu7ArKUqXEgiPKVedTEBAaQD1iUq+ZMRYrfmmXHQwSbyQ+WYVgtNa3VKvbNovi+wmoVYZ9rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JOdMQ9Gw7VdCM6AITfNiJ2BtOEcX1uu+s8NTi23afR6ysvMI5
	T2fHLrnUFvVgqo2AP9yitOwBXLtaIhfwrS2t3KO23CTdO98oM2avwkLQxu08Jw==
X-Gm-Gg: AZFdTZf+BQVN2wGaVUT18tfwINaFkjSWGdO4jIsuuHHKWOKGkBAMgzdcYLAn7k4gxrh
	m2JbhsTBsOMhWEto3bnV1PMVDBdoyZb+RX5JwLF5muiRIrwQx4ROjTD5x2rj0mbbOPHiwdCM7vY
	lHZ+UcbXN514joL0bc+vaWGublWQa47hHO4vlWs/1Iat4YHltICVG4G0Dpw6qprnpT5vOWh5TWN
	6Ew1sxpRyiQjB1Q4904Ld89aaRuz5vxQWpG8PxzCQmk4/vZoEd1y+nNDrUfZmJemaPK3UPaHpFg
	rH0ONo5FP5MjXtuYvfipSAaYzbVhC3iRxr8RHyHQ7zBTd+DFjbo8Q4bMWWOrUW2eRmMfrqs6eiQ
	9iKh5OQU94yTuq3Qjx6gjdPxFJr/vW5NplXB/2kNcwY5UdqUeAUiqZdX8ie+9mCMKJ/xHM+adMB
	KcLuL5iAANlAfTkgos7eEYqKVPryNngMiFbV/83aGe/RqClpq8C/ihHz6/11KuOZpCGyPWVZBnI
	lMTJGU0vTQuvGW8oOSM/Uq562Q8RgSoXKdlVErOcbR1njCT0zQHTeG6ivftzEb5tNygtoNUP8mo
	heWDgYMjQG0OD0nCDg9+ELYPZC0UYhrttgn3CAPLUFOCsDBF5w==
X-Received: by 2002:a17:903:b0e:b0:2e8:e17d:c8c3 with SMTP id d9443c01a7336-2f03f1da4e5mr192444935ad.62.1795670748092;
        Wed, 25 Nov 2026 21:25:48 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm99968545ad.1.2026.11.25.21.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:25:47 -0800 (PST)
From: Cheng Ming Lin <linchengming884@gmail.com>
X-Google-Original-From: Cheng Ming Lin <chengminglin@mxic.com.tw>
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 740CE4163B63;
	Thu, 26 Nov 2026 13:25:45 +0800 (CST)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nor: macronix: Clear the RDCR opcode on MX25L3255E
Date: Thu, 26 Nov 2026 13:25:24 +0800
Message-Id: <20261126052524.1816136-1-chengminglin@mxic.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com> <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
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

Hi Miquel,

On Wed, Nov 25, 2026 at 07:01:35PM +0100, Miquel Raynal wrote:
> The MX25L3255E BFPT table is incorrect which leads to the RDCR opcode to
> be reset. Make sure the configuration for this chip remains correct.

I think this patch is not needed.

The MX25L3255E BFPT is JESD216 rev 0, its parameter table length is
0x09 DWORDs (see Table 9, offset 0Bh, on page 64 of the datasheet [1]).
spi_nor_parse_bfpt() returns before touching the SR opcodes and the
QE mask in this case:

	/* Stop here if not JESD216 rev A or later. */
	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);

Since macronix_nor_default_init() now always runs before
spi_nor_parse_sfdp(), the read_sr2 = 0 set in patch 1 is kept for
this part. So the BFPT is not incorrect, it just predates the QER
field.

>  	params->qe_mask[0] = BIT(6);
>  	params->qe_mask[1] = 0;
> +	params->opcodes.read_sr2 = 0;

The same is true for the qe_mask lines above. They were only needed
because the old spi_nor_init_params() did not call the manufacturer
default_init() when SFDP was required. With the reworked init flow
they can be dropped too, and only the 1-4-4 PP part needs to stay.

[1] https://media.digikey.com/pdf/data%20sheets/macronix/mx25l3255e.pdf

Thanks,
Cheng Ming Lin
