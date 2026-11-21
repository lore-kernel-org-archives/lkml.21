Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281803;
	b=h+PAgCMv5IJK5QxbIKLsMf/7cgsHLucXfjm/j/gF6hR2d/miWFnG6XjNAsc8nv6yIUuZ
	 p5PpduiNPiGqBq43ximL0ZLT04vzvJiXOuV4v4+3AfTj6HzPdFGdBXGWo4/J4kafZDB2v
	 IOyJ4Gll3SGR0UCBx0E+hPnGp4rvZH4WVmh7oQcIfukNWOMM3UvkBtABAk8msNeQG6VCb
	 U3lPjO5E2oqLMxkQDT6Ww51Pwg1xXp6pkMLRFQ/U2aA8k0+x4QjvyNdL7w5BFpW7JJcU+
	 Fl4bitTwNTDmNlQMhrpbWQBC3QrOUOxtqmQskoMs/qdRwopIu0Su77k/CGYuomOsN6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rf6nX6z9gFornN9cf7tozfwyaeDZkmjs0vcNKXrirVc=;
	b=i8/IjIPMIWjhF0dqn0eNABbPMJawGqSzuCgH2a0MLVeHAKh1WCbuSCtjeHsrMASnhpQE
	 e42AqhO+qyTczhvVpcpwpCecMKlSi3Jh+OJ42MGOKfbhNEKE73Q22CD0ebPJkWgNJk2Fn
	 Sy2Okzs+ndKt3eVec+I7PTxJ2k+Ir7NQk0PbCTXXcyBdh6tOK+DvCdjUcBD8Llnb6exsJ
	 X5WETNlRXRkirYuOoFcoH8gkddBU29u3DDJ235fG+UPvwTHEPw2jSezPIuPADD3DlP26q
	 KtwO0KPanr+mJEw7AnNX329LCSTNTtGd3jrGFaBGvqMs3/oHxI++HOWOJF4ObszI7DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W6Jv14/o";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E476606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E476606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6Jv14/o
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38190551625so3859235eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281802; x=1795886602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rf6nX6z9gFornN9cf7tozfwyaeDZkmjs0vcNKXrirVc=;
        b=W6Jv14/oX0BcPQYRsaHnsjvBVFH/SSg7Gw+531o+1xtwGe18j35J/O6ym3b9t3qaEg
         R5vxdpl9ZdOIH/GNu411QtlFPkqwmkdIaG1bJSH6AKVJGZbjD7gOP2akjNuKQzMP0MIE
         58YIMpkv0VpPCGJ/yPUN19tRQD/+Mrk5o++6cuTYB5u/WB2wHiOrTj4M9F06SToA+ZYz
         nJ4fRL31Mz82ERRYvkszKqr5lUnEGKE41S2pQLr+iw8eiQdbHKk3JvK1WfKrg1ITOmxk
         N1EyniCz1Tkxve1sSB1eZzAgU9OYi+hvfcxSlrK9Hu6UIQhlFZytJTVP6PyK+i3GlYG3
         s3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281802; x=1795886602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rf6nX6z9gFornN9cf7tozfwyaeDZkmjs0vcNKXrirVc=;
        b=nu/D29UrBfZ4TNFi8neMo/3ZINOuFS259/Pk9o19SL/1umBK/5jmXxx2POtvRzyUim
         AxFZwA8Aqz9HK8Jr5Dh5WhqdT1KGaXSgr6t+DBZdzBhN+JaZVxG/u4qdksaiIrv1ud7G
         0oyZy/3GdCu5V7mhqyGydtQLybwk3ESU5TVyEx+ylsbvLQEVbGM1Ppo8MlqooW0Reh7+
         YFzLN1jlADNeDLJPjA7v9FyxgMjOb5G/UUgbP19Pp1X0zWJZP7EbCmH0MyiOPrKnK8Ho
         ajxKLJXB70/vCgOe0HxneRkZBzJB+bqFSZ29nKjoYKjKUwjW28xHZMaP/Lt//+ZZAF6r
         pNtA==
X-Forwarded-Encrypted: i=1; AL+hErGZPoJ2HXj8fcPZv5PDJwU6nChEbqLviikpQKHdEDmt7YB9hp3TiQjuHVRDYQ/t5kAsk7wDre7zbmVTqxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uv8Nf8TparOfOV8IEhs1sN841/trf6NbLsTgpuSiV7RHFX4S9
	xHU52gUeQWhKxqUze41MG4+FAsiYCVAVTpGwuOxRjXqCp9yAbCIEjBxmeY/qRG2RD6g=
X-Gm-Gg: AZFdTZfe/BQlB4SLz2Y4YrFOyFZTF2GfbsyJdjPtHNJXPI9o70buI2gD2wH8UxGirA5
	DWHxB3CrFwljJWMufKBsMFQSIV13jm0y6abxkOjZoNfXkf1aGE53U9tCY7QITg+VEPUgVqMiqat
	/+vEQoGLzUO+zMI958oZzLtqc9EMzi+sal4w2Wm8bHRhOjFpIb37VWrjgZQStmIx7qu/3YZAJFS
	rORL/gnMUKfjpavOsrJdXL6hrMUNc54oFAWv/oPsnDJwVIiNnd/MC4qL0BI51LNs1Axa9ClFnjx
	jce/mG0S/Hc6A3INFMzK0SxfzI1GvK5ABa6c1CAoSq/aHjk7DqOZJqabMpkhDUHMJKI8rOlEyos
	LmuyPoNNBVB+QYh9lOwwNiOR9vGxNo8XlE2LoLigH13nY8GV3l+aHOYEvvYjZypcUXa1GlCF8dh
	KFNMaXOWfRzE/SpdMDHZp9MzcgM3vh/VijKXlKHpEL8iozosswErfzwbQJimoT+JwZMQp3ZBbNL
	kZneGW6H2rG0nvMm6SK4qJAHoKt4VEniJQYZD+ieG51Iv9sVLAjpvDcpeGQTPc4Rzn7RtL/dB/e
	qQcDO/G5DNqEpH2SIvYTRjgfCsYGvkSHvs7g
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr8528080eec.17.1795281802311;
        Sat, 21 Nov 2026 09:23:22 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm21227439eec.27.2026.11.21.09.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:21 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 4/6] Input: aw86927 - add support for Awinic AW86937
Date: Sun, 22 Nov 2026 02:23:20 +0900
Message-ID: <20261121172320.829-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261117052112.32527-5-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052112.32527-1-xiaqinghuan@mail.ustc.edu.cn> <20261117052112.32527-5-xiaqinghuan@mail.ustc.edu.cn>
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

On Tue, 17 Nov 2026 13:21:10 +0800, Qianhui Xu wrote:
> The AW86937 reports CHIPID 0x9370 and is register compatible with the
> AW86938 as far as the boost setup is concerned, so it joins that branch of
> the haptic initialisation.

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two AW86937
(chip ID 0x9370), compatible "awinic,aw86937", "awinic,aw86927".
Both probe and a force-feedback rumble on each drives the matching motor,
before and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
