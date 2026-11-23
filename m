Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437478;
	b=aFp4ScNwtdJEzfnng8kmSch0urCLU6JI4iQMHg3WuN9vGvI+j5GjeJHyGEfoiejO54YU
	 JG9h61lJKMqm11XJY3bm3fT0Huhwdja/gxksJzQ13EbbByuXiKjSG70jJzbHqB6FQloLP
	 gNDnTszU+kC2j3F8zNPTX2tJ89ZzU8XI22/Sp6Tyjk4cpnjTzgoo9Dowb8FcR6gIYmxqL
	 M2S12bMjJwiT2s/8uaVrvIJqwuO7ftTxEnUN1ojbosDkhQR2d5MXJAahnF1acaRHB21g4
	 z1H9FgGyqNSNCvZaOPxV+15IpEvJSoh3XjUYoQRLoGS2W3KBOSq+kgigdFbcvWK0kMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4FHRYHmmGVRFcPlTDGmzx/L3A2zzLoxUicG8IqEA4p8=;
	b=tKjxAfbpiyUsHtcvLOsdgiufD28iLY/NgsJDmNpTBoP6ngpzRReNgBtuWKd7ia2LTET9
	 TZS54nAlVuOmRIDe6uMuSwh/Ws4ivOq6pjwAten9Ae5Z63nfIxWKGDXek+zxtAMbUiy/J
	 gRaVnurkMm8JmqPT7/J+YrgiNQdNlU9NO55YF3aoDOnWCJvq7W8y8kGLmnyoTlk9RaiHF
	 8MfhRtVf7NfkkMFbJe4EpZoYFyjeSfWh87nzDub1Cn4+Iv6lEUuHnohZETNYoDZrXz0bF
	 Pl6sHIwFN3U8DRBTkRO4mFiDD6ucD8LJUbHxwd3B6xmNGPdEHLyW6jZ2YcV7/LXQmwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JQujt/H5";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F262606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F262606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JQujt/H5
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f020d0169eso14382435ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437477; x=1796042277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FHRYHmmGVRFcPlTDGmzx/L3A2zzLoxUicG8IqEA4p8=;
        b=JQujt/H5E/i5WTl+jz+YqJXcKepX9mWQBC3heidVAz/a/MvDYSx4nPL8nqCIz1q22E
         KO89UAnp22TmDevPiP/iTEcZwthcMvD5tDn3E2Qf+mzC1yPgUelC+U7VgR9tHGjvhK79
         5Fe9Zr94KqaAMqlpyD0qT7MNTr66FO5GdB/7ISOdrtWSIWCnkpI3/jUWNrhJhOAppYC4
         jcUwz0gXM6YIRC0drO/x3YE2ERT0wSjVCJpkrsS84ekfi5v1eFop50QSswk8Tu3WWPHj
         f6uGbkd6z+B5nSGlKQgLaje2ut13Nx9utjDRqHgkud0N/BgbVpT7CuYydhC6eOmUfNiO
         As4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437477; x=1796042277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4FHRYHmmGVRFcPlTDGmzx/L3A2zzLoxUicG8IqEA4p8=;
        b=RDXzcNVjPNrXSpl2z8eBTZqVwaQ7ZHJausOogf3u0pMETIoz11NI8TYyz+tqLv/TCq
         g3xkAF31CJpIFSIRSUINsld8VWgzJ+c/6sajACiRqPWftAzBCcygwkt5T9TRWi9bfizq
         tseSaqokP+IKRJCW/slIgVcEIcydYNcC+9fHtrSL3SfVzRDYoZ6sfe7wwp0AcomUmLZZ
         bbkiFBp8hbMzq+DRTNde/ZNLCNNEJ/FShfm5nx91o6JkpuwPOHDclFc1y0Je0+qytmJm
         TIjaO11D3XFWNV8YG3rNSRXwUp3+TveXUMZW/RfuqrI036fqRy3bbEq++4a69z5K/z/r
         +gcw==
X-Forwarded-Encrypted: i=1; AL+hErFURYh6lnuH4ybi+R+Dufr+IJUsFgPWvTLIU6J+OPeKUzDXu7tEexJrXJzGz/24q4v5Qz/H9QJzFhywk+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OXCRN70j95i/FUkJTeU58bUAwnluMjW9YIvivunzn1slaJb5e
	6Q4z4t5iaVTtVxGtBB/9mLp9zWolNDDBYKtao1QVBKbTXLLA1RCrZ1Yz
X-Gm-Gg: AZFdTZc4lSAfKu7e/S6z6Ay9qbGFIFg6ccYDale/kBJpDLOvkiXbFuSpg4VNmtDycjV
	jSnGW+HXxMdaSi8tfkEKvx5P7OloIj1DDTfGET/GTh6NilYBLBA+t644ybp1oxNzMAD5QGd5rgh
	XW/uE38/NTRuktYsNFZcD8Tdy9sc/I+ImvPdOQbn90HmuLDTyL2ZJ5YJ8DzI1Q4L83BX/cHVrcZ
	xTY59nRA0vm+/xngW+mBHB3nZQ0MSuKrf2RakIruOAfgHjBMaqqRDo4INFaroWCJo49Ho+VhRDf
	qNmtn20zySov8CBmo6ySXZ2dwWPqao/zNcLZJCCWFfI8c+K9vJjngz4TyL85PpRWCPyBD2vkzhj
	8p107aUvrbREoqSMGICtLu9cDFiVxbqRdlP9FDArSCVDG0YAE3hZnoW5AC93WbwHWMPoxSC4sH0
	fwUqhf5TfX0S9r78DRUrdpnkOt0f8fcG7uuD8Jm/w15yRTv8s+6VeaaJoPwaTKV5zA8V4xhwlxh
	YI/AlthD1JU3kvGirusYSnLPDR7fCeS/VTc/jxCbQ7frwtfD9zTHP9PyPCB0RbK5RkpxkpOZrNk
	r4qsIRrvZAySN9vQtX2bLoWm2aABXIranw==
X-Received: by 2002:a17:902:e847:b0:2ed:c9bf:9570 with SMTP id d9443c01a7336-2f03f1a4599mr114769615ad.26.1795437477376;
        Mon, 23 Nov 2026 04:37:57 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f06c02a92esm32318165ad.40.2026.11.23.04.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:37:56 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6 kernels
Date: Mon, 23 Nov 2026 20:37:46 +0800
Message-Id: <20261123123746.2963491-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2611231038330.54328@angie.orcam.me.uk>
References: <20261030140430.1857741-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk> <20261123035732.728281-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2611231038330.54328@angie.orcam.me.uk>
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

On Mon, 23 Nov 2026, Maciej W. Rozycki wrote:
> > Your form and v1 differ only on pre-r6 kernels. I built both on
>
>  Then you're doing something wrong; with __isa_ge_or_flag() I get:
[...]
> $ objdump -d vmlinux-base | grep -c dclz
> 18
> $ objdump -d vmlinux-has-mips64r6 | grep -c dclz
> 1430

Sorry, I worded that badly: I compared your form with v1, not with
mainline. Against mainline, in bytes of bloat-o-meter -t with GCC
16.2:

  defconfig   your form   v1
  ---------   ---------   -------
  64r6el        -105340   -105340
  32r6el              0         0
  64r2el           +264         0
  32r2el          +3352         0

On the r6 kernels the two give the same vmlinux, byte for byte, so
your form has all of the gain that you show. On the pre-r6 kernels it
makes cpu_has_mips64r6 a run-time test, hence the growth; v1 leaves
their vmlinux as it is.

>  I maintain that __isa_ge_or_flag() is the correct approach.

Understood. v2 will use your form: cpu_has_mips64r6 as cpu_has_64bits
&& __isa_ge_or_flag(6, MIPS_CPU_ISA_M64R6), with __isa_ge_and_flag()
removed.

>  FWIW an early check for the ISA mismatch might be worth having if at all
> feasible, reporting the issue via a firmware printf()-like callback where
> available.  Said JR instruction could be recoded as JALR $0, ... if this
> turns out feasible.  Not a requirement for your change of course.

Thanks, I will look into that separately.

Tzu-Ching
