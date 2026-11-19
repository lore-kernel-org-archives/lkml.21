Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096909;
	b=0CxH/R+3tumjmF0vmFAcy0uGNOk6WzgpnTd8EYqqqqIs5XA8RvFUYfvMBpR2vcqTFJQb
	 Av3SlFkMC6pmcEWYISFkfs8kV2MICtxJab7A5JePqOE+QC2AzceOyGzQk7QEoOr7hnjIb
	 qHIMBTe+UVdTuNjYlbZ5kOnvsc80iX6aND2vLexBRnRq8ebiNEzqhAmY8GFwkrvlAVQSC
	 Zt2IkoohdQiXOAZQwsVW13ief937kTaUAUiNHXFJZ74dVNIwac1hgWRTYRiA2c0VqFAmR
	 Ufjfkb6gaPqN/Ze8gj3GgKCOO5ta0fDRmsqNpT8dG1u2mKNBCY9PQFJfthSSHpjkvLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096909;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z5EL3q762qp7TZYQCjRPoRbL9JdY+YgOu7t6i3GkEj4=;
	b=VoU5jLkRHpGLmwy6942d3oqnkzmVQ2jGmrgriBfbTEZTRq1WC5e9ZBSmnMvOa8yeatux
	 y0QIW9/JhRaVBja8nD9vZkR/Sqs3SgKRqiO/GYW7aD17NvVbRV3tofnFRMFaAphaTINft
	 SUTM0xZOXcBLF0my++mFoFlkjoWfIIduItigWAz1OO9UPvj7mHXBTgYpmcpJ4h0XO4km/
	 w9A10n3XEWADs5i3PRhz5VVQv4mIWKN3YrEgPQC8CLCiSXJqnRwMXvA7ebo00g6b4b4EL
	 JyKfnoi3vHrWYyE0bmo4FfH3Jk0eaNdtxGpIdM1xRokiuTlq35YVvoQV5Xwf+mxsmVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDoUCEDi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 793BE606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VDoUCEDi
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 766C61F000C4;
	Thu, 19 Nov 2026 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096909;
	bh=Z5EL3q762qp7TZYQCjRPoRbL9JdY+YgOu7t6i3GkEj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VDoUCEDi8AwWGlLBNEhn2eHAlK4rhVAnqwFrUj1/tGdVv3T6fB7PaWjFEw+3YapWA
	 KD+SvN5u0P/Zs0IfsE93cjktRvunyzvzr1h28z9eDiVILFo3Ml0tqlCZpi5j3FLTDR
	 cxKG+SK38nuCg1NN0w6FfDgRGFM2GL1m7csPuPvytMFDvoV/G/ThiXjv0bnSg1N8/t
	 MYm8gQWkenEyE3tQc1tyfAPZiZsRC5LQCQY1w+xbsVGPUtzzrMDmnI78/HJXV7nAt4
	 JAjkr6rfFZZKmPSsQ4iUTpf4M9cas6KDXlluScLuyUHKHhizmA1DUi9p2/sUsrI8UV
	 av37EJEQEc0FQ==
Date: Thu, 19 Nov 2026 15:01:46 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 10/11] nvmem: u-boot-env: propagate cell registration
 errors
Message-ID: <z5laz72u42uayn6dxbn2x3t3bxtlx3okyrq2dwkua4la5gnjda@cmyyl5iw6wxc>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-10-3cfbd48812b5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-10-3cfbd48812b5@gmail.com>

On Tue, Nov 17, 2026 at 12:38:17PM -0700, James Hilliard wrote:
> The environment parser ignores cell registration failures, so allocation
> failures can leave a partially populated layout reported as successfully
> registered. The OF node reference obtained for a rejected cell is also
> leaked.
> 
> Return the registration error and release the node reference that was
> not transferred to a cell.
> 
> Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
