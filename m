Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185314;
	b=mc+l8uyJf9y6sz8Yk8BpLcvHDitsg4XYa8QkXY+OIYM0z4CdnC5VVCwUP/BsQZQtEQwi
	 JzcTHYCyGEh4+cScIeftmBpMLwSI0liOL7FyZdvKUByIJOcI9i5cgqmMLwJcuwh8R92CK
	 PwwpZHdbBzmz1p0aoy9XsoUzdZTcaljeWiXP5caSMSdfmgG5SwO/209jxg+ocgwW/T8sm
	 r1XKmmssyOmyYUcqS2R0wp2ok4yTFS/Iogf/bd8EYTR8f8SRXQGjrsGThb/fqr2MDzQ/m
	 llzeJUaR/kxRuw2IkaMEIh/vSr5bZdNdpAEAcn89Obg5VylPKbQLXzls2T7CyO6c+3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185314;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PttDiclza9AIWquWpENwIDPE7a6gtcFVbDNgaC+t2sg=;
	b=zUKNZz7rP5oveWqUn6mH1hZfhlqRXkLK3ABfmaCFXFj2TTGJz+5jpWfi05Zp5Tg6KqW/
	 zLT630doE9M5pdlB8I5UGYSI3JbqRl6xY23zDlgbtb28agDR/rAYENNLG3jKxSosxLGBk
	 yWVHv+IzvAmgPP8ejXwlrPTh9y2+XRWRhKITVgEF9kZhWOw4Xtwi2+wQ9gY8TE9DrjKiu
	 9xQr4kXl9kKCnxgz3fx8elYb5+ISsHw6qKodBjoe2X2yUx6YxnchVpmzEHXrQTuA1FQC3
	 gWYrr2WC+USOA7YDSfvyjk14j63snOM6u/vQ2Cy5iJp2ZZ9DM9Yisi5qSWgH0kepyFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bYDR+CmM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=arO2BeEf;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F09606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F09606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bYDR+CmM;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=arO2BeEf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795185310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PttDiclza9AIWquWpENwIDPE7a6gtcFVbDNgaC+t2sg=;
	b=bYDR+CmMjBFuoSnevpSNMy9f8/KyC1aZzvRW3BItLKXahgdGdHLr973va+xMmrp0TnsV+1
	AJ/wPxLcopoGGxr9NlGMpZd9vWDKqjv9UkqNDGhGqfBi0sjiIaYbFNqLym93ZXKwXxQxgI
	+rKfeURRI/Nonw+VpPeOSngQ0YttyK0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-FVYXE7t_PpmMabpbJo4YLw-1; Fri, 20 Nov 2026 14:35:04 +0000
X-MC-Unique: FVYXE7t_PpmMabpbJo4YLw-1
X-Mimecast-MFC-AGG-ID: FVYXE7t_PpmMabpbJo4YLw_1795185302
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b6fb975053so1025526a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795185302; x=1795790102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PttDiclza9AIWquWpENwIDPE7a6gtcFVbDNgaC+t2sg=;
        b=arO2BeEf14/JsZRJ9DqciEhIF8KNNM/3zyiYchCpzhTU8HmOE1TbUEW63Pwx9xs0cJ
         7yTae+ko/Aq+PVMJUeY80ufoCrTYSk8hHMRI1yAmAERnDt8Remtqt5W5h+BDPq7S5/lH
         i3Nv0pPuha4z+ypTzjLyC5Rk0ZLOmngJLghB162OVR0By8xHc9yh6OWxJ2+IFWSN+8+w
         JdHgvyoFY4zaGB5a/MO3944+PSHoVU5zuRioXnPAFssdI++jyi3CWsz7D0W+OcJnvbIS
         pLh5zMmr1o9QheiJ5oTG9E0hDufesaA/+fSIY2J4SOA66Ym3yuF5MTqonDJEJJGvck8i
         53bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185302; x=1795790102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PttDiclza9AIWquWpENwIDPE7a6gtcFVbDNgaC+t2sg=;
        b=JNOeLSrsmzv9BQUwMc7/Kwd7BXuXKgDPVILdbAzOnWQZ82IaCiB/q0fp5DWZ7kHIiI
         zR8DSSCZ/OFQQnqhsX3/TZ+Y+5epdovvlfI28vrS8YzTSqNnM1s/82DaeygpGnOL62GB
         1jXWhheYEOGRCB2m3a3KqFqabI/iNzEvq7qRReoHLhC4v9ZQE8tGmlJbpcbn2MDerrOR
         4OQigH6cfPmNQoQObFm9qrAWuZR8yYl1gZhnIlzX3Cc1FlhpWxn+2LjtlDwea2AB3qPk
         U8th2mh+GvsvjKLRZCMjxTx+jUmZxwViYWJ9dNAn2Zj3eq8OnwFp+GyRiDcVctO7rzA2
         nKpA==
X-Forwarded-Encrypted: i=1; AL+hErHzFfO80QAxafqXobiaJonkbt1BTU2TtB5tPzcrxtykTthFrD+6ehEeEmzPmaxeNMerBHMiHjuU9k0W62E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2hv2wgZ5ryE8qJ3Oi376bndwwnhO0sis6NbbXW2WDhk5BIksL
	p4y6NJjaqkwvC2WTLYCjikt+gMPSutfIU2SHbf27iWOwfOEVSwelZ0w1p1Bnq7xxz6wBAzZE2Y2
	GLofg1I96OoQtSW9fY2KDHJ0f58tVIFqNoSLKZeRHD0sQiBdK2uPgYGOlX2i/WGA0bg==
X-Gm-Gg: AZFdTZeEvp6XR3F5k0ZzH3ebW4w/TAyL6iJGw9QTEl0VXc5y40+q/nU2fAaqr/4fwkX
	jAZI5DAclFtTLr5JyGq5OCFCcwYLIGTbjWoYKppTUCSsFctVvEFf4GtP3IevLOT103lSJJxJzTO
	5X5f7Bp63SFNg1nHv9GyZJr4vTgprcLAvVTyqtfliL8YLI40mDjI6TUHVVi9SGQ15uK46GdiVDC
	SzuzvZsNBHg8qpFYe1dmcfaPY7tn2bMtpINLYEyZZy+MJCF0SO1oFs0VxgCBO/I25MM1Im3VYfI
	1/4mx8E4DVXNDDz01Pb3z7GvaGunc1P41xbcgNu21xJmqRzsvkpJ/TTUm+K2dRe756grMNvWXon
	QciGxGd67ci1smtvS3iSsVVcJ8D6eCzha58y/llly+IxokvD0fplUJqLwS3Zcx3ANOu479hQDtT
	gFuTnQI8RTnx87PR1drYjE
X-Received: by 2002:a05:6402:895:b0:6ba:ad4:2c43 with SMTP id 4fb4d7f45d1cf-6ba37c7a76fmr1882685a12.5.1795185301785;
        Fri, 20 Nov 2026 06:35:01 -0800 (PST)
X-Received: by 2002:a05:6402:895:b0:6ba:ad4:2c43 with SMTP id 4fb4d7f45d1cf-6ba37c7a76fmr1882673a12.5.1795185301389;
        Fri, 20 Nov 2026 06:35:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm1185033a12.3.2026.11.20.06.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 06:35:00 -0800 (PST)
Message-ID: <dc4518d6-c62c-428a-94a2-39c84cafc83a@redhat.com>
Date: Fri, 20 Nov 2026 15:34:57 +0100
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
Subject: Re: [PATCH] drm/panic: Bring back the kmsg screen fixes lost in a
 merge
To: Devin Wittmayer <lucid_duck@justthetip.ca>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 desobei <desobei@outlook.com>, luyuantao <luyuantao@kylinos.cn>
References: <20261119191038.146963-1-lucid_duck@justthetip.ca>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261119191038.146963-1-lucid_duck@justthetip.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 20:10, Devin Wittmayer wrote:
> Commit b537d87d2632 ("drm/panic: Fix the loop that causes kmsg to not
> display correctly") and commit 1ba640563843 ("drm/panic: Fix kmsg screen
> hang on a long log line") changed the old panic file. By the time they
> reached drm-fixes, that code had moved into the helper library, and the
> merge left the helper as it was.
> 
> So the panic screen that prints the kernel log hangs again on a long
> log line, and the machine never reboots. The helper's KUnit suite hangs
> the same way.
> 
> Make both changes in the helper.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

So I'll push it again to drm-misc-next.

-- 

Jocelyn
> 
> Fixes: 5c3d323984fd ("drm/panic: Move panic display code into helper library")
> Reported-by: desobei <desobei@outlook.com>
> Closes: https://lore.kernel.org/all/PH7PR19MB6658FDBDD012399C6E8D330FAF792@PH7PR19MB6658.namprd19.prod.outlook.com/
> Tested-by: desobei <desobei@outlook.com>
> Cc: luyuantao <luyuantao@kylinos.cn>
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> Both were lost in merge 1c3b1398f1cf. My other fix in that pull, for
> the panic screen setting, made it through.
> 
> Panics with a long line in the log, on drm-misc-fixes:
> 
>                                without this    with this
>      QEMU, 40 panics           all hang        all reboot
>      AMD mini PC, 8 panics     all hang        all reboot
> 
> Panics with nothing long in the log reboot either way.
> 
>   drivers/gpu/drm/drm_panic_helper.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
> index 8913c3d22e8d..385a07ed314b 100644
> --- a/drivers/gpu/drm/drm_panic_helper.c
> +++ b/drivers/gpu/drm/drm_panic_helper.c
> @@ -513,7 +513,8 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	struct kmsg_dump_iter iter;
> -	char kmsg_buf[512];
> +	/* the size printk formats one record into, too big for the stack */
> +	static char kmsg_buf[2048];
>   	size_t kmsg_len;
>   	struct drm_panic_line line;
>   	int yoffset;
> @@ -530,10 +531,15 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
>   	drm_panic_helper_fill(sb, &r_screen, bg_color);
>   
>   	kmsg_dump_rewind(&iter);
> -	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
> +	while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf,
> +	       sizeof(kmsg_buf), &kmsg_len)) {
>   		char *start;
>   		char *end;
>   
> +		/* a record that does not fit comes back empty, every time */
> +		if (!kmsg_len)
> +			break;
> +
>   		/* ignore terminating NUL and newline */
>   		start = kmsg_buf + kmsg_len - 2;
>   		end = kmsg_buf + kmsg_len - 1;

