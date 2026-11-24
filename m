Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525942;
	b=J/M+9H2yJTiQNOleriXhgQgRHDjKn55QF0XlElNrmRxZ9brSvnl0+WzJSgm7yW8rFe6q
	 PBnnupzb0tLrhzMZPO4VDhtGbGQWBINmHxU3cepiGOdh6F06s4Hpd8d6D1rrOKvP6E7o8
	 Lnzu39qwzi8gstH/oFIJtLqK7R+Ak3OH4c5WQMfrsYb+ba7/3YQX/Lv6p5GysFqbwA/kJ
	 CNuWqnzcZ0kN5qz2ffGPdxke2Q7Z2DkEJVYPTxlpaiMq7zn/aJm6g75Q3QaeRKIX8Dxnf
	 RPVTsAK4HPCi7//aHEFNyrUwPMyYDbLt0MwcVxYceidIKoHaLpxeADQpqfIDVNSshdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
	b=w6eXi6YgZ5M/iychqdI4ikv6LSaFtL9ch5KEehlMrDnbkEE9zahwz/a9FBJc2Wih1bLW
	 JN3cKYlerBSG/pRaiK9CaeuGFklZhLbEyRVWibaO91QI3EJBtd4uk6jSfGuid32fMDOMe
	 xwFvtF04LZ7Sf8+kHULCAs/wXPqgDsRfZleuXRnvNplUAdk3zXwqkkWafJfis+psHMzlR
	 Vir0w4/urxHlWB7WbqlwJuO1hZ6isPxYVzuK8G6fhu3qlbaTFNSJTqaT5QGbJAVEVo9T/
	 NJdxVzB1ssvDL4DLUsIwh4CKIroQZHaXWHJVhR278XbRKKnXh4dMjbsMlT6gRwuqR+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY8j8U2H;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3930606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3930606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY8j8U2H
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2330122f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525940; x=1796130740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
        b=MY8j8U2HvJPRU0JWuC7woMd93fJ8ssW+LisG1zpIkm66fX4ex21BV5d47dfgAD1GSL
         vEVVzgW750eyJCHgD9H9DSqtSMtwP6OUHHWswlmcYhtbq0K00PMTL2HY+/G4YardykdU
         0qyHB2MfCRAf6v+yVn+PpyRRs2JfkQHM2btghQOmjcpcopsFy+H+tBVrJjrEPkJznFKo
         kwptAYCpnK4ZRaUQ/Y+0uAMX1WidLh4SFXwGH6YTvmejxurT3M3hrQ6hOfnomy+m+MVK
         NB3s70RFnU1JQAYVohUeuAoL+Jsmtb4GE9kEGIXD335qTxtjs+nh9EcAZyhiq5gQD81V
         esGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525940; x=1796130740;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
        b=puV5zoEqRvyNGcoBgfAIperJMwOn7lF+qIuYU+6QiNvq8srEne9H5UfpdzpIBwsZoe
         7mV7bYYHnnIi8eih9gbwnUyA4Mttu6VmJQ7Xo/kA4nAKxJCweba3ynD/vK2cx7A/jH6K
         SpAYOzUfefSlOxoFfSpq7KlCboMPC11JYhO8fcgZyWscXT0AvxiAl2uGKb3BxaRi6KSP
         SPEgma3Fi4hbkVTJScgVu4ivjCip8gZiqFMx4DggcoLnNQqnHrAqHbj/wClb27HgesGk
         ShiD5o5Lo24TssaI/VPXLlTpYPoms2FgkoiiANcuqjziGT9qvRUYAQmYdBm8+b1F2O28
         2JMg==
X-Forwarded-Encrypted: i=1; AL+hErEuwv8HKizW6CwgqQ3JIjhY3kngdoQ4w9DgirIao2hbpqnUD4pG6NmGAaQ+oWy/n5SeGKL8yzH7Bxw2FJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EB5rw9xVCxffqiqEY7fAGyjoZbdgXH0mvS5m7yK7Igo55ZJmm
	xskL8ddwwspqe6RHsv74EkoH/WZqyuF/+FEc46IUNwnqREqhkejoHlyB
X-Gm-Gg: AZFdTZe3coXzuMJ9n1davhWuvrL25zIQdRqMXdQV1b7AP+zG5rl9lZ0jT0RxS+3pLtn
	G4NjgpWDUI8WgxEAE4NBbXsiPiY3kR8qfg6tU9NDly9jOivWFZsvow/tDoEp8xsc+04moshbdws
	ifv4jroBFEJxcngr0Iye7WQlc37hWOrB/o+ALxxnL/bA0jj7CDkwCczBI91gJyIwr+JmUir36l2
	V2DsjaeqXP0cjU1UdMjR5TODvmv6Yewm7QvgepBeU1kk9eIhZ+YsGLmoOxr3q6hQe6cIlGOxWvl
	wj0HWkEuDQYu94RrVMbw/neKLVcVIeQLm097cfRZiJ42AmnPiJJqhhTZ2dV2pHCHJjSo4AY2f7G
	pArp4hMguhPgcVZsD1UAYH5JyyKxfRMQ2EUmX/HTsRWN6VjcH0mpiZQk58fJcSkAV1z4SzLi0MO
	fvHQYQu8PyGXriDRGdBFLROlOC56iwsd3O2h2d7rgQTATI6XvwhE76Z6KSbdYkKNnS6XKcWoOmB
	dsKvchFuBnubuU/kLAUYrTF17U3RA5YsIkYHd/uChrMZla8jl14AzxaB/Hu2oemi9/I9nnXI5Dp
	m/bgFrSrBuUbDLrACwEmRPSbaVpVw1g=
X-Received: by 2002:a5d:5d05:0:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4abaf74024cmr30988416f8f.17.1795525940203;
        Tue, 24 Nov 2026 05:12:20 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm29088126f8f.57.2026.11.24.05.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:12:19 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 06/43] drm/tests: Add test cases for DRM rotation name
Date: Tue, 24 Nov 2026 14:12:02 +0100
Message-ID: <awWLyW77VcEKkt1w@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-6-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-6-78ace90f4fc1@bootlin.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Tested-by: Oarora Etimis <oaroraetimis@gmail.com>
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
