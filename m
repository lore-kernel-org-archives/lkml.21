Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746430;
	b=dqDGDbBR95oxla3uK5AsAi8saWh7usrfHeTIE2VavsqSyT5HUBeKxaDPyFnlUXx8SAdh
	 9TqoW6AZqTMFXxA7br2kVyKRn+ZP7tgo/fnEGuNlDu2dbOxxa6MbAjlijG9zYKjffv9mc
	 /OV+isnOcdpVT4HYRKMFCSS8JhWlsVxqN8N/Uq5ajcUIzKlBCdQ+JNER1ywIM8IR6NG2u
	 gR1wcC5kMPt1Jp+wPZ+bwBk0D/YjIdKvlS/16q/ymyvHug1No/XLchb0NjkJXMdPVc8EV
	 WSxvOvMBtKmHC+ciMWbH7d7tj46xVwGN7FfF23rYBcTiZ5LhWEz4lR/+AvZH07oHMSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
	b=Zt5LRxBdLpedI6OnPqIZ1dWhMIH2ajlyjMLwMo1pTn8imzT++aLXzvO0rPiRm+G02Ymz
	 xG6mrwJIIVZ4wq7p7hZx6QWYyzjv7hHcSCATV1KQ3ZPf8b7j+JLTeMelRAxAPJOkiRj8O
	 W4+C2ZEShjStMbmOyxaGN8x0OK5CgVEvNH5DdwsHHC6UYTXSivZt6DceMKEtqwfoUPvL+
	 ZduPfwbiqkVp/I4a2ZWIRrcMzAP4SRHRveSW7Wl56rqrRZhEW6QfoPDLLndoFHtyWSuVT
	 fv9PRi8TlvrY7f91ADNHIMORdNoqyGdLw8OUNWaZcOh0XdMLCDDWVuBRknbLj9CIypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YllbfJkj;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YllbfJkj
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b413997581so5634488a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746430; x=1796351230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
        b=YllbfJkj3EDXkwUCx9UTs6py3Rt7zH3anrLzdwxh6ZgzL2E8YLcaWNRjJ7xuPk59OY
         i+O+4Bclzhmf7dGV/0vASNe4+LRRqEFFbOTmaicFvFI/mUhyTOSWD3kyVVh9d7t014VP
         nvMTX86uKf2A9TS1k25/UoyZK+noL7OHfu+ybdn773/UplK20MnaTZUy7KP/HG7Lu9ns
         8d65Igo+h8tSqgtqpyoYxVN7A7VKV5MjCPBFDZyI14ivcoxZ8npDxg0GX9GTXqRZFRiu
         +Kb3v+gr8Dh6bINRaKYVFUBRg+6sxItr4HFz3uGQz/1OJ35wuLwtDbfY4p2DSRxesNkb
         /CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746430; x=1796351230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRNJo2Wq+atj6dWEhKZftfAsf0NVsAUajmV6VEgSNV0=;
        b=wgqA6z0Va1PhSKsJxIGrUtZTbfYQJ360+LOwePYKMZkylnOky1ui2dgeZxHy0kNl7A
         pU6Jr35TqmGyf6EK2q17bs62lnhJhukh7D9FaQQ5gZrz1h3ogdTQKMmFyZ2/2dyYw364
         CUIzBcb/uKQhlNzDgRLKLFsFm1jPn78Nj2xjOlL2qIaGS2yelWkZqeg1XsvKPy7BX4AV
         B7Mr+ti4/h1WkcSTx77pwvO+pCDGqzoQKIB2g+1Y7jLnNomDHgiPmmkgaK01phqBJyD8
         PxksP0XyOMGJPjlWouOdFnNRTM6omb8hpi7DK42gxP+7vPb6UCZ385dslHFlHpt170jX
         Iqvg==
X-Forwarded-Encrypted: i=1; AL+hErHQcwtUkDKXeysN9SSOq4DDnfb6iVLXphqmM52PxPrGdMQfMvHDdc767893Y4m7EdyUe2al/NXm1LGvQv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D13raWzqpLEKZcXy746rIEaE6nLVNNPdjk2leTrk7IIt8mvf8
	Gx3iQOV0NveCcr6d7aozFZh1Hx7q0nepU1ClDvi2eYac5R1c7i4sukr7
X-Gm-Gg: AZFdTZcdz3KRUgSDjERs0/dqptOprnxlKr45bDie26IdT+v6VHj+Xt9zsAu9/ki8tjm
	eZsWgnd4d6nOmqtFJK6UBjA15XlUDR3qYAFXEnS7LiBhrGrEaoeFcvjpVwcyGzjQ9g3coxlAkmp
	R2QEKNDziRYglXncSs5pudhPlA9NrXo1hyhk7OkxiVwjeyaqzZca/rhSKSZDvAfLrRKO8Vg8EyU
	l+LzoiOWJlHsfSG9Q9mSyOK6NLdMfkcBg4oKnfHpu4EWnwWsOY50nDVP3VWTqrt3a91vKlqAXJI
	FPqbNq6BUvvLh3UnDDB7E/ulYQsfi2/xlI3xiQIrwd9/gFBXcq3+YdBEdSmp1WB83m3Mjx3Gev9
	h/7G22q17r/4hdegWFKL3d5LKS95+U1yc/r3ck6Croa/xGdlER2P8pAsKzY5SLgd0mkeWLSQ7hL
	oLepnAxWfvdhChCggrMKvCbJVRJyTcc5Ee8pDeoUoBtYxTbCFWQp8PHpNwPkXcoa+NVGxdL/YhO
	qsRznCLrcJDlo/DacfWLs64HZb/ZyUn44rmlGnnoqm7ncMOb52PQTOnD6TRn8EzLx0qh0vLbbb3
	45bL2+n0T0qaf8ajUiqR33C14j+XO3W/2WUkpb66lGU/rRQBLtRy0ZG9BpKjb9141ccZHFdnanu
	nwDBd3y0=
X-Received: by 2002:a17:90b:164a:b0:3b5:a3:442f with SMTP id 98e67ed59e1d1-3b500a34654mr6199205a91.41.1795746429680;
        Thu, 26 Nov 2026 18:27:09 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm15560039a91.4.2026.11.26.18.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:09 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pisp_be: Propagate platform_get_irq() errors
Date: Fri, 27 Nov 2026 10:27:04 +0800
Message-ID: <20261127022704.685043-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260630123452.14226-1-ahmisaranrao@gmail.com>
References: <20260630123452.14226-1-ahmisaranrao@gmail.com>
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

On Tue, 30 Jun 2026 18:04:52 +0530, Narasimharao Vadlamudi wrote:
> Return the error from platform_get_irq() directly.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be probe/prepare fixes
("Initialize lock before requesting IRQ" and "check configuration
buffer CPU mappings"), by rebuilding the pisp_be module.

The driver probes normally, unloading and reloading the module 20 times
works, v4l2-compliance -m on the pispbe media device passes 400/400
before and after the reloads, and there are no new kernel messages. I
couldn't exercise the platform_get_irq() error path itself.

Tested-by: Roy <rongh7426@gmail.com>
