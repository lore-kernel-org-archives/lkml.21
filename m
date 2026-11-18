Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007188;
	b=SHi9RBkGWQVjItXg1D6FxW1yikFzWKuijnjMDQdzX7rNYuaTSwgeXvp7a6Gh7/i8JtIy
	 5gzcVnP6h8OgoQ1arjpXMEDNBt1t9NGSyeL6zm9BCZnHaOfcYga1pbeP/3ZfkyMMvmsF0
	 ujrebTg/i90RyyPMMbTdVQSmLiZi3bZlMDBnNVKaNNDoca0iQ6ll3nSeUeg1LQAjjKYGc
	 eObPeUZ8+3PlojIqGyExQ5/3eYztCRGadEeXwCa3dQ9dSaa1gIEo/yGB1ccma+BqCvXKS
	 M66GBY7+4YUa/baGv8zBPo0iNFDX3bD9UUCSYzsRl4JlG6kx/Dr050BBy98kkWoTjag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
	b=jyv6rn5k7Xa/cwkd5OapRob6LOWUT/Rz87NsuTL4k7WtbvpcedbQr0a3ZeK58OsQp17z
	 kkXiJeXRrwPdX9aNLP/roKLQ/7EL5GhS4yrwK/7+/oifNb3usbQKWGndJYMmvVkZFnOTu
	 L5WgPWnuoUWm67x3IYyM/FkqkwVvJ7K3PTPq/HlQTwRZ3oTcTOP2oQ3FHdt/bVexrUzmw
	 N5w82swBaCP32AzR2Kc5awuj/CN3WKOBtEoisXFd/HiD/OHu3mJzZMRU19gBMOd3a1SdG
	 JCDe4zNqlxIovWDKxgnJQDwO+u6w1uxC6cjEEdKWrOW8OcQEQyB0PYynlQJGZvDgPnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F3ds/Y6i";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97CF606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97CF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3ds/Y6i
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3b75aae4cso741331a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795007187; x=1795611987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=F3ds/Y6iTAFk6c9okiHX4ugqJMur/U27X6JeeAJ+yzfGm0q4P2rBjaloJgMDKUr2/W
         34tCb0YlWvaAgF2fQL4f2Xcvuoro9nCd1LfXYXKmm4CyIqaxlMCF9o+vkiAjcyvDc/uI
         ysgwTZw0SGro996TrtCOaN9mXeVmFXu2WJe7KphPz9Zy0Z2kly+HcWaC1s/z5tH69wtZ
         v+yxhZv2dKyRATvbRm6FcqW4Fxtz+H33a+AyhlkW6K7JbUrOMO0oolMfhgmivnE3pQ69
         v0b6WJn9lqV6pFXwDSfEqAC5mLbH6CwDZ4dEpLHdp30XdPD9y1tDcR3kHyWnC+6/CF4Z
         zSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007187; x=1795611987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=ZsWs+ge0aC/ztAObGZO0zJDDYRzMYUB8zciLZa08cUiriBaG/f1J/zQGK18sKekATb
         E/CHNFjpxuZxboRQuTx+gWqWlyaISpVxqiQJi8gP09Kogg6r8Lsv0fM1po6ybBAsTWWY
         7NECA9fJWiA1Xz7CTwjWbvivMGKy07N+h2C83bhMrOjmcNMBMxII351KbrgMnIU101W7
         fmXKkCNrO/uXAJeE3IXhO6f76tJKc+8sGCoPqCAx2FDmcDF/OA9PpFFA5kdIMm6UgX9X
         IzD77L+aPmFyNSAXW7Ybm9NMmEi7petpvU+3zORZh0J16hOIHmUNFszf/YjB+K901uRZ
         Hhug==
X-Forwarded-Encrypted: i=1; AL+hErEiUy95BrTiCTPaq9qtSPUDPyd3rmGvIH0ERq6oR8iDPSXjbvONbZvutT78A0mEp5wst3D2WBO5So4RiyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uVbIbBxWosvEaOge17AwDhDnzFfXjNQuGCOtKl4Td/ws1aqlR
	JYyVfSMFlh3VYMKGIqRyNoZ68giWKKZ844B5S7cFbWHJJwxP4WF/YSML
X-Gm-Gg: AZFdTZc5UZ+tfKldKlf4GsN7zI93qwWgdH19+Y8IpGZSi2ZOiq9XK13vpXt6vAe0FMS
	R4edkpV33FtX+AuJ1lXpGSW/K4pXPsVdsUUJNRfsIH5NakGPUwO/8ihI7un6vQKNXuY9kTqJDRb
	i8nIsuRbzi/D+KhvGOXdSMuI7Zhv39+VUt2iCHa7Y7Nn4vS+id1BtLCzMNerx7ozevGMVojkyTN
	P0yF7ZkKhfXgX+dxxRSoiTdx6y5yWGyy8ss8/V8Hekr9DH/b74hj0FhX00LsWWrZ4aPPsrMNp6q
	ZkVVYu0nl/GFw7k79Lml27GTKcVHsHeypM9vCD4ijm2H7vp2OLY9jv6g+uCaRCj+fp9w5wIOdXB
	nu4iTugRhLLiGUBZuv+oApaxVgecyrlbG6oPUQCa0n9/YkyWU+ufqUGh5kyGobxwhLnJkxfHVRZ
	tWFmuTZyOeACSuu88fEjhSFHQbfJz1WOar5gviYTes4WM++18ltOVW02OrDLHZ/HyQYICSV/CfV
	2WthPbv1lOUAsVUw83wSqS3va9efelJoAgKzuzA0Eih/VK/8H55NoVdB37rd/+zkbuHpPDD1/U/
	DVZwv1qqbFumenrx3NBl99Iu8xuV7DgO
X-Received: by 2002:a17:90b:2243:b0:3b3:c44b:b774 with SMTP id 98e67ed59e1d1-3b3d07a7a7fmr2534441a91.45.1795007186887;
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Received: from macbookair ([187.40.224.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm4314633a91.15.2026.11.18.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Date: Thu, 19 Nov 2026 00:06:16 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	Yuvan Shen <yuvanshen09@gmail.com>
Subject: Re: [PATCH v2 02/15] drivers/perf: apple_m1: Remove unused variables
Message-ID: <av2iyF3Ssa5mwgTH@macbookair>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
 <20261107-m3-plus-pmu-events-v2-2-acf1e78da039@gmail.com>
 <865wxu1jfa.wl-maz@kernel.org>
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
In-Reply-To: <865wxu1jfa.wl-maz@kernel.org>

On Wed, Nov 18, 2026 at 11:13:45AM +0000, Marc Zyngier wrote:
> On Sat, 07 Nov 2026 10:48:49 +0000,
> Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org> wrote:
> > 
> > From: Myria Sarvay <myrialsarvay@gmail.com>
> > 
> > These variables are calculated elsewhere as well, remove the extra dead
> > code.
> > 
> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> > Fixes: a639027a1be1 ("drivers/perf: Add Apple icestorm/firestorm CPU PMU driver")
> 
> Not quite. In this patch, the variables were very much in use. They
> became useless with 75ecffc361bbc ("drivers/perf: apple_m1: Refactor
> event select/filter configuration").
> 
> Please adjust the tag accordingly, or just drop it because this really
> isn't a fix, only a minor cleanup.

Yeah, sashiko picked this up. I had fixed it locally for v3, but was
just waiting for other reviews before sending another series with just a
fixes tag. Thanks for picking it up!

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
