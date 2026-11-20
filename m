Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197204;
	b=p3NNHnoysIotNMy9Fufeq6uu94qzMdQr7QwTq4Bs7SQ3PTpDbXYH0QQzU4Aj8tC8tbx7
	 tAUobritBzeSg9akAxLwyxB/lEl5MP5OTNgcP44uw4bg3JwZAKDS0rEgnfxlhmfKAWu7J
	 6skXCtqKaDj2uehzlrGo4EeI8yeKpvMcwAV2yDRmWrkTptretglRi1K1BbbNgeQ1rUTql
	 O6JtmYbshGQiuwijGi+lXYCE4k4MxMhCJpxt0lgpNCo5SZf//Ifup8tdvDasxjXEqFvcB
	 aF+L+g8HlYqus1h+p1TlPlGB9E6Jo0u7UTHmxsOiH8cL5RsGExKBuvIHjV45NoANDBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
	b=FrRmwf6tJGaq3tILXxCdXkMtWq7I/x+lDVy3xWCRUnyGB4J1JrrO9wMB7lcsxSVP1PtF
	 ke/Di5lNBmXZF6qqQckykU0NE9/BpHNIp5KIPuAoxkpHDqvWTswgQJVg23MvnHkCw9SdL
	 dxr+YtyMqaXqAiYdCXB+fuDsZCqmuduPSoRNVYztl/Es3TJHorS/OcMWtdsAOdKtYfLs8
	 SSy+b0iatnP/2ltbzhE6eG8CAM65qQ7yqCN3uufcA/n+pPTCZnuAfl07hU0sJJukiH82A
	 16x4gilLceeQyp815k/X7KhPihWw+R7V1Qi4T7tDusgXP4lDL7mU7DOi/yAlF6vfFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kH2IVjrD;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82776606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82776606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kH2IVjrD
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50e26763a4so227468366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795197203; x=1795802003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
        b=kH2IVjrDLqtVN6qbwh37wlp5gSfPO6LJplFV1+GUGqUpB+WphKsAXMfUJWL9mclX38
         l98btS1FxAN7V1ECJeAifcnViBybXhXLY7/lae5+zIQiNM80FcCEFy5bmlMcyjQdTpy7
         DKpsK7Dx7rMOdwlkXNDQX2753UyQ/JEloBLME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197203; x=1795802003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iriUQT3AzRrdfB9ami6Z9V3Qer8kviuIexFHj/Nsehc=;
        b=zDH1K+/nV+79GVfALHYIXOte1nm7EmsgUF8WKiW1Eh4y9DTXGH/huvZ2JBHCWRO2xq
         g1zojUURZV7i1ZD4rzWlh939c8mD/jmjd6ZDt+gSLLqZ+MchLFtrZb/3RBfjNlg1x9xU
         7JoJHPxD/AqWO449MkEGlut9ape2UW5JtGhKa1KWA8D/VUTiWUibNDH4SsYzxUqmw+N9
         IolLWkfxMqxygkyCOKhPqDlwAJWcc6TQrm4urw8/Pu3qlB3WvI7BvsMBgeIQl2bOkCtn
         2OnDCvkG+24xKNyIXSEDsblU4vtZKEO8jzEP+mAdNhqMUvef/fnLffQHJopAxAgFYnmo
         t2+Q==
X-Forwarded-Encrypted: i=1; AL+hErELP/nfsIf1mmYR6c8ioDp9l/3JZAtzZS88t8zpDHqoJNvLfi3lOKSvEax/O5tvS35UdOcSQiXnLzgCorc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hsfE7EfAtRyxo7o6az6Klny59BOasfhikE1HEzcuzY4WsaN4v
	0hXbkuOM9qPyVvXJpnQ913kuZ4184rmWkgmSk1OO1WoKlJZaizwcaIAREiTsAEDDcKZrjOVheqx
	2e4Dvud8g
X-Gm-Gg: AYBFou0CFSpMMjcEMGQfSpL0SyUlSQ56vxWWU8OYoUAwF6rG/F3+4k7XivkMVqN+WPr
	fJy3o8cxBGTZfGj30rlrpySQ5/K0QHYboyUagi0NXlrzM82/BYeo8dOoZFROgobMaDcfcioHe/o
	oj0wECTO2qmvO5q5ONZt3B3Jk/kIsfeLXWFITOIulBUUIUD5HY5Y40g+Rr9HEPtd+Kfu5wJ3nuI
	8KClAUXdbESq2UNMDjAba/ps834y41hk3tazhwD2cKm4hCb003NjKOGWW0l8t6KMSU5Y+NcHpCF
	35GePRJtGv8j8gSXh3TgUgY9dhWfYofbumedx3ezVAFqz/fGmtJx5aIudyVDcEUqp+o3iRZPr/6
	PJS/ar+uo2yRj5Z9CLxqF1/jgTe5xEJqNuaGnJDvOgTxBwQSPMYm6+Fj2n47El7mKFZEcxWIH5A
	uyLn8kuMhS2mwmnl2QDk1vwXodhnLM9lY/0O3Q/1OoVCoevd1FzIR3EKN6Zk9Ll0TrBQQQofsp7
	uEJ7gIRcyVMm6aHi3obZRC4tnlZP0+RRGEjULW3hCTio/7srCTt12wK9fyb/hkr1K8HGe4tzNVS
	0KI0jv+7XtAkN3lX9nRlORLhjZn3r2j6VyaIbt9Kh7GXrF6t7zo6opA/wu4i1HPX1qzU
X-Received: by 2002:a17:907:6091:b0:c3e:f39b:2286 with SMTP id a640c23a62f3a-c513a25e36bmr417281366b.0.1795197202958;
        Fri, 20 Nov 2026 09:53:22 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm127483766b.33.2026.11.20.09.53.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 09:53:22 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so10624385e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:53:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFxk3lgVQTm1+Hysx22MhGgFMW3gSs9FxdPIJLLOJC8QdJmtJIl1pGkjRWRwa5kImX2WASp+qvs3iOZ+8Y=@vger.kernel.org
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id
 5b1f17b1804b1-4bb887e220emr85956855e9.2.1795197199813; Fri, 20 Nov 2026
 09:53:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-15-dianders@chromium.org> <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
In-Reply-To: <CAFLszTjEczj5OYCV4sXuAHieg4rWZk7F24V-uME9Jvv--=9x0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 09:53:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WC+2qPD2vgsDfm5fVjEH+=YT6pSDqMyQ8Z++XWb9n0ug@mail.gmail.com>
X-Gm-Features: Aa3M54p6je0a5w9XNpmTKTy7gXFNUMhYRhpYs55-PBkGHvfL4DfTkPTkx_OnFMM
Message-ID: <CAD=FV=WC+2qPD2vgsDfm5fVjEH+=YT6pSDqMyQ8Z++XWb9n0ug@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] fdtfactor: Parallelize blob compression and decompression
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Fri, Nov 20, 2026 at 7:29 AM Simon Glass <sjg@chromium.org> wrote:
>
> > diff --git a/fdtfactor b/fdtfactor
> > @@ -140,6 +141,32 @@ def compress_blob(raw_bytes, comp, filename=''):
> > +    if pool is not None:
> > +        return list(pool.map(lambda t: func(*t), tasks))
> > +    with concurrent.futures.ThreadPoolExecutor() as new_pool:
> > +        return list(new_pool.map(lambda t: func(*t), tasks))
>
> Is the shared pool worth it? Creating a ThreadPoolExecutor is cheap
> next to compressing even one blob, and factor_dtb_files() already
> relies on the pool being created here. If _map_blobs() always creates
> its own, the 'pool' argument can be dropped from
> _extract_fit_fdt_entries(), _strip_fit_unfactored_local_fixups() and
> _factor_fit_group(), and factor_fit() doesn't need to be re-indented.
> What do you think?

Makes sense. Creating a `ThreadPoolExecutor` inside `_map_blobs()` is
in the noise next to blob compression, and dropping `pool` keeps
`factor_fit()` and its helpers much cleaner. Done for v5.

> BTW the default is up to 32 workers, so with lz4 this can start up to
> 32 processes at once, regardless of any -j limit in the build that
> calls the tool. It would be worth a -j/--jobs option, perhaps as a
> follow-up.

Agreed, adding `-j`/`--jobs` (or jobserver integration) as a follow-up
sounds worthwhile.

> > diff --git a/fdtfactor b/fdtfactor
> > @@ -1668,7 +1731,24 @@ def factor_dtb_files(args):
> > +    dtbs = [
> > +        ParsedDtb(
> > +            p,
> > +            comp=comp,
> > +            fdt=_open_fdt(raw, p),
> > +            uncompressed_size=len(raw),
> > +            compressed_size=len(fblob),
> > +        )
> > +        for p, fblob, raw in zip(input_dtb_paths, file_blobs, raw_blobs)
> > +    ]
>
> This was the last caller which relied on ParsedDtb reading and
> decompressing the file itself, so the 'if fdt is None' path in
> ParsedDtb.__init__() is now dead code. Please can you drop it, make
> 'fdt' a required argument and update the docstring?

Done for v5.

-Doug
