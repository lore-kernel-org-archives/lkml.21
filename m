Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177643;
	b=AfWGPqU9xP5yAoRJYxmJ0f+4RR0pg5wCNBSqL+qkR7Ykr8sCemAo6bzG0SHsAm7EhMpc
	 9qKdG5n/Gu6PLyr2W2234S9om2NIp73phmr4qxIpQS/Hiz+o/uhAKhAdpKJbvEmNndPpV
	 +p21GKRGAnDFBi9Smq3XeUhhUyoTQ269mSqKYtFx2PH0WO+MJ9DjAFO7pPgqXBVTsmoae
	 FLlDxtBOUBRQ5SHrq4H+oLisSN7254BFHX1ane0mSw9Rg4/j9sddURPoXRuGLQKEhPBE1
	 Y2T9QrhMnuSaGKBWJuacdBAR8gTqYh+LgbZRu79NB1nyfeNwQF0/5SDiOJElabTZqJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177643;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=WeFdTE4PR68OQCnZa7+zxRrhnvY3a7YtcGXshXCKTgo=;
	b=f7Viy+3PxOzolWEaz8+j0ghLnIhQRdFOpsStgTGjsIuStlwFujA2Lyx6piBduHVkGazO
	 aDSOpK94LM6UsFP/REVmAg9nUYwD6jkGXmCpUC18/NFEJk605xXTSn9FqiCK8noIgi3/8
	 qNhNd00iUDZzM7QPKAYm0R3PHdTcbAEUs+x3ahHi+UHuKU4TvdUaNu1Ji69+yTTCfsr55
	 /KEnGcljN5YdnsrE4t0aKfYNLvGBofJsUBf7Q+0r1o7m9ypEJAJRR0AfpgWOnLLoFaUwa
	 /pDs2fxCVIpvYM5accfiUXtM8PGXBZcvielGMyDXufba9S+pph5WmniSrXg8Zr9IOrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLbMn2xB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35F606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLbMn2xB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1F01F000E1;
	Fri, 20 Nov 2026 12:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177642;
	bh=WeFdTE4PR68OQCnZa7+zxRrhnvY3a7YtcGXshXCKTgo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kLbMn2xBkz95rHft/v4+ZMDSvSxBYWNlZDLIhB6PVLI4VtASoCQJ/dnAvVS6PZvDc
	 0N0sOxY/8fWX0z8fi3SbwvjHIkiLqX3Qt9SesXVtORAXSWYh1sIuSeuFRhPlCLnZNb
	 KsxYvYWlYBpoiINnrEjEb71oEw0J4Sz53YiHJOqdtNyrIO0pND3R/ozy2j845BY2oP
	 h467FfPfq5TpapIMMiK9OZEJOjsz9nqXKxcKVFUkmgANhwvUM+ETv5H1BMx6QYLAjQ
	 5x/MIwyDIReeF94wsHu5b/Qm2U1xy/RbjMbL4vEZnEaCODy51ay+wEVgEGsY/KbCUK
	 4a3/gcNZZ/G6Q==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Bart Van Assche <bvanassche@acm.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
References: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
Subject: Re: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
Message-Id: <179517764105.1011003.7250063376346500539.b4-ty@b4>
Date: Fri, 20 Nov 2026 13:27:21 +0100
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


On Fri, 06 Nov 2026 13:04:53 -0800, Bart Van Assche wrote:
> In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
> called after spi_nor_ready() returns 0. If the flash is already ready on
> the first status check, the function returns before reaching
> cond_resched(). This happens e.g. under QEMU, where SPI NOR page
> programs and sector erases complete synchronously during the MMIO write,
> combined with a controller driver that polls without sleeping.
> Consequently, multi-sector erases in spi_nor_erase() and multi-page
> writes in spi_nor_write() may iterate over thousands of sectors or pages
> without ever yielding the CPU on kernels built without
> CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=y.
> This triggers soft lockup and RCU stall reports.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
      commit: bcfbc784fce431f0f2b0a25c238b61feda2b710a

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

