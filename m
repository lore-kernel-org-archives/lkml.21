Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795483770;
	b=B5XLvGIKKt6D6CLcrdIhBlePE5KjWDAVWJSCiasidrezlJOHLiCTn6uymT+NYf75VO9W
	 4zXnmQ1kfKOmKrJi2m7TNb5v+WzQqfpmpBqTFx8Ep1wOaV/Q8aoXOAYwoliA5KIXIfRVs
	 RxJFOHCbMB1MI+684tTaJpmEM7PjtM95zy+Nurj3S+v0YSpMxdewssJzwbKzCqTUFxHkm
	 ffxPEg8Y6qWODz6f5EoY04tL1+dZDTMwL51dP7QMtdDOBtchIOY/Gt60FDzE4UpfyERAb
	 5dIDXQRFN9xCXY1rvn0bjd4gsTu0EeeGnIQg3wF6ekr5mc9LY2TggJf19v4slu7FPhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
	b=RkAnCWz8SBUswqx4yd73o9Eig5YHsURRK3u0OV+Wp6Y8wwtOVaqy0U36ZXl5vfauj9Mb
	 KoTb0wX5ByV05LnPvHblkUg3vcTnpw0FST0VGEQGLeDFubj/6r7ATdLqtL5z+QUwq4Dks
	 KeKq5gJya12SOyhxpogSLo5A8xrkYnOB6NWjnRFue4KzPnafDO2mqAKp/QrTKvmSZEIkk
	 X+yCmaDjXtquALCs6Ro9yVNUAXCmRmnheRqKLHt9vUV/lnPvNW1XdI4FFqqSXGdGbxvdV
	 PkhkVmhtUIb5W+K/5iY7yHMCUt38b3zT3+Slly10gywSDuLx4etZXug/91coFCqKliQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b="ILJcHM/a";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53008606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53008606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=ILJcHM/a
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-18818daa3e7so2326592c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795483769; cv=none;
        d=google.com; s=arc-20260327;
        b=Vs+lg9qKwL6oInZuia5k39vEEV/g4QWkPKvHT7BPd63aoz3mcV1N75pZu5ToJzIw8e
         ZcnfH72pEIZD4jHMGUB0LhJuDfM2BBRIOtQ7p+rGpDTHgyxyZc/1aTw1tgP5TmYac1I/
         BnNdI1nWa7DP36QOPv+Rw5S5ZWSCf3uOYBQhPDpPtxZUW07tc0aVc86JiSKLc7zs5lby
         lnwQ+Q0V2o3A1jjun2EeqTJBbS9Rna6/Z4L9Dv41CqWtw+Ov7k4ay1pcwTtT2zl+4FDr
         kjiozDLmlAzKDWCWwB19dXn9SoVJTw9vYPNQVmKNly01henYLDxUOrwHIeAT0sCJMdWS
         TZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
        fh=hnQ3gscI8UBgWCpkBPo6FMQFOlqdWohZb2wUrkcqxaY=;
        b=WV8e9bJloR7jz/TBMFR8M454EqpkKTYooLr3foznW6Ro44C6UEqpdDB7Ejc32FDYZB
         1iVNetuP96nbwRiSkaHiwgLwIIffT5uTXmAXLbI9GPR5dN7Wbg7jLtM9SNhOfg1lnxAX
         tPEMXaV4iwWpmFu/0iMZZm0GMZxXWTKhG1GzuYGtI0F32dH/DEhS5v4+XA7NEZvQPrYn
         MkAXDYqX4X62kcoCJpd2d8L2i1hLNe3nmqK2/ib9tISHX0XavVlk93rcFUvx6NQpMqtf
         GBmZDwsPjm5bulBJrqZxlsRYabshT6569/saJpMND/sIHRXbAOXm8EKr358TWzIB4HZZ
         Zr9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1795483769; x=1796088569; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
        b=ILJcHM/abHahj99I8Qx90ypSPUuQ4LxQoQ8yQaudRB94DzHTlgfkooiXPGG6sTwz7x
         vQi3c4gY/UYXSTH0vV/koHUpHxu2ncHHsWPP1eZaEaW6KM8HEg1o1ICVz1GzwO5vq/fS
         u5lgh04n/CnmCsbXTl1OwjF9mMPcrtHiEPdeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483769; x=1796088569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3mFuzoYvyXQo2TUc22gZGbp7TOAk+Ltwc/mMVtUyX4=;
        b=Rr4l0o/j1r6vh9CF6vcmQAd//gq2Akj4+bEu4MYV1BdL+OneU/zWj6OO8SDoMd2kvn
         lKQPLWoM9SyDfsSO91O/ZUoYV8HhOWW97wpJtxfbnZDcoBHpwEiltXIN6ypndAwdSwq9
         5P7uP4ffgu3gxwGpZ2nCFm/TjdevtwTJSifX0Bt59vNMx/2mVbaMraL9IbiPF7xWL7NX
         QuTHQFlbcrqthSwBwgMqN4eRLhw3X7Zx1phDSr6ifckPqLgb04Nk1BlnnqsloIwsI4Ol
         I/L0Mnr3Odq6y18X4DV+Jg10VTr02GU3rWuHiM3uzorgO5+SODFZNHTxN7mnA7uP1xK3
         n9+g==
X-Forwarded-Encrypted: i=1; AL+hErFBtQpa73ovtdHX2Fc7TIa313pf/4/rznqoPjpkczcMKAINPmoWxAAXlrVLnfAUt04x4pJNOSK2rjD8w68=@vger.kernel.org
X-Gm-Message-State: APuU4Z+quypFFRVNK4k0HoMy27XOUX/bM0bHXNs+Rb0P0g3AgBHvr9S2
	Uj5TaTE8KhlxzQoVHEWxgKstl+kEjyTLhKyrVqVy6neUzCgOv7FXK7GJUPGKfrkAtKb7SUzurep
	fcI2jpYz3Bf2XTBdZP36sbCnPUhE34fFjnpyf/eXqXA==
X-Gm-Gg: AZFdTZeajF4o7NRDsNLMTXa3bBxJKbBqNpDoU6jQ5O4xrhivMX1o5zH8rUEEZ5RbzJA
	x+8avD5IF7oEoEyPeuTNwHvuFELZDH+MXGyVq88gNiCWS0lSXmWU5PffD1SNxwKbrxQO7aScbb5
	JtLqFM0f0Jm7XQg/GMA2ARDSdk+am70AtMQc5c7ouQmGbpuR9zIxLl4rMZGMlBMXkjxho9jXb/b
	VTOazxlz8xhHDNYGrn2CMyj5CKwTMIQYAzhYJicTpNCF4j4Hk0EyIy39j2/iy/2yzbu9Jn2bDxE
	hdOrZchwbfvFzpeWxohQpS4Tlag800LSg5ogUDBUaXZNj7/mALRJSIra+OPHri/+tt1Y+SPlW5f
	uxCSUzwcid5M0JiG8JxIK9WmS2Iz9IJn3Y//8KXw=
X-Received: by 2002:a05:7022:296:10b0:1b4:facd:5311 with SMTP id
 a92af1059eb24-1b5524972dbmr13211449c88.8.1795483769303; Mon, 23 Nov 2026
 17:29:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
 <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
In-Reply-To: <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 24 Nov 2026 10:29:18 +0900
X-Gm-Features: Aa3M54o0JiYTAKqcLTrNwkwS1oQokR6HA4PVFm038Kc9FIiT1C8aDz7TJNtKvgc
Message-ID: <CAFr9PXmgpbX9SB6BuD_VdaD7AuU_ems+RRpS7AegvGpaMR9Ctg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Preserve fixups during dead code elimination
To: czietz@gmx.net
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Mon, 16 Nov 2026 at 08:27, Daniel Palmer <daniel@0x0f.com> wrote:

> That's mine. I wonder if this explains why one of my m68k machines
> would not boot with dead code elimination enabled. I forget which it
> was now :)

Tested on Amiga 4000 (060), MVME147 (030) and E17 (out of tree SMP 040
:)). Amiga apparently needs the fix to boot correctly.
The reduction in kernel size is ~8% for all of them.

So,

Tested-by: Daniel Palmer <daniel@thingy.jp>
