Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486342;
	b=Knt/pv0IaQHG3i7v4gduHNG5CycbynvkD8s6i0S8MxRtPLMhYjswAgpUSnI4hWVd9kpu
	 Tc+kckzN0qiW9bt1X9sHXBID6NSYDQKEaOT32A3R3jXQvruJWbF7MSN3j2bGvou1EcGaR
	 9Xwp+OLR5TObGaVfFEuzYgdb17zzouccCvu8xf8bPvOkzrVs0Mem/TT3nbBr2yyZxSaNw
	 1axu2IoWL/ti7PTrzPw+TKuUAnbdQ3l4EuJ8VZD/uT3aZ3fe+NSTTzSASJ8a3WPVsWL6T
	 FjSsAMNcnAsQGNqEg6+sp2BXJzDfv+wvnjjA595bmUZtSmXUJlgQXtAM5KqSuPQKf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
	b=IARjwEcpAwA1hrwyOHoWHKeJNeQxoe0kpOTpq+h8mv3Uj12esHgafg1fydih7H1W7dr8
	 56KZ9dr/KqbOs3PVjIDkPkw3jg/csq3WOpL7KF11UvfvbpbZzvigLibQpyofFCkG8Kshc
	 an8eEBl3QtrGmxZlsNyidPSduCoBsC0GF92goqYX0V3ca2NofJhNoDXwYtlulNDJbS+x6
	 xHk+cdxi9vp047FD/yamz0fxOFjm8gNUhVlieitS3+/TQfnYvI1+yI757Ni9/maorBnnS
	 Be8ZVGXhNYawrTluPnWKFmDHqO6j8cIx9E4kiKy4niR3cAirouoSRh52EfaLNZY2nEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkYlWrnT;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3033C606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3033C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WkYlWrnT
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso777421a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486341; x=1796091141; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=WkYlWrnTqUdrWZZm1tK0o8QHAcJHKyc3XhplDP+3YX6tsrRhC0AYQcy4LTqT8tdoa9
         zj1O+B6mDS5A5xDFsf8Pkyh3hwyhSnYcHNqJMXLEhBDTTwOvTETI5S1b3+Rm5vi7Mcgy
         u42trG+PMkhfMsBT3ZMcC8gi23DZi2bzCk8IvpyzIbJmCQeY/hKyOsh96b/i2kleGL9M
         2UuvDDrXlDll0k3f2+m4a2uauQCe1pCsI+caGf3kRmjlxbfQk75Kr8XEK79c+XbG0Zwr
         XEr20HVO6BfOmhCjVPgMY7VNMyu9YagOmsLU3w9tu03Hegxbo8SHaR2gCOWaGLyOIsar
         5Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486341; x=1796091141;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=XZq6yPA9wkrO5JwxVcxGFDmuQCcc9JVVFq2i0CNLsPtpjgvIvBPw+8s+czwZyYqfAo
         aT9UB7y1zzWfcvD+UPveuEzRpiQCOVdH9ZPpQnSEgmzyFbKIxTeI4wOkUD2qbVvEu2yw
         tXylx4yLz1r83v7nxA8x2W5bg9xZ6ij4vTwab2XdO7LgPiksGxx/SRaky6CX0+UoJpyQ
         /RdjapsteMGW5tTafB6GCCgKsNiZWwtBcDY35NqBTU9X4nALggKAby92AW8x5QEauVcl
         u/AR7zPgynYxBAdOXthFvJECY/VuPQugyt6jlWJ/9LyVBp8It2fbYfieWU5NUNJDLkHT
         kBLw==
X-Forwarded-Encrypted: i=1; AL+hErH84W6qP8BeHKsB67ULhmF/CDvPmo7CMn/X+5wwNfs4rKb+mSZeZ3O6Z/ObKjfwH9r6GtJdFp47cPsERH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B9iAhXSALbisagCea1YwJvcrX09oeubdFFENgaaK4BWw0TYg1
	/NZwKKp4buSe4BGMNF1zTLPUUr941xw6k54a24JNyYup/ZLKARwHxggD
X-Gm-Gg: AZFdTZcMTq51L3JmekByidzaCKhRDvwwp9+X8Ssk5Y0nEl4WKFiMPpJSk+fO0X+Cd74
	zjFD40aiGt1NAJR9NC7Qk+xh8AbgYYJkdmn/hnRzURMtqZTEgSgco+oz3E9sK8LEw6G/PRssqUP
	WWf2traEpv0AQIKnXysU4bh0pJ3J8uOYebGaVU7+bjxIErBZ7vP+0tra1rqsFu+56NDXtulqkBY
	LZHcONMBJcj1O+2QrURG31zRpMgtBYOjI/tVEHctMSJQnR+tzLMMg/k3nfnr0Bc0B2z5PUcgN5y
	3vcPNQlmamVupMfZ0ubMnrReP+FGmxhtsCryJie9C+lEqp6m7nJDbUzm7jXq60z+wgkjlTw9YLN
	eIQyUQfhXOTwl+Rh2OxWPEoCY6d50L7cmdQ8yfWN5X8EYKJZMBtOs+uoGVrMFH4tdW16kM66mGC
	Nb0YQYR4gze5BUbTtS4/8/9g0NAwDN6nAFw4IM1Sx0PIOs4fLTLgByhUx747aOXLxUALvYBrxhs
	bq6aImAthazkeZZsBdJZ2uAi0q/0fHShldsN6TanIKof3wrch9tQ/I2ssRU3ZLWoYCW/+lttX6f
	PTf1OCHJSGATbeoIo+8DTE/dbH/l70WVp5Q65eTEpb5npCoXF6N0Uf/GyA==
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr12780728a91.37.1795486341377;
        Mon, 23 Nov 2026 18:12:21 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm9869004a91.9.2026.11.23.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:12:19 -0800 (PST)
Date: Tue, 24 Nov 2026 10:12:15 +0800
Message-ID: <3b4d214b53b64cd7941260875bbc88d7.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Ze Huang <ze.huang@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ze,

On Mon, 23 Nov 2026 22:59:10 +0800, Ze Huang wrote:
> Thanks for v3. I tested the series based on v7.4-rc1 on the K3 Pico-ITX
> with an external DisplayPort monitor.
>
> Modesetting and page flipping with modetest work at 1920x1080@144Hz,
> and kmscube renders correctly using Mesa softpipe.
>
> Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Thanks for testing v3.

Cody
