Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578206;
	b=AWRT46/jy2Azao9Op8wjch6JZTetn3bIKepQM9UTYGS38JyyTBf2FTxI1Ik/dLmddAWn
	 1n0ksYvk+C0kFas4Ga9auPrTRDCNyCzdjsJbEf4MXHcTiMfhn6p0nbdiMczoxVKkm87Uu
	 1tbHnybiKAW8QqfUxqc/Ti4KC5zPiUCMLtHEwxfhztPkeSrBv+E810iC5+OCXYF9KO0MP
	 jM8gZc/wFT0foFEE3jliaw/nydoUHC8YbwKIkPQNFRU6NkcDBiCLjkFyjwoDHPw6VC4Ww
	 G7kLnEVVkAbB7qQOkaG8+LJxyjXWLF5am2zFGX542UeoS0WcZywnAQjQke94CT1TJnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578206;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=t9W2Gk10DZjEPSXH6hcneTKP4KaRBynMS3mjwYq/Ysk=;
	b=c7sT3pITj229mnijrYb2Lc3uiMSTUzAkcyUS08tBv2ZU+l9qAcJXkQSePINevkNWPnL/
	 prpS2IwApFPU9zDaK9pJ+BQAywjGEj2rgSvfWtjeyv5Qd+odB7MwktI71GUgZfgBCwVrs
	 Is6sZNVioq88al/ts8ZKLEtwokoY/QnOcOkdqRM1L0fOMOA+o6eGFmqcGAbYL/lDEzDaX
	 7AjNrQbChoKyy9Ha955gkQMh26yWYJvfvhx0kpgeLdsgVmi4M4QmZXVn7hbkrRodLSXWm
	 zjXYuA/DTA9a+2xpSzacM+5KRnLm54m+uIHf1qayzEYRsRiZSEwLyEqXVzwD7IuASgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UoYi5Mv7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130C606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UoYi5Mv7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D5E1F000CF;
	Wed, 25 Nov 2026 03:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795578205;
	bh=t9W2Gk10DZjEPSXH6hcneTKP4KaRBynMS3mjwYq/Ysk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UoYi5Mv79jgFAkNJrDo303k06YX6w5EXqixUl5ya1oUFWdmbhdWfFjVB1ImbTQQvb
	 hBfHx0ZKyfmPfXIjD8QwNJ9GFDmRvRH+/yD6/LgPJjq8N7dZLR5VOkOFnIOhlCy4jW
	 3uIwMoLve9Qm8kIf65hhGjnzhH2CH8/H6dw02B2d4JGZwMqd1j/3M39zitM02y5Ilo
	 gv3As7JUg18/mS8/YB2OurUxvpJf3QW6Wxplk8Sg4a5Y8jwLHWikVNojB0SWX8VmsL
	 lHMP3P69EzvcFy7euUtSnbvnUNDroqHlbcs9fsc+BTa6ivffHE/+sGp7YjF/3ppaa0
	 FRCtNW1XBacyw==
Date: Tue, 24 Nov 2026 20:43:21 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: pi: validate early bootargs before string use
In-Reply-To: <20260403143003.3-riscv-pi-bootargs-pengpeng@iscas.ac.cn>
Message-ID: <bda6c38f-a3fe-5dd4-3fe3-29f3069a9b42@kernel.org>
References: <20260403143003.3-riscv-pi-bootargs-pengpeng@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Apr 2026, Pengpeng Hou wrote:

> get_early_cmdline() fetches bootargs directly from the FDT and
> immediately passes the raw property pointer to strlen() before copying
> it into the early command-line buffer. Flat DT properties are external
> boot input, and this path does not prove that bootargs is
> NUL-terminated within its declared bounds.
> 
> Use fdt_stringlist_get() so malformed unterminated bootargs are
> rejected before any C-string helpers walk them.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Sashiko points out that this could cause a regression in the 
CONFIG_CMDLINE_FALLBACK-related code, later in get_early_cmdline().  The 
CONFIG_CMDLINE_FALLBACK-related code only tests for fdt_cmdline_size == 0, 
but fdt_stringlist_get() could pass back a negative error code in 
fdt_cmdline_size under some error conditions.  

Care to fix that and resubmit?

thanks,


- Paul
