Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154567;
	b=OKEskADeGdiaAf3qt+fJ7Je+FX0myc2xl8+XbFz421dyQqmVQN/3d0Kt9yHuPY+5JrdD
	 8gnZMaBTZOjYnqnmfcjlQ8UchMJi0OCjZOVPAyduajio+pFhanHlxBc61hGDJanjZdEpv
	 7pjvUMUD3NL2gDfihZJquybuKsc2O5+laEq4YTgfJoDi/e6Pb/2rLDgB+PucSCoUmeQuH
	 7Hn7wAeuHy2wf+vQA1PZnyLaT7qSICAtjJC57HZkhPcwbHPfD2QdctN0cHOYXx9YhmzEG
	 gx72+9Dy4Hgs5mluKl4ZHbcpFsuZmdZeCvZctaXVy8LfW91WLI0pIVm6R96q33Ud8Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=31xlQVhSaZjv1R+Uf4vk/nus+bOahfJDFRfIitG39V0=;
	b=wkIsU1o4lqpG/lwbAwx3/uOb38hMfR3B4NHE7Vr9Iee9Ad0Cl9RQKNy1uDMHIePfd86d
	 E2C+H6sA5NTTVX1x3D9F4vL/2pcB4YnFkK4Qm8whAvnRMt308J2AMu8WtNdTWPhjdngTE
	 F82OmBafBoYXTBa7rDEv52LlANONvPKs0B0EpccLJPF4w+aXftYN6Jq9x7X+ASbXEwV9h
	 4Fd8C1vCkTK7BQEW3BurFew6ljPElQ/DYXGtSg4paAJ2vsSHPl9wUG7zvI8hRu3PmLD81
	 FfmVDrNSU8rX3x+GYTyk32KN7wBLhLb/vxkd5rHhAenpmW0ib4mmXRfuLvJknSoTHSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9Ip23D8;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E4606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E2E4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9Ip23D8
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-381f65e4e4bso832865eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154561; x=1795759361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31xlQVhSaZjv1R+Uf4vk/nus+bOahfJDFRfIitG39V0=;
        b=T9Ip23D8SQdG98yOJLVMYyrqUAg2FpRL1Xp7K6AEsGaR+Y9fhKvblM6s49+inOnSfI
         4EOdeH0RWcOhMijDHNyaD9IdqUaYvJjb8MfEzvNHZM500o7QoxlBresG5/9SlYLmb5sr
         pX02q6QGBTKyoyhdoXyJPaHUSBww10N9dMVPiajlUcriC4mbQz8Z+AMGIQJqFnNofdGM
         OVvuVww5wU48hq+9vkDfcGuLanOSY6feQQ9CWhGdH3McaN1hEbikaB8cvnjkNGgswu4u
         llBfi0i7hLFOAuw3A9xmqj6YdMc4bUmAb5RynQCD+VznGJSBktVjkU21mp8sQLL5PoOh
         BDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154561; x=1795759361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31xlQVhSaZjv1R+Uf4vk/nus+bOahfJDFRfIitG39V0=;
        b=mVJwcGRwMYrixN9GZbkSMSl1m5e2Iyae4UaaWymPynW9rVYA6O5IITbtDaIPs/U5uO
         fxTMq4eiQ+9dTr65AAH+cNIom3Cmtfjz41jOHICi9r+zadhqxlmxm/njMDj5FHdd5GYo
         KDgdjI6A/evLLNLJU12IJHew92l0vEqU4TCC+cEC4ioXURJd48HK58kwoiamhxzn+ohb
         o5gK88HS5+uIK47lsP0iIJ3qtHrClTyZgkcPNuSXBIohYg7zbDScsCxcZKZLLxFG1Xe3
         gHP4llKkE4EdyGLm9i6XXzNzqAdY1MTWJHyaSpPJ6VmkpI15wCLEL+T/iUNedAvCjl49
         4TOQ==
X-Gm-Message-State: APuU4Z+wNtzVPV7cdFcbRiqIPJpKygtfYi3PbBaxIPY03kzRHtqjtiuW
	++zn1y6MwubXZoqQ2UAWHg/F5SDkKLP7ZL5AYsHkZ+ZUhKpDucugNMyWXxleqEgq
X-Gm-Gg: AZFdTZcQ4xCzmxKOEUjkeV1YiC/lE2dN92Uzy17+jiKPZi80jCfLIY4LoHXrYR+dr9x
	EGaVFJHeAKCbk99L6idiU3I+JOC3HFiQNHQrch4nc1TrnoqzeIUCGWXp+LH551ymLusD5PMjUD2
	KBq3nS12HKVXEO1JdJd5LdT4Xlrj1CkVBChPxZQVEYck4t3Nfi39/UIIbm/XyAUBvBIaEx2IJz8
	TC4jlkLKo4Wsp842nCh3Q9DmLZASvQgsLYvAsVTaqPL1joQwfQpX237VGyRe8PoawXpO32kY6dv
	UNnMf0Akj7RXy1ZQUecIMINqfSmrQguuXWy181rz4okLpdAzvL4uKZFrb/w75QjB6ROgbXPfjA0
	7UNRQwbSi/fcwPv4JJnwWE2dJX/+9qblsIlzGIczOUoHiaz6UirVeFvm59Q85i8KRmIEX3yc5Tf
	Q1rVT1R9aWqjnqV1cHgaB1MUH1GxZQR+3SzFZZKwWcpqz8baITZT648B/X9ACCuvxguJIcfsQ7E
	kpzcGur9gOFV0cXvHysnbRlgxcDfh7fbWMQqD6tE/x2txZPb/4yZcbNUuvGQdwwWa5TacaQdPTW
	RgmZhILoEnpOxpqfCLdcseJw7YA13LCYaQ==
X-Received: by 2002:a05:7300:e9c5:20b0:381:f33d:ed9d with SMTP id 5a478bee46e88-3856fb6a214mr1984582eec.21.1795154560877;
        Thu, 19 Nov 2026 22:02:40 -0800 (PST)
Received: from nevers1dd ([2401:4900:9258:be0f:72a7:6656:e53c:a806])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm4810504eec.26.2026.11.19.22.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:02:40 -0800 (PST)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH v3 0/1] remoteproc: k3: Merge ti_sci_dev and ti_sci_proc
Date: Fri, 20 Nov 2026 11:32:30 +0530
Message-ID: <20261120060231.11033-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The previous version of the patch had a new header ti_sci_dev.h,
that mirrors ti_sci_proc.h in terms of the struct decl and
its helper function structure, with the goal of abstracting
all ti_sci_handle's members like ti_sci_dev_ops from being
invoked directly in the driver code.

Lore link to the v1 patch:
https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.com/

Lore link to the v2 patch:
https://lore.kernel.org/all/20261014103241.3847-1-sid9.karanam@gmail.com/

Upon discussing in the original patch thread, it seemed
better to combine ti_sci_proc.h and ti_sci_dev.h's structs
and merge all their helpers into a single header. That is
what ti_sci_ctrl.h aims to do: It has the union of tsd
(ti_sci_dev) and tsp (ti_sci_proc) and both their helper
functions are prefixed with ti_sci_ctrl_dev and
ti_sci_ctrl_proc respectively.

The goal of the patch (v3) is to maintain a single source of origin
for all ti_sci_dev/proc_ops call sites. Any stray calls
to dev_ops/proc_ops function pointer members in driver code should
eventually be abstracted through this header (ti_sci_ctrl.h).

In the future we can switch to pm runtime calls.

Siddharth Karanam (1):
  remoteproc: k3: Merge ti_sci_dev and ti_sci_proc abstraction

 drivers/remoteproc/ti_k3_common.c         |  21 +--
 drivers/remoteproc/ti_k3_common.h         |   6 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  25 ++-
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
 drivers/remoteproc/ti_sci_ctrl.h          | 184 ++++++++++++++++++++++
 drivers/remoteproc/ti_sci_proc.h          | 130 ---------------
 7 files changed, 239 insertions(+), 216 deletions(-)
 create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
 delete mode 100644 drivers/remoteproc/ti_sci_proc.h

-- 
2.55.0

