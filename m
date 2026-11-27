Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778982;
	b=VzZlF7wwvJUp73PzyLdtT8lX+D7W0CT1YbcLGgFtkvP5RTtxm5vHZvvVYXLuWjd/RMm3
	 ZWCv9P1XzI/aa8LsW8XgUSQV8MgV4uHg8vmwr9A8sVUcNh62sdiz++U60iASxxIdoaH6B
	 nbGy8s97hcBvFVW61QN7Rdgn8bz08+vJSaI985wWotjq9/bkz0gd2UYLkmxg+ZCePfRny
	 wwjXpELbsRzf0aBeRAXAwWivt3dFjShu/AnmKR9M1iX13w2lt/+RV24hI6HELLh9aTtV1
	 cxCrEYwR2HZlDzCvV8/PquphJ9GpIZ771111DjpbFZwF5/gsu3K1yRnxlHN5NXieOmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778982;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=r3cKN/GPYtn0ND7gaO21Js49B8day/G629pPGdYyEqg=;
	b=i4YbD784uKndjPDFkFV3/znYacN25V1txnA2CFxNP0JT2CtsbziXJ6ZFpBphTAvkYXmF
	 ugvBgn0GZ5+UNR6ptqtM1wzGqEgD/4X/Je9ECFmvAXfF5mjo/77EN+8kIZO3l0286UwXD
	 /KHX7Vg81u5+1mlO7JrTMehdrI9aBXh9nr2Cnw9GOOOOKlCyQZjX6L+d7QTBdGwKd7BG9
	 qCTkBiGwR4jmKITQ2yexEcXOosSggL9iNFuXNfTu102z2uUzxE10iyc4IjRAX/qljG8U+
	 /rgsb2Ulz294hT3Fmv7loo6fb1qSNn8Hn3ITIvcg1JoHyTFsztkrt5VR/O+VF44x1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFB10kfz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510FF606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFB10kfz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7651F0092C;
	Fri, 27 Nov 2026 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778981;
	bh=r3cKN/GPYtn0ND7gaO21Js49B8day/G629pPGdYyEqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UFB10kfzglzZ42h4azX2J6mqD++o9gWDkLLlK8d3kPvl+kP0+FcWeVpvSH4vWL/rA
	 DqsRgXklIZMkt0ozXR7ComCHkVBOmcHj2R3wuDKbyxMgXfwaAEHuhgExR4SDK1jnEs
	 3uialK5buWlQTPr4QVkih6RRNl1ohQLO4YgIqaTj5QtY5HxYVbe4bPH1sYG8SNzkzc
	 A/nHtl5tzuaeIz6N1xZdiTr0pCdUK02EvBl/SLRK29DeWThYraxjykF2KDSYaUBydu
	 ssz8auUo0MoxYZHMego08g9OeUGynGvWH1h1jnsJoR9b2MEkWQxOCHSEKGwzqtugUK
	 Qeb0bCM8XlUyQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Zhengping Zhang <zhengping.zhang@airoha.com>
Cc: gregkh@linuxfoundation.org, ansuelsmth@gmail.com, 
 linux-kernel@vger.kernel.org, lei.dong@airoha.com
In-Reply-To: <20261030024601.678699-1-zhengping.zhang@airoha.com>
References: <20261030024601.678699-1-zhengping.zhang@airoha.com>
Subject: Re: [PATCH] nvmem: airoha-smc-efuses: Fix the SMC function ID for
 eFuse read
Message-Id: <179577898074.24106.16086545483176384260.b4-ty@kernel.org>
Date: Fri, 27 Nov 2026 11:29:40 +0000
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
X-Mailer: b4 0.14.3


On Fri, 30 Oct 2026 10:46:00 +0800, Zhengping Zhang wrote:
> The Airoha firmware uses SMC function ID 0x82000005 for the eFuse
> word-read service. The driver currently uses 0x82000001, which does
> not select this service and prevents eFuse read from working
> correctly.
> 
> Use the correct function ID and rename the constant to
> AIROHA_SMC_EFUSE_READ_WORD_FID to make the selected operation explicit.
> 
> [...]

Applied, thanks!

[1/1] nvmem: airoha-smc-efuses: Fix the SMC function ID for eFuse read
      commit: 45205a6e10dcb95ac7eac668762d932320e07d59

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

