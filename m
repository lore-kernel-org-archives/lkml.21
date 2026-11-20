Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181157;
	b=sXg09d/THnKFrzDidduMZDaXKLJ9hO/vbVy6u+vJgKdXmuy+cKGbvdbf+4DwU9Rn+mqY
	 juY74uLOUiEO8xm0a+cQgCY70v2DF1i5I8+/qVcqs/AUsuK0jczipsMGnl6N6noadybin
	 aUInQwc9hsoOpCzS++GrD7FdNkcBPE+593Combe/f5j8frH4RVJMxqgtpQdMnABn6x8B/
	 kmo+C/YhevIg1ft9QkNKY/ewcn8fz3nIWVnAEO6UzvRNVV//7efWGq+4U8KfbzOYjABCO
	 oH3FV6JQz+TmsT3sYSvwzOotZNCnu5vUj6do7wMe9UGUUTlDZWBARgYML3/j77qReaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181157;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MdHBYFqedFG/M4xDoPl+RbOCyvzyHqcHdVkH59zOCr8=;
	b=apH1ynkVDLvw43kfEMPyj2Wo7jhz5bf7ZTMnA2kJhFw7TJ5cdI9S+2WCTMU3Ei5Ya8YZ
	 nWDSCvHT4LprbTdJe07QC40QNSAQbKIksyLZ+pi85nD3Q5jld3Zc91MAuawezmkRJ4SWF
	 6KrtpjSE2zLJyNUa4lDW3X5Mpag67HYWTBHhGoJgYDK0wMnb4Jp6AqqkqFrKxLuZFvB+T
	 Kq7suGQhKvHCxQQ0fGdYKNMTxibwl+wjS5QK4ldUX7aiPPHHpy11wc/guIKLvvzJaYtkO
	 slQrOvcYCmAPyld4SLSBunVVVz90a9Yi5rMeZxFEiRXbg/CUazjEzYsxmXH/hXj+7cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fyrA+0QI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fyrA+0QI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB861F000CF;
	Fri, 20 Nov 2026 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795181156;
	bh=MdHBYFqedFG/M4xDoPl+RbOCyvzyHqcHdVkH59zOCr8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fyrA+0QIjARgh+hIWU8HB5hDVsw+6vU8pYC2gGsr1WKwJeDyiiBxgQ/dEuVlBu8mv
	 BydNnsidOsA1LxjGl4mpkBsOz0xo2e+SFGAxdcFuQVns5sopbe3zrVHAQy86xJw5bt
	 VjMQso1THJcB+VCwfQ8VvRkHIcx9uL1kOvscUtLavKBNpAnqzB2gi73nd5vBZ0X4cg
	 2tgmfdZBF2Ri2zQvARQTPtZdWwq/GCbjNalxETxzmYLTfoGo3l9EMjeoRpIhzq0R3p
	 aq/rUOL5ccA/jALEjj4Lb/Z2A0tNEtd6MJAlqEIhTERcnLjvawJJruSVRk8ejf/SzC
	 faMdVSEFnjRBg==
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
Subject: Re: [RFC PATCH v2 1/2] regmap: add regmap_reg_field_* APIs
From: Mark Brown <broonie@kernel.org>
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andy@kernel.org>
In-Reply-To: <SN1PR12MB2528007B30A64BD79BB576FDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
 <SN1PR12MB2528007B30A64BD79BB576FDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
Date: Fri, 20 Nov 2026 13:25:49 +0000
Message-Id: <179518114964.6016.13001381210648647656.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qRuv0OEbyBh99l0NpAwxk8n+59eAUQtZL/eSp4Abmw4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZvBK53rYruDj4FM39+kZuQb3pnMcvGc/lWftVZ3w9e
 v35sr3uHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZiIzzuG/9kWSRqPnhpOnSd8
 qOL6fNfi+H0Cgr0+5xJWxrBud/nFMY+RYVHBaq1nzyfVBnVp+gfsnWZ4Rjrmy6VNZw/cZi+Jkbi
 +jA8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> These functions are equivalent to their regmap_field_* counterparts,
> but allow working with reg_field directly, without having to
> allocate and manage regmap_fields.

> +static inline int
> +regmap_reg_field_read(struct regmap *regmap, struct reg_field field,
> +		      unsigned int *val)
> +{
> +	WARN_ONCE(1, "regmap API is disabled");
> +	return -EINVAL;
> +}
> +
> +static inline int
> +regmap_reg_field_write(struct regmap *regmap, struct reg_field field,
> +		       unsigned int val)
> +{
> +	WARN_ONCE(1, "regmap API is disabled");
> +	return -EINVAL;
> +}

These stubs need to have struct reg_field defined in order to build.

-- 
Mark Brown <broonie@kernel.org>
