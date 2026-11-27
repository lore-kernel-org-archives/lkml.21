Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791700;
	b=hGyNJYAllK3RWZ3NOE5GMPVSAMrgh459FoC98fOaFBE/5rxL/N3rlifqhezfWqZYnriS
	 NIgULKLrBEBR6CNvGxM7CR5xlCh399lpyevSKDKJLwAyaJCzpaY47No4PICtUpmI/1gss
	 5pHlYL1aypKC9yH0QCnsYVsBVZX6KgCz8/fJtm+wwB2inb4FzVDagrvDSi+gWdhaHYBhk
	 JxvvW/3sEO05hhRlQL94VEtwkTjVrcGqZxRyoAZwGO80UPC2pBUWWbsaiKfIxbr/z75CF
	 112OzsPIcOGPj5c7hf0/m9w3pLUpadBvZA6ZKtXrY3LFc/hauSj1l9/lEWMedP5TTqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
	b=X0ThX0xnRqVXlcasdjE7Bhw9cGFal75X8bOaAFnJ5wa5UeC5HLRLyaq2alCERj3zvsr8
	 X84LgGxlxZpgOlQehAePtJMcMdmEcdYvsOraV948cDNzRvvy4DgJUOoWDV4AWEout3GyP
	 M8+Km0PJmkmfqAlkROWjb5L30TOOYNFMHDfa9RhSJEHn2u2ZOtRzdjNOztr4+KbYRNFvF
	 aRrk/1BV1uMa+6D63WMOeFD6RsuCfiL6GkS56LwIqTuzHtsjwQBpIahIWOSxPVY1I3+i7
	 3E2/osqxdxJlWy0s7TD3x31tqRVJOZHSMCj5Y1CxsLtfvMZUHPtMka+Qc9j7njzJe/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nFyZBs0C;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1F606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C1F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nFyZBs0C
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so64345205e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795791698; x=1796396498; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=nFyZBs0C7J3e4bI0vXvPauJ6r64YNndWq6eLYyzDQCzJVbptP2o0aZ90EisCekw/EL
         j2Dd1RtiL4zfIl+dtEjTVhoTHomp79HlXKDPaomyaugkReD8FKpA/yREODW1Ko/dwnvk
         XH2EPgNpBiyo33q8fEFr6zen0MR6CBcFDz8fnOXmyjomOEzGXCgqyZea9BLuWJ0LK0cx
         keoyBsZTrOeNv3lMG3QVH5wRj/uTIE2DbWVdoHK0+14NO4FMzs/QMOuGmT+UrCgZZGeJ
         roky9jZ3b7avcJANbXD/D4AbGqWrXvn5L4LpN+kzqKjFcQ0XcRHMMl7EMFxCNyipOJnm
         MVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791698; x=1796396498;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaEv7R/BjRnXVDpwqhtcR9qe+ZhZ8m8cezZ42dYSI4c=;
        b=OWWUxK11u6PUsCezYStgEqK+KgOWOe4yN0DW4DyipcXtEoIPKsUPibpx4YluCQ2mbr
         EOJtKgP5UyEqMXFgsBhsaKgLNyPLQnocQH4F9Ow7jHlUmXiBl+xMMc9puCtFiTllXFxF
         zpWa583ESWxU8v5VDyX2r4EnCl06pmWerOvi5BDOe1sGHvm+ehs2+E4pRm6d4j77J3Fu
         h92Xn8VRBEjrgUhsJTBiFWlzPqb6T2GJ4G8HXeec8sV4kFaqy6QwIZ3g306bWt6sjALn
         mx+N95oe11qcYobB7pqEgVw0Bnr/4rTg+RFpPMoPiqTwR4A3mcSYgZbrDu6Z2M0fmNN1
         rTkQ==
X-Forwarded-Encrypted: i=1; AL+hErGEA05syqLXTsrtQL+YZSixyZS2u4gAyi+9mJORbUBP4W/lptWUXmV/8JIeA7S4EoMUIjz7QTmzdgjNZKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BsNPe45zWQCfqQIjTwxvp8mI3V5K88r/wvH+QPcUftIxmP3lC
	IBMP53mQOAh+Y0w1XqQeDLPJxfTTANqcjtoy5EOLZF+9iDmCxxPQdycslYTaJ5PFLwE=
X-Gm-Gg: AZFdTZdbyx1fGS/R7ObMG+/7i8wPZpG3RXyJREqtdlBlQY9IKth2MWlBCC5rUCql8LN
	RXp4GvCGceDlDShrBKstj5WzkzukQyXVaFUhJbB1ky9b38EHjJm4xO7hNhIkJZyu7XtnY79T5qa
	/2Pd9Ke6HQupGALoJjIub3DUjXmPvyIjrgU+7FMo3CDaq2kEiB9CJ7qaSkI2CDCVvEWC35+rRu5
	FhmqgwICBFMV0IdtWAnSDPLOWyVeIjfuUtiI33ZZcT+bl/6bbLSEqV2qRnMSe5wmGHVbozH5ggz
	Ud4vh/11O+c2GCF4yKJqRZ0GNtJlOfYkCheJr/6zP3cOj65S8X+blOOB8iu/0fGkC5g4sWkuF7k
	opDN4cWe6l73jSLiZs2k9WD0b/SZ/K1BUpuOt9derKswAD6JWnPmDqgETGI2L1XKWQ3U9LudQQE
	l3+QJXxbIFqgw82tTWOmp/BwTY8dgPCgViXlj3eN/XBKa+lbMryYKUExA2Byp/si3WgOp48Gtb/
	0G3A9jtvFfjdbQucFbCMpdqWwYglh9U/kABJ/aQdnJuvV0/39ra6NWI/QTPt+4Hxx1p52p+5cN6
	Z0eHD86KfPCqr/NcZfoiBE6eaZOWKSR8NOT0/ySdA2GiKvgT
X-Received: by 2002:a05:600c:a086:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb88817ef1mr520259335e9.24.1795791696489;
        Fri, 27 Nov 2026 07:01:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm665457205e9.2.2026.11.27.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:01:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] clk: sophgo: sg2042: Keep gates used by
 firmware enabled
From: Jerome Brunet <jbrunet@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
Date: Fri, 27 Nov 2026 16:01:32 +0100
Message-Id: <179579169278.2788166.8963233310700352675.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zyZPxaWhtK89KOfIzTta5tnUxxcbXy33/Xi1h4W0PlQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcs/3yNEp8maMy1+r+Wm/Ebptp0Biw5cH025W9i/gED
 OfYsO/pKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETc4xgZHr8rKXnybqH076p3
 yxfsn5W+Vc/ixMfzHLltP1bMNnr63J7hn1LOTN7jjgU/O6XVHl+sVq8PNEq9+8Pfmct9ZveT2ru
 dTAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> On Milk-V Pioneer, firmware uses I2C0 for the EFI RTC and the serial
> flash for its own image and EFI variables. Both sit behind clock gates
> shared with devices Linux drives, so runtime PM on the Linux side can
> turn them off under the firmware, and GetTime() returns EFI_NOT_READY.
> 
> Let firmware list such gates in protected-clocks on the clkgen node,
> and keep them enabled.
> 
> qcom, the only current user of protected-clocks, does not register such
> clocks at all. That would break the I2C controllers Linux uses, as the
> DesignWare driver needs the clock rate, so here they stay registered and
> are only kept on. I'm not sure this fits the intended use; suggestions
> welcome.
> 
> Tested on Milk-V Pioneer.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Changes in v2:
> - Drop the EFI MMIO patch, Ard is taking it through the EFI tree
> - Use protected-clocks instead of scanning reserved nodes under /soc
>   (Krzysztof)

Hey Krzysztof,

Using protected-clocks in the way proposed in this series would give it a different
behavior/meaning compared to what introduced it in Qcom:

- Qualcomm skips registering listed clocks. A consumer requesting a listed ID gets NULL.
- SG2042 still registers listed gates and marks them CLK_IS_CRITICAL.
  A consumer gets a valid clock handle, can read its rate, but releasing its enable
  reference won’t turn off the hardware gate.

Having different meaning for the same property is not ideal, is it ?
Eventually that might be something we could fold into the framework, but that can only
happen if the meaning is consistent.

IMO what they are trying to do here might be more appropriate, but Qcom was there first.
OTOH, actually registering the clock in Qcom would not be a breaking change DT wise, the driver
would start returning a handle where it would previously have returned NULL.

What is your view on this ?

-- 
Jerome

