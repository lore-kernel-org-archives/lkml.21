Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795077149;
	b=CLOqbY23L66adoS0m+oJh1VU9wRQ6fhst/iSxi+kXh+Tor3fZBD6rsMCDBKgtS7qTI1e
	 4mEaqJXXV1Bujf3QwPp0DNzXpTHQjYs8/D2ssfBc2G0xgcanQdIa6lhiZDZ4ICEvjvOGn
	 71u8X2gZ44S5VdMIRpiKglzJQ6QoEGc67Q6irWdoR9n0IhEgHjRtd9WYSeVYEELF9V+dy
	 LYIhMMvVZeoUf334HnFBxUWQtp9+ctepsNZOjpBvuqhW1FobLm83pn79bBH0qAdrfcFUV
	 A/2JTARLGb00cfveSMoY3mlYygGQ541rmBaf/vcHVligiTc/rCjSOJzcToXl7WDfjzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077149;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=GOeeMlJadvR8eJKaf/pvSRcLKH/zNPjXMWFdAT6wDGo=;
	b=Qvz8pi8aviZwHuX6STiANHB85jvYifmdbuwf0nlgkISExsAdqznIRyGRGfTVtMTzM+qW
	 ewr7H61m8VfrxAXUp5a3gW/ZYN50wA4OF+0aaz+iVzb5mfwuxgOpDYLdrVhP4Im2EpUJh
	 owWmO+87V5GJ3Nc9LmVQHH4lwb4dZXbyfaz4lbea8dV8gJPBPnpTZ5DugNxZpDOIUP1Hh
	 zKU1OYuwaeDMcJ/repqdKnhYMzSazm3Q8Bhg0ZCONV7EQMklPbvzRjQ5HidO06HmJTx3+
	 9MQxGUGyz5zdrUTRzBn+QuJ4G2GNBSpGIeHObCAMqHfR2+ab88gVgavJLhwTKJtC1oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H8hCxp0z;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XQjNBvGc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F8606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H8hCxp0z;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XQjNBvGc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795077147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOeeMlJadvR8eJKaf/pvSRcLKH/zNPjXMWFdAT6wDGo=;
	b=H8hCxp0zvcVUgXo8/06KQIRl9obUNuL/in380U9Z+/8ZrSoR3uIXL1AgfJRtUBsP9e2MY5
	O4opx6Y3tTazSgdyNoEsGXhoFbXUj/qu2p18NpPaxxSYtvqg+P7nUtffu1lJSReT2/krIy
	2azPNyA1HOBJsRsUMdLdiu+rEgJMKPs=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-tT3Aot4XO0G-A4wzxD14Vg-1; Thu, 19 Nov 2026 03:32:26 -0500
X-MC-Unique: tT3Aot4XO0G-A4wzxD14Vg-1
X-Mimecast-MFC-AGG-ID: tT3Aot4XO0G-A4wzxD14Vg_1795077146
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b37869f851so29108517b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795077146; cv=none;
        d=google.com; s=arc-20260327;
        b=gJNYuUNp6oJmX0vovacCb1A0d46IF2HqTHCg/2+8X6xkmOptzxYZK10SkIIxyG4JXk
         pOX1s7Vvt8eY49qEPQAxZLriZXV7jhrIWtYrmDtfgxmTdakjNOI64hTn6YL6N9Pjq74b
         DQy6xa0e8d6PMnPC0G7a/wSS/1s+AlvWZDsbOa7SCesZMLE/6eHzCvcLUztIkIjf5EEf
         91nNL35a+Cp8JbaiFcCEyMO56/D2GY3XSLd8JVweKRW10QbZo0NFhL5vLc65bZlQU1QG
         0IT7A11j+Tub6icxSAExrnX4wn6zjJnvdujZDXFr6qG67bSx7UzeckwRNfjRQAuAFXV7
         51kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOeeMlJadvR8eJKaf/pvSRcLKH/zNPjXMWFdAT6wDGo=;
        fh=yJYQ6h1a1wCnzoT4+M+ayBAg1jV3tKZHg9sT8BKt4rc=;
        b=AsM07rVMqTob+Fi01Qidbgo4P/+OESmP7TVoVEjdoFTzsOGBUFYMafOnF76WM/EZvs
         Y7hMS5eVVzkV4LIrx2JyvkgIgYSJR/03pbRjvvn5T1+d+q1EygIx2I0HsKKTa8QuO+oJ
         mv4BPQzvceJA4y9Yj1t7q1sl6eFJ5cBVKcJGqWwqwj08NG426tUpjC8M7g26EQNgwDlD
         lOMmtUCptUXtN1505lHsBr5Qv5M7Ov13MzBFnHvY9TVwstwbat0Rn1+0z+CQng3b4Uox
         O9xwEtcARJkfG9TFZNcrNrZerZXIex6RSe0K8QhBIU1pqFJ2Cf3duynKL5XpGNsME+pN
         lqPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795077146; x=1795681946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GOeeMlJadvR8eJKaf/pvSRcLKH/zNPjXMWFdAT6wDGo=;
        b=XQjNBvGc+MXfCyFPA2nIKEmcng9LXrqwvhqLMK7HQccjM1YJ3Rx0VDfV02PEWCwN2s
         4WphkJwHZjtlR1jI2EVDvjCnP15prK1px1F5aTCcpU6iyMTvYuagjqlaxcuEiOysoDEG
         CQ8Bb2EsUnYmG8k1xEZYHtxipA8ELOOY8lRVs592ewgK3R7Tv1UcdOx4TmEokY5jAHUF
         FgHBXhwGH6F7W2eQEo0RVm18kcwP9sILAr5vNHfNFFU/ShHQm3njK5v6LNG1Sot4C08f
         XRG6bIlfe+/Uu7zLOvjS5g8VaX9QhYqPT9KtKCZ9PExCtR6aTIB+NDVaC3fhYDoCw4zQ
         eDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077146; x=1795681946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GOeeMlJadvR8eJKaf/pvSRcLKH/zNPjXMWFdAT6wDGo=;
        b=rlulNHA2qbtK3rueIEN6tAtMm96TTz5oa4DM/YkX0if3TQOHeifc1FU6BPfxmdvA0u
         Q3wzNvMiwoHpRxLktmOzv3BOHw2FEaG2guhq+ietwkal+qYpdCrs10JJ1jcs5d7AJqSh
         hTaDDaJw3wiXYuO3SqOftkB639BqtV6TusbEW07v1mZZ5EWgBZxUp3N48GGlRRe2RSaO
         aGAwkQ9P2PUxEd7McWnpvc4yo1bKQAszJ6MOxUef0G31By5Q5eqYFsKgHHXwwF2OVU4a
         S62MviskZNQI6hx0KXzGkCJSu0RkmpuboFIQTeUm8SGe8Kr2rMzZjWN+FrJrwlWtRBGZ
         5iwg==
X-Forwarded-Encrypted: i=1; AL+hErE1CyhG/NG5MmsHTG3yf6q/9ClJlFyDQbf5i3XA9BJLSUo+/WjZ60yC7pM6PA6toR4fLE0a1fZCUOwmisc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DuqW68A//TxT3vISVQl+aRxDT01gor+Uc1nZQklnuLFRbot6K
	KMX2SAMEadQPJxF+F2uxX2b9ujEDXhOiPjysMz4sp9G3Pn+7ck1iRkB6DvU6Hpai7UhPkgJ+W9W
	QzP3d635MdyTdVP0B76wzAxF2o2/73H88Au13zqo4UHs6/IXgGZBgLbrhE1XgY8/fgL7iP7IkS1
	siL1P87EH3pzPqaeg/h5XI8hPSyBEGwzDWzrDYko5x
X-Gm-Gg: AZFdTZcJ+H0riDFEt0JMxT8MrqWSPHz+F7n7yaA6Ypa1UvYZWUdpM/faMZGjxs7K8ds
	bnVwcljeFhbaMmcnB5us9OlFlW7qWt3GinqvrQhicyb2t0fuSeJlwmpGp5/Mx2CZrDznStOXdz4
	GJX92j+sGtDC18NbXxa94vP/LAHSMOzsZ6d8ipkTpQY6EIoDXunXsTHyRu
X-Received: by 2002:a05:690c:22c7:b0:8b1:e7c:cde6 with SMTP id 00721157ae682-8b4fecfa916mr15730697b3.14.1795077145727;
        Thu, 19 Nov 2026 00:32:25 -0800 (PST)
X-Received: by 2002:a05:690c:22c7:b0:8b1:e7c:cde6 with SMTP id
 00721157ae682-8b4fecfa916mr15730547b3.14.1795077145072; Thu, 19 Nov 2026
 00:32:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117184019.430513-1-andreas@kemnade.info>
In-Reply-To: <20261117184019.430513-1-andreas@kemnade.info>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 19 Nov 2026 09:32:11 +0100
X-Gm-Features: Aa3M54pcd8uZex_i9Rd4360VDD8T-xWI8UqsAN9jqbFQoUlHyB8r0gZiXyXzCl8
Message-ID: <CADSE00+-9Br_eVWRc=+i+OnthqZYfaMZ57Gxp5fXmqFXrMqf3A@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: dss: simplify omapdss_device_init_output
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	luca.ceresoli@bootlin.com, louis.chauvet@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:40=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> During reviewing of a regression fix is that function, questionable
> possibly unbalanced drm_bridge_put/get came to light. Sashiko
> review pointed out that of_drm_get_bridge_by_endpoint() does not return
> NULL, so the questionable code is simply unreachable and therefore does
> at least not harm. Remove the dead code.
>
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/gpu/drm/omapdrm/dss/output.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapd=
rm/dss/output.c
> index b5cef5093a883..cbb9b2f1a2133 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -20,7 +20,6 @@ int omapdss_device_init_output(struct omap_dss_device *=
out,
>                                struct drm_bridge *local_bridge)
>  {
>         struct drm_bridge *bridge;
> -       int ret;
>
>         bridge =3D of_drm_get_bridge_by_endpoint(out->dev->of_node, out->=
of_port, 0);
>         if (IS_ERR(bridge)) {
> @@ -34,20 +33,11 @@ int omapdss_device_init_output(struct omap_dss_device=
 *out,
>         out->bridge =3D bridge;
>
>         if (local_bridge) {
> -               if (!out->bridge) {
> -                       ret =3D -EPROBE_DEFER;
> -                       goto error;
> -               }
> -
>                 out->next_bridge =3D out->bridge;
>                 out->bridge =3D drm_bridge_get(local_bridge);
>         }
>
>         return 0;
> -
> -error:
> -       omapdss_device_cleanup_output(out);
> -       return ret;
>  }

This looks correct, it is dead code. But removing it makes the return
value meaningless (every path returns 0), so it may make sense to make
omapdss_device_init_output() void?

I looked for the callers and there are only a handful. They can be
simplified to avoid checking the return value (the "r=3D...; if (r < 0)
{ cleanup; }" patterns is repeated in all of them).

BR,
Albert.

>
>  void omapdss_device_cleanup_output(struct omap_dss_device *out)
> --
> 2.47.3
>

