Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111720;
	b=Rs5wTr8vtG1jTj2tfRF+H6QY6fR8XGBd6Ewi6K8Q6C4TRneSTcriCO7DZGVvNiTIdROU
	 LEwMJXBzGoMkWHmLfWEJAOg+pIusFULYB6kzAyUlHHLotesTKnCVX7MZLNwC4ic5yJNLn
	 JR8ExX3qHc03MuiwjxNm1pIHWBLwIqaFYfGcnT2V6/Fx3clYimcpduuBFzSSPStDaOQy0
	 r4Eqw5YCDSRKJsuKBduq15K/f/P6KVl70twJnQWvILbCv4XqE0L2Bqw6tVC9RnCXEMgwS
	 18WFAjVyodBbiCdCo87l2t6XxyuSgOEvF9szV9nzdVbZN2nbC68Q5iQyz62W+4IS4aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
	b=Wh0G8VZfrKxbR2LqfvpjRX3GssZnzu2bjeK5ZwUmRpUE2ZSj40UxFZThGfjTO5RvbohA
	 rHqlR7pZCh6dRSk2ySiwzmeIcYTHIw6fUTqy4hazt9bmv8iQq4yPstwEoeLYsLaZVtP4a
	 /mfabbIvcNmXQVq9JcWwzKajLTdIkIz2j+4NH+qzb57W5Itm+VEpenoOMb5v+iLAQjpHZ
	 Pd0fhsxat1+f0QbduJURNUq2aGW7+zyu6pJhvKD2whB2Rt90so4hSJmBS85QEX2MR8Uwm
	 IC1tVhyagyvtmTWBjoEf8bHvhxEinEYBVSI0h1KkbhpBKjaoVQDonYWGbZpTXX2yEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZubt7C5;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94623606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94623606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BZubt7C5
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-490d838b425so48672fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111719; x=1795716519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=BZubt7C5T0vLUI4jNv6Y96iGWqpXvtaMAJMM/Z1yLj0tsZ5RroRzO8SP8LWAxuXwhZ
         6ti3I+XbC0jpsIwqxtU2oq5MXRQ+too1m/wf/MaaHx734SUHnc7u1Lct+n7A1Hloundi
         ONfCLd2LraQ/Efy2n5nX7ADWnrl8QxG0fz7LDAXG8sLTLfKIxH/0XRyyH4Gvq6/8Xx8w
         4XcJIz/A0laK0cTWGC0f2ZUBDRJJ5ALKzgKx7v1FIfuTd9uN+FD11l5fZBq++N99Gyh1
         B+0gjxpjg70iLDqE/a3Z2KJ94zkRk2s2FuTUXehItao43kuQiBUYw3+XhZy6EjuWt+U2
         4dvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111719; x=1795716519;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=0qAk7C37QS1QhywiC6iruiaVNV1oOy7oM5ZDPhBKovp8oINiNDIrO4XVUTIkHTYR1N
         JraAmtMwuMGDkoVIwQJrdM7oElA4itmiT+LL81GnC9xjEGwwbQ+n4MsUuq/iDr8YI0YS
         Fto3XW6QwdusyEngiu4IQv3OzK4z5gGeDCCyqnNFk1+bAMcLpSvWHRuJmUtMfEPOazWe
         RATuI2ILqf5HkEl7x+YHubPgA9cCcjCMJ9oU7lu4l4UIkRsgRSK6p7wm4g+Un5j9duOD
         qJNdpehIu4KBpL8BGkXINXiSZxGYC4Bs20TRaJWrvab2nwbSspmtSHLGhfE7Yba5om00
         53CQ==
X-Forwarded-Encrypted: i=1; AL+hErEpThRz1rJ9HNIdiE0Aq5SCueGdoQIuWlLNnsOo8sTtuRxSvPNFTOrhQUe5deSxFh4yEmy2Su2bnkrw6n4=@vger.kernel.org
X-Gm-Message-State: APuU4Z99fvPNmm4aE4uiSIgqHge46jLACDsCZ411xV0hsVf1q+g/671z
	OEHTwV4WQcg/VeStODM/hnNdys5J1DkWqgDRBJs84oP9BN9LVRGhHKup
X-Gm-Gg: AYBFou3EqF5w2Of81aGHqz21mrNldpf4RHxTBb0lrHMRhugsUVOZBh1kLozrUjGKPcE
	AAaqPHe1F6OEOZBbL4fzoVtGrr4O8nTe53O1+K77ujJNToq11dThhdGknvLOQzGBFuj/uSlbb2y
	BSH2Mif5pzcllNpPexxRF6vG6u0uJhPVwwB+jJ69bCEOChrH6phIk9kgbuxrtEz70glZRjD3Nwd
	o4U7pZt4RFcjOOlXV2ila46BHd9GsULZwiLlrK/PGcSa07FZDKUBPNfTdILDJtWEeDAPeOquUNK
	CVWMaRHAIbzOttmsA04+e5hIOOpQ35wt915biwUym41mjVWKNUiVO5N9ST4uTic3iR+DfUbKfEz
	4iSdY8clnP6Kl+PSFV/PRe8BoE3sgmW/LDR4VF4G8BQounreU2ttMJdNh+Une8OcE4ZWRLiG4Ej
	mmK+6fw5qW36C+n1hG2RxmZC/lA9m7P/i1NIGyQKlE6lNROC9LN3w8gLOr+K3TyRFLnXGqOXLdT
	TldCVdKzPIURdtqG78KPL1FAr4X/eM8fxf7CjC5FxYDS6rovV8SyR+HxaExj8F0n7ZNcx+Qe1u2
	fp8zCjQSplEJlQ3mj4tdezzed8pZfWyEGZJSuEz6vtJF6pERN9+dqvdfGznAg6mzP8+tg8tldSF
	k
X-Received: by 2002:a05:6871:e7c5:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4bc802e97admr436457fac.10.1795111719191;
        Thu, 19 Nov 2026 10:08:39 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm456866fac.10.2026.11.19.10.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 19 Nov 2026 13:08:36 -0500
Message-ID: <20261118-a733-dt-v3-3-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com> <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
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

Hi Alexander,

> Should the history be moved below "---"?

Yes, in v4.

> Should two regulators and the clock have been sorted in the reverse order?

Yes. osc32k-clk sorts before the two regulator nodes; I will fix the
order in v4.

> Should "status" have been last (preceded by a blank line)? (dts-coding-style.rst)

Yes. In v4 I will put status last in r_i2c0, after its properties and
before the PMIC child node, with a blank line before each. mmc0 and
uart0 already put status last; I will add the preceding blank lines
there too.

Thanks,
Enzo
