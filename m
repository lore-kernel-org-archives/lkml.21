Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650212;
	b=RE8aODRs4VWmhJnQViwDz2RNRpCSV6pKd6KsqCz3+SMSNXiXyTI+Ucafj2Pj6+Dre4XB
	 ghIZaVfiV7d309i5e0Zm+KK3n8H54/8D+yvMhGBRbrxmoc4XRTbu+o535uhQF+msWgwBK
	 PW6CLFXKQkb6KGQs0GgFQaZLkymC+aYad5NbYY3sXX2U4CFZtpdvvGImkdwLmN8MHHnjU
	 tWvO1kMJhBw950cSD1fRXtm8YbtnSeDkqAKj7VcPOvgJN52X5gTdLN3NmWyo4La9LgUpw
	 sONJhgKKHmGNaqXHTiermiEoct3hFfzcqEW0VOEScgwJtfssDoAMCbz9vo1h1nZgGkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650212;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=oKSnt8gA2Fy+R/UYvUgzl3Tn/GEe05bs1oSii6h9IUM=;
	b=al5HwZB9vvDoi62AhY9g+3ACvlLb0jwCiozIpHZLa6vP+wviapSvEx7spoTH0fr4IoZb
	 Twb81jwYHd9Vwb2bvEGceKMy9XiPb9HbLKRrO3FFL/eOu0CohtXjJxZye8DUmnO8ME+XD
	 nHoghaHijzlG9FvR+eFk/bgckXQ/kHD84NAWkxs3Chg0fZf8veINymOe+owptzCDO0SOU
	 K/e3MXGMJJgKsDsXJtOAQa/oNoV8Pa44MK+KtSxpua7S6/iTojanP3CUfbrIN7bPAOENB
	 Qp6kMnvh7en4gbNeAxxSG1TsGa02SVAV8AYrfoatsHB2wKb69FFDXA/UaMm6UmOKMuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=IvllxDAl;
	arc=none smtp.remote-ip=109.224.244.122
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9E9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=IvllxDAl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795650209; x=1795909409;
	bh=oKSnt8gA2Fy+R/UYvUgzl3Tn/GEe05bs1oSii6h9IUM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IvllxDAlLoCqOpxVVj2YInn/EAQH+B2+Ze1U4B8jpnrovnETxgFcKK7LQc+Juyl5e
	 18jT4kesNk76YyoznORIQM2iIBMfejlg5fmQTExSHQa9Kx+YIxgiPUjNED9WHLSaqn
	 hsnE28mmCpnyTjrK86mZmRmI7Ut1DOMInYW9rBecfXQj0cuI5t/VpxPqHbqZ0oDeF9
	 lsqb5wEJkcVl8BNQTEo05SKSfXVdk42BmJ18tOGTDOqzd7+l5T9UQHR4K0RoGqQ13C
	 TJPvATvmPo57EKdzVzBqmSeRWxZTmUddcU4Is1IAZozPRs/5EZyLjdBOb5p+rueYi6
	 IYvziNGbS+eIQ==
Date: Wed, 25 Nov 2026 23:43:23 +0000
To: Zhiqi Song <songzhiqi1@huawei.com>, Longfang Liu <liulongfang@huawei.com>
From: Ryan Prinz <rc4d5a@protonmail.com>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] crypto: hisilicon/hpre - fix missing DH/ECDH public key validation
Message-ID: <20261125234311.1860032-1-rc4d5a@protonmail.com>
In-Reply-To: <20261125231929.1857637-1-rc4d5a@protonmail.com>
References: <20261125231929.1857637-1-rc4d5a@protonmail.com>
Feedback-ID: 190731814:user:proton
X-Pm-Message-ID: a7b2ec0eb878d7b75eb8e3b555084c0faea4f59e
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Confirmed -- this is expected, and the fix isn't a code change.

This patch depends on a separately-sent patch, "crypto: dh - add
shared DH public key range check" (Message-ID
<20261125231825.1857253-1-rc4d5a@protonmail.com>), which adds
crypto_dh_pubkey_in_range() to crypto/dh_helper.c and declares it in
dh.h. That patch needs to be applied first; this one was never meant
to build on its own without it, which is exactly the build failure
reported above.

Apologies for not making that dependency something the build tooling
could see -- the commit message notes it in prose, but that doesn't
help an automated check applying this patch in isolation. I'll send
any future multi-patch dependency as a linked series instead.

