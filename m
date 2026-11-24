Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544381;
	b=XbRUDaxzF/npV35ylLpbOgu/fmrN7UsLNBN9WyGF48+M+OGOTWZfMGVp78fw8+ymBDPN
	 HcOgCfwMRhbD3NpQxrsvq53ccC3YPVZ580MuzSF4Wpu3WVdd6Vt7Fubf3PAXeH+KChEhm
	 pK6yrtuC91zcJdY4MtFU0L/ZI7YKNKEq6t7k5pBqWNOE7vckVg6G1BhHTY5vhErpo5Alc
	 v9T2QG+Mmu0J62dpQAlYKO9BigbzHEUo3tyFHP8jtGIyohIx+Hqx8b+xd1exxzn91idRO
	 ld4uswZCSfoMnhudvl9retnoWTLA37xvnUhFrDpnl3aSPQdnftkmtyIob/VGoQSeGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9akaBTfF6wDI9oHwKMXEjnbhxpjEIU4hGAF8pqsrUb0=;
	b=ZzJxtJde2oAeZ/Vnr9mkjO+JDReOVFHozKmull0AgX+I3b3qaVGCDCuOp7EIeHBzoKRD
	 zrUmhh0RR2O0wiAkB6PfxhI0Qu2Bc5RAV8g/upvPItjS5j0ZiIYCXl0tJRuJ+N+rPpkAU
	 3vSzoMdUyWIiTJdH3oFT00xSIw8VHUXZQYjftlIkwkdx2zCNSS6JDxxPmuqfF+haw4gVT
	 CX+bP4MDt4F9Ynle7m1OU16W2TRRtHIDB0Q3kdtW06T1/AwhduovS0GhFP7/hV4oUR80a
	 ZG66dsSch98k9wmVou/xKOFTwAaIuudZ2AinjNYmZN6pMZduLg1S80M698Ly2cujtag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wY7ezL7Z;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E258A606A697
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E258A606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wY7ezL7Z
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b244fb7fffso4628419c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544380; x=1796149180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9akaBTfF6wDI9oHwKMXEjnbhxpjEIU4hGAF8pqsrUb0=;
        b=wY7ezL7ZJHSy88yNX5eWm11tPgbR57oSI8+P+lsVZYh+5Mlo0A26pskKG4s36ZD+UN
         p4fImx6DwC1Zrs5SpEhwQ+snEAbkWiB1ytpte51ijioXfMV5XuMM96UDXyHo45cTBNPu
         aI3G3gMKo/DwMj+J1G3saAvoesUq59uZYN/AosPraqswPu/5/CF92kAfeFkAhJtwc9nx
         wHSfflEMWq49wGrOoAPyRtSaJEQI9/R2zUkiQV4Bt6F9Dbv2yanx3Z8GCqX6oRoWnVK+
         NaNp1du21foNoqRlBYQDLV9FRL8zsB9/6NCuMi6Rin6NCEnljWT8+KPxvKci0TZOIcmh
         rEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544380; x=1796149180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9akaBTfF6wDI9oHwKMXEjnbhxpjEIU4hGAF8pqsrUb0=;
        b=a2RwUdE84hWfoqfbG17yfg/zXS2kyhACUQS6/absha99XouXG9cz/rvSC5VcXZfeVc
         UhgH7R8kwRMcAzHqBSF8b6+c/3UltwSHE+oIX/z/U68khlFSl7KAr9xEnwt//+XDShRu
         fIuneDUSDkOtwAw0DjbXeGarK1iDpEzZ02lMkZm5pDk5Zy9dqlpgEifiNykKAZcYyKhZ
         QImx1P4Vvi7790izz5CKQPt5+r9tbtRIQ25ymKOu7wfbJjNJWd9QmLRqBaojZG2YbIzj
         xdfLCqpZAZSDE2W5eVCvtKh1gFrMtO0VwCJyfbla9pc1Qa/G+sif5sla4xoTIggCKXDF
         l2oQ==
X-Forwarded-Encrypted: i=1; AL+hErGu+dMKSLzPTY7PW698oZUFDingK0ZI2HIEDCxufaN1G6zXuz+v0eZNJN09E0zd6MhdjP9Ijj/D4gbzwdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rCQ9dkTFKjaD6YWvHjRBJHktvvPZ4Acdnmx7RDOb9lronYu65
	LK1LNYk9AKGNsoFEIdvtV0kU9RsmQ8j4/Xt6iIf21PcfPRfO7r3ahQxrFYXaM+nf
X-Gm-Gg: AZFdTZd+lYa6K8EzvhLUnd2X68d0QtdPtkc5FwsRn7RgEurMdYYPYBVwUzT72q5jap7
	ptIOV8k4YezsLTCmmlb6eBxgnhZQfApgIE4Z6oQI6g0WT/mzWPwXEO/Hj/KdjifvChS/r8KiR6i
	XUyj8Ng5rzB1ICuMK182vr/xHgMyYtiW1q42liATE4CvBhBifRW93J8O7DHwqKJ4V/td3/gekZs
	QpIdZafL8hzE70hla85TQdh/3v/Z1fekS6AnBDeea5/jW4p/GPgfF+3xKuRwTPMJgno9g5T2RRo
	hN/7wiDfl+WV6yGmEDCczU2Ij5fctpfI0di47LrkPheENQXD4zNYzGVNMIJx8F3bFcJdXZIeYaY
	FHxxGfaEbEacvqPEIK8MkfFgsATrhjVBIM7UsvTSD8yIj5dMMsPsPxQ3XQ3ac/hmPphZ7T/h4PT
	3bHPJKy3dwP7IDY0N6AopvTPCyLlRH759qj0MfcHs1uKYNoRylKqwSQrWy19l/LKgs9Q0e6+L5W
	rpGyWs6m3KYXxj1WAJFIGU7La8RnavXoebvuFMTZ7FUFrLrMzF0czbyS3zZIWthePLcu6WoBV5g
	UaxkVJmqlp/P6SmJ4BnxFxgtKNIzslEisd3ygpppS42YRS73Kb/0kiZ+d3LY3nypjfc4Z3w=
X-Received: by 2002:a05:7023:e41:10b0:1b5:43f6:74ee with SMTP id a92af1059eb24-1b5567c1250mr13792658c88.1.1795544379818;
        Tue, 24 Nov 2026 10:19:39 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm59688327c88.9.2026.11.24.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:19:37 -0800 (PST)
Date: Tue, 24 Nov 2026 10:19:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-input@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: amimouse - Fix the buttons
Message-ID: <awXVMoykw0uYsIsO@google.com>
References: <20261124100604.2380938-1-daniel@0x0f.com>
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
In-Reply-To: <20261124100604.2380938-1-daniel@0x0f.com>

On Tue, Nov 24, 2026 at 07:06:04PM +0900, Daniel Palmer wrote:
> On the Amiga the left button is connected to CIAAPRA bit 6 (/FIR0)
> and the middle and right ones are POTINP (called potgor in the code)
> bits 8 (DATLX) and 10 (DATLY), all of these are active low according
> to the "Amiga Hardware Reference Manual (3rd edition)":
> 
> In chapter 8, "Interface Hardware": under "Mouse Buttons" a 0 in CIAAPRA
> bit 6 means "switch closed", and under "Digital I/O on the Controller
> Port" reading POTINP "will produce a 0 if the button is pressed, a 1 if
> it is not".
> 
> Invert the bits from the registers so the state of the buttons is
> correct.
> 
> Tested with Quake on a real Amiga 4000.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Applied, thank you.

-- 
Dmitry
