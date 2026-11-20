Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177645;
	b=1VLg7tDhUyzkYCFhAnAoHava5OuDmE8v2F3m12L38HUUDVSRyBgUmMK/2bt0VE8TUTpC
	 tgswgb075xey+utokq9EQoqy9TsGNW9P7eCULMMbpT5fK5B8QJl6Cv3aolcf//h+XkN12
	 2TYjKi1JFneywvHCHl3wMIY0ROyqdDzj0IcYoXs2LKyNCvL7qQJp3dVIn12Zhe84RY9eE
	 EjBuupoBhaP0/4dT/xi+8iY7ZSip7PJktMDZqGSN+hEJmcxslxy+WWd6N7hyChIXSdWKC
	 A66lKGYvXFDYiKqcNuxGh1nlx/U4P9sTSwitAfRSutcMUZwXYWzwRDplFV2nG2kqQzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177645;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=TU45TieMHnoNsAzLGBQ9WAzCc/Ph1uI6h74S+nvnSBU=;
	b=SjaHBbd72hfr7JR5Ipdij4jkDDEaS+IODw9x7fBmh8DF/gHFQH57P5iHEAsk0Ed2eNBP
	 jz8OHeHMqbk2kbld9J+hfQqCin+0e2abwPJJSg43zsMCLfW7W7qKv1PAcltJRr+fD/jm4
	 jdeiedhM71bGQPtBTL8UPdoreMK8cbhvxXVX1lS+aXkI1kjGf3JWpe72llroPW2A7y9SV
	 TCXdvTpV1VOq/EnxIsG1iAhMGGwzZ8GrxWiaoq7JKw66H7mumCYMtgAw76DzfTEx24HHX
	 p2v0t/W0KqApgoAWy2qbluuMF6onPblKw3MJ13kmY9ot6e9wS6YWNToxKFJ8BkRLBug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/hWv9yE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB35D606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/hWv9yE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B401F000D2;
	Fri, 20 Nov 2026 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177645;
	bh=TU45TieMHnoNsAzLGBQ9WAzCc/Ph1uI6h74S+nvnSBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D/hWv9yERp0ILvAGLn7xFqt1CMmapEK+cXBt0JXJfbu9LUdRm3dIVNXf4kaTvr5ju
	 gvkzOrboyyesa5j1+QYu9T/hKd2rdLBFH9ioClASRw411PZhh16SawaEkHgTPNpn2F
	 onfDPncQW4SGssT6lb4xEps7tBQlUQTtDQ5TBloSjXLpiCfJrx/+gJVp6c5PY4pB19
	 UyvVrDqsVQyVg+aAK2L2xGMj5Pury0gO4jQuEvovpJhtis5iDwNUO/dnTll31Z+U74
	 v23/RW/cy/7NR92JcQ1Tk09cEjRjcXSXfCzmKL6okU/68K3r0FqV5ySHCEUGZkdWYX
	 l1WIuW4U3gs1g==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 0/3] Add 1S-xD-xD DTR support for SPI NOR
Message-Id: <179517764333.1011003.5755754465844686253.b4-ty@b4>
Date: Fri, 20 Nov 2026 13:27:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 11 Nov 2026 02:12:37 -0800, Changhuang Liang wrote:
> SPI NOR already defines the 1S-xD-xD DTR protocols (1S-1D-1D, 1S-2D-2D,
> 1S-4D-4D, 1S-8D-8D), but spi_nor_spimem_setup_op() treats every DTR
> protocol like 8D-8D-8D: it marks the command phase as DTR and turns
> the opcode into a 2-byte opcode + extension. No flash declares these
> protocols today, so the path has never been used.
> 
> This series makes the 1S-xD-xD protocols usable and enables the first
> user(MX66L1G45G).
> 
> [...]

Applied, thanks!

[1/3] mtd: spi-nor: Support mixed 1S-xD-xD DTR protocols in spi_nor_spimem_setup_op()
      commit: 20b85b6067e976c4a820eb0b099edc4735feed6c
[2/3] mtd: spi-nor: debugfs: Correct DTR protocol names for 1S-xD-xD modes
      commit: ed4a5fefe5134816d3827b3a44572b95af042863
[3/3] mtd: spi-nor: macronix: Add 1-4-4 DTR read support for MX66L1G45G
      commit: 7a7f426ca93dbbcb0a2b4f52fe48226fc2be71ca

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

