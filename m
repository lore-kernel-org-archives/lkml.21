Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287749;
	b=g2J9qu+PlDyJDp3ew19QafvaKawJKXyAFm22CIcwjT+6Rw8GUDw7Ijmhhy7uHHEd8N3R
	 xi1TLubCidaGiUfTvfgXm+DiB18Pzct854SFP5Ds4ztzmrBQjEKiEy18Bb1b03l9RFIXN
	 qf6meshmWujoGvkFv+jjiOq7yhzNhdrkIbHxWlQh4O2hR0ncgyMzjsUD3cujCr/DXkLg8
	 RvPCjRdyEtC5W+5VhBVX0df65Co7jnCNMypx9iRLF77Y4+uVMF5doDMHOM6Tsl0OHfwSE
	 lHsnxuw4mnuBHRzytsKnu0KlvEiVPIKw8KCGx9upmbJgaeNSdp0ycIKhB9mCKnTuJjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
	b=N99mx0A/H5K7ae17dvAtV78VIebhw9BeQJDYhL2GY1yns/DevQ88qEIxzL3A8t5y1NVX
	 c9HYqK2KGPwjX35fM/barY23J1pQ9Z6gXj2+kRreb9WtwlL+dyW58Eoh+aYxNjLiBIDeX
	 HlhFNl+Tu7e0uG0gRKMmUDP77pX3Yv2Ir1flm9+CcwOpZmOVBgCxl4vUyzUANxBrJ59k4
	 C78w292phIkDFApeQX08LlmUfN0PI6LjQg7YVTptJ0h7FyLCykkZrmAweAvOqjfPp9egz
	 pRit43873tNMyOZWfK5+It42xjjz/qWbuP9aMesZHRRzOgcMxuWYN49MXe7yom9C3Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF0L4OWQ;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34DC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34DC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF0L4OWQ
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91e7af9a67fso13004546d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287748; x=1795892548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
        b=tF0L4OWQ8diIx+BfGSc5Q27+DM9xv7zG+ssN6agguZg8GXUKNxOk/7p4/jJcSCCt2L
         vWMIEgiJZG1GdutpyeUCPGYhzouIPKFfhcMk6jhEL0nvyfsw5ybTJ4naJgl4pGSTOhh2
         cPjORvo68aZQtBovC1k2TesMjjyk9sQJ8DmTSiX8ZSxIHjHLkJ8tZ1KZjKss2/5m64Nn
         3hnpZLekEE29JzQtCPIAvvlOk4KQfFVt9P6A+4ia68AhL8EPofCK/AW94UthF18ve91F
         vIkmq7CCfF5QEjijJPXFfIgVIqeuQTkPTsoJjWp1LwsbozGMHrURGRuExm3PP66MLE4q
         G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287748; x=1795892548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4KEfQRTZSdTvWq9g7gVQah+LNPpDa1FpuzsFCfmc9c=;
        b=RQFwbDoxK9aCpWwfe9hpqgpIxA43JXhUKcrIH6SnDsiMYTL1ZKSKqkyG4uhHnJP4ml
         2e1v+Es+3AiBwh1gx78svs5T5/QjGcJVOCnrgdpwurqLRmXDNITKzgB12uylH7IRbphf
         NBvs8mA95ANz6Apm3utc39/Q7KdTYhPW6YBeXuB0TG/KI40BsDf2RIhe+lQnXj80zCJ5
         1mVPIFMkAC+yHaC729uKDBBwic4EBVolKpUfJzvIcWzbXXyEkOMPUvnM4v6CnBD1n+Yx
         dEQ2GsBxJBXL8BnfRcuHZXORKUlCd5Hpardt2hoxrAKIwCHq4QbLkKyuN9k2sJMi31ny
         iTMw==
X-Forwarded-Encrypted: i=1; AL+hErFNLfPNKQqRGSPzVFsnn4AdkNmFSs8PRiPYyh76xebcmDzWrx5o3oxk7TnCfkjfjCuunAXM03iF3vyjcRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ilTlL654dQewWn0u+fEW8DwMhG1tlvoq1Yfi/64/dB1y6BaR
	ZJ9LKjXWdnuhzdIMgcM5+OhF3jXB8CVn/8DHH9syVAV2lnSUlSLGbCPE1aX4mL7FpjI=
X-Gm-Gg: AZFdTZe+ZaAnkgpp1fq4UMjCt2aWdVGDwZqv1vJSlSq3D7IF5bIGot9jmPF4M6On4LM
	aegdO8XoJIJj3SKIUVT5ySAiIRaxtR/c4k9+nljdIvJhOxy8iPI4Eu6UstWK++WtrlQq1ZYbiaR
	9P7orxrHeT6badIcUSGgLpVWLpZuj427lhRWU7L0qBALzfFQqyGa9j1+TMEKrYjWBus9+/Okc2V
	RhEKaAdMbymWQvvZLdHZydnsx/upc7izviyBC79PTrVgVFcOQZe39kwMLxBkXNb/qLBgwCwVUps
	KfWHgRFM4Cl+RqH65c/rKlAwlq43aA+H9QhRAViifmywO4/juBuOLzjw9OYUx7p/PF93OPQAqj2
	x9U7xyLwAa5p/4UuCJEhhee8Eeuf+UqJjwDzpwpOnFg4gnVeS6r6p+ffezsVu5lSTW7SSi8rYGY
	ebVOJ4HPODqSB7byWILikiHib6ksqUfxHBxg7YyTGxNE2BgdMwAmqcoms9FnUyMMctdrQhd2s1q
	Fpn+MvcW6SqWGpVM6EedYqlAmyhjRm6RJMJBNaYSjiKZssTO7QNyajSPPcneTwhesWz/45cQaXD
	2KvMPOGdQrDKWlcIuymEJBWIpXCVHJnyOQob1ynzuyWZrkV0Eu3riDktMQ8ApPzV59Tiq7Oqrfm
	vqXBDkgsJ8M1/9ePePkNsxXU6RiYENZn4/zHA/eNDWORJLX8i5bJF
X-Received: by 2002:a05:6214:4e90:b0:91e:a629:ff9b with SMTP id 6a1803df08f44-92134b48e03mr101782516d6.52.1795287747625;
        Sat, 21 Nov 2026 11:02:27 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a15b99sm59575286d6.38.2026.11.21.11.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:02:27 -0800 (PST)
Message-ID: <6f70f43f-4fc3-47ee-802d-50ebc0a8394f@gmail.com>
Date: Sat, 21 Nov 2026 14:02:25 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: i2c: ov13858: add regulator, clock and reset
 GPIO handling
To: Sergey Lebedev <lsa.uz@pm.me>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hansg@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
 Jakob Berg Jespersen <dev@berg.pm>, George Neacsu <geocausa@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 Simon Kruse <simon0x+git@proton.me>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016210246.58562-1-lsa.uz@pm.me>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261016210246.58562-1-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 5:02 PM, Sergey Lebedev wrote:
> The driver assumes the sensor is already powered when probe() reads its
> chip ID. That holds where the rails and clock are ACPI power resources,
> but not where an INT3472 companion device registers them as regulators, a
> clock and a reset GPIO for the sensor driver to consume, which this
> driver does not do.
> 
> Request the three supplies and the reset GPIO, and sequence them along
> with the clock the driver already looks up, in runtime PM callbacks.

[...]

Hi Sergey,

Tested on a Surface Pro 11 (X1P-64-100, LCD, 5G) on a v7.3.4-based tree
with out-of-tree CCI/CAMSS and SP11 camera DT nodes and George's DT v2
patch on top:

- avdd, dovdd, dvdd, clock (19.2 MHz) and reset GPIO all come from DT;
  the sensor probes and streams 4224x3136 at ~30 fps through CAMSS and
  libcamera 0.7.2;
- All three supply rails are off when idle, on when streaming.
- v4l2-compliance on the subdev passes 46/46.

I did not test system suspend while streaming.

Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)

Thanks,
Haipeng

